<!DOCTYPE html>
<html lang="en" data-theme="dark">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BST Platform v2.0</title>
<style>
/* ============================================================
   CSS CUSTOM PROPERTIES — DESIGN TOKENS
   ============================================================ */
:root {
  --sidebar-width: 220px;
  --header-height: 52px;
  --bottom-nav-height: 56px;
  --transition-base: 0.15s ease;
  --transition-slow: 0.3s ease;

  --font-sans: -apple-system, BlinkMacSystemFont, 'Segoe UI', system-ui, sans-serif;
  --font-mono: 'SF Mono', 'Fira Code', 'Cascadia Code', monospace;

  --text-xs: 11px;
  --text-sm: 12px;
  --text-md: 13px;
  --text-base: 14px;
  --text-lg: 16px;
  --text-xl: 18px;
  --text-2xl: 22px;
  --text-3xl: 28px;

  --radius-sm: 4px;
  --radius-md: 6px;
  --radius-lg: 10px;
  --radius-xl: 14px;
  --radius-full: 9999px;

  --space-1: 4px;
  --space-2: 6px;
  --space-3: 8px;
  --space-4: 12px;
  --space-5: 16px;
  --space-6: 20px;
  --space-7: 24px;
  --space-8: 32px;
  --space-9: 40px;
  --space-10: 48px;
}

/* ============================================================
   DARK THEME (default)
   ============================================================ */
[data-theme="dark"] {
  --color-bg: #09090B;
  --color-surface: #111113;
  --color-surface-2: #18181B;
  --color-surface-3: #1C1C1F;
  --color-border: #27272A;
  --color-border-hover: #3F3F46;
  --color-bg-active: #27272A;
  --color-bg-hover: #1F1F23;

  --color-text-primary: #FAFAFA;
  --color-text-secondary: #E4E4E7;
  --color-text-tertiary: #A1A1AA;
  --color-text-quaternary: #71717A;

  --color-accent: #8B5CF6;
  --color-accent-hover: #7C3AED;
  --color-accent-subtle: rgba(139,92,246,0.12);
  --color-accent-text: #A78BFA;

  --color-success: #22C55E;
  --color-success-subtle: rgba(34,197,94,0.1);
  --color-warning: #F59E0B;
  --color-warning-subtle: rgba(245,158,11,0.1);
  --color-danger: #EF4444;
  --color-danger-subtle: rgba(239,68,68,0.1);
  --color-info: #3B82F6;
  --color-info-subtle: rgba(59,130,246,0.1);

  --color-scrollbar: #27272A;
  --color-scrollbar-thumb: #3F3F46;

  --shadow-sm: 0 1px 3px rgba(0,0,0,0.4);
  --shadow-md: 0 4px 12px rgba(0,0,0,0.5);
  --shadow-lg: 0 8px 32px rgba(0,0,0,0.6);
  --shadow-xl: 0 16px 48px rgba(0,0,0,0.7);
}

/* ============================================================
   LIGHT THEME
   ============================================================ */
[data-theme="light"] {
  --color-bg: #F8F8FA;
  --color-surface: #FFFFFF;
  --color-surface-2: #F4F4F6;
  --color-surface-3: #EFEFF2;
  --color-border: #E4E4E7;
  --color-border-hover: #D1D1D6;
  --color-bg-active: #E9E9EE;
  --color-bg-hover: #F0F0F4;

  --color-text-primary: #09090B;
  --color-text-secondary: #18181B;
  --color-text-tertiary: #52525B;
  --color-text-quaternary: #A1A1AA;

  --color-accent: #7C3AED;
  --color-accent-hover: #6D28D9;
  --color-accent-subtle: rgba(124,58,237,0.08);
  --color-accent-text: #7C3AED;

  --color-success: #16A34A;
  --color-success-subtle: rgba(22,163,74,0.08);
  --color-warning: #D97706;
  --color-warning-subtle: rgba(217,119,6,0.08);
  --color-danger: #DC2626;
  --color-danger-subtle: rgba(220,38,38,0.08);
  --color-info: #2563EB;
  --color-info-subtle: rgba(37,99,235,0.08);

  --color-scrollbar: #E4E4E7;
  --color-scrollbar-thumb: #D1D1D6;

  --shadow-sm: 0 1px 3px rgba(0,0,0,0.08);
  --shadow-md: 0 4px 12px rgba(0,0,0,0.1);
  --shadow-lg: 0 8px 32px rgba(0,0,0,0.12);
  --shadow-xl: 0 16px 48px rgba(0,0,0,0.15);
}

/* ============================================================
   RESET & BASE
   ============================================================ */
*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
html { font-size: 14px; }
body {
  font-family: var(--font-sans);
  background: var(--color-bg);
  color: var(--color-text-primary);
  line-height: 1.5;
  overflow: hidden;
  transition: background var(--transition-slow), color var(--transition-slow);
}
::-webkit-scrollbar { width: 5px; height: 5px; }
::-webkit-scrollbar-track { background: var(--color-scrollbar); }
::-webkit-scrollbar-thumb { background: var(--color-scrollbar-thumb); border-radius: 3px; }

/* ============================================================
   DEMO WRAPPER — BOTTOM NAV ONLY
   ============================================================ */
.demo-wrapper {
  display: flex;
  flex-direction: column;
  height: 100vh;
  overflow: hidden;
}

/* ============================================================
   BOTTOM NAV BAR
   ============================================================ */
.bottom-nav {
  display: flex;
  align-items: center;
  height: var(--bottom-nav-height);
  background: var(--color-surface);
  border-top: 1px solid var(--color-border);
  padding: 0 var(--space-4);
  gap: var(--space-1);
  flex-shrink: 0;
  z-index: 100;
  transition: background var(--transition-slow), border-color var(--transition-slow);
}
.bottom-nav-brand {
  display: flex;
  align-items: center;
  gap: var(--space-2);
  margin-right: var(--space-5);
  flex-shrink: 0;
}
.bottom-nav-logo {
  width: 28px; height: 28px;
  border-radius: var(--radius-md);
  background: linear-gradient(135deg, var(--color-accent), #6366F1);
  display: flex; align-items: center; justify-content: center;
  font-weight: 800; font-size: var(--text-sm); color: white;
}
.bottom-nav-title {
  font-size: var(--text-sm); font-weight: 700;
  color: var(--color-text-primary);
}
.bottom-nav-version {
  font-size: 9px; color: var(--color-text-quaternary);
  font-family: var(--font-mono);
  background: var(--color-bg-active);
  padding: 1px 5px; border-radius: var(--radius-sm);
}
.bottom-nav-items {
  display: flex;
  align-items: center;
  gap: var(--space-1);
  flex: 1;
}
.bottom-nav-btn {
  display: flex;
  align-items: center;
  gap: var(--space-2);
  padding: 6px var(--space-3);
  border-radius: var(--radius-md);
  background: transparent;
  border: none;
  cursor: pointer;
  font-size: var(--text-sm);
  color: var(--color-text-quaternary);
  font-family: var(--font-sans);
  transition: all var(--transition-base);
  white-space: nowrap;
}
.bottom-nav-btn svg {
  width: 14px; height: 14px;
  stroke: currentColor; fill: none;
  stroke-width: 2; stroke-linecap: round; stroke-linejoin: round;
  flex-shrink: 0;
}
.bottom-nav-btn:hover {
  background: var(--color-bg-hover);
  color: var(--color-text-secondary);
}
.bottom-nav-btn.active {
  background: var(--color-accent-subtle);
  color: var(--color-accent-text);
}
.bottom-nav-btn.active svg { stroke: var(--color-accent-text); }
.bottom-nav-right {
  display: flex;
  align-items: center;
  gap: var(--space-3);
  flex-shrink: 0;
}

/* Theme Toggle Button */
.theme-toggle {
  display: flex;
  align-items: center;
  gap: var(--space-2);
  padding: 5px var(--space-3);
  border-radius: var(--radius-md);
  background: var(--color-bg-active);
  border: 1px solid var(--color-border);
  cursor: pointer;
  font-size: var(--text-xs);
  color: var(--color-text-tertiary);
  font-family: var(--font-sans);
  transition: all var(--transition-base);
}
.theme-toggle:hover { border-color: var(--color-border-hover); color: var(--color-text-primary); }
.theme-toggle svg { width: 13px; height: 13px; stroke: currentColor; fill: none; stroke-width: 2; }

/* AI Mode Toggle in Nav */
.ai-mode-toggle {
  display: flex;
  align-items: center;
  gap: var(--space-2);
  padding: 5px var(--space-3);
  border-radius: var(--radius-md);
  background: var(--color-bg-active);
  border: 1px solid var(--color-border);
  cursor: pointer;
  font-size: var(--text-xs);
  color: var(--color-text-tertiary);
  font-family: var(--font-sans);
  transition: all var(--transition-base);
}
.ai-mode-toggle.active {
  background: linear-gradient(135deg, rgba(139,92,246,0.15), rgba(99,102,241,0.15));
  border-color: var(--color-accent);
  color: var(--color-accent-text);
}
.ai-mode-toggle svg { width: 13px; height: 13px; stroke: currentColor; fill: none; stroke-width: 2; }

/* User Avatar in Nav */
.nav-user-avatar {
  width: 28px; height: 28px;
  border-radius: var(--radius-full);
  background: linear-gradient(135deg, #6366F1, var(--color-accent));
  display: flex; align-items: center; justify-content: center;
  font-size: 10px; font-weight: 700; color: white;
  cursor: pointer;
  flex-shrink: 0;
}
.nav-badge-dot {
  width: 6px; height: 6px;
  border-radius: var(--radius-full);
  background: var(--color-danger);
  flex-shrink: 0;
}

/* ============================================================
   APP SHELL — NO SIDEBAR
   ============================================================ */
.page-section {
  display: none;
  flex: 1;
  overflow: hidden;
}
.page-section.active { display: flex; flex-direction: column; }

.main-content {
  flex: 1;
  display: flex;
  flex-direction: column;
  overflow: hidden;
  background: var(--color-bg);
  transition: background var(--transition-slow);
}

/* ============================================================
   TOPBAR
   ============================================================ */
.topbar {
  height: var(--header-height);
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 var(--space-7);
  border-bottom: 1px solid var(--color-border);
  background: var(--color-surface);
  flex-shrink: 0;
  transition: background var(--transition-slow), border-color var(--transition-slow);
}
.topbar-breadcrumb {
  font-size: var(--text-sm);
  color: var(--color-text-quaternary);
  display: flex; align-items: center; gap: var(--space-2);
}
.topbar-breadcrumb span:last-child { color: var(--color-text-primary); font-weight: 500; }
.breadcrumb-sep { color: var(--color-border-hover); }
.topbar-actions { display: flex; align-items: center; gap: var(--space-3); }

.search-trigger {
  display: flex; align-items: center; gap: var(--space-2);
  padding: 6px var(--space-4);
  background: var(--color-bg-active);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-md);
  font-size: var(--text-sm);
  color: var(--color-text-quaternary);
  cursor: pointer;
  transition: all var(--transition-base);
  min-width: 200px;
}
.search-trigger:hover { border-color: var(--color-border-hover); }
.search-shortcut { display: flex; gap: 3px; margin-left: auto; }
.search-shortcut kbd {
  font-family: var(--font-sans); font-size: 10px;
  padding: 1px 5px; background: var(--color-surface-2);
  border: 1px solid var(--color-border); border-radius: 3px;
  color: var(--color-text-quaternary);
}

/* ============================================================
   CONTENT AREA
   ============================================================ */
.content-area {
  flex: 1;
  overflow-y: auto;
  padding: var(--space-7);
  background: var(--color-bg);
}
.content-area.no-padding { padding: 0; }

/* ============================================================
   PAGE HEADER
   ============================================================ */
.page-header { margin-bottom: var(--space-6); }
.page-header-top {
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
  gap: var(--space-4);
}
.page-title { font-size: var(--text-2xl); font-weight: 700; letter-spacing: -0.5px; }
.page-subtitle { font-size: var(--text-sm); color: var(--color-text-tertiary); margin-top: var(--space-1); }

/* ============================================================
   CARDS
   ============================================================ */
.card {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  overflow: hidden;
  transition: background var(--transition-slow), border-color var(--transition-slow);
}
.card:hover { border-color: var(--color-border-hover); }
.card-header {
  display: flex; align-items: center; justify-content: space-between;
  padding: var(--space-4) var(--space-5);
  border-bottom: 1px solid var(--color-border);
}
.card-title { font-size: var(--text-md); font-weight: 600; }
.card-subtitle { font-size: var(--text-xs); color: var(--color-text-quaternary); }
.card-body { padding: var(--space-5); }

/* ============================================================
   STAT CARDS
   ============================================================ */
.stat-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: var(--space-4);
}
.stat-card {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  padding: var(--space-5);
  transition: all var(--transition-base);
}
.stat-card:hover { border-color: var(--color-border-hover); box-shadow: var(--shadow-sm); }
.stat-label { font-size: var(--text-xs); color: var(--color-text-quaternary); margin-bottom: var(--space-2); text-transform: uppercase; letter-spacing: 0.5px; }
.stat-value { font-size: var(--text-3xl); font-weight: 700; letter-spacing: -1px; }
.stat-change { font-size: var(--text-xs); margin-top: var(--space-2); }
.stat-change.positive { color: var(--color-success); }
.stat-change.negative { color: var(--color-danger); }

/* ============================================================
   BUTTONS
   ============================================================ */
.btn {
  display: inline-flex; align-items: center; gap: var(--space-2);
  padding: 7px var(--space-4);
  border-radius: var(--radius-md);
  font-size: var(--text-sm); font-weight: 500; font-family: var(--font-sans);
  border: 1px solid transparent;
  cursor: pointer;
  transition: all var(--transition-base);
  white-space: nowrap;
}
.btn svg { width: 13px; height: 13px; stroke: currentColor; fill: none; stroke-width: 2; stroke-linecap: round; stroke-linejoin: round; flex-shrink: 0; }
.btn-primary { background: var(--color-accent); color: white; border-color: var(--color-accent); }
.btn-primary:hover { background: var(--color-accent-hover); border-color: var(--color-accent-hover); }
.btn-secondary { background: var(--color-surface-2); color: var(--color-text-secondary); border-color: var(--color-border); }
.btn-secondary:hover { background: var(--color-bg-active); border-color: var(--color-border-hover); }
.btn-ghost { background: transparent; color: var(--color-text-tertiary); border-color: transparent; }
.btn-ghost:hover { background: var(--color-bg-hover); color: var(--color-text-secondary); }
.btn-group { display: flex; gap: var(--space-2); }
.btn-sm { padding: 4px var(--space-3); font-size: var(--text-xs); }
.btn-danger { background: var(--color-danger); color: white; border-color: var(--color-danger); }

/* ============================================================
   TAGS / BADGES
   ============================================================ */
.tag {
  display: inline-flex; align-items: center; gap: var(--space-1);
  padding: 2px 8px; border-radius: var(--radius-full);
  font-size: var(--text-xs); font-weight: 500;
}
.tag-green { background: var(--color-success-subtle); color: var(--color-success); }
.tag-blue { background: var(--color-info-subtle); color: var(--color-info); }
.tag-orange { background: var(--color-warning-subtle); color: var(--color-warning); }
.tag-red { background: var(--color-danger-subtle); color: var(--color-danger); }
.tag-purple { background: var(--color-accent-subtle); color: var(--color-accent-text); }
.tag-default { background: var(--color-bg-active); color: var(--color-text-tertiary); }

/* ============================================================
   TABS
   ============================================================ */
.tabs {
  display: flex;
  border-bottom: 1px solid var(--color-border);
  margin-bottom: var(--space-6);
  gap: 0;
}
.tab-item {
  padding: var(--space-3) var(--space-4);
  font-size: var(--text-sm); font-weight: 500;
  color: var(--color-text-quaternary);
  cursor: pointer;
  border-bottom: 2px solid transparent;
  margin-bottom: -1px;
  transition: all var(--transition-base);
}
.tab-item:hover { color: var(--color-text-secondary); }
.tab-item.active { color: var(--color-text-primary); border-bottom-color: var(--color-accent); }

/* ============================================================
   PROGRESS BARS
   ============================================================ */
.progress-bar {
  height: 4px; background: var(--color-bg-active);
  border-radius: var(--radius-full); overflow: hidden;
}
.progress-fill {
  height: 100%; border-radius: var(--radius-full);
  transition: width 0.4s ease;
}
.progress-fill.purple { background: linear-gradient(90deg, var(--color-accent), #6366F1); }
.progress-fill.blue { background: linear-gradient(90deg, #3B82F6, #60A5FA); }
.progress-fill.green { background: linear-gradient(90deg, #22C55E, #4ADE80); }
.progress-fill.orange { background: linear-gradient(90deg, #F59E0B, #FBBF24); }
.progress-fill.red { background: linear-gradient(90deg, #EF4444, #F87171); }

/* ============================================================
   GRID LAYOUTS
   ============================================================ */
.two-col { display: grid; grid-template-columns: 1fr 1fr; gap: var(--space-5); }
.three-col { display: grid; grid-template-columns: repeat(3, 1fr); gap: var(--space-5); }

/* ============================================================
   DATA TABLE
   ============================================================ */
.data-table-container {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  overflow: hidden;
}
.data-table { width: 100%; border-collapse: collapse; font-size: var(--text-sm); }
.data-table th {
  padding: var(--space-3) var(--space-4);
  text-align: left; font-size: var(--text-xs); font-weight: 600;
  color: var(--color-text-quaternary); text-transform: uppercase; letter-spacing: 0.5px;
  background: var(--color-surface-2); border-bottom: 1px solid var(--color-border);
}
.data-table td {
  padding: var(--space-3) var(--space-4);
  border-bottom: 1px solid var(--color-border);
  color: var(--color-text-secondary);
  vertical-align: middle;
}
.data-table tbody tr:last-child td { border-bottom: none; }
.data-table tbody tr:hover td { background: var(--color-bg-hover); }
.cell-id { font-family: var(--font-mono); font-size: var(--text-xs); color: var(--color-text-quaternary); }
.cell-primary { font-weight: 500; color: var(--color-text-primary); }

/* ============================================================
   KANBAN
   ============================================================ */
.kanban-board { display: flex; gap: var(--space-5); overflow-x: auto; padding-bottom: var(--space-3); }
.kanban-column {
  min-width: 260px; max-width: 260px;
  display: flex; flex-direction: column;
  background: var(--color-surface-2);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  overflow: hidden;
}
.kanban-col-header {
  display: flex; align-items: center; justify-content: space-between;
  padding: var(--space-3) var(--space-4);
  border-bottom: 1px solid var(--color-border);
}
.kanban-col-title { font-size: var(--text-sm); font-weight: 600; }
.kanban-col-count {
  font-size: var(--text-xs); padding: 1px 7px;
  background: var(--color-bg-active); border-radius: var(--radius-full);
  color: var(--color-text-quaternary); font-family: var(--font-mono);
}
.kanban-col-body { padding: var(--space-3); display: flex; flex-direction: column; gap: var(--space-2); flex: 1; min-height: 80px; }
.kanban-card {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-md);
  padding: var(--space-3) var(--space-4);
  cursor: pointer;
  transition: all var(--transition-base);
}
.kanban-card:hover { border-color: var(--color-border-hover); box-shadow: var(--shadow-sm); transform: translateY(-1px); }
.kanban-card-title { font-size: var(--text-sm); font-weight: 500; margin-bottom: var(--space-2); }
.kanban-card-meta { display: flex; align-items: center; justify-content: space-between; margin-top: var(--space-2); }
.kanban-card-avatar {
  width: 22px; height: 22px; border-radius: var(--radius-full);
  background: linear-gradient(135deg, var(--color-accent), #6366F1);
  display: flex; align-items: center; justify-content: center;
  font-size: 9px; font-weight: 700; color: white;
}

/* ============================================================
   AVATAR GROUP
   ============================================================ */
.avatar-group { display: flex; }
.avatar {
  width: 24px; height: 24px; border-radius: var(--radius-full);
  background: linear-gradient(135deg, var(--color-accent), #6366F1);
  border: 2px solid var(--color-surface);
  display: flex; align-items: center; justify-content: center;
  font-size: 8px; font-weight: 700; color: white;
  margin-left: -6px;
}
.avatar:first-child { margin-left: 0; }
.avatar.blue { background: linear-gradient(135deg, #2563EB, #3B82F6); }
.avatar.green { background: linear-gradient(135deg, #059669, #22C55E); }
.avatar.orange { background: linear-gradient(135deg, #D97706, #F59E0B); }
.avatar.pink { background: linear-gradient(135deg, #DB2777, #EC4899); }
.avatar.more { background: var(--color-bg-active); color: var(--color-text-quaternary); font-size: 9px; }

/* ============================================================
   GANTT CHART
   ============================================================ */
.gantt-placeholder {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  overflow: hidden;
}
.gantt-header-row {
  display: grid;
  grid-template-columns: 160px repeat(12, 1fr);
  background: var(--color-surface-2);
  border-bottom: 1px solid var(--color-border);
}
.gantt-header-cell {
  padding: var(--space-2) var(--space-3);
  font-size: var(--text-xs); font-weight: 600;
  color: var(--color-text-quaternary); text-align: center;
  border-right: 1px solid var(--color-border);
}
.gantt-row {
  display: grid;
  grid-template-columns: 160px 1fr;
  border-bottom: 1px solid var(--color-border);
  min-height: 40px;
}
.gantt-row:last-child { border-bottom: none; }
.gantt-task-name {
  padding: var(--space-2) var(--space-3);
  font-size: var(--text-sm); color: var(--color-text-secondary);
  border-right: 1px solid var(--color-border);
  display: flex; align-items: center;
}
.gantt-bar-container { position: relative; padding: var(--space-2) 0; }
.gantt-bar {
  position: absolute; height: 20px; top: 50%; transform: translateY(-50%);
  background: linear-gradient(90deg, var(--color-accent), #6366F1);
  border-radius: var(--radius-sm);
  opacity: 0.85;
}
.gantt-bar.blue { background: linear-gradient(90deg, #2563EB, #3B82F6); }
.gantt-bar.green { background: linear-gradient(90deg, #059669, #22C55E); }
.gantt-bar.orange { background: linear-gradient(90deg, #D97706, #F59E0B); }
.gantt-bar.red { background: linear-gradient(90deg, #DC2626, #EF4444); }

/* ============================================================
   FORM ELEMENTS
   ============================================================ */
.form-group { display: flex; flex-direction: column; gap: var(--space-2); }
.form-label { font-size: var(--text-xs); font-weight: 600; color: var(--color-text-quaternary); text-transform: uppercase; letter-spacing: 0.5px; }
.form-input {
  padding: 8px var(--space-3);
  background: var(--color-surface-2);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-md);
  font-size: var(--text-sm); color: var(--color-text-primary);
  font-family: var(--font-sans);
  transition: all var(--transition-base);
  outline: none;
}
.form-input:focus { border-color: var(--color-accent); box-shadow: 0 0 0 2px var(--color-accent-subtle); }
.form-select { cursor: pointer; }

/* ============================================================
   TOGGLE SWITCH
   ============================================================ */
.toggle {
  width: 36px; height: 20px;
  background: var(--color-bg-active);
  border-radius: var(--radius-full);
  cursor: pointer;
  position: relative;
  transition: background var(--transition-base);
  flex-shrink: 0;
}
.toggle.active { background: var(--color-accent); }
.toggle-knob {
  position: absolute; top: 2px; left: 2px;
  width: 16px; height: 16px;
  background: white; border-radius: var(--radius-full);
  transition: left var(--transition-base);
  box-shadow: var(--shadow-sm);
}
.toggle.active .toggle-knob { left: 18px; }

/* ============================================================
   SETTINGS PAGE
   ============================================================ */
.settings-item {
  display: flex; align-items: center; justify-content: space-between;
  padding: var(--space-4) var(--space-5);
  border-bottom: 1px solid var(--color-border);
}
.settings-item-left { display: flex; flex-direction: column; gap: var(--space-1); }
.settings-item-title { font-size: var(--text-sm); font-weight: 500; }
.settings-item-desc { font-size: var(--text-xs); color: var(--color-text-quaternary); }

/* ============================================================
   VIEW SWITCHER
   ============================================================ */
.view-switcher {
  display: flex;
  background: var(--color-bg-active);
  border-radius: var(--radius-md);
  padding: 2px;
  gap: 2px;
}
.view-switcher-btn {
  padding: 4px var(--space-3);
  border-radius: var(--radius-sm);
  background: transparent;
  border: none; cursor: pointer;
  font-size: var(--text-xs); font-weight: 500;
  color: var(--color-text-quaternary);
  font-family: var(--font-sans);
  transition: all var(--transition-base);
}
.view-switcher-btn.active { background: var(--color-surface); color: var(--color-text-primary); box-shadow: var(--shadow-sm); }

/* ============================================================
   SCORE RING
   ============================================================ */
.score-ring { position: relative; width: 72px; height: 72px; flex-shrink: 0; }
.score-ring svg { width: 80px; height: 80px; transform: rotate(-90deg) scale(0.9); }
.ring-bg { fill: none; stroke: var(--color-bg-active); stroke-width: 6; }
.ring-fill { fill: none; stroke-width: 6; stroke-linecap: round; stroke-dasharray: 226; transition: stroke-dashoffset 0.8s ease; }
.ring-fill.green { stroke: var(--color-success); }
.ring-fill.blue { stroke: var(--color-info); }
.ring-fill.purple { stroke: var(--color-accent); }
.score-value {
  position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);
  font-size: var(--text-lg); font-weight: 700;
}

/* ============================================================
   HEATMAP
   ============================================================ */
.heatmap-cell {
  border-radius: 2px;
  background: var(--color-bg-active);
  display: block;
}
.heatmap-cell.level-1 { background: rgba(139,92,246,0.2); }
.heatmap-cell.level-2 { background: rgba(139,92,246,0.4); }
.heatmap-cell.level-3 { background: rgba(139,92,246,0.65); }
.heatmap-cell.level-4 { background: rgba(139,92,246,0.9); }

/* ============================================================
   FLOW STEPS
   ============================================================ */
.flow-steps { display: flex; align-items: center; }
.flow-step { display: flex; flex-direction: column; align-items: center; gap: var(--space-2); }
.flow-step-number {
  width: 28px; height: 28px;
  border-radius: var(--radius-full);
  background: var(--color-bg-active);
  border: 2px solid var(--color-border);
  display: flex; align-items: center; justify-content: center;
  font-size: var(--text-xs); font-weight: 700;
  color: var(--color-text-quaternary);
}
.flow-step-number.completed { background: var(--color-success); border-color: var(--color-success); color: white; }
.flow-step-number.active { background: var(--color-accent); border-color: var(--color-accent); color: white; }
.flow-step-label { font-size: var(--text-xs); color: var(--color-text-quaternary); white-space: nowrap; }
.flow-step-label.active { color: var(--color-accent-text); font-weight: 600; }
.flow-connector { flex: 1; height: 2px; background: var(--color-border); margin: 0 var(--space-2); margin-bottom: 18px; }
.flow-connector.completed { background: var(--color-success); }

/* ============================================================
   RISK MATRIX
   ============================================================ */
.risk-matrix-cell {
  display: flex; align-items: center; justify-content: center;
  font-size: 9px; font-weight: 600;
  border-radius: var(--radius-sm);
  cursor: default;
}
.risk-matrix-cell.risk-low { background: rgba(34,197,94,0.15); color: var(--color-success); }
.risk-matrix-cell.risk-medium { background: rgba(245,158,11,0.15); color: var(--color-warning); }
.risk-matrix-cell.risk-high { background: rgba(239,68,68,0.12); color: var(--color-danger); }
.risk-matrix-cell.risk-critical { background: rgba(239,68,68,0.25); color: var(--color-danger); }

/* ============================================================
   CHECKBOX ITEMS
   ============================================================ */
.checkbox-item { display: flex; align-items: center; gap: var(--space-2); padding: var(--space-1) 0; font-size: var(--text-sm); color: var(--color-text-secondary); }
.checkbox-box {
  width: 16px; height: 16px;
  border-radius: 4px;
  border: 1.5px solid var(--color-border);
  display: flex; align-items: center; justify-content: center;
  flex-shrink: 0;
}
.checkbox-box.checked { background: var(--color-accent); border-color: var(--color-accent); }
.checkbox-box svg { width: 10px; height: 10px; stroke: white; fill: none; stroke-width: 3; stroke-linecap: round; stroke-linejoin: round; }

/* ============================================================
   DOC CARDS (Patent)
   ============================================================ */
.doc-card {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  padding: var(--space-5);
  transition: all var(--transition-base);
  cursor: pointer;
}
.doc-card:hover { border-color: var(--color-border-hover); box-shadow: var(--shadow-sm); }
.doc-card-type { display: flex; align-items: center; gap: var(--space-2); font-size: var(--text-xs); font-weight: 500; margin-bottom: var(--space-3); }
.doc-card-title { font-size: var(--text-md); font-weight: 600; margin-bottom: var(--space-2); line-height: 1.4; }
.doc-card-desc { font-size: var(--text-sm); color: var(--color-text-tertiary); margin-bottom: var(--space-3); line-height: 1.5; }
.doc-card-footer { display: flex; align-items: center; justify-content: space-between; }

/* ============================================================
   AI CHAT INTERFACE
   ============================================================ */
.ai-message { display: flex; gap: var(--space-4); margin-bottom: var(--space-6); }
.ai-message.user { flex-direction: row-reverse; }
.ai-avatar {
  width: 32px; height: 32px; border-radius: var(--radius-full);
  display: flex; align-items: center; justify-content: center;
  font-size: var(--text-xs); font-weight: 700;
  flex-shrink: 0;
}
.ai-avatar.assistant { background: linear-gradient(135deg, var(--color-accent), #6366F1); color: white; }
.ai-avatar.human { background: linear-gradient(135deg, #059669, #22C55E); color: white; }
.ai-bubble {
  max-width: 75%;
  padding: var(--space-4) var(--space-5);
  border-radius: var(--radius-lg);
  font-size: var(--text-sm);
  line-height: 1.6;
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  color: var(--color-text-secondary);
}
.ai-message.user .ai-bubble {
  background: var(--color-accent-subtle);
  border-color: rgba(139,92,246,0.2);
  color: var(--color-text-primary);
}
.ai-quick-actions {
  display: flex; gap: var(--space-2); flex-wrap: wrap;
  padding: var(--space-4) var(--space-8);
  border-top: 1px solid var(--color-border);
}
.ai-quick-btn {
  padding: 5px var(--space-4);
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-full);
  font-size: var(--text-xs); color: var(--color-text-tertiary);
  cursor: pointer; font-family: var(--font-sans);
  transition: all var(--transition-base);
}
.ai-quick-btn:hover { border-color: var(--color-accent); color: var(--color-accent-text); background: var(--color-accent-subtle); }
.ai-input-bar {
  display: flex; align-items: flex-end; gap: var(--space-3);
  padding: var(--space-4) var(--space-8) var(--space-6);
  background: var(--color-surface);
  border-top: 1px solid var(--color-border);
}
.ai-input-field {
  flex: 1; padding: var(--space-3) var(--space-4);
  background: var(--color-bg-active);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  font-size: var(--text-sm); color: var(--color-text-primary);
  font-family: var(--font-sans);
  resize: none; outline: none;
  transition: border-color var(--transition-base);
  max-height: 120px;
}
.ai-input-field:focus { border-color: var(--color-accent); }
.ai-send-btn {
  width: 36px; height: 36px;
  border-radius: var(--radius-md);
  background: var(--color-accent);
  border: none; cursor: pointer;
  display: flex; align-items: center; justify-content: center;
  flex-shrink: 0;
  transition: background var(--transition-base);
}
.ai-send-btn:hover { background: var(--color-accent-hover); }
.ai-send-btn svg { width: 15px; height: 15px; stroke: white; fill: none; stroke-width: 2; stroke-linecap: round; stroke-linejoin: round; }

/* ============================================================
   NOTIFICATION STYLES
   ============================================================ */
.notification-list { display: flex; flex-direction: column; }
.notification-item {
  display: flex; align-items: flex-start; gap: var(--space-3);
  padding: var(--space-4) var(--space-5);
  border-bottom: 1px solid var(--color-border);
  transition: background var(--transition-base);
  cursor: pointer;
}
.notification-item:last-child { border-bottom: none; }
.notification-item:hover { background: var(--color-bg-hover); }
.notification-item.unread { background: var(--color-accent-subtle); }
.notification-item.unread:hover { background: rgba(139,92,246,0.15); }
.notification-icon-wrap {
  width: 32px; height: 32px; border-radius: var(--radius-md);
  display: flex; align-items: center; justify-content: center;
  flex-shrink: 0;
}
.notification-icon-wrap svg { width: 16px; height: 16px; stroke: currentColor; fill: none; stroke-width: 2; }
.notification-icon-wrap.orange { background: var(--color-warning-subtle); color: var(--color-warning); }
.notification-icon-wrap.green { background: var(--color-success-subtle); color: var(--color-success); }
.notification-icon-wrap.purple { background: var(--color-accent-subtle); color: var(--color-accent-text); }
.notification-icon-wrap.blue { background: var(--color-info-subtle); color: var(--color-info); }
.notification-body { flex: 1; }
.notification-title-text { font-size: var(--text-sm); font-weight: 500; margin-bottom: 2px; }
.notification-desc { font-size: var(--text-xs); color: var(--color-text-quaternary); }
.notification-time { font-size: var(--text-xs); color: var(--color-text-quaternary); flex-shrink: 0; }

/* ============================================================
   MODAL / COMMAND PALETTE
   ============================================================ */
.modal-overlay {
  position: fixed; inset: 0; z-index: 1000;
  background: rgba(0,0,0,0.6);
  backdrop-filter: blur(4px);
  display: flex; align-items: flex-start; justify-content: center;
  padding-top: 80px;
}
.command-palette {
  width: 560px;
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-xl);
  box-shadow: var(--shadow-xl);
  overflow: hidden;
}
.command-input-wrapper {
  display: flex; align-items: center; gap: var(--space-3);
  padding: var(--space-4) var(--space-5);
  border-bottom: 1px solid var(--color-border);
}
.command-input-wrapper svg { width: 16px; height: 16px; stroke: var(--color-text-quaternary); fill: none; stroke-width: 2; flex-shrink: 0; }
.command-input {
  flex: 1; background: transparent; border: none;
  font-size: var(--text-base); color: var(--color-text-primary);
  font-family: var(--font-sans); outline: none;
}
.command-results { max-height: 400px; overflow-y: auto; padding: var(--space-2); }
.command-group-label {
  font-size: var(--text-xs); font-weight: 600;
  color: var(--color-text-quaternary); text-transform: uppercase; letter-spacing: 0.5px;
  padding: var(--space-2) var(--space-3); margin-top: var(--space-2);
}
.command-item {
  display: flex; align-items: center; gap: var(--space-3);
  padding: var(--space-3); border-radius: var(--radius-md);
  cursor: pointer; transition: background var(--transition-base);
}
.command-item:hover { background: var(--color-bg-hover); }
.command-item-icon {
  width: 32px; height: 32px; border-radius: var(--radius-md);
  background: var(--color-bg-active);
  display: flex; align-items: center; justify-content: center;
  flex-shrink: 0;
}
.command-item-icon svg { width: 16px; height: 16px; stroke: var(--color-text-tertiary); fill: none; stroke-width: 2; }
.command-item-text { flex: 1; }
.command-item-label { font-size: var(--text-sm); font-weight: 500; }
.command-item-desc { font-size: var(--text-xs); color: var(--color-text-quaternary); }
.command-item-shortcut { display: flex; gap: 3px; }
.command-item-shortcut kbd {
  font-family: var(--font-sans); font-size: 10px;
  padding: 1px 5px; background: var(--color-bg-active);
  border: 1px solid var(--color-border); border-radius: 3px;
  color: var(--color-text-quaternary);
}

/* ============================================================
   MODAL
   ============================================================ */
.modal {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-xl);
  box-shadow: var(--shadow-xl);
  width: 100%;
  max-width: 560px;
  overflow: hidden;
}
.modal-header {
  display: flex; align-items: center; justify-content: space-between;
  padding: var(--space-4) var(--space-5);
  border-bottom: 1px solid var(--color-border);
}
.modal-title { font-size: var(--text-md); font-weight: 600; }
.divider { height: 1px; background: var(--color-border); }

/* ============================================================
   AI DASHBOARD MODE — CURSOR-STYLE SPLIT LAYOUT
   ============================================================ */
.ai-dashboard {
  display: grid;
  grid-template-columns: 1fr 500px;
  gap: 0;
  height: 100%;
  overflow: hidden;
}
.ai-dashboard-left {
  overflow-y: auto;
  padding: var(--space-7);
  border-right: 1px solid var(--color-border);
}
.ai-dashboard-right {
  display: flex;
  flex-direction: column;
  overflow: hidden;
  background: var(--color-surface);
  border-left: 1px solid var(--color-border);
}
/* AI typing animation */
@keyframes blink { 0%,100%{opacity:1} 50%{opacity:0} }
.ai-typing-cursor { display: inline-block; width: 2px; height: 14px; background: var(--color-accent); vertical-align: middle; margin-left: 2px; animation: blink 1s infinite; }
@keyframes fadeInUp { from { opacity:0; transform: translateY(8px); } to { opacity:1; transform: translateY(0); } }
.ai-gen-item { animation: fadeInUp 0.4s ease both; }
.ai-gen-item:nth-child(1) { animation-delay: 0.1s; }
.ai-gen-item:nth-child(2) { animation-delay: 0.3s; }
.ai-gen-item:nth-child(3) { animation-delay: 0.5s; }
.ai-gen-item:nth-child(4) { animation-delay: 0.7s; }
.ai-gen-item:nth-child(5) { animation-delay: 0.9s; }
.ai-gen-item:nth-child(6) { animation-delay: 1.1s; }

/* AI greeting banner */
.ai-greeting-banner {
  background: linear-gradient(135deg, rgba(139,92,246,0.1), rgba(99,102,241,0.08));
  border: 1px solid rgba(139,92,246,0.25);
  border-radius: var(--radius-lg);
  padding: var(--space-5) var(--space-6);
  margin-bottom: var(--space-6);
}

/* Mini kanban for AI mode */
.mini-kanban { display: flex; gap: var(--space-3); overflow-x: auto; }
.mini-kanban-col {
  min-width: 140px;
  background: var(--color-surface-2);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-md);
  overflow: hidden;
}
.mini-kanban-col-header {
  padding: var(--space-2) var(--space-3);
  border-bottom: 1px solid var(--color-border);
  font-size: var(--text-xs); font-weight: 600;
  display: flex; align-items: center; justify-content: space-between;
}
.mini-kanban-col-body { padding: var(--space-2); display: flex; flex-direction: column; gap: var(--space-1); }
.mini-kanban-card {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-sm);
  padding: var(--space-2) var(--space-2);
  font-size: var(--text-xs);
  color: var(--color-text-secondary);
}

/* Shimmer loading effect */
@keyframes shimmer { from { background-position: -200% 0; } to { background-position: 200% 0; } }
.shimmer {
  background: linear-gradient(90deg, var(--color-surface-2) 25%, var(--color-bg-active) 50%, var(--color-surface-2) 75%);
  background-size: 200% 100%;
  animation: shimmer 1.5s infinite;
}

/* ============================================================
   PERFORMANCE KANBAN BOARD
   ============================================================ */
.perf-kanban { display: flex; gap: var(--space-4); overflow-x: auto; padding-bottom: var(--space-3); }
.perf-kanban-col {
  min-width: 220px;
  display: flex; flex-direction: column;
  background: var(--color-surface-2);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  overflow: hidden;
}
.perf-kanban-col-header {
  padding: var(--space-3) var(--space-4);
  border-bottom: 1px solid var(--color-border);
  display: flex; align-items: center; justify-content: space-between;
}
.perf-kanban-col-body { padding: var(--space-3); display: flex; flex-direction: column; gap: var(--space-2); }
.perf-kanban-card {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-md);
  padding: var(--space-3);
  transition: all var(--transition-base);
  cursor: pointer;
}
.perf-kanban-card:hover { border-color: var(--color-border-hover); box-shadow: var(--shadow-sm); }

/* ============================================================
   WBS TREE VIEW
   ============================================================ */
.wbs-tree { display: flex; flex-direction: column; gap: var(--space-1); }
.wbs-node {
  display: flex; align-items: center; gap: var(--space-2);
  padding: var(--space-2) var(--space-3);
  border-radius: var(--radius-md);
  cursor: pointer;
  transition: background var(--transition-base);
  position: relative;
}
.wbs-node:hover { background: var(--color-bg-hover); }
.wbs-indent-1 { padding-left: var(--space-8); }
.wbs-indent-2 { padding-left: calc(var(--space-8) * 2); }
.wbs-indent-3 { padding-left: calc(var(--space-8) * 3); }
.wbs-connector {
  width: 16px; height: 16px;
  border-left: 1.5px solid var(--color-border);
  border-bottom: 1.5px solid var(--color-border);
  border-bottom-left-radius: 3px;
  margin-right: var(--space-1);
  flex-shrink: 0;
}
.wbs-icon {
  width: 20px; height: 20px;
  border-radius: var(--radius-sm);
  display: flex; align-items: center; justify-content: center;
  flex-shrink: 0;
  font-size: 10px; font-weight: 700;
}
.wbs-icon.root { background: var(--color-accent-subtle); }
.wbs-icon.branch { background: var(--color-info-subtle); }
.wbs-icon.leaf { background: var(--color-surface-2); }
.wbs-label { font-size: var(--text-sm); flex: 1; }
.wbs-node-root .wbs-label { font-weight: 600; }

/* ============================================================
   PROJECT STATUS VIEW
   ============================================================ */
.project-status-grid { display: flex; flex-direction: column; gap: var(--space-3); }
.project-status-row {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  padding: var(--space-4) var(--space-5);
  display: grid;
  grid-template-columns: 2fr 1fr 1fr 1fr 1fr 1fr;
  align-items: center;
  gap: var(--space-4);
  transition: all var(--transition-base);
}
.project-status-row:hover { border-color: var(--color-border-hover); }

/* ============================================================
   RESPONSIVE adjustments for no-sidebar layout
   ============================================================ */
@media (max-width: 1200px) {
  .ai-dashboard { grid-template-columns: 1fr 340px; }
}
</style>
</head>
<body>
<div class="demo-wrapper">

<!-- ============================================================
     BOTTOM NAV BAR
     ============================================================ -->
<div style="order: 2;">
<div class="bottom-nav">
  <div class="bottom-nav-brand">
    <div class="bottom-nav-logo">B</div>
    <span class="bottom-nav-title">BST Platform</span>
    <span class="bottom-nav-version">v2.0</span>
  </div>
  <div class="bottom-nav-items">
    <button class="bottom-nav-btn active" onclick="showPage('dashboard')">
      <svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg>
      Dashboard
    </button>
    <button class="bottom-nav-btn" onclick="showPage('tasks')">
      <svg viewBox="0 0 24 24"><path d="M9 11l3 3L22 4"/><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/></svg>
      Tasks
    </button>
    <button class="bottom-nav-btn" onclick="showPage('projects')">
      <svg viewBox="0 0 24 24"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg>
      Projects
    </button>
    <button class="bottom-nav-btn" onclick="showPage('safety')">
      <svg viewBox="0 0 24 24"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
      Safety Review
    </button>
    <button class="bottom-nav-btn" onclick="showPage('performance')">
      <svg viewBox="0 0 24 24"><line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/></svg>
      Performance
    </button>
    <button class="bottom-nav-btn" onclick="showPage('patent')">
      <svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
      Patent / IP
    </button>
    <button class="bottom-nav-btn" onclick="showPage('reports')">
      <svg viewBox="0 0 24 24"><path d="M12 2a10 10 0 1 0 10 10H12V2z"/></svg>
      Reports
    </button>
    <button class="bottom-nav-btn" onclick="showPage('ai')">
      <svg viewBox="0 0 24 24"><rect x="2" y="2" width="20" height="20" rx="5"/><path d="M8 12h8M12 8v8" opacity="0.5"/></svg>
      AI Assistant
    </button>
    <button class="bottom-nav-btn" onclick="showPage('settings')">
      <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="3"/><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1-2.83 2.83l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-4 0v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83-2.83l.06-.06A1.65 1.65 0 0 0 5.68 15a1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1 0-4h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 2.83-2.83l.06.06A1.65 1.65 0 0 0 9 4.68a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 4 0v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 2.83l-.06.06A1.65 1.65 0 0 0 19.4 9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 0 4h-.09a1.65 1.65 0 0 0-1.51 1z"/></svg>
      Settings
    </button>
  </div>
  <div class="bottom-nav-right">
    <!-- AI Mode Toggle -->
    <button class="ai-mode-toggle" id="aiModeToggle" onclick="toggleAIMode()">
      <svg viewBox="0 0 24 24"><rect x="2" y="2" width="20" height="20" rx="5"/><path d="M8 12h8M12 8v8"/></svg>
      AI Mode
    </button>
    <!-- Theme Toggle -->
    <button class="theme-toggle" id="themeToggle" onclick="toggleTheme()">
      <svg id="themeIcon" viewBox="0 0 24 24"><circle cx="12" cy="12" r="5"/><line x1="12" y1="1" x2="12" y2="3"/><line x1="12" y1="21" x2="12" y2="23"/><line x1="4.22" y1="4.22" x2="5.64" y2="5.64"/><line x1="18.36" y1="18.36" x2="19.78" y2="19.78"/><line x1="1" y1="12" x2="3" y2="12"/><line x1="21" y1="12" x2="23" y2="12"/><line x1="4.22" y1="19.78" x2="5.64" y2="18.36"/><line x1="18.36" y1="5.64" x2="19.78" y2="4.22"/></svg>
      <span id="themeLabel">Light</span>
    </button>
    <!-- Notification -->
    <button class="theme-toggle" onclick="document.getElementById('notificationPanel').style.display='flex'" style="gap:var(--space-1)">
      <svg viewBox="0 0 24 24" style="width:13px;height:13px;stroke:currentColor;fill:none;stroke-width:2"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/><path d="M13.73 21a2 2 0 0 1-3.46 0"/></svg>
      <div class="nav-badge-dot"></div>
    </button>
    <div class="nav-user-avatar">ZG</div>
  </div>
</div>
</div>

<!-- ============================================================
     PAGES CONTAINER
     ============================================================ -->
<div style="order:1; flex:1; overflow:hidden; display:flex; flex-direction:column;">

<!-- ============================================================
     PAGE 1 — DASHBOARD (Normal + AI Mode)
     ============================================================ -->
<div class="page-section active" id="page-dashboard">
  <div class="main-content">
    <header class="topbar">
      <div class="topbar-breadcrumb">Overview <span class="breadcrumb-sep">/</span> <span id="dashboardBreadcrumb">Dashboard</span></div>
      <div class="topbar-actions">
        <div class="search-trigger">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
          Search...
          <span class="search-shortcut"><kbd>Ctrl</kbd><kbd>K</kbd></span>
        </div>
        <button class="btn btn-sm btn-secondary" onclick="toggleAIMode()">
          <svg viewBox="0 0 24 24" style="width:13px;height:13px;stroke:currentColor;fill:none;stroke-width:2"><rect x="2" y="2" width="20" height="20" rx="5"/><path d="M8 12h8M12 8v8"/></svg>
          <span id="dashAIBtnLabel">Enter AI Mode</span>
        </button>
      </div>
    </header>

    <!-- NORMAL DASHBOARD -->
    <div id="normalDashboard" class="content-area">
      <div class="page-header">
        <div class="page-header-top">
          <div>
            <h1 class="page-title">Good morning, Zhang Gong 👋</h1>
            <p class="page-subtitle">Here's what's happening across your workspace today — Jan 15, 2024</p>
          </div>
          <div class="btn-group">
            <button class="btn btn-secondary">
              <svg viewBox="0 0 24 24"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
              Jan 2024
            </button>
            <button class="btn btn-primary">
              <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
              New Task
            </button>
          </div>
        </div>
      </div>

      <!-- Stat Cards -->
      <div class="stat-grid" style="margin-bottom:var(--space-6)">
        <div class="stat-card">
          <div class="stat-label">Active Tasks</div>
          <div class="stat-value">24</div>
          <div class="stat-change positive">↑ 3 new this week</div>
        </div>
        <div class="stat-card">
          <div class="stat-label">Projects</div>
          <div class="stat-value">6</div>
          <div class="stat-change positive">2 on track</div>
        </div>
        <div class="stat-card">
          <div class="stat-label">Safety Reviews</div>
          <div class="stat-value">3</div>
          <div class="stat-change negative">↑ 1 overdue</div>
        </div>
        <div class="stat-card">
          <div class="stat-label">Performance Score</div>
          <div class="stat-value">92</div>
          <div class="stat-change positive">↑ 5 vs last month</div>
        </div>
      </div>

      <div class="two-col" style="margin-bottom:var(--space-5)">
        <!-- Recent Tasks -->
        <div class="card">
          <div class="card-header">
            <span class="card-title">Recent Tasks</span>
            <button class="btn btn-ghost btn-sm" onclick="showPage('tasks')">View All</button>
          </div>
          <div class="card-body" style="padding:0">
            <table class="data-table">
              <tbody>
                <tr>
                  <td style="padding:var(--space-3) var(--space-4)">
                    <div style="font-weight:500;font-size:var(--text-sm)">Thermal runaway simulation model validation</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">TSK-019 · BMS Safety Certification</div>
                  </td>
                  <td><span class="tag tag-red">Urgent</span></td>
                  <td><span class="tag tag-blue">In Progress</span></td>
                  <td style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Jan 18</td>
                </tr>
                <tr>
                  <td style="padding:var(--space-3) var(--space-4)">
                    <div style="font-weight:500;font-size:var(--text-sm)">Safety review document preparation</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">TSK-018 · BMS Safety Certification</div>
                  </td>
                  <td><span class="tag tag-orange">High</span></td>
                  <td><span class="tag tag-blue">In Progress</span></td>
                  <td style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Jan 20</td>
                </tr>
                <tr>
                  <td style="padding:var(--space-3) var(--space-4)">
                    <div style="font-weight:500;font-size:var(--text-sm)">Thermal diffusion test plan</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">TSK-020 · THERM-03</div>
                  </td>
                  <td><span class="tag tag-default">Medium</span></td>
                  <td><span class="tag tag-default">Backlog</span></td>
                  <td style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Jan 28</td>
                </tr>
                <tr>
                  <td style="padding:var(--space-3) var(--space-4)">
                    <div style="font-weight:500;font-size:var(--text-sm)">Multi-cell SOC balancing algorithm test</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">TSK-017 · BMS-2024</div>
                  </td>
                  <td><span class="tag tag-orange">High</span></td>
                  <td><span class="tag tag-purple">Review</span></td>
                  <td style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Jan 16</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <!-- Activity Timeline -->
        <div class="card">
          <div class="card-header">
            <span class="card-title">Activity Timeline</span>
            <span class="tag tag-green">Live</span>
          </div>
          <div class="card-body">
            <div style="display:flex;flex-direction:column;gap:var(--space-4)">
              <div style="display:flex;gap:var(--space-3)">
                <div style="width:32px;height:32px;border-radius:var(--radius-full);background:var(--color-warning-subtle);display:flex;align-items:center;justify-content:center;flex-shrink:0">
                  <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="var(--color-warning)" stroke-width="2"><path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"/></svg>
                </div>
                <div style="flex:1">
                  <div style="font-size:var(--text-sm);font-weight:500">SR-001 review overdue</div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Thermal runaway risk assessment — 15m ago</div>
                </div>
              </div>
              <div style="display:flex;gap:var(--space-3)">
                <div style="width:32px;height:32px;border-radius:var(--radius-full);background:var(--color-success-subtle);display:flex;align-items:center;justify-content:center;flex-shrink:0">
                  <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="var(--color-success)" stroke-width="2"><polyline points="20 6 9 17 4 12"/></svg>
                </div>
                <div style="flex:1">
                  <div style="font-size:var(--text-sm);font-weight:500">Li Gong completed TSK-016</div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Cell testing data collation — 1h ago</div>
                </div>
              </div>
              <div style="display:flex;gap:var(--space-3)">
                <div style="width:32px;height:32px;border-radius:var(--radius-full);background:var(--color-accent-subtle);display:flex;align-items:center;justify-content:center;flex-shrink:0">
                  <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="var(--color-accent-text)" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/></svg>
                </div>
                <div style="flex:1">
                  <div style="font-size:var(--text-sm);font-weight:500">Patent disclosure submitted</div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Wang Lei — Impedance-based thermal runaway — 3h ago</div>
                </div>
              </div>
              <div style="display:flex;gap:var(--space-3)">
                <div style="width:32px;height:32px;border-radius:var(--radius-full);background:var(--color-info-subtle);display:flex;align-items:center;justify-content:center;flex-shrink:0">
                  <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="var(--color-info)" stroke-width="2"><line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/></svg>
                </div>
                <div style="flex:1">
                  <div style="font-size:var(--text-sm);font-weight:500">December performance report ready</div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Score: 87 — 2 days ago</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="two-col">
        <!-- Safety Alerts -->
        <div class="card">
          <div class="card-header">
            <span class="card-title">Safety Alerts</span>
            <span class="tag tag-red">3 Critical</span>
          </div>
          <div class="card-body" style="padding:0">
            <div style="padding:var(--space-3) var(--space-5);border-bottom:1px solid var(--color-border);display:flex;align-items:center;justify-content:space-between">
              <div>
                <div style="font-size:var(--text-sm);font-weight:500">SR-001 Overdue</div>
                <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Thermal runaway risk — 3 days past due</div>
              </div>
              <span class="tag tag-red">Critical</span>
            </div>
            <div style="padding:var(--space-3) var(--space-5);border-bottom:1px solid var(--color-border);display:flex;align-items:center;justify-content:space-between">
              <div>
                <div style="font-size:var(--text-sm);font-weight:500">Missing test data</div>
                <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Cell vendor reports not received</div>
              </div>
              <span class="tag tag-orange">High</span>
            </div>
            <div style="padding:var(--space-3) var(--space-5);display:flex;align-items:center;justify-content:space-between">
              <div>
                <div style="font-size:var(--text-sm);font-weight:500">ISO 26262 criteria update needed</div>
                <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Safety margin document pending review</div>
              </div>
              <span class="tag tag-blue">Medium</span>
            </div>
          </div>
        </div>

        <!-- Project Progress -->
        <div class="card">
          <div class="card-header">
            <span class="card-title">Project Progress</span>
            <button class="btn btn-ghost btn-sm" onclick="showPage('projects')">View All</button>
          </div>
          <div class="card-body">
            <div style="display:flex;flex-direction:column;gap:var(--space-4)">
              <div>
                <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                  <span style="font-size:var(--text-sm);font-weight:500">BMS Safety Certification</span>
                  <span style="font-size:var(--text-xs);font-family:var(--font-mono)">65%</span>
                </div>
                <div class="progress-bar"><div class="progress-fill purple" style="width:65%"></div></div>
              </div>
              <div>
                <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                  <span style="font-size:var(--text-sm);font-weight:500">Thermal Management R&D</span>
                  <span style="font-size:var(--text-xs);font-family:var(--font-mono)">42%</span>
                </div>
                <div class="progress-bar"><div class="progress-fill blue" style="width:42%"></div></div>
              </div>
              <div>
                <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                  <span style="font-size:var(--text-sm);font-weight:500">Next-Gen Cell Integration</span>
                  <span style="font-size:var(--text-xs);font-family:var(--font-mono)">28%</span>
                </div>
                <div class="progress-bar"><div class="progress-fill green" style="width:28%"></div></div>
              </div>
              <div>
                <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                  <span style="font-size:var(--text-sm);font-weight:500">BMS-2024 Algorithm Update</span>
                  <span style="font-size:var(--text-xs);font-family:var(--font-mono)">88%</span>
                </div>
                <div class="progress-bar"><div class="progress-fill orange" style="width:88%"></div></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- AI MODE DASHBOARD -->
    <div id="aiDashboard" style="display:none;flex:1;overflow:hidden">
      <div class="ai-dashboard">
        <!-- LEFT: AI-generated workspace info -->
        <div class="ai-dashboard-left">
          <!-- AI Greeting Banner -->
          <div class="ai-greeting-banner ai-gen-item">
            <div style="display:flex;align-items:center;gap:var(--space-3);margin-bottom:var(--space-3)">
              <div style="width:36px;height:36px;border-radius:var(--radius-lg);background:linear-gradient(135deg,var(--color-accent),#6366F1);display:flex;align-items:center;justify-content:center;flex-shrink:0">
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"><rect x="2" y="2" width="20" height="20" rx="5"/><path d="M8 12h8M12 8v8"/></svg>
              </div>
              <div>
                <div style="font-size:var(--text-md);font-weight:700">BST AI — Good morning, Zhang Gong</div>
                <div style="font-size:var(--text-xs);color:var(--color-text-tertiary)">Jan 15, 2024 · Monday · AI workspace analysis ready</div>
              </div>
              <div class="ai-typing-cursor" style="margin-left:auto"></div>
            </div>
            <div style="font-size:var(--text-sm);color:var(--color-text-secondary);line-height:1.7">
              I've analyzed your workspace. You have <strong style="color:var(--color-danger)">1 overdue safety review</strong>, <strong style="color:var(--color-accent-text)">3 urgent tasks</strong> due this week, and your performance score is trending <strong style="color:var(--color-success)">+5 above last month</strong>. Your patent pipeline has 3 active applications. I recommend prioritizing SR-001 today.
            </div>
          </div>

          <!-- AI Generated Task Summary -->
          <div class="ai-gen-item" style="margin-bottom:var(--space-5)">
            <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-3)">
              <span style="font-size:var(--text-md);font-weight:600">📋 AI Task Board</span>
              <span class="tag tag-purple">Auto-generated</span>
            </div>
            <div class="mini-kanban">
              <div class="mini-kanban-col">
                <div class="mini-kanban-col-header">
                  <span>Urgent</span>
                  <span class="kanban-col-count">3</span>
                </div>
                <div class="mini-kanban-col-body">
                  <div class="mini-kanban-card" style="border-left:2px solid var(--color-danger)">SR-001 Review — Overdue 3d</div>
                  <div class="mini-kanban-card" style="border-left:2px solid var(--color-danger)">Thermal simulation validation</div>
                  <div class="mini-kanban-card" style="border-left:2px solid var(--color-warning)">Vendor test data request</div>
                </div>
              </div>
              <div class="mini-kanban-col">
                <div class="mini-kanban-col-header">
                  <span>In Progress</span>
                  <span class="kanban-col-count">4</span>
                </div>
                <div class="mini-kanban-col-body">
                  <div class="mini-kanban-card">Safety review docs prep</div>
                  <div class="mini-kanban-card">SOC balancing algorithm</div>
                  <div class="mini-kanban-card">Cell testing report</div>
                  <div class="mini-kanban-card">Impedance test setup</div>
                </div>
              </div>
              <div class="mini-kanban-col">
                <div class="mini-kanban-col-header">
                  <span>Review</span>
                  <span class="kanban-col-count">2</span>
                </div>
                <div class="mini-kanban-col-body">
                  <div class="mini-kanban-card">NUDD checklist Q4</div>
                  <div class="mini-kanban-card">Patent disclosure draft</div>
                </div>
              </div>
              <div class="mini-kanban-col">
                <div class="mini-kanban-col-header">
                  <span>Done</span>
                  <span class="kanban-col-count">5</span>
                </div>
                <div class="mini-kanban-col-body">
                  <div class="mini-kanban-card" style="opacity:0.6">Cell data collation</div>
                  <div class="mini-kanban-card" style="opacity:0.6">Q4 report submission</div>
                  <div class="mini-kanban-card" style="opacity:0.6">Team meeting notes</div>
                </div>
              </div>
            </div>
          </div>

          <!-- AI KPI Summary -->
          <div class="ai-gen-item" style="margin-bottom:var(--space-5)">
            <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-3)">
              <span style="font-size:var(--text-md);font-weight:600">📊 KPI Snapshot</span>
              <span class="tag tag-blue">AI Analyzed</span>
            </div>
            <div class="stat-grid" style="grid-template-columns:repeat(4,1fr)">
              <div class="stat-card" style="padding:var(--space-4)">
                <div class="stat-label">Performance</div>
                <div class="stat-value" style="font-size:var(--text-2xl)">92</div>
                <div class="stat-change positive">↑ +5 MoM</div>
              </div>
              <div class="stat-card" style="padding:var(--space-4)">
                <div class="stat-label">Task Rate</div>
                <div class="stat-value" style="font-size:var(--text-2xl)">87%</div>
                <div class="stat-change positive">21/24 on time</div>
              </div>
              <div class="stat-card" style="padding:var(--space-4)">
                <div class="stat-label">Patents</div>
                <div class="stat-value" style="font-size:var(--text-2xl)">3</div>
                <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:var(--space-1)">Target: 4/yr</div>
              </div>
              <div class="stat-card" style="padding:var(--space-4)">
                <div class="stat-label">Risk Items</div>
                <div class="stat-value" style="font-size:var(--text-2xl);color:var(--color-danger)">3</div>
                <div class="stat-change negative">Need action</div>
              </div>
            </div>
          </div>

          <!-- AI Project Summary -->
          <div class="ai-gen-item" style="margin-bottom:var(--space-5)">
            <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-3)">
              <span style="font-size:var(--text-md);font-weight:600">🚀 Project Overview</span>
              <span class="tag tag-green">6 Active</span>
            </div>
            <div class="card">
              <div class="card-body" style="padding:0">
                <table class="data-table">
                  <thead>
                    <tr>
                      <th>Project</th>
                      <th>Progress</th>
                      <th>Status</th>
                      <th>Due</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="cell-primary">BMS Safety Certification</td>
                      <td style="width:120px">
                        <div class="progress-bar"><div class="progress-fill purple" style="width:65%"></div></div>
                        <div style="font-size:10px;color:var(--color-text-quaternary);margin-top:2px">65%</div>
                      </td>
                      <td><span class="tag tag-orange">At Risk</span></td>
                      <td style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Mar 31</td>
                    </tr>
                    <tr>
                      <td class="cell-primary">Thermal Management R&D</td>
                      <td style="width:120px">
                        <div class="progress-bar"><div class="progress-fill blue" style="width:42%"></div></div>
                        <div style="font-size:10px;color:var(--color-text-quaternary);margin-top:2px">42%</div>
                      </td>
                      <td><span class="tag tag-green">On Track</span></td>
                      <td style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Jun 30</td>
                    </tr>
                    <tr>
                      <td class="cell-primary">BMS-2024 Algorithm</td>
                      <td style="width:120px">
                        <div class="progress-bar"><div class="progress-fill green" style="width:88%"></div></div>
                        <div style="font-size:10px;color:var(--color-text-quaternary);margin-top:2px">88%</div>
                      </td>
                      <td><span class="tag tag-green">On Track</span></td>
                      <td style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Jan 31</td>
                    </tr>
                    <tr>
                      <td class="cell-primary">Next-Gen Cell Integration</td>
                      <td style="width:120px">
                        <div class="progress-bar"><div class="progress-fill orange" style="width:28%"></div></div>
                        <div style="font-size:10px;color:var(--color-text-quaternary);margin-top:2px">28%</div>
                      </td>
                      <td><span class="tag tag-blue">Planning</span></td>
                      <td style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Dec 31</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

          <!-- AI Recommendations -->
          <div class="ai-gen-item">
            <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-3)">
              <span style="font-size:var(--text-md);font-weight:600">💡 AI Recommendations</span>
            </div>
            <div style="display:flex;flex-direction:column;gap:var(--space-3)">
              <div style="background:var(--color-danger-subtle);border:1px solid rgba(239,68,68,0.2);border-radius:var(--radius-md);padding:var(--space-3) var(--space-4);display:flex;align-items:center;gap:var(--space-3)">
                <div style="width:6px;height:6px;border-radius:50%;background:var(--color-danger);flex-shrink:0"></div>
                <div style="flex:1">
                  <div style="font-size:var(--text-sm);font-weight:500">Expedite SR-001 review — 3 days overdue</div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Contact vendor for test reports by today</div>
                </div>
                <button class="btn btn-sm btn-danger" onclick="showPage('safety')">Go to Review</button>
              </div>
              <div style="background:var(--color-warning-subtle);border:1px solid rgba(245,158,11,0.2);border-radius:var(--radius-md);padding:var(--space-3) var(--space-4);display:flex;align-items:center;gap:var(--space-3)">
                <div style="width:6px;height:6px;border-radius:50%;background:var(--color-warning);flex-shrink:0"></div>
                <div style="flex:1">
                  <div style="font-size:var(--text-sm);font-weight:500">Submit 1 more patent to hit annual target</div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">AI-driven degradation prediction draft ready</div>
                </div>
                <button class="btn btn-sm btn-secondary" onclick="showPage('patent')">View Patents</button>
              </div>
              <div style="background:var(--color-accent-subtle);border:1px solid rgba(139,92,246,0.2);border-radius:var(--radius-md);padding:var(--space-3) var(--space-4);display:flex;align-items:center;gap:var(--space-3)">
                <div style="width:6px;height:6px;border-radius:50%;background:var(--color-accent);flex-shrink:0"></div>
                <div style="flex:1">
                  <div style="font-size:var(--text-sm);font-weight:500">Performance on track — submit monthly report</div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">January goals at 68% weighted completion</div>
                </div>
                <button class="btn btn-sm btn-secondary" onclick="showPage('reports')">Generate Report</button>
              </div>
            </div>
          </div>
        </div>

        <!-- RIGHT: AI Chat Panel -->
        <div class="ai-dashboard-right">
          <div style="padding:var(--space-4) var(--space-5);border-bottom:1px solid var(--color-border);display:flex;align-items:center;justify-content:space-between">
            <div style="display:flex;align-items:center;gap:var(--space-2)">
              <div style="width:8px;height:8px;border-radius:50%;background:var(--color-success)"></div>
              <span style="font-size:var(--text-sm);font-weight:600">BST AI Assistant</span>
            </div>
            <button class="btn btn-ghost btn-sm">New Chat</button>
          </div>

          <div style="flex:1;overflow-y:auto;padding:var(--space-5)" id="aiChatMessages">
            <!-- Welcome -->
            <div style="text-align:center;padding:var(--space-5) 0;margin-bottom:var(--space-4)">
              <div style="width:44px;height:44px;border-radius:var(--radius-xl);background:linear-gradient(135deg,var(--color-accent),#6366F1);display:flex;align-items:center;justify-content:center;margin:0 auto var(--space-3)">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"><rect x="2" y="2" width="20" height="20" rx="5"/><path d="M8 12h8M12 8v8"/></svg>
              </div>
              <div style="font-size:var(--text-md);font-weight:700;margin-bottom:var(--space-1)">AI workspace loaded</div>
              <div style="font-size:var(--text-xs);color:var(--color-text-tertiary)">I've analyzed 24 tasks, 6 projects, 3 safety reviews and 3 patents. Ask me anything.</div>
            </div>

            <!-- AI message -->
            <div class="ai-message assistant" style="margin-bottom:var(--space-4)">
              <div class="ai-avatar assistant">AI</div>
              <div class="ai-bubble" style="max-width:85%">
                <strong>Today's Priority Summary</strong><br><br>
                🔴 <strong>SR-001</strong> is 3 days overdue — immediate action needed<br>
                🟡 <strong>TSK-019</strong> thermal simulation at 65% — due Jan 18<br>
                🟢 Performance score <strong>92</strong> — excellent trajectory<br><br>
                What would you like to work on first?
              </div>
            </div>
          </div>

          <!-- Quick Commands -->
          <div style="padding:var(--space-3) var(--space-4);border-top:1px solid var(--color-border)">
            <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-bottom:var(--space-2)">Quick commands</div>
            <div style="display:flex;flex-wrap:wrap;gap:var(--space-2)">
              <button class="ai-quick-btn" onclick="sendAIQuick('Summarize my tasks this week')">📋 Task summary</button>
              <button class="ai-quick-btn" onclick="sendAIQuick('Generate my monthly report')">📄 Monthly report</button>
              <button class="ai-quick-btn" onclick="sendAIQuick('Analyze SR-001 risk status')">🛡️ Safety analysis</button>
              <button class="ai-quick-btn" onclick="sendAIQuick('Show my KPI breakdown')">📊 KPI breakdown</button>
              <button class="ai-quick-btn" onclick="sendAIQuick('Draft patent abstract for thermal management')">💡 Draft patent</button>
              <button class="ai-quick-btn" onclick="sendAIQuick('What projects are at risk?')">🚀 Project risks</button>
            </div>
          </div>

          <!-- Input -->
          <div class="ai-input-bar" style="padding:var(--space-3) var(--space-4) var(--space-4)">
            <textarea class="ai-input-field" id="aiDashInput" placeholder="Ask BST AI anything... (Enter to send)" rows="1" onkeydown="handleAIDashInput(event)"></textarea>
            <button class="ai-send-btn" onclick="sendAIDashMessage()">
              <svg viewBox="0 0 24 24"><line x1="22" y1="2" x2="11" y2="13"/><polygon points="22 2 15 22 11 13 2 9 22 2"/></svg>
            </button>
          </div>
        </div>
      </div>
    </div>

  </div>
</div>

<!-- ============================================================
     PAGE 2 — TASK MANAGEMENT
     ============================================================ -->
<div class="page-section" id="page-tasks">
  <div class="main-content">
    <header class="topbar">
      <div class="topbar-breadcrumb">Workspace <span class="breadcrumb-sep">/</span> <span>Task Management</span></div>
      <div class="topbar-actions">
        <div class="search-trigger">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
          Search tasks...
          <span class="search-shortcut"><kbd>Ctrl</kbd><kbd>K</kbd></span>
        </div>
      </div>
    </header>
    <div class="content-area">
      <div class="page-header">
        <div class="page-header-top">
          <div>
            <h1 class="page-title">Task Management</h1>
            <p class="page-subtitle">Manage and track all your engineering tasks across projects.</p>
          </div>
          <div class="btn-group">
            <button class="btn btn-secondary">
              <svg viewBox="0 0 24 24"><line x1="4" y1="6" x2="20" y2="6"/><line x1="4" y1="12" x2="20" y2="12"/><line x1="4" y1="18" x2="20" y2="18"/></svg>
              Filter
            </button>
            <button class="btn btn-primary">
              <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
              New Task
            </button>
          </div>
        </div>
      </div>

      <div class="tabs">
        <div class="tab-item active">Kanban Board</div>
        <div class="tab-item">List View</div>
        <div class="tab-item">My Tasks</div>
        <div class="tab-item">Timeline</div>
      </div>

      <div class="kanban-board">
        <!-- Backlog -->
        <div class="kanban-column">
          <div class="kanban-col-header">
            <span class="kanban-col-title">Backlog</span>
            <span class="kanban-col-count">4</span>
          </div>
          <div class="kanban-col-body">
            <div class="kanban-card">
              <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                <span class="tag tag-default">Medium</span>
                <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">TSK-020</span>
              </div>
              <div class="kanban-card-title">Thermal diffusion test plan</div>
              <div class="progress-bar" style="margin-bottom:var(--space-2)"><div class="progress-fill blue" style="width:0%"></div></div>
              <div class="kanban-card-meta">
                <div class="kanban-card-avatar">ZG</div>
                <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Jan 28</span>
              </div>
            </div>
            <div class="kanban-card">
              <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                <span class="tag tag-default">Low</span>
                <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">TSK-021</span>
              </div>
              <div class="kanban-card-title">Q1 training plan documentation</div>
              <div class="kanban-card-meta">
                <div class="kanban-card-avatar" style="background:linear-gradient(135deg,#059669,#22C55E)">WL</div>
                <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Feb 5</span>
              </div>
            </div>
            <div class="kanban-card">
              <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                <span class="tag tag-blue">Medium</span>
                <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">TSK-022</span>
              </div>
              <div class="kanban-card-title">Supplier qualification checklist update</div>
              <div class="kanban-card-meta">
                <div class="kanban-card-avatar" style="background:linear-gradient(135deg,#2563EB,#3B82F6)">LG</div>
                <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Feb 10</span>
              </div>
            </div>
          </div>
        </div>
        <!-- In Progress -->
        <div class="kanban-column">
          <div class="kanban-col-header">
            <span class="kanban-col-title">In Progress</span>
            <span class="kanban-col-count">4</span>
          </div>
          <div class="kanban-col-body">
            <div class="kanban-card" style="border-left:2px solid var(--color-danger)">
              <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                <span class="tag tag-red">Urgent</span>
                <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">TSK-019</span>
              </div>
              <div class="kanban-card-title">Thermal runaway simulation model validation</div>
              <div class="progress-bar" style="margin-bottom:var(--space-2)"><div class="progress-fill red" style="width:65%"></div></div>
              <div class="kanban-card-meta">
                <div class="kanban-card-avatar">ZG</div>
                <span style="font-size:var(--text-xs);color:var(--color-danger)">Jan 18 — Due soon</span>
              </div>
            </div>
            <div class="kanban-card" style="border-left:2px solid var(--color-warning)">
              <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                <span class="tag tag-orange">High</span>
                <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">TSK-018</span>
              </div>
              <div class="kanban-card-title">Safety review document preparation SR-001</div>
              <div class="progress-bar" style="margin-bottom:var(--space-2)"><div class="progress-fill orange" style="width:40%"></div></div>
              <div class="kanban-card-meta">
                <div class="kanban-card-avatar">ZG</div>
                <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Jan 20</span>
              </div>
            </div>
            <div class="kanban-card">
              <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                <span class="tag tag-orange">High</span>
                <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">TSK-015</span>
              </div>
              <div class="kanban-card-title">Impedance spectroscopy test setup and calibration</div>
              <div class="progress-bar" style="margin-bottom:var(--space-2)"><div class="progress-fill purple" style="width:55%"></div></div>
              <div class="kanban-card-meta">
                <div class="kanban-card-avatar" style="background:linear-gradient(135deg,#059669,#22C55E)">WL</div>
                <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Jan 22</span>
              </div>
            </div>
          </div>
        </div>
        <!-- Review -->
        <div class="kanban-column">
          <div class="kanban-col-header">
            <span class="kanban-col-title">Review</span>
            <span class="kanban-col-count">3</span>
          </div>
          <div class="kanban-col-body">
            <div class="kanban-card">
              <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                <span class="tag tag-orange">High</span>
                <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">TSK-017</span>
              </div>
              <div class="kanban-card-title">Multi-cell SOC balancing algorithm test</div>
              <div class="progress-bar" style="margin-bottom:var(--space-2)"><div class="progress-fill green" style="width:90%"></div></div>
              <div class="kanban-card-meta">
                <div class="avatar-group">
                  <div class="avatar">ZG</div>
                  <div class="avatar blue">LG</div>
                </div>
                <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Jan 16</span>
              </div>
            </div>
            <div class="kanban-card">
              <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                <span class="tag tag-default">Medium</span>
                <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">TSK-014</span>
              </div>
              <div class="kanban-card-title">NUDD checklist Q4 2023 update</div>
              <div class="kanban-card-meta">
                <div class="kanban-card-avatar">ZG</div>
                <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Jan 14</span>
              </div>
            </div>
          </div>
        </div>
        <!-- Done -->
        <div class="kanban-column">
          <div class="kanban-col-header">
            <span class="kanban-col-title">Done</span>
            <span class="kanban-col-count">5</span>
          </div>
          <div class="kanban-col-body">
            <div class="kanban-card" style="opacity:0.65">
              <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                <span class="tag tag-green">Completed</span>
                <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">TSK-016</span>
              </div>
              <div class="kanban-card-title" style="text-decoration:line-through;color:var(--color-text-quaternary)">Cell testing data collation</div>
              <div class="kanban-card-meta">
                <div class="kanban-card-avatar" style="background:linear-gradient(135deg,#2563EB,#3B82F6)">LG</div>
                <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Jan 12</span>
              </div>
            </div>
            <div class="kanban-card" style="opacity:0.65">
              <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                <span class="tag tag-green">Completed</span>
                <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">TSK-013</span>
              </div>
              <div class="kanban-card-title" style="text-decoration:line-through;color:var(--color-text-quaternary)">Q4 performance self-assessment submission</div>
              <div class="kanban-card-meta">
                <div class="kanban-card-avatar">ZG</div>
                <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Jan 10</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- ============================================================
     PAGE 3 — PROJECT CENTER (Multi-view)
     ============================================================ -->
<div class="page-section" id="page-projects">
  <div class="main-content">
    <header class="topbar">
      <div class="topbar-breadcrumb">Workspace <span class="breadcrumb-sep">/</span> <span>Project Center</span></div>
      <div class="topbar-actions">
        <div class="search-trigger">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
          Search projects...
          <span class="search-shortcut"><kbd>Ctrl</kbd><kbd>K</kbd></span>
        </div>
      </div>
    </header>
    <div class="content-area">
      <div class="page-header">
        <div class="page-header-top">
          <div>
            <h1 class="page-title">Project Center</h1>
            <p class="page-subtitle">Manage all active projects, timelines, and deliverables.</p>
          </div>
          <div class="btn-group">
            <button class="btn btn-secondary">
              <svg viewBox="0 0 24 24"><line x1="4" y1="6" x2="20" y2="6"/><line x1="4" y1="12" x2="20" y2="12"/><line x1="4" y1="18" x2="20" y2="18"/></svg>
              Filter
            </button>
            <button class="btn btn-primary">
              <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
              New Project
            </button>
          </div>
        </div>
      </div>

      <!-- Project View Tabs -->
      <div class="tabs" style="margin-bottom:var(--space-4)">
        <div class="tab-item active" onclick="switchProjectView('list',this)">List View</div>
        <div class="tab-item" onclick="switchProjectView('kanban',this)">Kanban View</div>
        <div class="tab-item" onclick="switchProjectView('gantt',this)">Gantt Chart</div>
        <div class="tab-item" onclick="switchProjectView('wbs',this)">WBS</div>
        <div class="tab-item" onclick="switchProjectView('status',this)">Project Status</div>
      </div>

      <!-- LIST VIEW -->
      <div id="project-view-list">
        <div class="data-table-container">
          <table class="data-table">
            <thead>
              <tr>
                <th>Project</th>
                <th>Status</th>
                <th>Progress</th>
                <th>Team</th>
                <th>Start</th>
                <th>End</th>
                <th>Priority</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>
                  <div class="cell-primary">BMS Safety Certification</div>
                  <div class="cell-id">PRJ-001</div>
                </td>
                <td><span class="tag tag-orange">At Risk</span></td>
                <td style="width:140px">
                  <div class="progress-bar">
                    <div class="progress-fill purple" style="width:65%"></div></div>
                  <div style="font-size:10px;color:var(--color-text-quaternary);margin-top:2px">65%</div>
                </td>
                <td>
                  <div class="avatar-group">
                    <div class="avatar">ZG</div><div class="avatar blue">LG</div><div class="avatar green">WL</div>
                  </div>
                </td>
                <td style="font-size:var(--text-xs);color:var(--color-text-quaternary)">2023-09-01</td>
                <td style="font-size:var(--text-xs);color:var(--color-text-quaternary)">2024-03-31</td>
                <td><span class="tag tag-red">Critical</span></td>
              </tr>
              <tr>
                <td>
                  <div class="cell-primary">Thermal Management R&D</div>
                  <div class="cell-id">PRJ-002</div>
                </td>
                <td><span class="tag tag-green">On Track</span></td>
                <td style="width:140px">
                  <div class="progress-bar"><div class="progress-fill blue" style="width:42%"></div></div>
                  <div style="font-size:10px;color:var(--color-text-quaternary);margin-top:2px">42%</div>
                </td>
                <td>
                  <div class="avatar-group">
                    <div class="avatar">ZG</div><div class="avatar orange">CK</div>
                  </div>
                </td>
                <td style="font-size:var(--text-xs);color:var(--color-text-quaternary)">2023-11-01</td>
                <td style="font-size:var(--text-xs);color:var(--color-text-quaternary)">2024-06-30</td>
                <td><span class="tag tag-orange">High</span></td>
              </tr>
              <tr>
                <td>
                  <div class="cell-primary">BMS-2024 Algorithm Update</div>
                  <div class="cell-id">PRJ-003</div>
                </td>
                <td><span class="tag tag-green">On Track</span></td>
                <td style="width:140px">
                  <div class="progress-bar"><div class="progress-fill green" style="width:88%"></div></div>
                  <div style="font-size:10px;color:var(--color-text-quaternary);margin-top:2px">88%</div>
                </td>
                <td>
                  <div class="avatar-group">
                    <div class="avatar blue">LG</div><div class="avatar">ZG</div>
                  </div>
                </td>
                <td style="font-size:var(--text-xs);color:var(--color-text-quaternary)">2023-10-01</td>
                <td style="font-size:var(--text-xs);color:var(--color-text-quaternary)">2024-01-31</td>
                <td><span class="tag tag-orange">High</span></td>
              </tr>
              <tr>
                <td>
                  <div class="cell-primary">Next-Gen Cell Integration</div>
                  <div class="cell-id">PRJ-004</div>
                </td>
                <td><span class="tag tag-blue">Planning</span></td>
                <td style="width:140px">
                  <div class="progress-bar"><div class="progress-fill orange" style="width:28%"></div></div>
                  <div style="font-size:10px;color:var(--color-text-quaternary);margin-top:2px">28%</div>
                </td>
                <td>
                  <div class="avatar-group">
                    <div class="avatar green">WL</div><div class="avatar">ZG</div><div class="avatar orange">CK</div>
                  </div>
                </td>
                <td style="font-size:var(--text-xs);color:var(--color-text-quaternary)">2024-01-01</td>
                <td style="font-size:var(--text-xs);color:var(--color-text-quaternary)">2024-12-31</td>
                <td><span class="tag tag-default">Medium</span></td>
              </tr>
              <tr>
                <td>
                  <div class="cell-primary">Battery Pack Validation Test</div>
                  <div class="cell-id">PRJ-005</div>
                </td>
                <td><span class="tag tag-orange">At Risk</span></td>
                <td style="width:140px">
                  <div class="progress-bar"><div class="progress-fill red" style="width:51%"></div></div>
                  <div style="font-size:10px;color:var(--color-text-quaternary);margin-top:2px">51%</div>
                </td>
                <td>
                  <div class="avatar-group">
                    <div class="avatar orange">CK</div><div class="avatar blue">LG</div>
                  </div>
                </td>
                <td style="font-size:var(--text-xs);color:var(--color-text-quaternary)">2023-12-01</td>
                <td style="font-size:var(--text-xs);color:var(--color-text-quaternary)">2024-04-30</td>
                <td><span class="tag tag-orange">High</span></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <!-- KANBAN VIEW -->
      <div id="project-view-kanban" style="display:none">
        <div class="kanban-board">
          <div class="kanban-column">
            <div class="kanban-col-header">
              <span class="kanban-col-title">Planning</span>
              <span class="kanban-col-count">1</span>
            </div>
            <div class="kanban-col-body">
              <div class="kanban-card">
                <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                  <span class="tag tag-default">Medium</span>
                  <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">PRJ-004</span>
                </div>
                <div class="kanban-card-title">Next-Gen Cell Integration</div>
                <div class="progress-bar" style="margin-bottom:var(--space-2)"><div class="progress-fill orange" style="width:28%"></div></div>
                <div class="kanban-card-meta">
                  <div class="avatar-group"><div class="avatar green">WL</div><div class="avatar">ZG</div></div>
                  <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Dec 2024</span>
                </div>
              </div>
            </div>
          </div>
          <div class="kanban-column">
            <div class="kanban-col-header">
              <span class="kanban-col-title">In Progress</span>
              <span class="kanban-col-count">3</span>
            </div>
            <div class="kanban-col-body">
              <div class="kanban-card" style="border-left:2px solid var(--color-warning)">
                <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                  <span class="tag tag-red">Critical</span>
                  <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">PRJ-001</span>
                </div>
                <div class="kanban-card-title">BMS Safety Certification</div>
                <div class="progress-bar" style="margin-bottom:var(--space-2)"><div class="progress-fill purple" style="width:65%"></div></div>
                <div class="kanban-card-meta">
                  <div class="avatar-group"><div class="avatar">ZG</div><div class="avatar blue">LG</div></div>
                  <span style="font-size:var(--text-xs);color:var(--color-danger)">Mar 31</span>
                </div>
              </div>
              <div class="kanban-card">
                <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                  <span class="tag tag-orange">High</span>
                  <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">PRJ-002</span>
                </div>
                <div class="kanban-card-title">Thermal Management R&D</div>
                <div class="progress-bar" style="margin-bottom:var(--space-2)"><div class="progress-fill blue" style="width:42%"></div></div>
                <div class="kanban-card-meta">
                  <div class="avatar-group"><div class="avatar">ZG</div><div class="avatar orange">CK</div></div>
                  <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Jun 30</span>
                </div>
              </div>
              <div class="kanban-card" style="border-left:2px solid var(--color-warning)">
                <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                  <span class="tag tag-orange">High</span>
                  <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">PRJ-005</span>
                </div>
                <div class="kanban-card-title">Battery Pack Validation Test</div>
                <div class="progress-bar" style="margin-bottom:var(--space-2)"><div class="progress-fill red" style="width:51%"></div></div>
                <div class="kanban-card-meta">
                  <div class="avatar-group"><div class="avatar orange">CK</div><div class="avatar blue">LG</div></div>
                  <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Apr 30</span>
                </div>
              </div>
            </div>
          </div>
          <div class="kanban-column">
            <div class="kanban-col-header">
              <span class="kanban-col-title">Review</span>
              <span class="kanban-col-count">1</span>
            </div>
            <div class="kanban-col-body">
              <div class="kanban-card">
                <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                  <span class="tag tag-orange">High</span>
                  <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">PRJ-003</span>
                </div>
                <div class="kanban-card-title">BMS-2024 Algorithm Update</div>
                <div class="progress-bar" style="margin-bottom:var(--space-2)"><div class="progress-fill green" style="width:88%"></div></div>
                <div class="kanban-card-meta">
                  <div class="avatar-group"><div class="avatar blue">LG</div><div class="avatar">ZG</div></div>
                  <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Jan 31</span>
                </div>
              </div>
            </div>
          </div>
          <div class="kanban-column">
            <div class="kanban-col-header">
              <span class="kanban-col-title">Completed</span>
              <span class="kanban-col-count">0</span>
            </div>
            <div class="kanban-col-body">
              <div style="text-align:center;padding:var(--space-6);color:var(--color-text-quaternary);font-size:var(--text-xs)">No completed projects</div>
            </div>
          </div>
        </div>
      </div>

      <!-- GANTT VIEW -->
      <div id="project-view-gantt" style="display:none">
        <div class="gantt-placeholder">
          <div class="gantt-header-row">
            <div class="gantt-header-cell" style="text-align:left;padding-left:var(--space-4)">Project</div>
            <div class="gantt-header-cell">Sep</div>
            <div class="gantt-header-cell">Oct</div>
            <div class="gantt-header-cell">Nov</div>
            <div class="gantt-header-cell">Dec</div>
            <div class="gantt-header-cell" style="background:rgba(139,92,246,0.08);color:var(--color-accent-text)">Jan ▶</div>
            <div class="gantt-header-cell">Feb</div>
            <div class="gantt-header-cell">Mar</div>
            <div class="gantt-header-cell">Apr</div>
            <div class="gantt-header-cell">May</div>
            <div class="gantt-header-cell">Jun</div>
            <div class="gantt-header-cell">Jul</div>
            <div class="gantt-header-cell">Dec</div>
          </div>
          <div class="gantt-row">
            <div class="gantt-task-name"><span class="tag tag-red" style="margin-right:var(--space-2);font-size:9px">●</span>BMS Safety Cert</div>
            <div class="gantt-bar-container">
              <div class="gantt-bar" style="left:0%;width:58%;"></div>
            </div>
          </div>
          <div class="gantt-row">
            <div class="gantt-task-name"><span class="tag tag-blue" style="margin-right:var(--space-2);font-size:9px">●</span>Thermal Mgmt R&D</div>
            <div class="gantt-bar-container">
              <div class="gantt-bar blue" style="left:16%;width:66%;"></div>
            </div>
          </div>
          <div class="gantt-row">
            <div class="gantt-task-name"><span class="tag tag-green" style="margin-right:var(--space-2);font-size:9px">●</span>BMS-2024 Algorithm</div>
            <div class="gantt-bar-container">
              <div class="gantt-bar green" style="left:8%;width:42%;"></div>
            </div>
          </div>
          <div class="gantt-row">
            <div class="gantt-task-name"><span class="tag tag-orange" style="margin-right:var(--space-2);font-size:9px">●</span>Next-Gen Cell Integ.</div>
            <div class="gantt-bar-container">
              <div class="gantt-bar orange" style="left:33%;width:66%;"></div>
            </div>
          </div>
          <div class="gantt-row">
            <div class="gantt-task-name"><span class="tag tag-red" style="margin-right:var(--space-2);font-size:9px">●</span>Pack Validation Test</div>
            <div class="gantt-bar-container">
              <div class="gantt-bar" style="left:25%;width:50%;background:linear-gradient(90deg,#DC2626,#EF4444)"></div>
            </div>
          </div>
        </div>
      </div>

      <!-- WBS VIEW -->
      <div id="project-view-wbs" style="display:none">
        <div class="card">
          <div class="card-header">
            <span class="card-title">Work Breakdown Structure — BMS Safety Certification (PRJ-001)</span>
            <div class="view-switcher">
              <button class="view-switcher-btn active">PRJ-001</button>
              <button class="view-switcher-btn">PRJ-002</button>
              <button class="view-switcher-btn">PRJ-003</button>
            </div>
          </div>
          <div class="card-body">
            <div class="wbs-tree">
              <!-- Root -->
              <div class="wbs-node wbs-node-root">
                <div class="wbs-icon root">
                  <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="var(--color-accent-text)" stroke-width="2.5"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg>
                </div>
                <span class="wbs-label">PRJ-001 · BMS Safety Certification</span>
                <span class="tag tag-red" style="margin-left:auto">65%</span>
              </div>
              <!-- Branch 1 -->
              <div class="wbs-node wbs-indent-1">
                <div class="wbs-connector"></div>
                <div class="wbs-icon branch">
                  <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="var(--color-info)" stroke-width="2.5"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
                </div>
                <span class="wbs-label" style="font-weight:600">1. Safety Analysis</span>
                <span class="tag tag-orange" style="margin-left:auto">50%</span>
              </div>
              <div class="wbs-node wbs-indent-2">
                <div class="wbs-connector"></div>
                <div class="wbs-icon leaf"><span style="color:var(--color-text-quaternary);font-size:10px">T</span></div>
                <span class="wbs-label">1.1 Hazard Analysis (HARA)</span>
                <span class="tag tag-green" style="margin-left:auto">Done</span>
              </div>
              <div class="wbs-node wbs-indent-2">
                <div class="wbs-connector"></div>
                <div class="wbs-icon leaf"><span style="color:var(--color-text-quaternary);font-size:10px">T</span></div>
                <span class="wbs-label">1.2 Fault Tree Analysis (FTA)</span>
                <span class="tag tag-blue" style="margin-left:auto">In Progress</span>
              </div>
              <div class="wbs-node wbs-indent-2">
                <div class="wbs-connector"></div>
                <div class="wbs-icon leaf"><span style="color:var(--color-text-quaternary);font-size:10px">T</span></div>
                <span class="wbs-label">1.3 Thermal Runaway Risk Assessment (SR-001)</span>
                <span class="tag tag-red" style="margin-left:auto">Overdue</span>
              </div>
              <!-- Branch 2 -->
              <div class="wbs-node wbs-indent-1">
                <div class="wbs-connector"></div>
                <div class="wbs-icon branch">
                  <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="var(--color-info)" stroke-width="2.5"><polyline points="22 12 18 12 15 21 9 3 6 12 2 12"/></svg>
                </div>
                <span class="wbs-label" style="font-weight:600">2. Testing & Validation</span>
                <span class="tag tag-blue" style="margin-left:auto">75%</span>
              </div>
              <div class="wbs-node wbs-indent-2">
                <div class="wbs-connector"></div>
                <div class="wbs-icon leaf"><span style="color:var(--color-text-quaternary);font-size:10px">T</span></div>
                <span class="wbs-label">2.1 Cell-level abuse testing</span>
                <span class="tag tag-green" style="margin-left:auto">Done</span>
              </div>
              <div class="wbs-node wbs-indent-2">
                <div class="wbs-connector"></div>
                <div class="wbs-icon leaf"><span style="color:var(--color-text-quaternary);font-size:10px">T</span></div>
                <span class="wbs-label">2.2 Pack-level thermal diffusion test</span>
                <span class="tag tag-default" style="margin-left:auto">Backlog</span>
              </div>
              <div class="wbs-node wbs-indent-2">
                <div class="wbs-connector"></div>
                <div class="wbs-icon leaf"><span style="color:var(--color-text-quaternary);font-size:10px">T</span></div>
                <span class="wbs-label">2.3 Impedance spectroscopy validation</span>
                <span class="tag tag-blue" style="margin-left:auto">In Progress</span>
              </div>
              <!-- Branch 3 -->
              <div class="wbs-node wbs-indent-1">
                <div class="wbs-connector"></div>
                <div class="wbs-icon branch">
                  <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="var(--color-info)" stroke-width="2.5"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/></svg>
                </div>
                <span class="wbs-label" style="font-weight:600">3. Documentation & Certification</span>
                <span class="tag tag-blue" style="margin-left:auto">70%</span>
              </div>
              <div class="wbs-node wbs-indent-2">
                <div class="wbs-connector"></div>
                <div class="wbs-icon leaf"><span style="color:var(--color-text-quaternary);font-size:10px">T</span></div>
                <span class="wbs-label">3.1 Safety Case document</span>
                <span class="tag tag-blue" style="margin-left:auto">In Progress</span>
              </div>
              <div class="wbs-node wbs-indent-2">
                <div class="wbs-connector"></div>
                <div class="wbs-icon leaf"><span style="color:var(--color-text-quaternary);font-size:10px">T</span></div>
                <span class="wbs-label">3.2 NUDD checklist completion</span>
                <span class="tag tag-purple" style="margin-left:auto">Review</span>
              </div>
              <div class="wbs-node wbs-indent-2">
                <div class="wbs-connector"></div>
                <div class="wbs-icon leaf"><span style="color:var(--color-text-quaternary);font-size:10px">T</span></div>
                <span class="wbs-label">3.3 Third-party audit submission</span>
                <span class="tag tag-default" style="margin-left:auto">Not Started</span>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- PROJECT STATUS VIEW -->
      <div id="project-view-status" style="display:none">
        <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-4)">
          <div class="stat-grid" style="grid-template-columns:repeat(5,1fr);flex:1;gap:var(--space-3)">
            <div class="stat-card" style="padding:var(--space-4)">
              <div class="stat-label">Total Projects</div>
              <div class="stat-value">5</div>
            </div>
            <div class="stat-card" style="padding:var(--space-4)">
              <div class="stat-label">On Track</div>
              <div class="stat-value" style="color:var(--color-success)">2</div>
            </div>
            <div class="stat-card" style="padding:var(--space-4)">
              <div class="stat-label">At Risk</div>
              <div class="stat-value" style="color:var(--color-warning)">2</div>
            </div>
            <div class="stat-card" style="padding:var(--space-4)">
              <div class="stat-label">Planning</div>
              <div class="stat-value" style="color:var(--color-info)">1</div>
            </div>
            <div class="stat-card" style="padding:var(--space-4)">
              <div class="stat-label">Avg Progress</div>
              <div class="stat-value">55%</div>
            </div>
          </div>
        </div>
        <div class="project-status-grid">
          <div style="display:grid;grid-template-columns:2fr 1fr 1fr 1fr 1fr 1fr;gap:var(--space-4);padding:var(--space-2) var(--space-5);font-size:var(--text-xs);font-weight:600;color:var(--color-text-quaternary);text-transform:uppercase;letter-spacing:0.5px">
            <span>Project</span><span>Status</span><span>Health</span><span>Progress</span><span>Team</span><span>Deadline</span>
          </div>
          <div class="project-status-row">
            <div>
              <div style="font-weight:600;font-size:var(--text-sm)">BMS Safety Certification</div>
              <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">PRJ-001 · Safety Engineering</div>
            </div>
            <span class="tag tag-orange">At Risk</span>
            <div style="display:flex;align-items:center;gap:var(--space-2)">
              <div style="width:8px;height:8px;border-radius:50%;background:var(--color-warning)"></div>
              <span style="font-size:var(--text-xs)">Caution</span>
            </div>
            <div>
              <div class="progress-bar" style="margin-bottom:4px"><div class="progress-fill purple" style="width:65%"></div></div>
              <span style="font-size:10px;color:var(--color-text-quaternary)">65%</span>
            </div>
            <div class="avatar-group"><div class="avatar">ZG</div><div class="avatar blue">LG</div><div class="avatar green">WL</div></div>
            <span style="font-size:var(--text-xs);color:var(--color-danger)">Mar 31 ⚠</span>
          </div>
          <div class="project-status-row">
            <div>
              <div style="font-weight:600;font-size:var(--text-sm)">Thermal Management R&D</div>
              <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">PRJ-002 · R&D</div>
            </div>
            <span class="tag tag-green">On Track</span>
            <div style="display:flex;align-items:center;gap:var(--space-2)">
              <div style="width:8px;height:8px;border-radius:50%;background:var(--color-success)"></div>
              <span style="font-size:var(--text-xs)">Healthy</span>
            </div>
            <div>
              <div class="progress-bar" style="margin-bottom:4px"><div class="progress-fill blue" style="width:42%"></div></div>
              <span style="font-size:10px;color:var(--color-text-quaternary)">42%</span>
            </div>
            <div class="avatar-group"><div class="avatar">ZG</div><div class="avatar orange">CK</div></div>
            <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Jun 30</span>
          </div>
          <div class="project-status-row">
            <div>
              <div style="font-weight:600;font-size:var(--text-sm)">BMS-2024 Algorithm Update</div>
              <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">PRJ-003 · Software</div>
            </div>
            <span class="tag tag-green">On Track</span>
            <div style="display:flex;align-items:center;gap:var(--space-2)">
              <div style="width:8px;height:8px;border-radius:50%;background:var(--color-success)"></div>
              <span style="font-size:var(--text-xs)">Healthy</span>
            </div>
            <div>
              <div class="progress-bar" style="margin-bottom:4px"><div class="progress-fill green" style="width:88%"></div></div>
              <span style="font-size:10px;color:var(--color-text-quaternary)">88%</span>
            </div>
            <div class="avatar-group"><div class="avatar blue">LG</div><div class="avatar">ZG</div></div>
            <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Jan 31</span>
          </div>
          <div class="project-status-row">
            <div>
              <div style="font-weight:600;font-size:var(--text-sm)">Next-Gen Cell Integration</div>
              <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">PRJ-004 · Hardware</div>
            </div>
            <span class="tag tag-blue">Planning</span>
            <div style="display:flex;align-items:center;gap:var(--space-2)">
              <div style="width:8px;height:8px;border-radius:50%;background:var(--color-info)"></div>
              <span style="font-size:var(--text-xs)">Early Stage</span>
            </div>
            <div>
              <div class="progress-bar" style="margin-bottom:4px"><div class="progress-fill orange" style="width:28%"></div></div>
              <span style="font-size:10px;color:var(--color-text-quaternary)">28%</span>
            </div>
            <div class="avatar-group"><div class="avatar green">WL</div><div class="avatar">ZG</div><div class="avatar orange">CK</div></div>
            <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Dec 31</span>
          </div>
          <div class="project-status-row">
            <div>
              <div style="font-weight:600;font-size:var(--text-sm)">Battery Pack Validation Test</div>
              <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">PRJ-005 · Testing</div>
            </div>
            <span class="tag tag-orange">At Risk</span>
            <div style="display:flex;align-items:center;gap:var(--space-2)">
              <div style="width:8px;height:8px;border-radius:50%;background:var(--color-warning)"></div>
              <span style="font-size:var(--text-xs)">Caution</span>
            </div>
            <div>
              <div class="progress-bar" style="margin-bottom:4px"><div class="progress-fill red" style="width:51%"></div></div>
              <span style="font-size:10px;color:var(--color-text-quaternary)">51%</span>
            </div>
            <div class="avatar-group"><div class="avatar orange">CK</div><div class="avatar blue">LG</div></div>
            <span style="font-size:var(--text-xs);color:var(--color-warning)">Apr 30</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- ============================================================
     PAGE 4 — SAFETY REVIEW
     ============================================================ -->
<div class="page-section" id="page-safety">
  <div class="main-content">
    <header class="topbar">
      <div class="topbar-breadcrumb">Workspace <span class="breadcrumb-sep">/</span> <span>Safety Review</span></div>
      <div class="topbar-actions">
        <button class="btn btn-primary">
          <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
          Initiate Review
        </button>
      </div>
    </header>

    <div class="content-area">
      <div class="page-header">
        <div class="page-header-top">
          <div>
            <h1 class="page-title">Safety Review</h1>
            <p class="page-subtitle">Manage safety assessments, FMEA reviews, NUDD checklists, and risk tracking.</p>
          </div>
        </div>
      </div>

      <!-- Review Flow Steps -->
      <div style="margin-bottom:var(--space-8)">
        <div class="flow-steps">
          <div class="flow-step">
            <div class="flow-step-number completed">
              <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg>
            </div>
            <span class="flow-step-label">Initiation</span>
          </div>
          <div class="flow-connector completed"></div>
          <div class="flow-step">
            <div class="flow-step-number completed">
              <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg>
            </div>
            <span class="flow-step-label">NUDD Analysis</span>
          </div>
          <div class="flow-connector completed"></div>
          <div class="flow-step">
            <div class="flow-step-number active">3</div>
            <span class="flow-step-label active">Risk Assessment</span>
          </div>
          <div class="flow-connector"></div>
          <div class="flow-step">
            <div class="flow-step-number">4</div>
            <span class="flow-step-label">Issue Resolution</span>
          </div>
          <div class="flow-connector"></div>
          <div class="flow-step">
            <div class="flow-step-number">5</div>
            <span class="flow-step-label">Test Validation</span>
          </div>
          <div class="flow-connector"></div>
          <div class="flow-step">
            <div class="flow-step-number">6</div>
            <span class="flow-step-label">Report Output</span>
          </div>
        </div>
      </div>

      <!-- Safety Review Tabs -->
      <div class="tabs" style="margin-bottom:var(--space-6)">
        <div class="tab-item active">Active Reviews</div>
        <div class="tab-item">NUDD Checklist</div>
        <div class="tab-item">Risk Matrix</div>
        <div class="tab-item">Issue Tracking</div>
        <div class="tab-item">Test Validation</div>
        <div class="tab-item">History</div>
      </div>

      <!-- Active Reviews Table -->
      <div class="card" style="margin-bottom:var(--space-8)">
        <div class="card-header">
          <span class="card-title">Active Safety Reviews</span>
          <span class="tag tag-red">1 Overdue</span>
        </div>
        <div class="card-body" style="padding:0">
          <table class="data-table">
            <thead>
              <tr>
                <th>Review ID</th>
                <th>Title</th>
                <th>Project</th>
                <th>Phase</th>
                <th>Risk Level</th>
                <th>Owner</th>
                <th>Due Date</th>
                <th>Status</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="cell-id">SR-001</td>
                <td class="cell-primary">Thermal Runaway Risk Assessment</td>
                <td><span class="tag tag-purple">BMS Safety Cert</span></td>
                <td style="font-size:var(--text-xs)">Risk Assessment</td>
                <td><span class="tag tag-red">Critical</span></td>
                <td>
                  <div style="display:flex;align-items:center;gap:var(--space-2)">
                    <div class="avatar">ZG</div>
                    <span style="font-size:var(--text-xs)">Zhang Gong</span>
                  </div>
                </td>
                <td style="color:var(--color-danger);font-size:var(--text-xs)">Jan 15 (Overdue)</td>
                <td><span class="tag tag-orange">In Review</span></td>
              </tr>
              <tr>
                <td class="cell-id">SR-002</td>
                <td class="cell-primary">Electrical Isolation Test Review</td>
                <td><span class="tag tag-purple">BMS Safety Cert</span></td>
                <td style="font-size:var(--text-xs)">Test Validation</td>
                <td><span class="tag tag-orange">High</span></td>
                <td>
                  <div style="display:flex;align-items:center;gap:var(--space-2)">
                    <div class="avatar green">LG</div>
                    <span style="font-size:var(--text-xs)">Li Gong</span>
                  </div>
                </td>
                <td style="font-size:var(--text-xs)">Jan 20</td>
                <td><span class="tag tag-blue">Pending</span></td>
              </tr>
              <tr>
                <td class="cell-id">SR-003</td>
                <td class="cell-primary">FMEA Update for Control Algorithm</td>
                <td><span class="tag tag-blue">FMEA Doc</span></td>
                <td style="font-size:var(--text-xs)">NUDD Analysis</td>
                <td><span class="tag tag-default">Medium</span></td>
                <td>
                  <div style="display:flex;align-items:center;gap:var(--space-2)">
                    <div class="avatar orange">CK</div>
                    <span style="font-size:var(--text-xs)">Chen Ke</span>
                  </div>
                </td>
                <td style="font-size:var(--text-xs)">Jan 22</td>
                <td><span class="tag tag-blue">Scheduled</span></td>
              </tr>
              <tr>
                <td class="cell-id">SR-004</td>
                <td class="cell-primary">Vibration & Shock Safety Validation</td>
                <td><span class="tag tag-purple">BMS Safety Cert</span></td>
                <td style="font-size:var(--text-xs)">Initiation</td>
                <td><span class="tag tag-default">Low</span></td>
                <td>
                  <div style="display:flex;align-items:center;gap:var(--space-2)">
                    <div class="avatar pink">HL</div>
                    <span style="font-size:var(--text-xs)">Huang Lei</span>
                  </div>
                </td>
                <td style="font-size:var(--text-xs)">Feb 10</td>
                <td><span class="tag tag-default">Draft</span></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <!-- Risk Matrix Section -->
      <div style="margin-top:var(--space-8)">
        <h2 style="font-size:var(--text-xl);font-weight:600;margin-bottom:var(--space-5)">Risk Assessment Matrix</h2>
        <div class="two-col">
          <!-- Risk Matrix Visual -->
          <div class="card">
            <div class="card-header">
              <span class="card-title">Severity vs Occurrence</span>
            </div>
            <div class="card-body">
              <div style="display:grid;grid-template-columns:30px repeat(5,1fr);grid-template-rows:repeat(5,44px) 24px;gap:3px;font-size:var(--text-xs)">
                <!-- Y-axis labels -->
                <div style="display:flex;align-items:center;justify-content:center;color:var(--color-text-quaternary);font-weight:500">5</div>
                <div class="risk-matrix-cell risk-medium">1</div>
                <div class="risk-matrix-cell risk-high">1</div>
                <div class="risk-matrix-cell risk-critical">SR-001</div>
                <div class="risk-matrix-cell risk-critical"></div>
                <div class="risk-matrix-cell risk-critical"></div>

                <div style="display:flex;align-items:center;justify-content:center;color:var(--color-text-quaternary);font-weight:500">4</div>
                <div class="risk-matrix-cell risk-low"></div>
                <div class="risk-matrix-cell risk-medium">1</div>
                <div class="risk-matrix-cell risk-high">SR-002</div>
                <div class="risk-matrix-cell risk-critical"></div>
                <div class="risk-matrix-cell risk-critical"></div>

                <div style="display:flex;align-items:center;justify-content:center;color:var(--color-text-quaternary);font-weight:500">3</div>
                <div class="risk-matrix-cell risk-low"></div>
                <div class="risk-matrix-cell risk-medium">SR-003</div>
                <div class="risk-matrix-cell risk-medium"></div>
                <div class="risk-matrix-cell risk-high"></div>
                <div class="risk-matrix-cell risk-high"></div>

                <div style="display:flex;align-items:center;justify-content:center;color:var(--color-text-quaternary);font-weight:500">2</div>
                <div class="risk-matrix-cell risk-low">SR-004</div>
                <div class="risk-matrix-cell risk-low"></div>
                <div class="risk-matrix-cell risk-medium"></div>
                <div class="risk-matrix-cell risk-medium"></div>
                <div class="risk-matrix-cell risk-high"></div>

                <div style="display:flex;align-items:center;justify-content:center;color:var(--color-text-quaternary);font-weight:500">1</div>
                <div class="risk-matrix-cell risk-low"></div>
                <div class="risk-matrix-cell risk-low"></div>
                <div class="risk-matrix-cell risk-low"></div>
                <div class="risk-matrix-cell risk-medium"></div>
                <div class="risk-matrix-cell risk-medium"></div>

                <!-- X-axis labels -->
                <div></div>
                <div style="display:flex;align-items:center;justify-content:center;color:var(--color-text-quaternary);font-weight:500">1</div>
                <div style="display:flex;align-items:center;justify-content:center;color:var(--color-text-quaternary);font-weight:500">2</div>
                <div style="display:flex;align-items:center;justify-content:center;color:var(--color-text-quaternary);font-weight:500">3</div>
                <div style="display:flex;align-items:center;justify-content:center;color:var(--color-text-quaternary);font-weight:500">4</div>
                <div style="display:flex;align-items:center;justify-content:center;color:var(--color-text-quaternary);font-weight:500">5</div>
              </div>
              <div style="display:flex;justify-content:center;margin-top:var(--space-3)">
                <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Severity →</span>
              </div>
            </div>
          </div>

          <!-- NUDD Checklist Summary -->
          <div class="card">
            <div class="card-header">
              <span class="card-title">NUDD Checklist Summary</span>
              <button class="btn btn-ghost btn-sm">View Details</button>
            </div>
            <div class="card-body">
              <div style="display:flex;flex-direction:column;gap:var(--space-4)">
                <!-- N -->
                <div>
                  <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-2)">
                    <div style="display:flex;align-items:center;gap:var(--space-2)">
                      <div style="width:24px;height:24px;border-radius:var(--radius-sm);background:var(--color-accent-subtle);display:flex;align-items:center;justify-content:center;font-size:var(--text-xs);font-weight:700;color:var(--color-accent)">N</div>
                      <span style="font-size:var(--text-sm);font-weight:500">New Design Elements</span>
                    </div>
                    <span style="font-size:var(--text-xs);color:var(--color-text-quaternary);font-family:var(--font-mono)">3/4</span>
                  </div>
                  <div class="progress-bar"><div class="progress-fill purple" style="width:75%"></div></div>
                </div>
                <div style="height:1px;background:var(--color-border)"></div>
                <!-- U -->
                <div>
                  <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-2)">
                    <div style="display:flex;align-items:center;gap:var(--space-2)">
                      <div style="width:24px;height:24px;border-radius:var(--radius-sm);background:var(--color-info-subtle);display:flex;align-items:center;justify-content:center;font-size:var(--text-xs);font-weight:700;color:var(--color-info)">U</div>
                      <span style="font-size:var(--text-sm);font-weight:500">Unvalidated</span>
                    </div>
                    <span style="font-size:var(--text-xs);color:var(--color-text-quaternary);font-family:var(--font-mono)">1/3</span>
                  </div>
                  <div class="progress-bar"><div class="progress-fill blue" style="width:33%"></div></div>
                </div>
                <div style="height:1px;background:var(--color-border)"></div>
                <!-- D1 -->
                <div>
                  <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-2)">
                    <div style="display:flex;align-items:center;gap:var(--space-2)">
                      <div style="width:24px;height:24px;border-radius:var(--radius-sm);background:var(--color-warning-subtle);display:flex;align-items:center;justify-content:center;font-size:var(--text-xs);font-weight:700;color:var(--color-warning)">D</div>
                      <span style="font-size:var(--text-sm);font-weight:500">Different Use</span>
                    </div>
                    <span style="font-size:var(--text-xs);color:var(--color-text-quaternary);font-family:var(--font-mono)">2/2</span>
                  </div>
                  <div class="progress-bar"><div class="progress-fill green" style="width:100%"></div></div>
                </div>
                <div style="height:1px;background:var(--color-border)"></div>
                <!-- D2 -->
                <div>
                  <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-2)">
                    <div style="display:flex;align-items:center;gap:var(--space-2)">
                      <div style="width:24px;height:24px;border-radius:var(--radius-sm);background:var(--color-success-subtle);display:flex;align-items:center;justify-content:center;font-size:var(--text-xs);font-weight:700;color:var(--color-success)">D</div>
                      <span style="font-size:var(--text-sm);font-weight:500">Different Supplier</span>
                    </div>
                    <span style="font-size:var(--text-xs);color:var(--color-text-quaternary);font-family:var(--font-mono)">1/1</span>
                  </div>
                  <div class="progress-bar"><div class="progress-fill green" style="width:100%"></div></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- ============================================================
     PAGE 5 — PERFORMANCE (with Kanban view)
     ============================================================ -->
<div class="page-section" id="page-performance">
  <div class="main-content">
    <header class="topbar">
      <div class="topbar-breadcrumb">Workspace <span class="breadcrumb-sep">/</span> <span>Performance</span></div>
      <div class="topbar-actions">
        <div class="view-switcher">
          <button class="view-switcher-btn active" onclick="switchPerfView('overview',this)">Overview</button>
          <button class="view-switcher-btn" onclick="switchPerfView('kanban',this)">Kanban</button>
          <button class="view-switcher-btn" onclick="switchPerfView('goals',this)">Goals</button>
        </div>
      </div>
    </header>
    <div class="content-area">
      <div class="page-header">
        <div class="page-header-top">
          <div>
            <h1 class="page-title">Performance Management</h1>
            <p class="page-subtitle">Track KPIs, goals, and team performance metrics for January 2024.</p>
          </div>
          <button class="btn btn-primary">
            <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
            Set New Goal
          </button>
        </div>
      </div>

      <!-- PERFORMANCE OVERVIEW -->
      <div id="perf-view-overview">
        <div class="stat-grid" style="grid-template-columns:repeat(4,1fr);margin-bottom:var(--space-6)">
          <div class="stat-card">
            <div class="stat-label">Overall Score</div>
            <div class="stat-value" style="color:var(--color-success)">92</div>
            <div class="stat-change positive">↑ +5 vs Dec 2023</div>
          </div>
          <div class="stat-card">
            <div class="stat-label">Task Completion</div>
            <div class="stat-value">87%</div>
            <div class="stat-change positive">21/24 tasks on time</div>
          </div>
          <div class="stat-card">
            <div class="stat-label">Team Ranking</div>
            <div class="stat-value">#2</div>
            <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:var(--space-1)">Out of 12 members</div>
          </div>
          <div class="stat-card">
            <div class="stat-label">Patent Output</div>
            <div class="stat-value">3/4</div>
            <div style="margin-top:var(--space-2)">
              <div class="progress-bar"><div class="progress-fill purple" style="width:75%"></div></div>
              <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:var(--space-1)">75% of annual target</div>
            </div>
          </div>
        </div>

        <div class="two-col" style="margin-bottom:var(--space-5)">
          <!-- Score Breakdown -->
          <div class="card">
            <div class="card-header"><span class="card-title">Score Breakdown</span></div>
            <div class="card-body">
              <div style="display:flex;flex-direction:column;gap:var(--space-4)">
                <div style="display:flex;align-items:center;gap:var(--space-4)">
                  <div class="score-ring">
                    <svg viewBox="0 0 80 80"><circle class="ring-bg" cx="40" cy="40" r="36"/><circle class="ring-fill green" cx="40" cy="40" r="36" stroke-dashoffset="27"/></svg>
                    <div class="score-value" style="color:var(--color-success)">88</div>
                  </div>
                  <div style="flex:1">
                    <div style="font-weight:500;margin-bottom:var(--space-1)">Task Execution</div>
                    <div class="progress-bar"><div class="progress-fill green" style="width:88%"></div></div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:var(--space-1)">Weight: 40%</div>
                  </div>
                </div>
                <div style="display:flex;align-items:center;gap:var(--space-4)">
                  <div class="score-ring">
                    <svg viewBox="0 0 80 80"><circle class="ring-bg" cx="40" cy="40" r="36"/><circle class="ring-fill blue" cx="40" cy="40" r="36" stroke-dashoffset="45"/></svg>
                    <div class="score-value" style="color:var(--color-info)">80</div>
                  </div>
                  <div style="flex:1">
                    <div style="font-weight:500;margin-bottom:var(--space-1)">Innovation & Patents</div>
                    <div class="progress-bar"><div class="progress-fill blue" style="width:80%"></div></div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:var(--space-1)">Weight: 25%</div>
                  </div>
                </div>
                <div style="display:flex;align-items:center;gap:var(--space-4)">
                  <div class="score-ring">
                    <svg viewBox="0 0 80 80"><circle class="ring-bg" cx="40" cy="40" r="36"/><circle class="ring-fill purple" cx="40" cy="40" r="36" stroke-dashoffset="18"/></svg>
                    <div class="score-value" style="color:var(--color-accent-text)">92</div>
                  </div>
                  <div style="flex:1">
                    <div style="font-weight:500;margin-bottom:var(--space-1)">Safety Compliance</div>
                    <div class="progress-bar"><div class="progress-fill purple" style="width:92%"></div></div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:var(--space-1)">Weight: 35%</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- Monthly Trend -->
          <div class="card">
            <div class="card-header"><span class="card-title">Monthly Trend</span><span class="tag tag-green">↑ Improving</span></div>
            <div class="card-body">
              <div style="display:flex;align-items:flex-end;gap:var(--space-2);height:120px;margin-bottom:var(--space-3)">
                <div style="flex:1;display:flex;flex-direction:column;align-items:center;gap:var(--space-2)">
                  <span style="font-size:9px;color:var(--color-text-quaternary)">75</span>
                  <div style="flex:1;width:100%;background:var(--color-accent-subtle);border-radius:3px 3px 0 0;height:75%" class="progress-fill purple" style="height:75%;width:100%;border-radius:3px 3px 0 0"></div>
                  <span style="font-size:9px;color:var(--color-text-quaternary)">Aug</span>
                </div>
                <div style="flex:1;display:flex;flex-direction:column;align-items:center;gap:var(--space-2)">
                  <span style="font-size:9px;color:var(--color-text-quaternary)">78</span>
                  <div style="width:100%;background:var(--color-accent-subtle);border-radius:3px 3px 0 0;height:78%"></div>
                  <span style="font-size:9px;color:var(--color-text-quaternary)">Sep</span>
                </div>
                <div style="flex:1;display:flex;flex-direction:column;align-items:center;gap:var(--space-2)">
                  <span style="font-size:9px;color:var(--color-text-quaternary)">80</span>
                  <div style="width:100%;background:var(--color-accent-subtle);border-radius:3px 3px 0 0;height:80%"></div>
                  <span style="font-size:9px;color:var(--color-text-quaternary)">Oct</span>
                </div>
                <div style="flex:1;display:flex;flex-direction:column;align-items:center;gap:var(--space-2)">
                  <span style="font-size:9px;color:var(--color-text-quaternary)">83</span>
                  <div style="width:100%;background:var(--color-accent-subtle);border-radius:3px 3px 0 0;height:83%"></div>
                  <span style="font-size:9px;color:var(--color-text-quaternary)">Nov</span>
                </div>
                <div style="flex:1;display:flex;flex-direction:column;align-items:center;gap:var(--space-2)">
                  <span style="font-size:9px;color:var(--color-text-quaternary)">87</span>
                  <div style="width:100%;background:var(--color-accent-subtle);border-radius:3px 3px 0 0;height:87%"></div>
                  <span style="font-size:9px;color:var(--color-text-quaternary)">Dec</span>
                </div>
                <div style="flex:1;display:flex;flex-direction:column;align-items:center;gap:var(--space-2)">
                  <span style="font-size:9px;color:var(--color-accent-text);font-weight:700">92</span>
                  <div style="width:100%;background:var(--color-accent);border-radius:3px 3px 0 0;height:92%"></div>
                  <span style="font-size:9px;color:var(--color-accent-text);font-weight:600">Jan</span>
                </div>
              </div>
              <div style="display:grid;grid-template-columns:repeat(3,1fr);gap:var(--space-3)">
                <div style="text-align:center">
                  <div style="font-size:var(--text-lg);font-weight:700;color:var(--color-success)">+5</div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">MoM Growth</div>
                </div>
                <div style="text-align:center">
                  <div style="font-size:var(--text-lg);font-weight:700">92</div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Current</div>
                </div>
                <div style="text-align:center">
                  <div style="font-size:var(--text-lg);font-weight:700;color:var(--color-accent-text)">95</div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Target</div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Activity Heatmap -->
        <div class="card">
          <div class="card-header">
            <span class="card-title">Activity Heatmap — Last 3 Months</span>
            <div style="display:flex;align-items:center;gap:var(--space-2);font-size:var(--text-xs);color:var(--color-text-quaternary)">
              Less
              <div style="width:12px;height:12px;border-radius:2px;background:var(--color-bg-active)"></div>
              <div class="heatmap-cell level-1" style="width:12px;height:12px"></div>
              <div class="heatmap-cell level-2" style="width:12px;height:12px"></div>
              <div class="heatmap-cell level-3" style="width:12px;height:12px"></div>
              <div class="heatmap-cell level-4" style="width:12px;height:12px"></div>
              More
            </div>
          </div>
          <div class="card-body">
            <div style="display:flex;flex-direction:column;gap:3px">
              <div style="display:flex;gap:3px">
                <span style="width:24px;font-size:9px;color:var(--color-text-quaternary);line-height:12px">Mon</span>
                <div style="display:grid;grid-template-columns:repeat(13,1fr);gap:3px;flex:1">
                  <div class="heatmap-cell level-2" style="height:12px"></div><div class="heatmap-cell level-4" style="height:12px"></div><div class="heatmap-cell level-1" style="height:12px"></div><div class="heatmap-cell level-3" style="height:12px"></div><div class="heatmap-cell" style="height:12px;background:var(--color-bg-active)"></div><div class="heatmap-cell level-4" style="height:12px"></div><div class="heatmap-cell level-2" style="height:12px"></div><div class="heatmap-cell level-3" style="height:12px"></div><div class="heatmap-cell level-1" style="height:12px"></div><div class="heatmap-cell level-4" style="height:12px"></div><div class="heatmap-cell level-2" style="height:12px"></div><div class="heatmap-cell level-3" style="height:12px"></div><div class="heatmap-cell level-4" style="height:12px"></div>
                </div>
              </div>
              <div style="display:flex;gap:3px">
                <span style="width:24px;font-size:9px;color:var(--color-text-quaternary);line-height:12px">Wed</span>
                <div style="display:grid;grid-template-columns:repeat(13,1fr);gap:3px;flex:1">
                  <div class="heatmap-cell level-3" style="height:12px"></div><div class="heatmap-cell level-2" style="height:12px"></div><div class="heatmap-cell level-4" style="height:12px"></div><div class="heatmap-cell level-1" style="height:12px"></div><div class="heatmap-cell level-3" style="height:12px"></div><div class="heatmap-cell level-2" style="height:12px"></div><div class="heatmap-cell" style="height:12px;background:var(--color-bg-active)"></div><div class="heatmap-cell level-4" style="height:12px"></div><div class="heatmap-cell level-3" style="height:12px"></div><div class="heatmap-cell level-2" style="height:12px"></div><div class="heatmap-cell level-1" style="height:12px"></div><div class="heatmap-cell level-4" style="height:12px"></div><div class="heatmap-cell level-3" style="height:12px"></div>
                </div>
              </div>
              <div style="display:flex;gap:3px">
                <span style="width:24px;font-size:9px;color:var(--color-text-quaternary);line-height:12px">Fri</span>
                <div style="display:grid;grid-template-columns:repeat(13,1fr);gap:3px;flex:1">
                  <div class="heatmap-cell level-1" style="height:12px"></div><div class="heatmap-cell level-3" style="height:12px"></div><div class="heatmap-cell level-2" style="height:12px"></div><div class="heatmap-cell level-4" style="height:12px"></div><div class="heatmap-cell level-2" style="height:12px"></div><div class="heatmap-cell level-1" style="height:12px"></div><div class="heatmap-cell level-3" style="height:12px"></div><div class="heatmap-cell" style="height:12px;background:var(--color-bg-active)"></div><div class="heatmap-cell level-4" style="height:12px"></div><div class="heatmap-cell level-3" style="height:12px"></div><div class="heatmap-cell level-4" style="height:12px"></div><div class="heatmap-cell level-2" style="height:12px"></div><div class="heatmap-cell level-4" style="height:12px"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- PERFORMANCE KANBAN -->
      <div id="perf-view-kanban" style="display:none">
        <div style="margin-bottom:var(--space-4)">
          <div class="stat-grid" style="grid-template-columns:repeat(4,1fr);margin-bottom:var(--space-5)">
            <div class="stat-card" style="padding:var(--space-4)">
              <div class="stat-label">Exceeded</div>
              <div class="stat-value" style="color:var(--color-success)">3</div>
              <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:2px">KPIs above target</div>
            </div>
            <div class="stat-card" style="padding:var(--space-4)">
              <div class="stat-label">On Track</div>
              <div class="stat-value" style="color:var(--color-info)">4</div>
              <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:2px">KPIs meeting target</div>
            </div>
            <div class="stat-card" style="padding:var(--space-4)">
              <div class="stat-label">At Risk</div>
              <div class="stat-value" style="color:var(--color-warning)">2</div>
              <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:2px">Need attention</div>
            </div>
            <div class="stat-card" style="padding:var(--space-4)">
              <div class="stat-label">Behind</div>
              <div class="stat-value" style="color:var(--color-danger)">1</div>
              <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:2px">Below target</div>
            </div>
          </div>
        </div>
        <div class="perf-kanban">
          <!-- Exceeded -->
          <div class="perf-kanban-col">
            <div class="perf-kanban-col-header">
              <span style="font-size:var(--text-sm);font-weight:600;color:var(--color-success)">🏆 Exceeded</span>
              <span class="kanban-col-count">3</span>
            </div>
            <div class="perf-kanban-col-body">
              <div class="perf-kanban-card" style="border-left:2px solid var(--color-success)">
                <div style="display:flex;justify-content:space-between;align-items:flex-start;margin-bottom:var(--space-2)">
                  <span style="font-size:var(--text-sm);font-weight:600">Safety Compliance</span>
                  <span class="tag tag-green">92/90</span>
                </div>
                <div class="progress-bar" style="margin-bottom:var(--space-2)"><div class="progress-fill green" style="width:92%"></div></div>
                <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Target: 90 · Actual: 92 · +2.2%</div>
              </div>
              <div class="perf-kanban-card" style="border-left:2px solid var(--color-success)">
                <div style="display:flex;justify-content:space-between;align-items:flex-start;margin-bottom:var(--space-2)">
                  <span style="font-size:var(--text-sm);font-weight:600">Review Quality</span>
                  <span class="tag tag-green">96/90</span>
                </div>
                <div class="progress-bar" style="margin-bottom:var(--space-2)"><div class="progress-fill green" style="width:96%"></div></div>
                <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Target: 90 · Actual: 96 · +6.7%</div>
              </div>
              <div class="perf-kanban-card" style="border-left:2px solid var(--color-success)">
                <div style="display:flex;justify-content:space-between;align-items:flex-start;margin-bottom:var(--space-2)">
                  <span style="font-size:var(--text-sm);font-weight:600">Team Collaboration</span>
                  <span class="tag tag-green">95/88</span>
                </div>
                <div class="progress-bar" style="margin-bottom:var(--space-2)"><div class="progress-fill green" style="width:95%"></div></div>
                <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Target: 88 · Actual: 95 · +8%</div>
              </div>
            </div>
          </div>
          <!-- On Track -->
          <div class="perf-kanban-col">
            <div class="perf-kanban-col-header">
              <span style="font-size:var(--text-sm);font-weight:600;color:var(--color-info)">✅ On Track</span>
              <span class="kanban-col-count">4</span>
            </div>
            <div class="perf-kanban-col-body">
              <div class="perf-kanban-card" style="border-left:2px solid var(--color-info)">
                <div style="display:flex;justify-content:space-between;align-items:flex-start;margin-bottom:var(--space-2)">
                  <span style="font-size:var(--text-sm);font-weight:600">Task Completion</span>
                  <span class="tag tag-blue">87/85</span>
                </div>
                <div class="progress-bar" style="margin-bottom:var(--space-2)"><div class="progress-fill blue" style="width:87%"></div></div>
                <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Target: 85% · Actual: 87% · 21/24 tasks</div>
              </div>
              <div class="perf-kanban-card" style="border-left:2px solid var(--color-info)">
                <div style="display:flex;justify-content:space-between;align-items:flex-start;margin-bottom:var(--space-2)">
                  <span style="font-size:var(--text-sm);font-weight:600">Documentation</span>
                  <span class="tag tag-blue">82/80</span>
                </div>
                <div class="progress-bar" style="margin-bottom:var(--space-2)"><div class="progress-fill blue" style="width:82%"></div></div>
                <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Target: 80 · Actual: 82 · On schedule</div>
              </div>
              <div class="perf-kanban-card" style="border-left:2px solid var(--color-info)">
                <div style="display:flex;justify-content:space-between;align-items:flex-start;margin-bottom:var(--space-2)">
                  <span style="font-size:var(--text-sm);font-weight:600">Cross-team Support</span>
                  <span class="tag tag-blue">85/82</span>
                </div>
                <div class="progress-bar" style="margin-bottom:var(--space-2)"><div class="progress-fill blue" style="width:85%"></div></div>
                <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Target: 82 · Actual: 85</div>
              </div>
              <div class="perf-kanban-card" style="border-left:2px solid var(--color-info)">
                <div style="display:flex;justify-content:space-between;align-items:flex-start;margin-bottom:var(--space-2)">
                  <span style="font-size:var(--text-sm);font-weight:600">Technical Skills</span>
                  <span class="tag tag-blue">88/85</span>
                </div>
                <div class="progress-bar" style="margin-bottom:var(--space-2)"><div class="progress-fill blue" style="width:88%"></div></div>
                <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Target: 85 · Actual: 88</div>
              </div>
            </div>
          </div>
          <!-- At Risk -->
          <div class="perf-kanban-col">
            <div class="perf-kanban-col-header">
              <span style="font-size:var(--text-sm);font-weight:600;color:var(--color-warning)">⚠ At Risk</span>
              <span class="kanban-col-count">2</span>
            </div>
            <div class="perf-kanban-col-body">
              <div class="perf-kanban-card" style="border-left:2px solid var(--color-warning)">
                <div style="display:flex;justify-content:space-between;align-items:flex-start;margin-bottom:var(--space-2)">
                  <span style="font-size:var(--text-sm);font-weight:600">Patent Output</span>
                  <span class="tag tag-orange">3/4</span>
                </div>
                <div class="progress-bar" style="margin-bottom:var(--space-2)"><div class="progress-fill orange" style="width:75%"></div></div>
                <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Target: 4/yr · Actual: 3 · Need 1 more</div>
              </div>
              <div class="perf-kanban-card" style="border-left:2px solid var(--color-warning)">
                <div style="display:flex;justify-content:space-between;align-items:flex-start;margin-bottom:var(--space-2)">
                  <span style="font-size:var(--text-sm);font-weight:600">On-time Delivery</span>
                  <span class="tag tag-orange">78/85</span>
                </div>
                <div class="progress-bar" style="margin-bottom:var(--space-2)"><div class="progress-fill orange" style="width:78%"></div></div>
                <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Target: 85% · Actual: 78% · SR delays</div>
              </div>
            </div>
          </div>
          <!-- Behind -->
          <div class="perf-kanban-col">
            <div class="perf-kanban-col-header">
              <span style="font-size:var(--text-sm);font-weight:600;color:var(--color-danger)">🔴 Behind</span>
              <span class="kanban-col-count">1</span>
            </div>
            <div class="perf-kanban-col-body">
              <div class="perf-kanban-card" style="border-left:2px solid var(--color-danger)">
                <div style="display:flex;justify-content:space-between;align-items:flex-start;margin-bottom:var(--space-2)">
                  <span style="font-size:var(--text-sm);font-weight:600">Safety Review Rate</span>
                  <span class="tag tag-red">60/80</span>
                </div>
                <div class="progress-bar" style="margin-bottom:var(--space-2)"><div class="progress-fill red" style="width:60%"></div></div>
                <div style="font-size:var(--text-xs);color:var(--color-danger);margin-bottom:var(--space-2)">SR-001 overdue — impacting score</div>
                <button class="btn btn-sm btn-danger" style="width:100%" onclick="showPage('safety')">Action Required</button>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- PERFORMANCE GOALS -->
      <div id="perf-view-goals" style="display:none">
        <div class="card" style="margin-bottom:var(--space-5)">
          <div class="card-header">
            <span class="card-title">Q1 2024 Goals</span>
            <span class="tag tag-blue">6 Active Goals</span>
          </div>
          <div style="display:flex;flex-direction:column">
            <div class="settings-item">
              <div class="settings-item-left" style="flex:1">
                <span class="settings-item-title">Complete BMS Safety Certification Phase 2</span>
                <span class="settings-item-desc">Project PRJ-001 · Safety Engineering · Due Mar 31</span>
                <div class="progress-bar" style="width:200px;margin-top:var(--space-2)"><div class="progress-fill purple" style="width:65%"></div></div>
              </div>
              <span class="tag tag-orange">65%</span>
            </div>
            <div class="settings-item">
              <div class="settings-item-left" style="flex:1">
                <span class="settings-item-title">Submit 1 additional patent application</span>
                <span class="settings-item-desc">Innovation · AI-driven battery degradation prediction · Due Mar 15</span>
                <div class="progress-bar" style="width:200px;margin-top:var(--space-2)"><div class="progress-fill orange" style="width:40%"></div></div>
              </div>
              <span class="tag tag-orange">40%</span>
            </div>
            <div class="settings-item">
              <div class="settings-item-left" style="flex:1">
                <span class="settings-item-title">Achieve 90%+ task on-time completion rate</span>
                <span class="settings-item-desc">Performance KPI · Current: 87% · Gap: 3%</span>
                <div class="progress-bar" style="width:200px;margin-top:var(--space-2)"><div class="progress-fill blue" style="width:87%"></div></div>
              </div>
              <span class="tag tag-blue">87%</span>
            </div>
            <div class="settings-item">
              <div class="settings-item-left" style="flex:1">
                <span class="settings-item-title">Complete thermal runaway simulation model</span>
                <span class="settings-item-desc">TSK-019 · BMS Safety Certification · Due Jan 18</span>
                <div class="progress-bar" style="width:200px;margin-top:var(--space-2)"><div class="progress-fill red" style="width:65%"></div></div>
              </div>
              <span class="tag tag-red">Urgent</span>
            </div>
            <div class="settings-item" style="border-bottom:none">
              <div class="settings-item-left" style="flex:1">
                <span class="settings-item-title">Mentor 2 junior engineers on safety protocols</span>
                <span class="settings-item-desc">Team development · Li Gong, Wang Lei · Ongoing</span>
                <div class="progress-bar" style="width:200px;margin-top:var(--space-2)"><div class="progress-fill green" style="width:50%"></div></div>
              </div>
              <span class="tag tag-default">50%</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- ============================================================
     PAGE 6 — PATENT / IP
     ============================================================ -->
<div class="page-section" id="page-patent">
  <div class="main-content">
    <header class="topbar">
      <div class="topbar-breadcrumb">Workspace <span class="breadcrumb-sep">/</span> <span>Patent / IP</span></div>
      <div class="topbar-actions">
        <button class="btn btn-primary">
          <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
          New Disclosure
        </button>
      </div>
    </header>
    <div class="content-area">
      <div class="page-header">
        <div class="page-header-top">
          <div>
            <h1 class="page-title">Patent / IP Management</h1>
            <p class="page-subtitle">Track patent applications, disclosures, and IP portfolio.</p>
          </div>
          <div class="view-switcher">
            <button class="view-switcher-btn active">Cards</button>
            <button class="view-switcher-btn">Table</button>
          </div>
        </div>
      </div>

      <div class="stat-grid" style="margin-bottom:var(--space-6)">
        <div class="stat-card"><div class="stat-label">Total Patents</div><div class="stat-value">12</div><div class="stat-change positive">Lifetime portfolio</div></div>
        <div class="stat-card"><div class="stat-label">In Progress</div><div class="stat-value">3</div><div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:var(--space-1)">Active applications</div></div>
        <div class="stat-card"><div class="stat-label">Granted (2023)</div><div class="stat-value">2</div><div class="stat-change positive">+1 vs 2022</div></div>
        <div class="stat-card"><div class="stat-label">Annual Target</div><div class="stat-value">4</div><div style="margin-top:var(--space-2)"><div class="progress-bar"><div class="progress-fill purple" style="width:75%"></div></div><div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:2px">3/4 submitted</div></div></div>
      </div>

      <div class="three-col" style="margin-bottom:var(--space-6)">
        <div class="doc-card">
          <div class="doc-card-type"><span class="tag tag-blue">Invention</span><span style="color:var(--color-text-quaternary)">PAT-2024-001</span></div>
          <div class="doc-card-title">Adaptive Thermal Runaway Early Warning System Using Multi-dimensional Feature Fusion</div>
          <div class="doc-card-desc">Machine learning approach combining voltage, temperature, and impedance signals for early detection.</div>
          <div class="doc-card-footer">
            <div class="avatar-group"><div class="avatar">ZG</div><div class="avatar blue">LG</div></div>
            <span class="tag tag-orange">Under Review</span>
          </div>
        </div>
        <div class="doc-card">
          <div class="doc-card-type"><span class="tag tag-purple">Algorithm</span><span style="color:var(--color-text-quaternary)">PAT-2024-002</span></div>
          <div class="doc-card-title">Impedance-Based State of Health Estimation with Real-Time Compensation Algorithm</div>
          <div class="doc-card-desc">Novel SoH estimation method with temperature compensation for Li-ion battery packs in EVs.</div>
          <div class="doc-card-footer">
            <div class="avatar-group"><div class="avatar green">WL</div><div class="avatar">ZG</div></div>
            <span class="tag tag-blue">Filed</span>
          </div>
        </div>
        <div class="doc-card">
          <div class="doc-card-type"><span class="tag tag-green">System Design</span><span style="color:var(--color-text-quaternary)">PAT-2024-003</span></div>
          <div class="doc-card-title">Self-Healing BMS Architecture with Redundant Safety Monitoring Nodes</div>
          <div class="doc-card-desc">Fault-tolerant BMS design with automatic failover and redundant sensing for functional safety.</div>
          <div class="doc-card-footer">
            <div class="avatar-group"><div class="avatar">ZG</div></div>
            <span class="tag tag-default">Draft</span>
          </div>
        </div>
      </div>

      <div class="card">
        <div class="card-header"><span class="card-title">Patent Pipeline</span></div>
        <div class="card-body" style="padding:0">
          <table class="data-table">
            <thead>
              <tr><th>ID</th><th>Title</th><th>Inventors</th><th>Filed</th><th>Stage</th><th>Status</th></tr>
            </thead>
            <tbody>
              <tr>
                <td class="cell-id">PAT-2024-001</td>
                <td class="cell-primary">Adaptive Thermal Runaway Early Warning</td>
                <td style="font-size:var(--text-xs)">Zhang Gong, Li Gong</td>
                <td style="font-size:var(--text-xs);color:var(--color-text-quaternary)">2024-01-08</td>
                <td style="font-size:var(--text-xs)">Substantive Examination</td>
                <td><span class="tag tag-orange">Under Review</span></td>
              </tr>
              <tr>
                <td class="cell-id">PAT-2024-002</td>
                <td class="cell-primary">Impedance-Based SoH Estimation</td>
                <td style="font-size:var(--text-xs)">Wang Lei, Zhang Gong</td>
                <td style="font-size:var(--text-xs);color:var(--color-text-quaternary)">2024-01-03</td>
                <td style="font-size:var(--text-xs)">Formal Examination</td>
                <td><span class="tag tag-blue">Filed</span></td>
              </tr>
              <tr>
                <td class="cell-id">PAT-2024-003</td>
                <td class="cell-primary">Self-Healing BMS Architecture</td>
                <td style="font-size:var(--text-xs)">Zhang Gong</td>
                <td style="font-size:var(--text-xs);color:var(--color-text-quaternary)">—</td>
                <td style="font-size:var(--text-xs)">Internal Review</td>
                <td><span class="tag tag-default">Draft</span></td>
              </tr>
              <tr>
                <td class="cell-id">PAT-2023-008</td>
                <td class="cell-primary">Multi-Cell Balancing Control Method</td>
                <td style="font-size:var(--text-xs)">Zhang Gong, Chen Ke</td>
                <td style="font-size:var(--text-xs);color:var(--color-text-quaternary)">2023-06-15</td>
                <td style="font-size:var(--text-xs)">Grant</td>
                <td><span class="tag tag-green">Granted</span></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- ============================================================
     PAGE 7 — REPORT CENTER
     ============================================================ -->
<div class="page-section" id="page-reports">
  <div class="main-content">
    <header class="topbar">
      <div class="topbar-breadcrumb">Intelligence <span class="breadcrumb-sep">/</span> <span>Report Center</span></div>
      <div class="topbar-actions"></div>
    </header>

    <div class="content-area">
      <div class="page-header">
        <div class="page-header-top">
          <div>
            <h1 class="page-title">Report Center</h1>
            <p class="page-subtitle">Generate, manage, and share reports. AI-powered auto-generation with one click.</p>
          </div>
        </div>
      </div>

      <!-- Quick Generate Section -->
      <div style="margin-bottom:var(--space-8)">
        <h2 style="font-size:var(--text-lg);font-weight:600;margin-bottom:var(--space-4)">Quick Generate</h2>
        <div class="three-col">
          <!-- Personal Monthly Report -->
          <div class="card" style="cursor:pointer;transition:all var(--transition-base)">
            <div class="card-body" style="padding:var(--space-6);text-align:center">
              <div style="width:48px;height:48px;border-radius:var(--radius-lg);background:var(--color-accent-subtle);display:flex;align-items:center;justify-content:center;margin:0 auto var(--space-4)">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="var(--color-accent)" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
              </div>
              <div style="font-size:var(--text-md);font-weight:600;margin-bottom:var(--space-2)">Personal Monthly Report</div>
              <div style="font-size:var(--text-xs);color:var(--color-text-tertiary);margin-bottom:var(--space-4);line-height:1.5">Auto-generated from tasks, patents, and performance data. Includes completion rate, key achievements, and next month's plan.</div>
              <div style="display:flex;flex-wrap:wrap;gap:var(--space-1);justify-content:center;margin-bottom:var(--space-4)">
                <span class="tag tag-default">Task Completion</span>
                <span class="tag tag-default">Patent Output</span>
                <span class="tag tag-default">Performance</span>
              </div>
              <button class="btn btn-primary" style="width:100%">Generate PDF</button>
            </div>
          </div>

          <!-- Department Monthly Report -->
          <div class="card" style="cursor:pointer">
            <div class="card-body" style="padding:var(--space-6);text-align:center">
              <div style="width:48px;height:48px;border-radius:var(--radius-lg);background:var(--color-info-subtle);display:flex;align-items:center;justify-content:center;margin:0 auto var(--space-4)">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="var(--color-info)" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
              </div>
              <div style="font-size:var(--text-md);font-weight:600;margin-bottom:var(--space-2)">Department Monthly Report</div>
              <div style="font-size:var(--text-xs);color:var(--color-text-tertiary);margin-bottom:var(--space-4);line-height:1.5">Aggregated team metrics including project progress, team performance rankings, issues tracking, and resource allocation.</div>
              <div style="display:flex;flex-wrap:wrap;gap:var(--space-1);justify-content:center;margin-bottom:var(--space-4)">
                <span class="tag tag-default">Team Performance</span>
                <span class="tag tag-default">Project Progress</span>
                <span class="tag tag-default">Issues</span>
              </div>
              <button class="btn btn-primary" style="width:100%;background:var(--color-info)">Generate PDF</button>
            </div>
          </div>

          <!-- Safety Review Summary -->
          <div class="card" style="cursor:pointer">
            <div class="card-body" style="padding:var(--space-6);text-align:center">
              <div style="width:48px;height:48px;border-radius:var(--radius-lg);background:var(--color-warning-subtle);display:flex;align-items:center;justify-content:center;margin:0 auto var(--space-4)">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="var(--color-warning)" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
              </div>
              <div style="font-size:var(--text-md);font-weight:600;margin-bottom:var(--space-2)">Safety Review Summary</div>
              <div style="font-size:var(--text-xs);color:var(--color-text-tertiary);margin-bottom:var(--space-4);line-height:1.5">Comprehensive safety review report with risk matrix, NUDD status, issue tracking summary, and test validation results.</div>
              <div style="display:flex;flex-wrap:wrap;gap:var(--space-1);justify-content:center;margin-bottom:var(--space-4)">
                <span class="tag tag-default">Risk Summary</span>
                <span class="tag tag-default">Issue Tracking</span>
                <span class="tag tag-default">Conclusions</span>
              </div>
              <button class="btn btn-primary" style="width:100%;background:var(--color-warning)">Select Review & Generate</button>
            </div>
          </div>
        </div>
      </div>

      <!-- More Report Types -->
      <div style="margin-bottom:var(--space-8)">
        <div class="two-col">
          <div class="card" style="cursor:pointer">
            <div class="card-body" style="padding:var(--space-5);display:flex;align-items:center;gap:var(--space-4)">
              <div style="width:40px;height:40px;border-radius:var(--radius-md);background:var(--color-success-subtle);display:flex;align-items:center;justify-content:center;flex-shrink:0">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="var(--color-success)" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/></svg>
              </div>
              <div style="flex:1">
                <div style="font-size:var(--text-md);font-weight:600">Annual Performance Summary</div>
                <div style="font-size:var(--text-xs);color:var(--color-text-tertiary)">Yearly trends, rankings, achievements comparison</div>
              </div>
              <button class="btn btn-sm btn-secondary">Generate</button>
            </div>
          </div>
          <div class="card" style="cursor:pointer">
            <div class="card-body" style="padding:var(--space-5);display:flex;align-items:center;gap:var(--space-4)">
              <div style="width:40px;height:40px;border-radius:var(--radius-md);background:var(--color-danger-subtle);display:flex;align-items:center;justify-content:center;flex-shrink:0">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="var(--color-danger)" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"/><line x1="12" y1="9" x2="12" y2="13"/><line x1="12" y1="17" x2="12.01" y2="17"/></svg>
              </div>
              <div style="flex:1">
                <div style="font-size:var(--text-md);font-weight:600">Issue Tracking Report</div>
                <div style="font-size:var(--text-xs);color:var(--color-text-tertiary)">Issue statistics, categories, closure rate analysis</div>
              </div>
              <button class="btn btn-sm btn-secondary">Generate</button>
            </div>
          </div>
        </div>
      </div>

      <!-- Report History -->
      <div>
        <h2 style="font-size:var(--text-lg);font-weight:600;margin-bottom:var(--space-4)">Report History</h2>
        <div class="card">
          <div class="card-body" style="padding:0;overflow-x:auto">
            <table class="data-table">
              <thead>
                <tr>
                  <th>Report Name</th>
                  <th>Type</th>
                  <th>Generated By</th>
                  <th>Date</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="cell-primary">January 2024 Personal Monthly Report</td>
                  <td><span class="tag tag-purple">Personal</span></td>
                  <td>
                    <div style="display:flex;align-items:center;gap:var(--space-2)">
                      <div class="avatar">ZG</div>
                      <span>Zhang Gong</span>
                    </div>
                  </td>
                  <td>Jan 05, 2024</td>
                  <td>
                    <div class="btn-group">
                      <button class="btn btn-sm btn-ghost">Preview</button>
                      <button class="btn btn-sm btn-ghost">Download</button>
                      <button class="btn btn-sm btn-ghost">Share</button>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td class="cell-primary">December 2023 Department Report</td>
                  <td><span class="tag tag-blue">Department</span></td>
                  <td>
                    <div style="display:flex;align-items:center;gap:var(--space-2)">
                      <div class="avatar green">AM</div>
                      <span>All Members</span>
                    </div>
                  </td>
                  <td>Jan 03, 2024</td>
                  <td>
                    <div class="btn-group">
                      <button class="btn btn-sm btn-ghost">Preview</button>
                      <button class="btn btn-sm btn-ghost">Download</button>
                      <button class="btn btn-sm btn-ghost">Share</button>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td class="cell-primary">SR-001 Safety Review Report</td>
                  <td><span class="tag tag-orange">Safety</span></td>
                  <td>
                    <div style="display:flex;align-items:center;gap:var(--space-2)">
                      <div class="avatar">ZG</div>
                      <span>Zhang Gong</span>
                    </div>
                  </td>
                  <td>Dec 28, 2023</td>
                  <td>
                    <div class="btn-group">
                      <button class="btn btn-sm btn-ghost">Preview</button>
                      <button class="btn btn-sm btn-ghost">Download</button>
                      <button class="btn btn-sm btn-ghost">Share</button>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:var(--space-3);padding:var(--space-2) 0">
          Watermark: All reports auto-include "BST Internal / Generated by / Timestamp" watermark.
        </div>
      </div>
    </div>
  </div>
</div>


<!-- ============================================================
     PAGE 8 — AI ASSISTANT
     ============================================================ -->
<div class="page-section" id="page-ai">
  <div class="main-content" style="display:flex;flex-direction:column;height:100%">
    <header class="topbar">
      <div class="topbar-breadcrumb">Workspace <span class="breadcrumb-sep">/</span> <span>AI Assistant</span></div>
      <div class="topbar-actions">
        <span class="tag tag-green">● Online</span>
        <button class="btn btn-secondary btn-sm">New Chat</button>
      </div>
    </header>
    <div style="flex:1;display:flex;flex-direction:column;overflow:hidden">
      <div style="flex:1;overflow-y:auto;padding:var(--space-8)" id="aiChatFull">
        <div class="ai-message assistant">
          <div class="ai-avatar assistant">AI</div>
          <div class="ai-bubble">
            Hello Zhang Gong! I'm your BST AI assistant. I've loaded your workspace context including 24 tasks, 6 projects, 3 safety reviews, and 3 patent applications. How can I help you today?
          </div>
        </div>
        <div class="ai-message user">
          <div class="ai-avatar human">ZG</div>
          <div class="ai-bubble">What are my most critical items today?</div>
        </div>
        <div class="ai-message assistant">
          <div class="ai-avatar assistant">AI</div>
          <div class="ai-bubble">
            <div style="margin-bottom:var(--space-3);font-weight:600">🔴 Critical Items for Jan 15, 2024</div>
            <div style="display:flex;flex-direction:column;gap:var(--space-2)">
              <div style="background:var(--color-danger-subtle);border-radius:var(--radius-md);padding:var(--space-2) var(--space-3)">
                <strong>1. SR-001 Overdue (3 days)</strong> — Thermal runaway risk assessment. Immediate action required.
              </div>
              <div style="background:var(--color-warning-subtle);border-radius:var(--radius-md);padding:var(--space-2) var(--space-3)">
                <strong>2. TSK-019 Due Jan 18</strong> — Thermal simulation model validation at 65%.
              </div>
              <div style="background:var(--color-accent-subtle);border-radius:var(--radius-md);padding:var(--space-2) var(--space-3)">
                <strong>3. Patent target</strong> — 1 more submission needed to hit 4/yr annual goal.
              </div>
            </div>
          </div>
        </div>
        <div class="ai-message user">
          <div class="ai-avatar human">ZG</div>
          <div class="ai-bubble">Create a task for SR-001 — "Request vendor thermal abuse test report" assigned to Li Gong, due Jan 16, linked to SR-001.</div>
        </div>
        <div class="ai-message assistant">
          <div class="ai-avatar assistant">AI</div>
          <div class="ai-bubble">
            <div style="margin-bottom:var(--space-3)">✅ Task created successfully:</div>
            <div style="background:var(--color-surface);border:1px solid var(--color-border);border-radius:var(--radius-md);padding:var(--space-3)">
              <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-2)">
                <span style="font-family:var(--font-mono);font-size:var(--text-xs);color:var(--color-text-quaternary)">TSK-025</span>
                <span class="tag tag-red">Urgent</span>
              </div>
              <div style="font-weight:500;margin-bottom:var(--space-2)">Request vendor thermal abuse test report</div>
              <div style="display:flex;gap:var(--space-4);font-size:var(--text-xs);color:var(--color-text-tertiary)">
                <span>👤 Li Gong</span><span>📅 Jan 16</span><span>🔗 SR-001</span>
              </div>
            </div>
            <div style="margin-top:var(--space-3);font-size:var(--text-xs);color:var(--color-text-tertiary)">Notification sent to Li Gong. Task linked to SR-001 safety review.</div>
          </div>
        </div>
      </div>
      <div class="ai-quick-actions">
        <button class="ai-quick-btn">Summarize my tasks</button>
        <button class="ai-quick-btn">Generate monthly report</button>
        <button class="ai-quick-btn">Analyze risk matrix</button>
        <button class="ai-quick-btn">Draft patent abstract</button>
        <button class="ai-quick-btn">Project status overview</button>
      </div>
      <div class="ai-input-bar">
        <textarea class="ai-input-field" placeholder="Ask BST AI anything... (Ctrl+Enter to send)" rows="1"></textarea>
        <button class="ai-send-btn">
          <svg viewBox="0 0 24 24"><line x1="22" y1="2" x2="11" y2="13"/><polygon points="22 2 15 22 11 13 2 9 22 2"/></svg>
        </button>
      </div>
    </div>
  </div>
</div>

<!-- ============================================================
     PAGE 9 — SETTINGS
     ============================================================ -->
<div class="page-section" id="page-settings">
  <div class="main-content">
    <header class="topbar">
      <div class="topbar-breadcrumb">System <span class="breadcrumb-sep">/</span> <span>Settings</span></div>
    </header>
    <div class="content-area">
      <div class="page-header">
        <div class="page-header-top">
          <div>
            <h1 class="page-title">Settings</h1>
            <p class="page-subtitle">Manage your account, preferences, team, and system configuration.</p>
          </div>
        </div>
      </div>

      <div style="display:grid;grid-template-columns:200px 1fr;gap:var(--space-8)">
        <div style="display:flex;flex-direction:column;gap:var(--space-1)">
          <div style="font-size:var(--text-xs);font-weight:600;color:var(--color-text-quaternary);text-transform:uppercase;letter-spacing:0.5px;padding:var(--space-2) 0">Account</div>
          <div class="bottom-nav-btn active" style="justify-content:flex-start">
            <svg viewBox="0 0 24 24"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>Profile
          </div>
          <div class="bottom-nav-btn" style="justify-content:flex-start">
            <svg viewBox="0 0 24 24"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>Security
          </div>
          <div class="bottom-nav-btn" style="justify-content:flex-start">
            <svg viewBox="0 0 24 24"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/><path d="M13.73 21a2 2 0 0 1-3.46 0"/></svg>Notifications
          </div>
          <div style="font-size:var(--text-xs);font-weight:600;color:var(--color-text-quaternary);text-transform:uppercase;letter-spacing:0.5px;padding:var(--space-2) 0;margin-top:var(--space-2)">Workspace</div>
          <div class="bottom-nav-btn" style="justify-content:flex-start">
            <svg viewBox="0 0 24 24"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>Team
          </div>
          <div class="bottom-nav-btn" style="justify-content:flex-start">
            <svg viewBox="0 0 24 24"><polyline points="22 12 18 12 15 21 9 3 6 12 2 12"/></svg>Workflow
          </div>
          <div class="bottom-nav-btn" style="justify-content:flex-start">
            <svg viewBox="0 0 24 24"><rect x="2" y="3" width="20" height="14" rx="2"/><line x1="8" y1="21" x2="16" y2="21"/><line x1="12" y1="17" x2="12" y2="21"/></svg>Integrations
          </div>
          <div style="font-size:var(--text-xs);font-weight:600;color:var(--color-text-quaternary);text-transform:uppercase;letter-spacing:0.5px;padding:var(--space-2) 0;margin-top:var(--space-2)">System</div>
          <div class="bottom-nav-btn" style="justify-content:flex-start">
            <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="5"/><line x1="12" y1="1" x2="12" y2="3"/><line x1="12" y1="21" x2="12" y2="23"/><line x1="4.22" y1="4.22" x2="5.64" y2="5.64"/><line x1="18.36" y1="18.36" x2="19.78" y2="19.78"/><line x1="1" y1="12" x2="3" y2="12"/><line x1="21" y1="12" x2="23" y2="12"/></svg>Appearance
          </div>
          <div class="bottom-nav-btn" style="justify-content:flex-start">
            <svg viewBox="0 0 24 24"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>Permissions
          </div>
        </div>

        <div>
          <h2 style="font-size:var(--text-xl);font-weight:600;margin-bottom:var(--space-6)">Profile Settings</h2>
          <div class="card" style="margin-bottom:var(--space-6)">
            <div class="card-body" style="padding:var(--space-6)">
              <div style="display:flex;align-items:center;gap:var(--space-5);margin-bottom:var(--space-6)">
                <div style="width:72px;height:72px;border-radius:var(--radius-full);background:linear-gradient(135deg,#6366F1,var(--color-accent));display:flex;align-items:center;justify-content:center;font-size:var(--text-2xl);font-weight:700;color:white">ZG</div>
                <div>
                  <div style="font-size:var(--text-xl);font-weight:600;margin-bottom:var(--space-1)">Zhang Gong</div>
                  <div style="font-size:var(--text-sm);color:var(--color-text-tertiary);margin-bottom:var(--space-2)">Senior Battery Safety Engineer</div>
                  <div style="display:flex;gap:var(--space-2)">
                    <span class="tag tag-purple">Safety Team</span>
                    <span class="tag tag-blue">BMS Group</span>
                  </div>
                </div>
                <button class="btn btn-secondary" style="margin-left:auto">Upload Photo</button>
              </div>
              <div style="display:grid;grid-template-columns:1fr 1fr;gap:var(--space-5)">
                <div class="form-group"><label class="form-label">Full Name</label><input type="text" class="form-input" value="Zhang Gong"></div>
                <div class="form-group"><label class="form-label">Employee ID</label><input type="text" class="form-input" value="EMP-2021-0087" disabled style="opacity:0.5"></div>
                <div class="form-group"><label class="form-label">Email</label><input type="email" class="form-input" value="zhang.gong@company.com"></div>
                <div class="form-group"><label class="form-label">Phone</label><input type="tel" class="form-input" value="+86 138 xxxx xxxx"></div>
                <div class="form-group">
                  <label class="form-label">Department</label>
                  <select class="form-input form-select"><option selected>Battery Safety Engineering</option><option>BMS Development</option><option>Testing & Validation</option></select>
                </div>
                <div class="form-group">
                  <label class="form-label">Role</label>
                  <select class="form-input form-select"><option selected>Senior Engineer</option><option>Team Lead</option><option>Manager</option></select>
                </div>
              </div>
            </div>
          </div>

          <h2 style="font-size:var(--text-xl);font-weight:600;margin-bottom:var(--space-4)">Notification Preferences</h2>
          <div class="card" style="margin-bottom:var(--space-6)">
            <div style="display:flex;flex-direction:column">
              <div class="settings-item"><div class="settings-item-left"><span class="settings-item-title">Task Assignments</span><span class="settings-item-desc">Notifications when tasks are assigned to you</span></div><div class="toggle active"><div class="toggle-knob"></div></div></div>
              <div class="settings-item"><div class="settings-item-left"><span class="settings-item-title">Safety Review Alerts</span><span class="settings-item-desc">Critical alerts for safety reviews requiring your attention</span></div><div class="toggle active"><div class="toggle-knob"></div></div></div>
              <div class="settings-item"><div class="settings-item-left"><span class="settings-item-title">Project Milestones</span><span class="settings-item-desc">Notify when milestones are approaching or completed</span></div><div class="toggle active"><div class="toggle-knob"></div></div></div>
              <div class="settings-item"><div class="settings-item-left"><span class="settings-item-title">Performance Updates</span><span class="settings-item-desc">Monthly performance score notifications</span></div><div class="toggle"><div class="toggle-knob"></div></div></div>
              <div class="settings-item" style="border-bottom:none"><div class="settings-item-left"><span class="settings-item-title">Patent Status Changes</span><span class="settings-item-desc">Updates on patent application status</span></div><div class="toggle active"><div class="toggle-knob"></div></div></div>
            </div>
          </div>

          <h2 style="font-size:var(--text-xl);font-weight:600;margin-bottom:var(--space-4)">Appearance</h2>
          <div class="card" style="margin-bottom:var(--space-6)">
            <div class="card-body" style="padding:var(--space-6)">
              <div class="form-group">
                <label class="form-label">Theme</label>
                <div style="display:flex;gap:var(--space-3)">
                  <div id="themeDarkOption" style="flex:1;padding:var(--space-4);border:2px solid var(--color-accent);border-radius:var(--radius-lg);background:var(--color-bg);cursor:pointer;text-align:center" onclick="setTheme('dark')">
                    <div style="width:100%;height:40px;border-radius:var(--radius-md);background:linear-gradient(135deg,#09090B,#18181B);margin-bottom:var(--space-2);border:1px solid #27272A"></div>
                    <span style="font-size:var(--text-xs);font-weight:500;color:var(--color-accent-text)">Dark</span>
                  </div>
                  <div id="themeLightOption" style="flex:1;padding:var(--space-4);border:2px solid var(--color-border);border-radius:var(--radius-lg);background:var(--color-bg);cursor:pointer;text-align:center" onclick="setTheme('light')">
                    <div style="width:100%;height:40px;border-radius:var(--radius-md);background:linear-gradient(135deg,#FFFFFF,#F4F4F5);margin-bottom:var(--space-2);border:1px solid #E4E4E7"></div>
                    <span style="font-size:var(--text-xs);font-weight:500;color:var(--color-text-tertiary)">Light</span>
                  </div>
                  <div style="flex:1;padding:var(--space-4);border:2px solid var(--color-border);border-radius:var(--radius-lg);background:var(--color-bg);cursor:pointer;text-align:center">
                    <div style="width:100%;height:40px;border-radius:var(--radius-md);background:linear-gradient(135deg,#FFFFFF 50%,#09090B 50%);margin-bottom:var(--space-2);border:1px solid var(--color-border)"></div>
                    <span style="font-size:var(--text-xs);font-weight:500;color:var(--color-text-tertiary)">Auto</span>
                  </div>
                </div>
              </div>
              <div class="form-group" style="margin-top:var(--space-5)">
                <label class="form-label">Accent Color</label>
                <div style="display:flex;gap:var(--space-3)">
                  <div style="width:32px;height:32px;border-radius:var(--radius-full);background:#8B5CF6;cursor:pointer;border:3px solid white;box-shadow:0 0 0 2px #8B5CF6"></div>
                  <div style="width:32px;height:32px;border-radius:var(--radius-full);background:#3B82F6;cursor:pointer;border:3px solid transparent"></div>
                  <div style="width:32px;height:32px;border-radius:var(--radius-full);background:#22C55E;cursor:pointer;border:3px solid transparent"></div>
                  <div style="width:32px;height:32px;border-radius:var(--radius-full);background:#F59E0B;cursor:pointer;border:3px solid transparent"></div>
                  <div style="width:32px;height:32px;border-radius:var(--radius-full);background:#EF4444;cursor:pointer;border:3px solid transparent"></div>
                  <div style="width:32px;height:32px;border-radius:var(--radius-full);background:#EC4899;cursor:pointer;border:3px solid transparent"></div>
                </div>
              </div>
            </div>
          </div>

          <div style="display:flex;justify-content:flex-end;gap:var(--space-3)">
            <button class="btn btn-secondary">Cancel</button>
            <button class="btn btn-primary">Save Changes</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

</div><!-- end pages container -->

<!-- ============================================================
     NOTIFICATION PANEL
     ============================================================ -->
<div id="notificationPanel" style="display:none;position:fixed;inset:0;z-index:900;background:rgba(0,0,0,0.5);backdrop-filter:blur(4px)" onclick="if(event.target===this)this.style.display='none'">
  <div style="position:absolute;right:0;top:0;bottom:0;width:380px;background:var(--color-surface);border-left:1px solid var(--color-border);display:flex;flex-direction:column">
    <div style="padding:var(--space-5);border-bottom:1px solid var(--color-border);display:flex;align-items:center;justify-content:space-between">
      <span style="font-size:var(--text-md);font-weight:600">Notifications</span>
      <div style="display:flex;gap:var(--space-2)">
        <button class="btn btn-ghost btn-sm">Mark all read</button>
        <button class="btn btn-ghost btn-sm" onclick="document.getElementById('notificationPanel').style.display='none'">✕</button>
      </div>
    </div>
    <div style="flex:1;overflow-y:auto">
      <div class="notification-list">
        <div class="notification-item unread">
          <div class="notification-icon-wrap orange"><svg viewBox="0 0 24 24"><path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"/></svg></div>
          <div class="notification-body"><div class="notification-title-text">SR-001 is overdue by 3 days</div><div class="notification-desc">Thermal runaway risk assessment — action required</div></div>
          <div class="notification-time">15m</div>
        </div>
        <div class="notification-item unread">
          <div class="notification-icon-wrap green"><svg viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg></div>
          <div class="notification-body"><div class="notification-title-text">Li Gong completed TSK-016</div><div class="notification-desc">Cell testing data collation task marked complete</div></div>
          <div class="notification-time">1h</div>
        </div>
        <div class="notification-item">
          <div class="notification-icon-wrap purple"><svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/></svg></div>
          <div class="notification-body"><div class="notification-title-text">New patent disclosure submitted</div><div class="notification-desc">Wang Lei — Impedance-based thermal runaway detection</div></div>
          <div class="notification-time">3h</div>
        </div>
        <div class="notification-item">
          <div class="notification-icon-wrap blue"><svg viewBox="0 0 24 24"><line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/></svg></div>
          <div class="notification-body"><div class="notification-title-text">December performance report ready</div><div class="notification-desc">Overall score: 87 — review and download available</div></div>
          <div class="notification-time">2d</div>
        </div>
        <div class="notification-item">
          <div class="notification-icon-wrap orange"><svg viewBox="0 0 24 24"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg></div>
          <div class="notification-body"><div class="notification-title-text">TSK-019 due in 3 days</div><div class="notification-desc">Thermal runaway simulation model validation — Jan 18</div></div>
          <div class="notification-time">3d</div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- ============================================================
     COMMAND PALETTE (Ctrl+K)
     ============================================================ -->
<div id="commandPalette" style="display:none" class="modal-overlay" onclick="if(event.target===this)closePalette()">
  <div class="command-palette">
    <div class="command-input-wrapper">
      <svg viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
      <input class="command-input" placeholder="Search commands, pages, tasks..." autofocus id="commandInput">
      <kbd style="font-family:var(--font-sans);font-size:10px;padding:1px 6px;background:var(--color-bg-active);border:1px solid var(--color-border);border-radius:3px;color:var(--color-text-quaternary)">ESC</kbd>
    </div>
    <div class="command-results">
      <div class="command-group-label">Navigation</div>
      <div class="command-item" onclick="showPage('dashboard');closePalette()">
        <div class="command-item-icon"><svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg></div>
        <div class="command-item-text"><div class="command-item-label">Go to Dashboard</div><div class="command-item-desc">Overview & activity</div></div>
        <div class="command-item-shortcut"><kbd>G</kbd><kbd>D</kbd></div>
      </div>
      <div class="command-item" onclick="showPage('tasks');closePalette()">
        <div class="command-item-icon"><svg viewBox="0 0 24 24"><path d="M9 11l3 3L22 4"/><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/></svg></div>
        <div class="command-item-text"><div class="command-item-label">Go to Tasks</div><div class="command-item-desc">Task management kanban</div></div>
        <div class="command-item-shortcut"><kbd>G</kbd><kbd>T</kbd></div>
      </div>
      <div class="command-item" onclick="showPage('projects');closePalette()">
        <div class="command-item-icon"><svg viewBox="0 0 24 24"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg></div>
        <div class="command-item-text"><div class="command-item-label">Go to Projects</div><div class="command-item-desc">Project center & timelines</div></div>
        <div class="command-item-shortcut"><kbd>G</kbd><kbd>P</kbd></div>
      </div>
      <div class="command-item" onclick="showPage('safety');closePalette()">
        <div class="command-item-icon"><svg viewBox="0 0 24 24"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg></div>
        <div class="command-item-text"><div class="command-item-label">Go to Safety Review</div><div class="command-item-desc">Safety assessments & NUDD</div></div>
        <div class="command-item-shortcut"><kbd>G</kbd><kbd>S</kbd></div>
      </div>
      <div class="command-item" onclick="showPage('ai');closePalette()">
        <div class="command-item-icon"><svg viewBox="0 0 24 24"><rect x="2" y="2" width="20" height="20" rx="5"/><path d="M8 12h8M12 8v8"/></svg></div>
        <div class="command-item-text"><div class="command-item-label">Open AI Assistant</div><div class="command-item-desc">Chat with BST AI</div></div>
        <div class="command-item-shortcut"><kbd>G</kbd><kbd>A</kbd></div>
      </div>
      <div class="command-group-label">Actions</div>
      <div class="command-item">
        <div class="command-item-icon"><svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg></div>
        <div class="command-item-text"><div class="command-item-label">Create New Task</div><div class="command-item-desc">Add task to current project</div></div>
        <div class="command-item-shortcut"><kbd>Ctrl</kbd><kbd>N</kbd></div>
      </div>
      <div class="command-item">
        <div class="command-item-icon"><svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/></svg></div>
        <div class="command-item-text"><div class="command-item-label">Generate Report</div><div class="command-item-desc">Create performance or safety report</div></div>
        <div class="command-item-shortcut"><kbd>Ctrl</kbd><kbd>R</kbd></div>
      </div>
      <div class="command-item" onclick="toggleTheme();closePalette()">
        <div class="command-item-icon"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="5"/><line x1="12" y1="1" x2="12" y2="3"/><line x1="12" y1="21" x2="12" y2="23"/><line x1="4.22" y1="4.22" x2="5.64" y2="5.64"/><line x1="18.36" y1="18.36" x2="19.78" y2="19.78"/><line x1="1" y1="12" x2="3" y2="12"/><line x1="21" y1="12" x2="23" y2="12"/></svg></div>
        <div class="command-item-text"><div class="command-item-label">Toggle Theme</div><div class="command-item-desc">Switch between dark and light mode</div></div>
        <div class="command-item-shortcut"><kbd>Ctrl</kbd><kbd>Shift</kbd><kbd>T</kbd></div>
      </div>
      <div class="command-item" onclick="toggleAIMode();closePalette()">
        <div class="command-item-icon"><svg viewBox="0 0 24 24"><rect x="2" y="2" width="20" height="20" rx="5"/><path d="M8 12h8M12 8v8"/></svg></div>
        <div class="command-item-text"><div class="command-item-label">Toggle AI Mode</div><div class="command-item-desc">Switch dashboard to AI mode</div></div>
        <div class="command-item-shortcut"><kbd>Ctrl</kbd><kbd>Shift</kbd><kbd>A</kbd></div>
      </div>
    </div>
  </div>
</div>

</div><!-- end demo-wrapper -->

<!-- ============================================================
     JAVASCRIPT
     ============================================================ -->
<script>
// ============================================================
// PAGE NAVIGATION
// ============================================================
let currentPage = 'dashboard';

function showPage(pageId) {
  document.querySelectorAll('.page-section').forEach(s => s.classList.remove('active'));
  document.querySelectorAll('.bottom-nav-btn').forEach(b => b.classList.remove('active'));

  const page = document.getElementById('page-' + pageId);
  if (page) page.classList.add('active');

  const navBtns = document.querySelectorAll('.bottom-nav-btn');
  navBtns.forEach(btn => {
    if (btn.getAttribute('onclick') && btn.getAttribute('onclick').includes("'" + pageId + "'")) {
      btn.classList.add('active');
    }
  });

  currentPage = pageId;
  closePalette();
}

// ============================================================
// THEME TOGGLE
// ============================================================
let currentTheme = 'dark';

function setTheme(theme) {
  currentTheme = theme;
  document.documentElement.setAttribute('data-theme', theme);

  const icon = document.getElementById('themeIcon');
  const label = document.getElementById('themeLabel');

  if (theme === 'light') {
    icon.innerHTML = '<path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"/>';
    label.textContent = 'Dark';
  } else {
    icon.innerHTML = '<circle cx="12" cy="12" r="5"/><line x1="12" y1="1" x2="12" y2="3"/><line x1="12" y1="21" x2="12" y2="23"/><line x1="4.22" y1="4.22" x2="5.64" y2="5.64"/><line x1="18.36" y1="18.36" x2="19.78" y2="19.78"/><line x1="1" y1="12" x2="3" y2="12"/><line x1="21" y1="12" x2="23" y2="12"/><line x1="4.22" y1="19.78" x2="5.64" y2="18.36"/><line x1="18.36" y1="5.64" x2="19.78" y2="4.22"/>';
    label.textContent = 'Light';
  }

  // Update settings page theme options
  const darkOption = document.getElementById('themeDarkOption');
  const lightOption = document.getElementById('themeLightOption');
  if (darkOption && lightOption) {
    if (theme === 'dark') {
      darkOption.style.borderColor = 'var(--color-accent)';
      lightOption.style.borderColor = 'var(--color-border)';
      darkOption.querySelector('span').style.color = 'var(--color-accent-text)';
      lightOption.querySelector('span').style.color = 'var(--color-text-tertiary)';
    } else {
      lightOption.style.borderColor = 'var(--color-accent)';
      darkOption.style.borderColor = 'var(--color-border)';
      lightOption.querySelector('span').style.color = 'var(--color-accent-text)';
      darkOption.querySelector('span').style.color = 'var(--color-text-tertiary)';
    }
  }
}

function toggleTheme() {
  setTheme(currentTheme === 'dark' ? 'light' : 'dark');
}

// ============================================================
// AI MODE TOGGLE
// ============================================================
let aiModeActive = false;

function toggleAIMode() {
  aiModeActive = !aiModeActive;

  const normalDash = document.getElementById('normalDashboard');
  const aiDash = document.getElementById('aiDashboard');
  const aiToggle = document.getElementById('aiModeToggle');
  const dashBtn = document.getElementById('dashAIBtnLabel');
  const breadcrumb = document.getElementById('dashboardBreadcrumb');

  // Only switch if we're on dashboard, else navigate to dashboard first
  if (currentPage !== 'dashboard') {
    showPage('dashboard');
  }

  if (aiModeActive) {
    normalDash.style.display = 'none';
    aiDash.style.display = 'flex';
    aiToggle.classList.add('active');
    if (dashBtn) dashBtn.textContent = 'Exit AI Mode';
    if (breadcrumb) breadcrumb.textContent = 'AI Dashboard';
    // Trigger animation refresh
    const items = aiDash.querySelectorAll('.ai-gen-item');
    items.forEach(item => {
      item.style.animation = 'none';
      item.offsetHeight; // reflow
      item.style.animation = '';
    });
  } else {
    normalDash.style.display = 'block';
    aiDash.style.display = 'none';
    aiToggle.classList.remove('active');
    if (dashBtn) dashBtn.textContent = 'Enter AI Mode';
    if (breadcrumb) breadcrumb.textContent = 'Dashboard';
  }
}

// ============================================================
// AI CHAT — DASHBOARD
// ============================================================
const aiResponses = [
  "I've analyzed your request. Based on your current workspace data, here's what I recommend focusing on today.",
  "Great question! Looking at your project timeline and safety review status, I suggest prioritizing SR-001 before TSK-019.",
  "I can help with that. Your performance score of 92 is excellent — you're on track for a strong Q1.",
  "Based on the thermal data and simulation results, the runaway risk model shows a 15% improvement with the new parameters.",
  "I've found 3 relevant patent databases with similar claims. Your invention appears to have strong novelty in the impedance compensation method.",
  "Task created and assigned successfully! I've also set up a reminder 24 hours before the deadline.",
  "Your monthly report is being generated. It will include KPI breakdown, safety review status, and project milestones.",
];

let aiResponseIndex = 0;

function sendAIQuick(text) {
  const input = document.getElementById('aiDashInput');
  if (input) {
    input.value = text;
    sendAIDashMessage();
  }
}

function handleAIDashInput(e) {
  if (e.key === 'Enter' && !e.shiftKey) {
    e.preventDefault();
    sendAIDashMessage();
  }
}

function sendAIDashMessage() {
  const input = document.getElementById('aiDashInput');
  const messages = document.getElementById('aiChatMessages');
  if (!input || !messages || !input.value.trim()) return;

  const userText = input.value.trim();
  input.value = '';

  // User message
  const userMsg = document.createElement('div');
  userMsg.className = 'ai-message user';
  userMsg.style.marginBottom = 'var(--space-4)';
  userMsg.innerHTML = `
    <div class="ai-avatar human">ZG</div>
    <div class="ai-bubble">${escapeHtml(userText)}</div>
  `;
  messages.appendChild(userMsg);

  // Typing indicator
  const typingMsg = document.createElement('div');
  typingMsg.className = 'ai-message assistant';
  typingMsg.style.marginBottom = 'var(--space-4)';
  typingMsg.innerHTML = `
    <div class="ai-avatar assistant">AI</div>
    <div class="ai-bubble" style="display:flex;align-items:center;gap:6px;padding:var(--space-3) var(--space-4)">
      <div style="width:6px;height:6px;border-radius:50%;background:var(--color-accent);animation:blink 1s infinite 0s"></div>
      <div style="width:6px;height:6px;border-radius:50%;background:var(--color-accent);animation:blink 1s infinite 0.2s"></div>
      <div style="width:6px;height:6px;border-radius:50%;background:var(--color-accent);animation:blink 1s infinite 0.4s"></div>
    </div>
  `;
  messages.appendChild(typingMsg);
  messages.scrollTop = messages.scrollHeight;

  // AI response after delay
  setTimeout(() => {
    typingMsg.remove();
    const response = aiResponses[aiResponseIndex % aiResponses.length];
    aiResponseIndex++;

    const aiMsg = document.createElement('div');
    aiMsg.className = 'ai-message assistant';
    aiMsg.style.marginBottom = 'var(--space-4)';
    aiMsg.innerHTML = `
      <div class="ai-avatar assistant">AI</div>
      <div class="ai-bubble">${response}</div>
    `;
    messages.appendChild(aiMsg);
    messages.scrollTop = messages.scrollHeight;
  }, 1000 + Math.random() * 500);
}

// ============================================================
// PROJECT VIEW SWITCHER
// ============================================================
function switchProjectView(view, tabEl) {
  // Hide all project views
  ['list','kanban','gantt','wbs','status'].forEach(v => {
    const el = document.getElementById('project-view-' + v);
    if (el) el.style.display = 'none';
  });

  // Show selected
  const target = document.getElementById('project-view-' + view);
  if (target) target.style.display = 'block';

  // Update tabs
  const tabs = tabEl.closest('.tabs').querySelectorAll('.tab-item');
  tabs.forEach(t => t.classList.remove('active'));
  tabEl.classList.add('active');
}

// ============================================================
// SAFETY VIEW SWITCHER
// ============================================================
function switchSafetyView(view, tabEl) {
  ['list','kanban','gantt','detail'].forEach(v => {
    const el = document.getElementById('safety-view-' + v);
    if (el) el.style.display = 'none';
  });

  const target = document.getElementById('safety-view-' + view);
  if (target) target.style.display = 'block';

  const tabs = tabEl.closest('.tabs').querySelectorAll('.tab-item');
  tabs.forEach(t => t.classList.remove('active'));
  tabEl.classList.add('active');
}

// ============================================================
// PERFORMANCE VIEW SWITCHER
// ============================================================
function switchPerfView(view, btnEl) {
  ['overview','kanban','goals'].forEach(v => {
    const el = document.getElementById('perf-view-' + v);
    if (el) el.style.display = 'none';
  });

  const target = document.getElementById('perf-view-' + view);
  if (target) target.style.display = 'block';

  const btns = btnEl.closest('.view-switcher').querySelectorAll('.view-switcher-btn');
  btns.forEach(b => b.classList.remove('active'));
  btnEl.classList.add('active');
}

// ============================================================
// COMMAND PALETTE
// ============================================================
function closePalette() {
  document.getElementById('commandPalette').style.display = 'none';
}

document.addEventListener('keydown', function(e) {
  // Ctrl+K — open palette
  if ((e.ctrlKey || e.metaKey) && e.key === 'k') {
    e.preventDefault();
    const palette = document.getElementById('commandPalette');
    if (palette.style.display === 'none' || !palette.style.display) {
      palette.style.display = 'flex';
      setTimeout(() => {
        const input = document.getElementById('commandInput');
        if (input) input.focus();
      }, 50);
    } else {
      closePalette();
    }
  }

  // ESC — close palette
  if (e.key === 'Escape') {
    closePalette();
    document.getElementById('notificationPanel').style.display = 'none';
  }

  // Ctrl+Shift+T — toggle theme
  if ((e.ctrlKey || e.metaKey) && e.shiftKey && e.key === 'T') {
    e.preventDefault();
    toggleTheme();
  }

  // Ctrl+Shift+A — toggle AI mode
  if ((e.ctrlKey || e.metaKey) && e.shiftKey && e.key === 'A') {
    e.preventDefault();
    toggleAIMode();
  }
});

// ============================================================
// UTILITY
// ============================================================
function escapeHtml(text) {
  const div = document.createElement('div');
  div.appendChild(document.createTextNode(text));
  return div.innerHTML;
}

// ============================================================
// INIT
// ============================================================
document.addEventListener('DOMContentLoaded', function() {
  showPage('dashboard');

  // Auto-resize AI textarea
  const textareas = document.querySelectorAll('.ai-input-field');
  textareas.forEach(ta => {
    ta.addEventListener('input', function() {
      this.style.height = 'auto';
      this.style.height = Math.min(this.scrollHeight, 120) + 'px';
    });
    ta.addEventListener('keydown', function(e) {
      if (e.key === 'Enter' && !e.shiftKey) {
        e.preventDefault();
        const sendBtn = this.nextElementSibling;
        if (sendBtn) sendBtn.click();
      }
    });
  });

  // Toggle switches (visual only)
  document.querySelectorAll('.toggle').forEach(toggle => {
    toggle.addEventListener('click', function() {
      this.classList.toggle('active');
    });
  });

  // View switcher buttons (generic, for ones not already wired)
  document.querySelectorAll('.view-switcher-btn').forEach(btn => {
    if (!btn.getAttribute('onclick')) {
      btn.addEventListener('click', function() {
        this.closest('.view-switcher').querySelectorAll('.view-switcher-btn').forEach(b => b.classList.remove('active'));
        this.classList.add('active');
      });
    }
  });

  // Tab items (generic)
  document.querySelectorAll('.tab-item').forEach(tab => {
    if (!tab.getAttribute('onclick')) {
      tab.addEventListener('click', function() {
        this.closest('.tabs').querySelectorAll('.tab-item').forEach(t => t.classList.remove('active'));
        this.classList.add('active');
      });
    }
  });
});
</script>
</body>
</html>
