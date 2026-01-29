import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr_content/jaspr_content.dart';
import 'package:duxt_ui/duxt_ui.dart';

/// Custom component for rendering live Duxt UI component previews in markdown.
/// Shows live preview on top and code example below (like Nuxt UI).
class UiPreview extends CustomComponentBase {
  const UiPreview();

  @override
  final Pattern pattern = 'ComponentPreview';

  @override
  Component apply(String name, Map<String, String> attributes, Component? child) {
    final componentName = attributes['name'] ?? '';
    return _buildPreview(componentName);
  }

  Component _buildPreview(String name) {
    final preview = _getPreviewComponent(name);
    final codeExample = _getCodeExample(name);

    return div(
      classes: 'not-prose my-6 rounded-xl border border-zinc-800 overflow-hidden',
      [
        // Live Preview area
        div(
          classes: 'p-8 bg-zinc-900/50 flex items-center justify-center min-h-[180px]',
          styles: Styles(raw: {
            'background-image': 'radial-gradient(circle at 1px 1px, rgb(63 63 70 / 0.4) 1px, transparent 0)',
            'background-size': '24px 24px',
          }),
          [preview],
        ),
        // Code area
        div(
          classes: 'border-t border-zinc-800 bg-zinc-950',
          [
            div(
              classes: 'flex items-center justify-between px-4 py-2 border-b border-zinc-800',
              [
                span(classes: 'text-xs text-zinc-500', [Component.text('dart')]),
                button(
                  type: ButtonType.button,
                  classes: 'p-1.5 text-zinc-500 hover:text-zinc-300 hover:bg-zinc-800 rounded transition-colors',
                  attributes: {'aria-label': 'Copy code'},
                  [
                    RawText('<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00-2 2v8a2 2 0 002 2z"></path></svg>'),
                  ],
                ),
              ],
            ),
            div(
              classes: 'p-4 overflow-x-auto',
              [
                pre(classes: 'text-sm', [
                  code(classes: 'language-dart text-zinc-300', [
                    RawText(codeExample),
                  ]),
                ]),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Component _getPreviewComponent(String name) {
    switch (name) {
      case 'button':
        return div(classes: 'flex flex-wrap items-center gap-3', [
          DButton(label: 'Primary', variant: DButtonVariant.solid, color: DButtonColor.primary),
          DButton(label: 'Secondary', variant: DButtonVariant.outline, color: DButtonColor.neutral),
          DButton(label: 'Ghost', variant: DButtonVariant.ghost),
        ]);

      case 'input':
        return div(classes: 'w-full max-w-sm', [
          DInput(placeholder: 'Enter your email...'),
        ]);

      case 'badge':
        return div(classes: 'flex flex-wrap items-center gap-3', [
          DBadge(label: 'New', color: DBadgeColor.primary),
          DBadge(label: 'Success', color: DBadgeColor.success),
          DBadge(label: 'Warning', color: DBadgeColor.warning),
          DBadge(label: 'Error', color: DBadgeColor.error),
        ]);

      case 'avatar':
        return div(classes: 'flex items-center gap-3', [
          DAvatar(alt: 'JD', size: DAvatarSize.sm),
          DAvatar(alt: 'AB', size: DAvatarSize.md),
          DAvatar(alt: 'XY', size: DAvatarSize.lg),
        ]);

      case 'alert':
        return div(classes: 'w-full max-w-md', [
          DAlert(
            title: 'Heads up!',
            description: 'You can add components to your app using the cli.',
            color: DAlertColor.info,
          ),
        ]);

      case 'spinner':
        return div(classes: 'flex items-center gap-4', [
          DSpinner(size: DSpinnerSize.sm),
          DSpinner(size: DSpinnerSize.md),
          DSpinner(size: DSpinnerSize.lg),
        ]);

      case 'progress':
        return div(classes: 'w-full max-w-sm space-y-3', [
          DProgress(value: 25),
          DProgress(value: 50),
          DProgress(value: 75),
        ]);

      case 'switch':
        return div(classes: 'flex items-center gap-4', [
          DSwitch(checked: false),
          DSwitch(checked: true),
        ]);

      case 'checkbox':
        return div(classes: 'flex items-center gap-4', [
          DCheckbox(label: 'Option 1', checked: true),
          DCheckbox(label: 'Option 2', checked: false),
        ]);

      case 'tabs':
        return DTabs(
          items: [
            DTabItem(label: 'Account', value: 'account'),
            DTabItem(label: 'Password', value: 'password'),
            DTabItem(label: 'Settings', value: 'settings'),
          ],
          defaultValue: 'account',
        );

      case 'skeleton':
        return div(classes: 'w-full max-w-sm space-y-3', [
          DSkeleton(classes: 'h-4 w-3/4'),
          DSkeleton(classes: 'h-4 w-1/2'),
          DSkeleton(classes: 'h-4 w-5/6'),
        ]);

      case 'kbd':
        return div(classes: 'flex items-center gap-2', [
          DKbd(keys: ['⌘']),
          DKbd(keys: ['K']),
        ]);

      case 'icon':
        return div(classes: 'flex items-center gap-4 text-zinc-300', [
          DIcon(name: DIconNames.home, size: DIconSize.sm),
          DIcon(name: DIconNames.settings, size: DIconSize.md),
          DIcon(name: DIconNames.search, size: DIconSize.lg),
        ]);

      case 'separator':
        return div(classes: 'w-full max-w-sm', [
          div(classes: 'text-zinc-400 text-sm', [Component.text('Above')]),
          DSeparator(classes: 'my-4'),
          div(classes: 'text-zinc-400 text-sm', [Component.text('Below')]),
        ]);

      case 'breadcrumb':
        return DBreadcrumb(
          items: [
            DBreadcrumbItem(label: 'Docs', href: '/docs'),
            DBreadcrumbItem(label: 'Components', href: '/components'),
            DBreadcrumbItem(label: 'Breadcrumb'),
          ],
        );

      case 'pagination':
        return DPagination(
          currentPage: 3,
          totalPages: 10,
        );

      default:
        return div(classes: 'text-zinc-500', [
          Component.text('Preview for "$name"'),
        ]);
    }
  }

  String _getCodeExample(String name) {
    switch (name) {
      case 'button':
        return '''<span class="text-cyan-400">DButton</span>(
  <span class="text-purple-400">label</span>: <span class="text-green-400">'Primary'</span>,
  <span class="text-purple-400">variant</span>: DButtonVariant.solid,
  <span class="text-purple-400">color</span>: DButtonColor.primary,
)''';

      case 'input':
        return '''<span class="text-cyan-400">DInput</span>(
  <span class="text-purple-400">placeholder</span>: <span class="text-green-400">'Enter your email...'</span>,
)''';

      case 'badge':
        return '''<span class="text-cyan-400">DBadge</span>(
  <span class="text-purple-400">label</span>: <span class="text-green-400">'New'</span>,
  <span class="text-purple-400">color</span>: DBadgeColor.primary,
)''';

      case 'avatar':
        return '''<span class="text-cyan-400">DAvatar</span>(
  <span class="text-purple-400">alt</span>: <span class="text-green-400">'JD'</span>,
  <span class="text-purple-400">size</span>: DAvatarSize.md,
)''';

      case 'alert':
        return '''<span class="text-cyan-400">DAlert</span>(
  <span class="text-purple-400">title</span>: <span class="text-green-400">'Heads up!'</span>,
  <span class="text-purple-400">description</span>: <span class="text-green-400">'You can add components...'</span>,
  <span class="text-purple-400">color</span>: DAlertColor.info,
)''';

      case 'spinner':
        return '''<span class="text-cyan-400">DSpinner</span>(
  <span class="text-purple-400">size</span>: DSpinnerSize.md,
)''';

      case 'progress':
        return '''<span class="text-cyan-400">DProgress</span>(
  <span class="text-purple-400">value</span>: <span class="text-orange-400">50</span>,
)''';

      case 'switch':
        return '''<span class="text-cyan-400">DSwitch</span>(
  <span class="text-purple-400">checked</span>: <span class="text-orange-400">true</span>,
  <span class="text-purple-400">onChanged</span>: (value) =&gt; setState(() =&gt; checked = value),
)''';

      case 'checkbox':
        return '''<span class="text-cyan-400">DCheckbox</span>(
  <span class="text-purple-400">label</span>: <span class="text-green-400">'Option 1'</span>,
  <span class="text-purple-400">checked</span>: <span class="text-orange-400">true</span>,
)''';

      case 'tabs':
        return '''<span class="text-cyan-400">DTabs</span>(
  <span class="text-purple-400">items</span>: [
    DTabItem(<span class="text-purple-400">label</span>: <span class="text-green-400">'Account'</span>, <span class="text-purple-400">value</span>: <span class="text-green-400">'account'</span>),
    DTabItem(<span class="text-purple-400">label</span>: <span class="text-green-400">'Password'</span>, <span class="text-purple-400">value</span>: <span class="text-green-400">'password'</span>),
  ],
  <span class="text-purple-400">defaultValue</span>: <span class="text-green-400">'account'</span>,
)''';

      case 'skeleton':
        return '''<span class="text-cyan-400">DSkeleton</span>(
  <span class="text-purple-400">classes</span>: <span class="text-green-400">'h-4 w-3/4'</span>,
)''';

      case 'kbd':
        return '''<span class="text-cyan-400">DKbd</span>(
  <span class="text-purple-400">keys</span>: [<span class="text-green-400">'⌘'</span>, <span class="text-green-400">'K'</span>],
)''';

      case 'icon':
        return '''<span class="text-cyan-400">DIcon</span>(
  <span class="text-purple-400">name</span>: DIconNames.home,
  <span class="text-purple-400">size</span>: DIconSize.md,
)''';

      case 'separator':
        return '''<span class="text-cyan-400">DSeparator</span>()''';

      case 'breadcrumb':
        return '''<span class="text-cyan-400">DBreadcrumb</span>(
  <span class="text-purple-400">items</span>: [
    DBreadcrumbItem(<span class="text-purple-400">label</span>: <span class="text-green-400">'Docs'</span>, <span class="text-purple-400">href</span>: <span class="text-green-400">'/docs'</span>),
    DBreadcrumbItem(<span class="text-purple-400">label</span>: <span class="text-green-400">'Components'</span>),
  ],
)''';

      case 'pagination':
        return '''<span class="text-cyan-400">DPagination</span>(
  <span class="text-purple-400">currentPage</span>: <span class="text-orange-400">3</span>,
  <span class="text-purple-400">totalPages</span>: <span class="text-orange-400">10</span>,
)''';

      default:
        return '''<span class="text-cyan-400">D${_capitalize(name)}</span>()''';
    }
  }

  String _capitalize(String s) {
    if (s.isEmpty) return s;
    return s[0].toUpperCase() + s.substring(1);
  }
}

/// A card preview component for the components index page.
class UiPreviewCard extends CustomComponentBase {
  const UiPreviewCard();

  @override
  final Pattern pattern = 'PreviewCard';

  @override
  Component apply(String name, Map<String, String> attributes, Component? child) {
    final componentName = attributes['name'] ?? '';
    final title = attributes['title'] ?? componentName;
    final description = attributes['description'] ?? '';
    final href = attributes['href'] ?? '/duxt-ui/components/$componentName';

    final preview = _getPreviewComponent(componentName);

    return div(
      classes: 'rounded-xl border border-zinc-800 overflow-hidden',
      [
        div(
          classes: 'aspect-[4/3] bg-zinc-900/50 flex items-center justify-center p-4',
          styles: Styles(raw: {
            'background-image': 'radial-gradient(circle at 1px 1px, rgb(63 63 70 / 0.3) 1px, transparent 0)',
            'background-size': '20px 20px',
          }),
          [preview],
        ),
        div(classes: 'p-4 border-t border-zinc-800', [
          h3(classes: 'font-semibold', [
            a(href: href, classes: 'text-white hover:text-cyan-400 transition-colors', [
              Component.text(title),
            ]),
          ]),
          p(classes: 'text-sm text-zinc-400 mt-1', [
            Component.text(description),
          ]),
        ]),
      ],
    );
  }

  Component _getPreviewComponent(String name) {
    switch (name) {
      case 'button':
        return div(classes: 'flex flex-wrap items-center gap-2 scale-90', [
          DButton(label: 'Button', variant: DButtonVariant.solid, color: DButtonColor.primary, size: DButtonSize.sm),
          DButton(label: 'Outline', variant: DButtonVariant.outline, size: DButtonSize.sm),
        ]);

      case 'input':
        return div(classes: 'w-full max-w-[200px] scale-90', [
          DInput(placeholder: 'Type here...', size: DInputSize.sm),
        ]);

      case 'badge':
        return div(classes: 'flex flex-wrap items-center gap-2 scale-90', [
          DBadge(label: 'New', color: DBadgeColor.primary),
          DBadge(label: 'Beta', color: DBadgeColor.warning),
        ]);

      case 'avatar':
        return div(classes: 'flex items-center gap-2 scale-90', [
          DAvatar(alt: 'JD', size: DAvatarSize.sm),
          DAvatar(alt: 'AB', size: DAvatarSize.md),
        ]);

      case 'progress':
        return div(classes: 'w-full max-w-[180px] scale-90', [
          DProgress(value: 60),
        ]);

      case 'skeleton':
        return div(classes: 'w-full max-w-[180px] space-y-2 scale-90', [
          DSkeleton(classes: 'h-3 w-full'),
          DSkeleton(classes: 'h-3 w-3/4'),
        ]);

      case 'icon':
        return div(classes: 'flex items-center gap-3 text-zinc-300', [
          DIcon(name: DIconNames.home, size: DIconSize.md),
          DIcon(name: DIconNames.settings, size: DIconSize.md),
          DIcon(name: DIconNames.search, size: DIconSize.md),
        ]);

      case 'kbd':
        return div(classes: 'flex items-center gap-1 scale-90', [
          DKbd(keys: ['⌘']),
          DKbd(keys: ['K']),
        ]);

      case 'alert':
        return div(classes: 'w-full max-w-[220px] scale-90', [
          DAlert(
            title: 'Note',
            description: 'This is important.',
            color: DAlertColor.info,
          ),
        ]);

      case 'spinner':
        return div(classes: 'flex items-center gap-3', [
          DSpinner(size: DSpinnerSize.sm),
          DSpinner(size: DSpinnerSize.md),
        ]);

      case 'switch':
        return div(classes: 'flex items-center gap-3 scale-90', [
          DSwitch(checked: true),
          DSwitch(checked: false),
        ]);

      case 'checkbox':
        return div(classes: 'flex flex-col gap-2 scale-90', [
          DCheckbox(label: 'Option 1', checked: true),
          DCheckbox(label: 'Option 2'),
        ]);

      case 'tabs':
        return DTabs(
          items: [
            DTabItem(label: 'Tab 1', value: '1'),
            DTabItem(label: 'Tab 2', value: '2'),
          ],
          defaultValue: '1',
        );

      case 'breadcrumb':
        return div(classes: 'scale-90', [
          DBreadcrumb(
            items: [
              DBreadcrumbItem(label: 'Home', href: '/'),
              DBreadcrumbItem(label: 'Docs'),
            ],
          ),
        ]);

      case 'pagination':
        return div(classes: 'scale-75', [
          DPagination(currentPage: 2, totalPages: 5),
        ]);

      case 'separator':
        return div(classes: 'w-full max-w-[150px] scale-90', [
          div(classes: 'text-xs text-zinc-500 mb-2', [Component.text('Above')]),
          DSeparator(),
          div(classes: 'text-xs text-zinc-500 mt-2', [Component.text('Below')]),
        ]);

      // Placeholder for components we don't have simple previews for
      default:
        return div(classes: 'w-16 h-16 rounded-lg bg-zinc-800 flex items-center justify-center', [
          span(classes: 'text-zinc-500 text-xs', [Component.text(name)]),
        ]);
    }
  }
}
