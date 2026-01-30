import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../shared/components/app_scaffold.dart';
import '../../../shared/components/sidebar_ui.dart';
import '../../../shared/components/code_preview.dart';

class ChatPage extends StatelessComponent {
  const ChatPage({super.key});

  @override
  Component build(BuildContext context) {
    return AppScaffold(
      sidebar: SidebarUi(),
      body: Component.fragment([
            h1([Component.text('Chat')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [Component.text('A composite chat UI component for building conversational interfaces with message bubbles, input fields, and typing indicators.')]),
            _section('Basic Usage', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md h-80 border border-zinc-700 rounded-lg overflow-hidden', [
                  DChatMessages(
                    messages: [
                      ChatMessageData(id: '1', content: 'Hello! How can I help you today?', role: 'assistant', timestamp: DateTime.now()),
                      ChatMessageData(id: '2', content: 'I have a question about Duxt UI.', role: 'user', timestamp: DateTime.now()),
                      ChatMessageData(id: '3', content: 'Of course! What would you like to know?', role: 'assistant', timestamp: DateTime.now()),
                    ],
                  ),
                ]),
              ], code: '''DChatMessages(
  messages: [
    ChatMessageData(id: '1', content: 'Hello! How can I help you today?', role: 'assistant', timestamp: DateTime.now()),
    ChatMessageData(id: '2', content: 'I have a question about Duxt UI.', role: 'user', timestamp: DateTime.now()),
    ChatMessageData(id: '3', content: 'Of course! What would you like to know?', role: 'assistant', timestamp: DateTime.now()),
  ],
)'''),
            ]),
            _section('With Loading Indicator', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md h-80 border border-zinc-700 rounded-lg overflow-hidden', [
                  DChatMessages(
                    messages: [
                      ChatMessageData(id: '1', content: 'Hello!', role: 'user', timestamp: DateTime.now()),
                      ChatMessageData(id: '2', content: '', role: 'assistant', timestamp: DateTime.now(), isLoading: true),
                    ],
                  ),
                ]),
              ], code: '''DChatMessages(
  messages: [
    ChatMessageData(id: '1', content: 'Hello!', role: 'user', timestamp: DateTime.now()),
    ChatMessageData(id: '2', content: '', role: 'assistant', timestamp: DateTime.now(), isLoading: true),
  ],
)'''),
            ]),
            _section('Hide Avatars', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md h-80 border border-zinc-700 rounded-lg overflow-hidden', [
                  DChatMessages(
                    messages: [
                      ChatMessageData(id: '1', content: 'Welcome to the chat!', role: 'assistant', timestamp: DateTime.now()),
                      ChatMessageData(id: '2', content: 'Thanks for having me!', role: 'user', timestamp: DateTime.now()),
                    ],
                    showAvatars: false,
                  ),
                ]),
              ], code: '''DChatMessages(
  messages: [
    ChatMessageData(id: '1', content: 'Welcome to the chat!', role: 'assistant', timestamp: DateTime.now()),
    ChatMessageData(id: '2', content: 'Thanks for having me!', role: 'user', timestamp: DateTime.now()),
  ],
  showAvatars: false,
)'''),
            ]),
            _section('Hide Timestamps', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md h-80 border border-zinc-700 rounded-lg overflow-hidden', [
                  DChatMessages(
                    messages: [
                      ChatMessageData(id: '1', content: 'Good morning!', role: 'assistant', timestamp: DateTime.now()),
                      ChatMessageData(id: '2', content: 'Good morning! How are you?', role: 'user', timestamp: DateTime.now()),
                    ],
                    showTimestamps: false,
                  ),
                ]),
              ], code: '''DChatMessages(
  messages: [
    ChatMessageData(id: '1', content: 'Good morning!', role: 'assistant', timestamp: DateTime.now()),
    ChatMessageData(id: '2', content: 'Good morning! How are you?', role: 'user', timestamp: DateTime.now()),
  ],
  showTimestamps: false,
)'''),
            ]),
            _section('Custom Styling', [
              ComponentPreviewCard(preview: [
                div(classes: 'w-full max-w-md h-80 border border-zinc-700 rounded-lg overflow-hidden', [
                  DChatMessages(
                    messages: [
                      ChatMessageData(id: '1', content: 'Custom styled message', role: 'assistant', timestamp: DateTime.now()),
                      ChatMessageData(id: '2', content: 'Another custom message', role: 'user', timestamp: DateTime.now()),
                    ],
                    userBgColor: 'bg-indigo-600 text-white',
                    assistantBgColor: 'bg-zinc-700 text-white',
                  ),
                ]),
              ], code: '''DChatMessages(
  messages: [
    ChatMessageData(id: '1', content: 'Custom styled message', role: 'assistant', timestamp: DateTime.now()),
    ChatMessageData(id: '2', content: 'Another custom message', role: 'user', timestamp: DateTime.now()),
  ],
  userBgColor: 'bg-indigo-600 text-white',
  assistantBgColor: 'bg-zinc-700 text-white',
)'''),
            ]),
          ]),
    );
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [Component.text(title)]), ...children]);
}
