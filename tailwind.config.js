/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './{lib,web}/**/*.dart',
    './content/**/*.md',
    './packages_duxt_ui/**/*.dart',
  ],
  darkMode: 'class',
  safelist: [
    // Button base classes
    'rounded-md', 'font-medium', 'inline-flex', 'items-center', 'justify-center',
    'disabled:cursor-not-allowed', 'disabled:opacity-75',
    'aria-disabled:cursor-not-allowed', 'aria-disabled:opacity-75',
    'transition-colors', 'focus:outline-none',
    'focus-visible:outline-2', 'focus-visible:outline-offset-2',
    'truncate', 'shrink-0', 'w-full',
    // Sizes
    'p-1', 'p-1.5', 'p-2', 'px-2', 'px-2.5', 'px-3', 'py-1', 'py-1.5', 'py-2',
    'text-xs', 'text-sm', 'text-base',
    'gap-1', 'gap-1.5', 'gap-2', 'gap-3', 'gap-4',
    'size-4', 'size-5', 'size-6',
    'h-4', 'h-5', 'h-8', 'h-9', 'h-10', 'w-4', 'w-5', 'w-8', 'w-9', 'w-10',
    // Animation
    'animate-spin', 'border-2', 'border-current', 'border-t-transparent', 'rounded-full',
    // Ring
    'ring', 'ring-inset', 'ring-1', 'ring-2',
    // Colors - generate patterns for all color variants
    {
      pattern: /bg-(green|blue|red|yellow|gray|zinc|slate|neutral|white|black|cyan|emerald|teal|indigo|purple|pink|orange|amber|lime|rose)-(50|100|200|300|400|500|600|700|800|900|950)/,
      variants: ['hover', 'dark', 'dark:hover', 'focus', 'active'],
    },
    {
      pattern: /bg-(green|blue|red|yellow|gray|zinc|cyan)-(400|500|600)\/(10|20|25|50)/,
      variants: ['hover', 'dark'],
    },
    {
      pattern: /text-(green|blue|red|yellow|gray|zinc|slate|white|black|cyan|neutral)-(50|100|200|300|400|500|600|700|800|900)/,
      variants: ['hover', 'dark', 'group-hover'],
    },
    {
      pattern: /ring-(green|blue|red|yellow|gray|zinc|cyan)-(300|400|500|600|700)\/(25|50)/,
      variants: ['dark'],
    },
    {
      pattern: /border-(green|blue|red|yellow|gray|zinc|slate|cyan)-(200|300|400|500|600|700|800)/,
      variants: ['hover', 'dark', 'focus'],
    },
    {
      pattern: /focus-visible:outline-(green|blue|red|yellow|gray|zinc|cyan)-(400|500|600)/,
    },
    {
      pattern: /placeholder-(gray|zinc|slate)-(400|500)/,
    },
    // Input/Form classes
    'block', 'w-full', 'rounded-md', 'border-0', 'py-1.5', 'px-3',
    'shadow-sm', 'ring-1', 'ring-inset',
    'focus:ring-2', 'focus:ring-inset',
    'sm:text-sm', 'sm:leading-6',
    // Checkbox/Switch
    'peer', 'sr-only', 'relative', 'inline-flex', 'cursor-pointer',
    'rounded', 'border', 'appearance-none',
    'checked:bg-green-500', 'checked:border-green-500',
    'focus:ring-green-500', 'focus:ring-offset-2',
    'peer-checked:bg-green-500', 'peer-focus:ring-2',
    // Layout
    'flex', 'flex-col', 'flex-row', 'flex-wrap', 'space-x-2', 'space-y-2',
    '-space-x-px', '-space-y-px',
    'absolute', 'relative', 'inset-0',
    // Dark mode specific
    'dark:bg-zinc-800', 'dark:bg-zinc-900', 'dark:bg-gray-800', 'dark:bg-gray-900',
    'dark:text-white', 'dark:text-gray-100', 'dark:text-gray-200', 'dark:text-gray-300',
    'dark:text-zinc-100', 'dark:text-zinc-200', 'dark:text-zinc-300', 'dark:text-zinc-400',
    'dark:border-zinc-700', 'dark:border-zinc-600', 'dark:border-gray-700',
    'dark:ring-zinc-700', 'dark:ring-gray-700',
    'dark:placeholder-zinc-500', 'dark:placeholder-gray-500',
    'dark:hover:bg-zinc-700', 'dark:hover:bg-gray-700',
    'dark:focus:ring-green-400',
    // Additional button/input states
    'hover:underline', 'hover:bg-gray-100', 'hover:bg-gray-200',
    'bg-white', 'bg-gray-50', 'bg-gray-100', 'bg-gray-900',
    'text-gray-700', 'text-gray-900', 'text-white',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Nunito', 'system-ui', 'sans-serif'],
      },
      colors: {
        cyan: {
          50: '#ecfeff',
          100: '#cffafe',
          200: '#a5f3fc',
          300: '#67e8f9',
          400: '#22d3ee',
          500: '#06b6d4',
          600: '#0891b2',
          700: '#0e7490',
          800: '#155e75',
          900: '#164e63',
          950: '#083344',
        },
      },
    },
  },
  plugins: [],
}
