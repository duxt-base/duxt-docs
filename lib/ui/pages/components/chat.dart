import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:duxt_ui/duxt_ui.dart';
import '../../../components/site_header.dart';
import '../../../components/sidebar_ui.dart';
import '../../../components/nav_link.dart';
import 'package:jaspr_content/components/theme_toggle.dart';

class ChatPage extends StatelessComponent {
  const ChatPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'min-h-screen flex flex-col bg-white dark:bg-zinc-950 text-zinc-900 dark:text-zinc-100', [
      SiteHeader(logo: '/images/logo.svg', logoAlt: 'Duxt', duxtVersion: '0.3.7', duxtUiVersion: '0.2.3',
        items: [NavLink(href: '/duxt', text: 'Duxt'), NavLink(href: '/duxt-ui', text: 'Duxt UI'), ThemeToggle()]),
      div(classes: 'flex flex-1 pt-16', [
        SidebarUi(),
        main_(classes: 'flex-1 p-8 max-w-4xl', [
          article(classes: 'prose dark:prose-invert max-w-none', [
            h1([text('Chat')]),
            p(classes: 'text-xl text-zinc-500 dark:text-zinc-400', [text('A composite chat UI component for building conversational interfaces with message bubbles, input fields, and typing indicators.')]),
            _section('Basic Usage', [
              _preview([
                div(classes: 'w-full max-w-md h-80 border border-zinc-700 rounded-lg overflow-hidden', [
                  DChatMessages(
                    messages: [
                      ChatMessageData(id: '1', content: 'Hello! How can I help you today?', role: 'assistant', timestamp: DateTime.now()),
                      ChatMessageData(id: '2', content: 'I have a question about Duxt UI.', role: 'user', timestamp: DateTime.now()),
                      ChatMessageData(id: '3', content: 'Of course! What would you like to know?', role: 'assistant', timestamp: DateTime.now()),
                    ],
                  ),
                ]),
              ], '''DChatMessages(
  messages: [
    ChatMessageData(id: '1', content: 'Hello! How can I help you today?', role: 'assistant', timestamp: DateTime.now()),
    ChatMessageData(id: '2', content: 'I have a question about Duxt UI.', role: 'user', timestamp: DateTime.now()),
    ChatMessageData(id: '3', content: 'Of course! What would you like to know?', role: 'assistant', timestamp: DateTime.now()),
  ],
)'''),
            ]),
            _section('With Loading Indicator', [
              _preview([
                div(classes: 'w-full max-w-md h-80 border border-zinc-700 rounded-lg overflow-hidden', [
                  DChatMessages(
                    messages: [
                      ChatMessageData(id: '1', content: 'Hello!', role: 'user', timestamp: DateTime.now()),
                      ChatMessageData(id: '2', content: '', role: 'assistant', timestamp: DateTime.now(), isLoading: true),
                    ],
                  ),
                ]),
              ], '''DChatMessages(
  messages: [
    ChatMessageData(id: '1', content: 'Hello!', role: 'user', timestamp: DateTime.now()),
    ChatMessageData(id: '2', content: '', role: 'assistant', timestamp: DateTime.now(), isLoading: true),
  ],
)'''),
            ]),
            _section('Hide Avatars', [
              _preview([
                div(classes: 'w-full max-w-md h-80 border border-zinc-700 rounded-lg overflow-hidden', [
                  DChatMessages(
                    messages: [
                      ChatMessageData(id: '1', content: 'Welcome to the chat!', role: 'assistant', timestamp: DateTime.now()),
                      ChatMessageData(id: '2', content: 'Thanks for having me!', role: 'user', timestamp: DateTime.now()),
                    ],
                    showAvatars: false,
                  ),
                ]),
              ], '''DChatMessages(
  messages: [
    ChatMessageData(id: '1', content: 'Welcome to the chat!', role: 'assistant', timestamp: DateTime.now()),
    ChatMessageData(id: '2', content: 'Thanks for having me!', role: 'user', timestamp: DateTime.now()),
  ],
  showAvatars: false,
)'''),
            ]),
            _section('Hide Timestamps', [
              _preview([
                div(classes: 'w-full max-w-md h-80 border border-zinc-700 rounded-lg overflow-hidden', [
                  DChatMessages(
                    messages: [
                      ChatMessageData(id: '1', content: 'Good morning!', role: 'assistant', timestamp: DateTime.now()),
                      ChatMessageData(id: '2', content: 'Good morning! How are you?', role: 'user', timestamp: DateTime.now()),
                    ],
                    showTimestamps: false,
                  ),
                ]),
              ], '''DChatMessages(
  messages: [
    ChatMessageData(id: '1', content: 'Good morning!', role: 'assistant', timestamp: DateTime.now()),
    ChatMessageData(id: '2', content: 'Good morning! How are you?', role: 'user', timestamp: DateTime.now()),
  ],
  showTimestamps: false,
)'''),
            ]),
            _section('Custom Styling', [
              _preview([
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
              ], '''DChatMessages(
  messages: [
    ChatMessageData(id: '1', content: 'Custom styled message', role: 'assistant', timestamp: DateTime.now()),
    ChatMessageData(id: '2', content: 'Another custom message', role: 'user', timestamp: DateTime.now()),
  ],
  userBgColor: 'bg-indigo-600 text-white',
  assistantBgColor: 'bg-zinc-700 text-white',
)'''),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  Component _section(String title, List<Component> children) => div(classes: 'my-8', [h2(classes: 'text-xl font-semibold text-zinc-900 dark:text-white mb-4', [text(title)]), ...children]);
  Component _preview(List<Component> components, String codeExample) => div(classes: 'not-prose my-4 rounded-xl border border-zinc-200 dark:border-zinc-800 overflow-hidden', [
    div(classes: 'p-8 bg-zinc-100/50 dark:bg-zinc-900/50 flex items-center justify-center min-h-[120px]', styles: Styles(raw: {'background-image': 'radial-gradient(circle at 1px 1px, rgb(63 63 70 / 0.4) 1px, transparent 0)', 'background-size': '24px 24px'}), components),
    div(classes: 'border-t border-zinc-200 dark:border-zinc-800 bg-zinc-50 dark:bg-zinc-950', [div(classes: 'flex items-center px-4 py-2 border-b border-zinc-200 dark:border-zinc-800', [span(classes: 'text-xs text-zinc-500', [text('dart')])]), div(classes: 'p-4 overflow-x-auto', [pre(classes: 'text-sm', [code(classes: 'text-zinc-700 dark:text-zinc-300', [text(codeExample)])])])]),
  ]);
}
