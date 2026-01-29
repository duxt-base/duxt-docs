---
title: Duxt - The Meta-Framework for Jaspr
description: Build full-stack Dart web apps with module-based architecture, file-based routing, and powerful scaffolding.
layout: landing
---

<style>
section.content, main, .content { background: transparent !important; padding: 0 !important; margin: 0 !important; max-width: 100% !important; }
.gradient-text { background: linear-gradient(to right, #06b6d4, #3b82f6); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text; }
.hero-full { min-height: 100vh; min-height: 100dvh; }
.icon-box { width: 56px; height: 56px; background: rgba(6, 182, 212, 0.1); border-radius: 16px; display: flex; align-items: center; justify-content: center; margin-bottom: 24px; border: 1px solid rgba(6, 182, 212, 0.2); }
.icon-box svg { width: 28px; height: 28px; color: #22d3ee; }
.check-icon { width: 20px; height: 20px; color: #22d3ee; flex-shrink: 0; }
.small-icon { width: 16px; height: 16px; color: #22d3ee; }
.terminal-box { background: #18181b; border-radius: 16px; overflow: hidden; border: 1px solid #27272a; box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5); }
.terminal-header { display: flex; align-items: center; gap: 8px; padding: 12px 20px; background: rgba(39, 39, 42, 0.5); border-bottom: 1px solid #27272a; }
.terminal-dot { width: 12px; height: 12px; border-radius: 50%; }
.terminal-body { padding: 24px 32px; font-family: ui-monospace, monospace; font-size: 14px; overflow-x: auto; }
.code-box { background: #18181b; border-radius: 16px; padding: 24px; border: 1px solid #27272a; font-family: ui-monospace, monospace; font-size: 14px; }
.feature-card { background: rgba(24, 24, 27, 0.5); border-radius: 16px; padding: 24px; border: 1px solid #27272a; }
.stat-card { background: rgba(24, 24, 27, 0.5); border-radius: 16px; padding: 24px; border: 1px solid #27272a; }
.stat-value { font-size: 2.25rem; font-weight: 700; color: #22d3ee; margin-bottom: 8px; }
.stat-label { color: #a1a1aa; }
</style>

<div style="min-height: 100vh; background: #09090b; color: #e4e4e7;">
  <section class="hero-full" style="display: flex; flex-direction: column; align-items: center; justify-content: center; padding: 0 24px; text-align: center; background: linear-gradient(to bottom, rgba(6, 182, 212, 0.05), transparent); position: relative;">
    <div style="position: absolute; inset: 0; background: radial-gradient(ellipse at top, rgba(6, 182, 212, 0.15), transparent 50%);"></div>
    <div style="max-width: 896px; margin: 0 auto; position: relative; z-index: 10;">
      <span style="display: inline-flex; padding: 6px 16px; background: rgba(6, 182, 212, 0.1); color: #22d3ee; font-size: 14px; font-weight: 500; border-radius: 9999px; margin-bottom: 32px; border: 1px solid rgba(6, 182, 212, 0.2);">Built on Jaspr</span>
      <h1 style="font-size: 3.5rem; font-weight: 700; color: white; margin-bottom: 32px; line-height: 1.1; letter-spacing: -0.02em;">The Meta-Framework<br/>for <span class="gradient-text">Jaspr</span></h1>
      <p style="font-size: 1.25rem; color: #a1a1aa; margin-bottom: 48px; max-width: 640px; margin-left: auto; margin-right: auto; line-height: 1.6;">Build full-stack Dart web apps with module-based architecture, file-based routing, and powerful scaffolding.</p>
      <div style="display: flex; gap: 16px; justify-content: center; flex-wrap: wrap;">
        <a href="/duxt" style="display: inline-flex; align-items: center; justify-content: center; padding: 16px 32px; font-size: 16px; font-weight: 600; border-radius: 12px; background: #06b6d4; color: white; text-decoration: none; transition: all 0.3s;">Get Started →</a>
        <a href="https://github.com/duxt-base/duxt" target="_blank" style="display: inline-flex; align-items: center; justify-content: center; padding: 16px 32px; font-size: 16px; font-weight: 600; border-radius: 12px; border: 1px solid #3f3f46; color: #d4d4d8; background: rgba(24, 24, 27, 0.5); text-decoration: none; transition: all 0.3s;">View on GitHub</a>
      </div>
    </div>
    <div style="position: absolute; bottom: 32px; left: 50%; transform: translateX(-50%);">
      <svg width="24" height="24" fill="none" stroke="#71717a" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"></path></svg>
    </div>
  </section>
  <section style="padding: 128px 24px; background: linear-gradient(to bottom, transparent, rgba(24, 24, 27, 0.5));">
    <div style="max-width: 896px; margin: 0 auto;">
      <div style="text-align: center; margin-bottom: 64px;">
        <h2 style="font-size: 2.25rem; font-weight: 700; color: white; margin-bottom: 16px;">Up and running in seconds</h2>
        <p style="font-size: 1.125rem; color: #a1a1aa;">Three commands to your first Duxt app</p>
      </div>
      <div class="terminal-box">
        <div class="terminal-header">
          <div class="terminal-dot" style="background: rgba(239, 68, 68, 0.8);"></div>
          <div class="terminal-dot" style="background: rgba(234, 179, 8, 0.8);"></div>
          <div class="terminal-dot" style="background: rgba(34, 197, 94, 0.8);"></div>
          <span style="margin-left: 12px; color: #71717a; font-size: 14px; font-weight: 500;">Terminal</span>
        </div>
        <div class="terminal-body">
          <div style="line-height: 1.8; color: #52525b;">// Install the CLI globally</div>
          <div style="line-height: 1.8;"><span style="color: #22d3ee;">$</span> <span style="color: #d4d4d8;">dart pub global activate duxt</span></div>
          <div style="line-height: 1.8; margin-top: 16px; color: #52525b;">// Create a new project</div>
          <div style="line-height: 1.8;"><span style="color: #22d3ee;">$</span> <span style="color: #d4d4d8;">duxt create my-app</span></div>
          <div style="line-height: 1.8; margin-top: 16px; color: #52525b;">// Start developing</div>
          <div style="line-height: 1.8;"><span style="color: #22d3ee;">$</span> <span style="color: #d4d4d8;">cd my-app && duxt dev</span></div>
          <div style="line-height: 1.8; margin-top: 16px; color: #22c55e;">✓ Server running at http://localhost:8080</div>
        </div>
      </div>
    </div>
  </section>
  <section style="padding: 128px 24px;">
    <div style="max-width: 1152px; margin: 0 auto;">
      <div style="display: grid; grid-template-columns: 1fr; gap: 64px; align-items: center;">
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 64px; align-items: center;">
          <div>
            <span style="color: #22d3ee; font-weight: 600; font-size: 14px; letter-spacing: 0.05em; text-transform: uppercase; margin-bottom: 16px; display: block;">What is Duxt?</span>
            <h2 style="font-size: 2.25rem; font-weight: 700; color: white; margin-bottom: 24px; line-height: 1.2;">A meta-framework that brings structure to Jaspr</h2>
            <p style="font-size: 1.125rem; color: #a1a1aa; margin-bottom: 24px; line-height: 1.6;">Duxt builds on top of Jaspr to provide conventions, tooling, and patterns that make building full-stack Dart applications a breeze.</p>
            <p style="font-size: 1.125rem; color: #a1a1aa; line-height: 1.6;">Think of it like Next.js for React, or Nuxt for Vue — but for Jaspr and Dart.</p>
          </div>
          <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px;">
            <div class="stat-card"><div class="stat-value">100%</div><div class="stat-label">Type-safe Dart</div></div>
            <div class="stat-card"><div class="stat-value">0</div><div class="stat-label">Config needed</div></div>
            <div class="stat-card"><div class="stat-value">CLI</div><div class="stat-label">Scaffolding</div></div>
            <div class="stat-card"><div class="stat-value">SSR</div><div class="stat-label">& Static Gen</div></div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <section style="padding: 128px 24px; background: rgba(24, 24, 27, 0.3);">
    <div style="max-width: 1152px; margin: 0 auto;">
      <div style="text-align: center; margin-bottom: 80px;">
        <span style="color: #22d3ee; font-weight: 600; font-size: 14px; letter-spacing: 0.05em; text-transform: uppercase; margin-bottom: 16px; display: block;">Core Features</span>
        <h2 style="font-size: 2.25rem; font-weight: 700; color: white; margin-bottom: 16px;">Everything you need to build modern apps</h2>
        <p style="font-size: 1.125rem; color: #a1a1aa; max-width: 640px; margin: 0 auto;">Duxt provides all the tools and patterns for scalable Dart web development.</p>
      </div>
      <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 48px; align-items: center; margin-bottom: 96px;">
        <div>
          <div class="icon-box"><svg width="28" height="28" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2V6zM14 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V6zM4 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2v-2zM14 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"></path></svg></div>
          <h3 style="font-size: 1.5rem; font-weight: 700; color: white; margin-bottom: 16px;">Module-Based Architecture</h3>
          <p style="color: #a1a1aa; margin-bottom: 24px; line-height: 1.6;">Organize your application by feature, not by type. Each module contains its own pages, components, models, and API calls.</p>
          <ul style="list-style: none; padding: 0; margin: 0;">
            <li style="display: flex; align-items: center; gap: 12px; color: #d4d4d8; margin-bottom: 12px;"><svg width="20" height="20" fill="none" stroke="#22d3ee" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>Self-contained features</li>
            <li style="display: flex; align-items: center; gap: 12px; color: #d4d4d8; margin-bottom: 12px;"><svg width="20" height="20" fill="none" stroke="#22d3ee" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>Easy to test and refactor</li>
            <li style="display: flex; align-items: center; gap: 12px; color: #d4d4d8;"><svg width="20" height="20" fill="none" stroke="#22d3ee" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>Team-friendly structure</li>
          </ul>
        </div>
        <div class="code-box">
          <div style="color: #71717a; margin-bottom: 16px;">lib/modules/</div>
          <div style="color: #d4d4d8; line-height: 1.6;">
            <div>├── <span style="color: #22d3ee;">auth/</span></div>
            <div style="padding-left: 16px;">├── pages/</div>
            <div style="padding-left: 16px;">├── components/</div>
            <div style="padding-left: 16px;">├── models/</div>
            <div style="padding-left: 16px;">└── api/</div>
            <div>├── <span style="color: #22d3ee;">dashboard/</span></div>
            <div style="padding-left: 16px;">├── pages/</div>
            <div style="padding-left: 16px;">├── components/</div>
            <div style="padding-left: 16px;">└── widgets/</div>
            <div>└── <span style="color: #22d3ee;">settings/</span></div>
            <div style="padding-left: 16px;">└── ...</div>
          </div>
        </div>
      </div>
      <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 48px; align-items: center; margin-bottom: 96px;">
        <div class="code-box">
          <div style="color: #71717a; margin-bottom: 16px;">pages/</div>
          <div style="color: #d4d4d8; line-height: 1.8;">
            <div>index.dart <span style="color: #52525b;">→</span> <span style="color: #22d3ee;">/</span></div>
            <div>about.dart <span style="color: #52525b;">→</span> <span style="color: #22d3ee;">/about</span></div>
            <div>blog/</div>
            <div style="padding-left: 16px;">index.dart <span style="color: #52525b;">→</span> <span style="color: #22d3ee;">/blog</span></div>
            <div style="padding-left: 16px;">[slug].dart <span style="color: #52525b;">→</span> <span style="color: #22d3ee;">/blog/:slug</span></div>
            <div>users/</div>
            <div style="padding-left: 16px;">[id]/</div>
            <div style="padding-left: 32px;">index.dart <span style="color: #52525b;">→</span> <span style="color: #22d3ee;">/users/:id</span></div>
          </div>
        </div>
        <div>
          <div class="icon-box"><svg width="28" height="28" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 20l-5.447-2.724A1 1 0 013 16.382V5.618a1 1 0 011.447-.894L9 7m0 13l6-3m-6 3V7m6 10l4.553 2.276A1 1 0 0021 18.382V7.618a1 1 0 00-.553-.894L15 4m0 13V4m0 0L9 7"></path></svg></div>
          <h3 style="font-size: 1.5rem; font-weight: 700; color: white; margin-bottom: 16px;">File-Based Routing</h3>
          <p style="color: #a1a1aa; margin-bottom: 24px; line-height: 1.6;">Your file structure becomes your routes. No configuration files, no manual route definitions.</p>
          <ul style="list-style: none; padding: 0; margin: 0;">
            <li style="display: flex; align-items: center; gap: 12px; color: #d4d4d8; margin-bottom: 12px;"><svg width="20" height="20" fill="none" stroke="#22d3ee" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>Zero configuration</li>
            <li style="display: flex; align-items: center; gap: 12px; color: #d4d4d8; margin-bottom: 12px;"><svg width="20" height="20" fill="none" stroke="#22d3ee" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>Dynamic routes with [params]</li>
            <li style="display: flex; align-items: center; gap: 12px; color: #d4d4d8;"><svg width="20" height="20" fill="none" stroke="#22d3ee" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>Nested layouts support</li>
          </ul>
        </div>
      </div>
      <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 48px; align-items: center;">
        <div>
          <div class="icon-box"><svg width="28" height="28" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 9l3 3-3 3m5 0h3M5 20h14a2 2 0 002-2V6a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg></div>
          <h3 style="font-size: 1.5rem; font-weight: 700; color: white; margin-bottom: 16px;">Powerful CLI</h3>
          <p style="color: #a1a1aa; margin-bottom: 24px; line-height: 1.6;">Generate modules, pages, components, and complete CRUD scaffolds with simple commands.</p>
          <ul style="list-style: none; padding: 0; margin: 0;">
            <li style="display: flex; align-items: center; gap: 12px; color: #d4d4d8; margin-bottom: 12px;"><svg width="20" height="20" fill="none" stroke="#22d3ee" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>Generate any scaffold type</li>
            <li style="display: flex; align-items: center; gap: 12px; color: #d4d4d8; margin-bottom: 12px;"><svg width="20" height="20" fill="none" stroke="#22d3ee" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>Full CRUD generation</li>
            <li style="display: flex; align-items: center; gap: 12px; color: #d4d4d8;"><svg width="20" height="20" fill="none" stroke="#22d3ee" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>Customizable templates</li>
          </ul>
        </div>
        <div class="code-box" style="line-height: 1.8;">
          <div style="color: #52525b; margin-bottom: 4px;">// Generate a new module</div>
          <div style="margin-bottom: 16px;"><span style="color: #22d3ee;">$</span> <span style="color: #d4d4d8;">duxt g module users</span></div>
          <div style="color: #52525b; margin-bottom: 4px;">// Generate a page</div>
          <div style="margin-bottom: 16px;"><span style="color: #22d3ee;">$</span> <span style="color: #d4d4d8;">duxt g page users/profile</span></div>
          <div style="color: #52525b; margin-bottom: 4px;">// Generate full CRUD</div>
          <div style="margin-bottom: 16px;"><span style="color: #22d3ee;">$</span> <span style="color: #d4d4d8;">duxt g crud products</span></div>
          <div style="padding-top: 12px; border-top: 1px solid #27272a; color: #22c55e;">✓ Created 8 files</div>
        </div>
      </div>
    </div>
  </section>
  <section style="padding: 128px 24px;">
    <div style="max-width: 1152px; margin: 0 auto;">
      <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 64px; align-items: center;">
        <div>
          <span style="display: inline-flex; padding: 6px 16px; background: rgba(59, 130, 246, 0.1); color: #60a5fa; font-size: 14px; font-weight: 500; border-radius: 9999px; margin-bottom: 24px; border: 1px solid rgba(59, 130, 246, 0.2);">Duxt UI</span>
          <h2 style="font-size: 2.25rem; font-weight: 700; color: white; margin-bottom: 24px; line-height: 1.2;">Beautiful components built for Jaspr</h2>
          <p style="font-size: 1.125rem; color: #a1a1aa; margin-bottom: 32px; line-height: 1.6;">A comprehensive component library with 100+ beautifully crafted components. Dark mode, full type safety, and seamless Tailwind integration.</p>
          <ul style="list-style: none; padding: 0; margin: 0 0 32px 0;">
            <li style="display: flex; align-items: flex-start; gap: 16px; margin-bottom: 16px;">
              <div style="width: 32px; height: 32px; background: rgba(6, 182, 212, 0.1); border-radius: 8px; display: flex; align-items: center; justify-content: center; flex-shrink: 0;"><svg width="16" height="16" fill="none" stroke="#22d3ee" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg></div>
              <div><div style="color: white; font-weight: 500;">Buttons, Inputs, Cards, Modals, Tables</div><div style="color: #71717a; font-size: 14px;">All the essentials you need</div></div>
            </li>
            <li style="display: flex; align-items: flex-start; gap: 16px; margin-bottom: 16px;">
              <div style="width: 32px; height: 32px; background: rgba(6, 182, 212, 0.1); border-radius: 8px; display: flex; align-items: center; justify-content: center; flex-shrink: 0;"><svg width="16" height="16" fill="none" stroke="#22d3ee" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg></div>
              <div><div style="color: white; font-weight: 500;">Dark mode built-in</div><div style="color: #71717a; font-size: 14px;">Automatic theme switching</div></div>
            </li>
            <li style="display: flex; align-items: flex-start; gap: 16px;">
              <div style="width: 32px; height: 32px; background: rgba(6, 182, 212, 0.1); border-radius: 8px; display: flex; align-items: center; justify-content: center; flex-shrink: 0;"><svg width="16" height="16" fill="none" stroke="#22d3ee" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg></div>
              <div><div style="color: white; font-weight: 500;">Fully customizable</div><div style="color: #71717a; font-size: 14px;">Tailwind-powered styling</div></div>
            </li>
          </ul>
          <a href="/duxt-ui" style="display: inline-flex; align-items: center; gap: 8px; color: #22d3ee; font-weight: 600; text-decoration: none;">Explore Components <svg width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"></path></svg></a>
        </div>
        <div class="code-box" style="padding: 32px; line-height: 1.8;">
          <div><span style="color: #60a5fa;">import</span> <span style="color: #4ade80;">'package:duxt_ui/duxt_ui.dart'</span>;</div>
          <div style="margin-top: 16px;"><span style="color: #22d3ee;">DButton</span>(</div>
          <div style="padding-left: 16px;">label: <span style="color: #4ade80;">'Get Started'</span>,</div>
          <div style="padding-left: 16px;">variant: <span style="color: #fbbf24;">DButtonVariant</span>.solid,</div>
          <div style="padding-left: 16px;">color: <span style="color: #fbbf24;">DColor</span>.primary,</div>
          <div style="padding-left: 16px;">size: <span style="color: #fbbf24;">DSize</span>.lg,</div>
          <div style="padding-left: 16px;">onPressed: () =&gt; navigate(<span style="color: #4ade80;">'/docs'</span>),</div>
          <div>)</div>
        </div>
      </div>
    </div>
  </section>
  <section style="padding: 128px 24px; background: linear-gradient(135deg, rgba(6, 182, 212, 0.1), rgba(59, 130, 246, 0.1));">
    <div style="max-width: 896px; margin: 0 auto; text-align: center;">
      <h2 style="font-size: 2.5rem; font-weight: 700; color: white; margin-bottom: 24px;">Ready to build something amazing?</h2>
      <p style="font-size: 1.25rem; color: #a1a1aa; margin-bottom: 40px; max-width: 640px; margin-left: auto; margin-right: auto;">Get started with Duxt today and experience the power of full-stack Dart development.</p>
      <div style="display: flex; gap: 16px; justify-content: center; flex-wrap: wrap;">
        <a href="/duxt" style="display: inline-flex; align-items: center; justify-content: center; padding: 16px 32px; font-size: 16px; font-weight: 600; border-radius: 12px; background: white; color: #18181b; text-decoration: none;">Get Started</a>
        <a href="https://github.com/duxt-base/duxt" target="_blank" style="display: inline-flex; align-items: center; justify-content: center; padding: 16px 32px; font-size: 16px; font-weight: 600; border-radius: 12px; border: 1px solid #3f3f46; color: #d4d4d8; text-decoration: none;">Star on GitHub</a>
      </div>
    </div>
  </section>
  <footer style="padding: 64px 24px; border-top: 1px solid #27272a;">
    <div style="max-width: 1152px; margin: 0 auto;">
      <div style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 32px; margin-bottom: 48px;">
        <div>
          <h4 style="font-size: 14px; font-weight: 600; color: white; margin-bottom: 16px;">Duxt</h4>
          <ul style="list-style: none; padding: 0; margin: 0;">
            <li style="margin-bottom: 12px;"><a href="/duxt" style="color: #71717a; font-size: 14px; text-decoration: none;">Introduction</a></li>
            <li style="margin-bottom: 12px;"><a href="/duxt/modules" style="color: #71717a; font-size: 14px; text-decoration: none;">Modules</a></li>
            <li style="margin-bottom: 12px;"><a href="/duxt/routing" style="color: #71717a; font-size: 14px; text-decoration: none;">Routing</a></li>
            <li><a href="/duxt/cli" style="color: #71717a; font-size: 14px; text-decoration: none;">CLI Commands</a></li>
          </ul>
        </div>
        <div>
          <h4 style="font-size: 14px; font-weight: 600; color: white; margin-bottom: 16px;">Duxt UI</h4>
          <ul style="list-style: none; padding: 0; margin: 0;">
            <li style="margin-bottom: 12px;"><a href="/duxt-ui" style="color: #71717a; font-size: 14px; text-decoration: none;">Introduction</a></li>
            <li style="margin-bottom: 12px;"><a href="/duxt-ui/components/button" style="color: #71717a; font-size: 14px; text-decoration: none;">Button</a></li>
            <li style="margin-bottom: 12px;"><a href="/duxt-ui/components/input" style="color: #71717a; font-size: 14px; text-decoration: none;">Input</a></li>
            <li><a href="/duxt-ui/components/card" style="color: #71717a; font-size: 14px; text-decoration: none;">Card</a></li>
          </ul>
        </div>
        <div>
          <h4 style="font-size: 14px; font-weight: 600; color: white; margin-bottom: 16px;">Resources</h4>
          <ul style="list-style: none; padding: 0; margin: 0;">
            <li style="margin-bottom: 12px;"><a href="/about" style="color: #71717a; font-size: 14px; text-decoration: none;">About</a></li>
            <li style="margin-bottom: 12px;"><a href="https://jaspr.dev" target="_blank" style="color: #71717a; font-size: 14px; text-decoration: none;">Jaspr</a></li>
            <li><a href="https://dart.dev" target="_blank" style="color: #71717a; font-size: 14px; text-decoration: none;">Dart</a></li>
          </ul>
        </div>
        <div>
          <h4 style="font-size: 14px; font-weight: 600; color: white; margin-bottom: 16px;">Community</h4>
          <ul style="list-style: none; padding: 0; margin: 0;">
            <li style="margin-bottom: 12px;"><a href="https://github.com/duxt-base/duxt" target="_blank" style="color: #71717a; font-size: 14px; text-decoration: none;">GitHub</a></li>
            <li style="margin-bottom: 12px;"><a href="https://github.com/duxt-base/duxt-ui" target="_blank" style="color: #71717a; font-size: 14px; text-decoration: none;">Duxt UI Repo</a></li>
            <li><a href="https://github.com/duxt-base/duxt/issues" target="_blank" style="color: #71717a; font-size: 14px; text-decoration: none;">Report Issue</a></li>
          </ul>
        </div>
      </div>
      <div style="padding-top: 32px; border-top: 1px solid #27272a; display: flex; justify-content: space-between; align-items: center;">
        <div style="display: flex; align-items: center; gap: 12px; color: #71717a;">
          <img src="/images/logo.svg" alt="Duxt" style="height: 24px; width: 24px;" />
          <span style="font-weight: 500;">Duxt</span>
        </div>
        <p style="color: #52525b; font-size: 14px;">Built with Jaspr and Dart. Open source under MIT License.</p>
      </div>
    </div>
  </footer>
</div>
