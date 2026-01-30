---
title: Chat
description: Components for building chat interfaces and messaging UIs.
layout: ui-layout
order: 38
---

# Chat

Duxt UI provides a set of components for building chat and messaging interfaces: `DChatMessage`, `DChatMessages`, and `DChatPrompt`.

## Chat Message

Display a single chat message bubble:

```
DChatMessage(
  message: ChatMessageData(
    id: '1',
    content: 'Hello! How can I help you today?',
    role: 'assistant',
    timestamp: DateTime.now(),
  ),
)
```

### User vs Assistant Messages

```
// User message (aligned right, colored background)
DChatMessage(
  message: ChatMessageData(
    id: '1',
    content: 'What is the weather like today?',
    role: 'user',
    timestamp: DateTime.now(),
  ),
)

// Assistant message (aligned left, neutral background)
DChatMessage(
  message: ChatMessageData(
    id: '2',
    content: 'The weather today is sunny with a high of 75°F.',
    role: 'assistant',
    timestamp: DateTime.now(),
  ),
)
```

### With Custom Avatar

```
DChatMessage(
  message: message,
  avatar: DAvatar(
    src: '/images/assistant-avatar.png',
    size: DAvatarSize.sm,
  ),
)
```

### Hide Avatar or Timestamp

```
DChatMessage(
  message: message,
  showAvatar: false,
  showTimestamp: false,
)
```

### Custom Bubble Colors

```
DChatMessage(
  message: message,
  userBgColor: 'bg-blue-600 text-white',
  assistantBgColor: 'bg-gray-200 dark:bg-gray-700 text-gray-900 dark:text-white',
)
```

### Loading State

```
DChatMessage(
  message: ChatMessageData(
    id: 'loading',
    content: '',
    role: 'assistant',
    timestamp: DateTime.now(),
    isLoading: true,  // Shows animated dots
  ),
)
```

## Chat Messages

Display a scrollable list of messages:

```
DChatMessages(
  messages: [
    ChatMessageData(
      id: '1',
      content: 'Hello!',
      role: 'user',
      timestamp: DateTime.now().subtract(Duration(minutes: 5)),
    ),
    ChatMessageData(
      id: '2',
      content: 'Hi! How can I help you?',
      role: 'assistant',
      timestamp: DateTime.now().subtract(Duration(minutes: 4)),
    ),
    ChatMessageData(
      id: '3',
      content: 'I have a question about my order.',
      role: 'user',
      timestamp: DateTime.now(),
    ),
  ],
)
```

### Auto-Scroll

```
DChatMessages(
  messages: messages,
  autoScrollToBottom: true,  // Default: true
)
```

### Custom Empty State

```
DChatMessages(
  messages: [],
  emptyState: div(classes: 'text-center', [
    DIcon(name: 'message-circle', size: 48, classes: 'text-gray-400 mx-auto'),
    p(classes: 'mt-4 text-gray-500', [text('Start a conversation')]),
    DButton(
      label: 'Say hello',
      variant: DButtonVariant.outline,
      onClick: () => sendMessage('Hello!'),
    ),
  ]),
)
```

### Hide Avatars/Timestamps

```
DChatMessages(
  messages: messages,
  showAvatars: false,
  showTimestamps: false,
)
```

## Chat Prompt

Input area for composing messages:

```
DChatPrompt(
  placeholder: 'Type a message...',
  onInput: (value) => setState(() => message = value),
  onSubmit: () => sendMessage(),
)
```

### With Submit Button

```
DChatPrompt(
  placeholder: 'Type a message...',
  onInput: (value) => setState(() => message = value),
  trailingSlot: DButton(
    leadingIcon: DIcon(name: 'send'),
    variant: DButtonVariant.ghost,
    square: true,
    onClick: () => sendMessage(),
  ),
)
```

### With Attachment Button

```
DChatPrompt(
  placeholder: 'Type a message...',
  leadingSlot: DButton(
    leadingIcon: DIcon(name: 'paperclip'),
    variant: DButtonVariant.ghost,
    square: true,
    onClick: () => openAttachmentPicker(),
  ),
  trailingSlot: DButton(
    leadingIcon: DIcon(name: 'send'),
    variant: DButtonVariant.ghost,
    square: true,
    onClick: () => sendMessage(),
  ),
  onInput: (value) => setState(() => message = value),
)
```

### Controlled Value

```
DChatPrompt(
  value: messageText,
  placeholder: 'Type a message...',
  onInput: (value) => setState(() => messageText = value),
)
```

### Disabled State

```
DChatPrompt(
  placeholder: 'Waiting for response...',
  disabled: true,
)
```

### Auto Focus

```
DChatPrompt(
  placeholder: 'Type a message...',
  autoFocus: true,
  onInput: (value) => {},
)
```

### Row Configuration

```
DChatPrompt(
  placeholder: 'Type a message...',
  minRows: 1,  // Minimum height
  maxRows: 5,  // Maximum height before scrolling
  onInput: (value) => {},
)
```

## Complete Chat Interface Example

```
class ChatInterface extends StatefulComponent {
  @override
  State createState() => _ChatInterfaceState();
}

class _ChatInterfaceState extends State<ChatInterface> {
  List<ChatMessageData> messages = [];
  String inputValue = '';
  bool isLoading = false;

  void sendMessage() {
    if (inputValue.trim().isEmpty) return;

    // Add user message
    final userMessage = ChatMessageData(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: inputValue,
      role: 'user',
      timestamp: DateTime.now(),
    );

    setState(() {
      messages = [...messages, userMessage];
      inputValue = '';
      isLoading = true;
    });

    // Add loading indicator
    final loadingMessage = ChatMessageData(
      id: 'loading',
      content: '',
      role: 'assistant',
      timestamp: DateTime.now(),
      isLoading: true,
    );

    setState(() {
      messages = [...messages, loadingMessage];
    });

    // Simulate API call
    Future.delayed(Duration(seconds: 2), () {
      final assistantMessage = ChatMessageData(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        content: 'This is a response from the assistant.',
        role: 'assistant',
        timestamp: DateTime.now(),
      );

      setState(() {
        messages = messages
            .where((m) => m.id != 'loading')
            .toList()
          ..add(assistantMessage);
        isLoading = false;
      });
    });
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: 'flex flex-col h-[600px] border rounded-lg overflow-hidden',
      [
        // Header
        div(classes: 'p-4 border-b bg-gray-50 dark:bg-gray-800', [
          div(classes: 'flex items-center gap-3', [
            DAvatar(text: 'AI', size: DAvatarSize.sm),
            div([
              p(classes: 'font-medium', [text('AI Assistant')]),
              p(classes: 'text-xs text-gray-500', [text('Online')]),
            ]),
          ]),
        ]),

        // Messages
        DChatMessages(
          messages: messages,
          autoScrollToBottom: true,
        ),

        // Input
        DChatPrompt(
          value: inputValue,
          placeholder: 'Type a message...',
          disabled: isLoading,
          onInput: (value) => setState(() => inputValue = value),
          trailingSlot: DButton(
            leadingIcon: DIcon(name: 'send'),
            variant: DButtonVariant.solid,
            disabled: inputValue.trim().isEmpty || isLoading,
            onClick: sendMessage,
          ),
        ),
      ],
    );
  }
}
```

## ChatMessageData Model

```
class ChatMessageData {
  final String id;          // Unique identifier
  final String content;     // Message text
  final String role;        // 'user' or 'assistant'
  final DateTime timestamp; // Message time
  final bool isLoading;     // Show loading animation
}
```

## Dark Mode Support

All chat components automatically adapt to dark mode:
- Message bubbles adjust for proper contrast
- Input areas use dark backgrounds
- Timestamps and avatars remain visible

## API Reference

### DChatMessage

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `message` | `ChatMessageData` | required | Message data |
| `avatar` | `DAvatar?` | `null` | Custom avatar |
| `showAvatar` | `bool` | `true` | Show avatar |
| `showTimestamp` | `bool` | `true` | Show timestamp |
| `userBgColor` | `String?` | `null` | User bubble classes |
| `assistantBgColor` | `String?` | `null` | Assistant bubble classes |

### DChatMessages

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `messages` | `List<ChatMessageData>` | required | Message list |
| `autoScrollToBottom` | `bool` | `true` | Auto-scroll on new messages |
| `showAvatars` | `bool` | `true` | Show avatars |
| `showTimestamps` | `bool` | `true` | Show timestamps |
| `emptyState` | `Component?` | `null` | Custom empty state |
| `userBgColor` | `String?` | `null` | User bubble classes |
| `assistantBgColor` | `String?` | `null` | Assistant bubble classes |

### DChatPrompt

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `placeholder` | `String?` | `null` | Input placeholder |
| `value` | `String?` | `null` | Input value |
| `disabled` | `bool` | `false` | Disable input |
| `autoFocus` | `bool` | `false` | Auto focus on mount |
| `minRows` | `int` | `1` | Minimum textarea rows |
| `maxRows` | `int` | `5` | Maximum textarea rows |
| `onInput` | `ValueChanged<String>?` | `null` | Input callback |
| `onSubmit` | `VoidCallback?` | `null` | Submit callback |
| `leadingSlot` | `Component?` | `null` | Left slot (e.g., attach button) |
| `trailingSlot` | `Component?` | `null` | Right slot (e.g., send button) |
