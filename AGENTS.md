<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BST Platform V2.0 — UI Design System</title>
<style>
/* ============================================================
   BST PLATFORM V2.0 — DESIGN SYSTEM
   Apple + Linear.app Style | Notion & Airtable Fusion
   ============================================================ */

/* --- CSS Variables (Design Tokens) --- */
:root {
  /* Primary Palette */
  --color-bg: #09090B;
  --color-bg-elevated: #18181B;
  --color-bg-subtle: #1E1E22;
  --color-bg-hover: #27272A;
  --color-bg-active: #2C2C30;
  --color-surface: #131316;
  --color-surface-hover: #1C1C20;

  /* Borders */
  --color-border: rgba(255,255,255,0.06);
  --color-border-hover: rgba(255,255,255,0.1);
  --color-border-active: rgba(255,255,255,0.16);

  /* Text */
  --color-text-primary: #FAFAFA;
  --color-text-secondary: #A1A1AA;
  --color-text-tertiary: #71717A;
  --color-text-quaternary: #52525B;

  /* Accent — Linear-style purple-blue */
  --color-accent: #8B5CF6;
  --color-accent-hover: #7C3AED;
  --color-accent-subtle: rgba(139,92,246,0.12);
  --color-accent-text: #C4B5FD;

  /* Semantic Colors */
  --color-success: #22C55E;
  --color-success-subtle: rgba(34,197,94,0.12);
  --color-warning: #F59E0B;
  --color-warning-subtle: rgba(245,158,11,0.12);
  --color-danger: #EF4444;
  --color-danger-subtle: rgba(239,68,68,0.12);
  --color-info: #3B82F6;
  --color-info-subtle: rgba(59,130,246,0.12);

  /* Status Colors */
  --color-status-todo: #71717A;
  --color-status-inprogress: #3B82F6;
  --color-status-review: #F59E0B;
  --color-status-done: #22C55E;
  --color-status-critical: #EF4444;

  /* Spacing */
  --space-1: 4px;
  --space-2: 8px;
  --space-3: 12px;
  --space-4: 16px;
  --space-5: 20px;
  --space-6: 24px;
  --space-8: 32px;
  --space-10: 40px;
  --space-12: 48px;
  --space-16: 64px;

  /* Typography */
  --font-sans: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text', 'Inter', 'Segoe UI', sans-serif;
  --font-mono: 'SF Mono', 'JetBrains Mono', 'Fira Code', monospace;
  --text-xs: 11px;
  --text-sm: 13px;
  --text-base: 14px;
  --text-md: 15px;
  --text-lg: 16px;
  --text-xl: 18px;
  --text-2xl: 22px;
  --text-3xl: 28px;
  --text-4xl: 36px;
  --line-height: 1.5;

  /* Radius */
  --radius-sm: 6px;
  --radius-md: 8px;
  --radius-lg: 12px;
  --radius-xl: 16px;
  --radius-full: 9999px;

  /* Shadows */
  --shadow-sm: 0 1px 2px rgba(0,0,0,0.3);
  --shadow-md: 0 4px 12px rgba(0,0,0,0.4);
  --shadow-lg: 0 8px 30px rgba(0,0,0,0.5);
  --shadow-glow: 0 0 20px rgba(139,92,246,0.15);

  /* Transitions */
  --transition-fast: 120ms ease;
  --transition-base: 200ms ease;
  --transition-slow: 300ms cubic-bezier(0.4,0,0.2,1);

  /* Layout */
  --sidebar-width: 240px;
  --sidebar-collapsed: 56px;
  --header-height: 52px;
  --page-max-width: 1200px;
}

/* --- Reset & Base --- */
*, *::before, *::after {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html {
  font-size: 14px;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

body {
  font-family: var(--font-sans);
  background: var(--color-bg);
  color: var(--color-text-primary);
  line-height: var(--line-height);
  overflow-x: hidden;
}

a { color: inherit; text-decoration: none; }
button { cursor: pointer; font-family: inherit; border: none; background: none; color: inherit; }
input, textarea, select { font-family: inherit; }

/* Scrollbar — Linear style thin */
::-webkit-scrollbar { width: 6px; height: 6px; }
::-webkit-scrollbar-track { background: transparent; }
::-webkit-scrollbar-thumb { background: var(--color-border-active); border-radius: var(--radius-full); }
::-webkit-scrollbar-thumb:hover { background: var(--color-text-quaternary); }

/* --- Page Sections (for demo navigation) --- */
.page-section {
  display: none;
  min-height: 100vh;
}
.page-section.active {
  display: flex;
}

/* --- App Shell --- */
.app-shell {
  display: flex;
  height: 100vh;
  width: 100%;
  overflow: hidden;
}

/* --- Sidebar --- */
.sidebar {
  width: var(--sidebar-width);
  height: 100vh;
  background: var(--color-surface);
  border-right: 1px solid var(--color-border);
  display: flex;
  flex-direction: column;
  flex-shrink: 0;
  position: relative;
  z-index: 100;
  transition: width var(--transition-slow);
}

.sidebar-header {
  height: var(--header-height);
  padding: 0 var(--space-4);
  display: flex;
  align-items: center;
  gap: var(--space-3);
  border-bottom: 1px solid var(--color-border);
}

.sidebar-logo {
  width: 28px;
  height: 28px;
  background: linear-gradient(135deg, var(--color-accent), #6366F1);
  border-radius: var(--radius-md);
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: 700;
  font-size: var(--text-sm);
  color: white;
  letter-spacing: -0.5px;
}

.sidebar-title {
  font-size: var(--text-md);
  font-weight: 600;
  letter-spacing: -0.3px;
}

.sidebar-version {
  font-size: var(--text-xs);
  color: var(--color-text-tertiary);
  background: var(--color-bg-hover);
  padding: 1px 6px;
  border-radius: var(--radius-full);
  margin-left: auto;
}

/* Sidebar Navigation */
.sidebar-nav {
  flex: 1;
  overflow-y: auto;
  padding: var(--space-3) var(--space-2);
}

.nav-section-label {
  font-size: var(--text-xs);
  font-weight: 600;
  color: var(--color-text-quaternary);
  text-transform: uppercase;
  letter-spacing: 0.8px;
  padding: var(--space-4) var(--space-3) var(--space-2);
}

.nav-item {
  display: flex;
  align-items: center;
  gap: var(--space-3);
  padding: 7px var(--space-3);
  border-radius: var(--radius-md);
  font-size: var(--text-sm);
  color: var(--color-text-secondary);
  transition: all var(--transition-fast);
  cursor: pointer;
  margin-bottom: 1px;
  position: relative;
}

.nav-item:hover {
  background: var(--color-bg-hover);
  color: var(--color-text-primary);
}

.nav-item.active {
  background: var(--color-accent-subtle);
  color: var(--color-accent-text);
}

.nav-item.active::before {
  content: '';
  position: absolute;
  left: -8px;
  top: 50%;
  transform: translateY(-50%);
  width: 3px;
  height: 16px;
  background: var(--color-accent);
  border-radius: var(--radius-full);
}

.nav-icon {
  width: 18px;
  height: 18px;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
}

.nav-icon svg {
  width: 16px;
  height: 16px;
  stroke: currentColor;
  fill: none;
  stroke-width: 1.8;
  stroke-linecap: round;
  stroke-linejoin: round;
}

.nav-badge {
  margin-left: auto;
  font-size: var(--text-xs);
  font-weight: 600;
  min-width: 18px;
  height: 18px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: var(--radius-full);
  background: var(--color-danger);
  color: white;
  padding: 0 5px;
}

.nav-badge.muted {
  background: var(--color-bg-hover);
  color: var(--color-text-tertiary);
}

/* Sidebar Footer */
.sidebar-footer {
  padding: var(--space-3);
  border-top: 1px solid var(--color-border);
}

.sidebar-user {
  display: flex;
  align-items: center;
  gap: var(--space-3);
  padding: var(--space-2) var(--space-3);
  border-radius: var(--radius-md);
  cursor: pointer;
  transition: background var(--transition-fast);
}

.sidebar-user:hover {
  background: var(--color-bg-hover);
}

.user-avatar {
  width: 30px;
  height: 30px;
  border-radius: var(--radius-full);
  background: linear-gradient(135deg, #6366F1, var(--color-accent));
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: var(--text-xs);
  font-weight: 600;
  color: white;
  flex-shrink: 0;
}

.user-info {
  flex: 1;
  min-width: 0;
}

.user-name {
  font-size: var(--text-sm);
  font-weight: 500;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.user-role {
  font-size: var(--text-xs);
  color: var(--color-text-tertiary);
}

/* --- Main Content --- */
.main-content {
  flex: 1;
  display: flex;
  flex-direction: column;
  overflow: hidden;
  min-width: 0;
}

/* --- Top Bar --- */
.topbar {
  height: var(--header-height);
  border-bottom: 1px solid var(--color-border);
  display: flex;
  align-items: center;
  padding: 0 var(--space-6);
  gap: var(--space-4);
  flex-shrink: 0;
  background: rgba(9,9,11,0.8);
  backdrop-filter: blur(12px);
  -webkit-backdrop-filter: blur(12px);
}

.topbar-breadcrumb {
  display: flex;
  align-items: center;
  gap: var(--space-2);
  font-size: var(--text-sm);
  color: var(--color-text-tertiary);
}

.topbar-breadcrumb span {
  color: var(--color-text-primary);
  font-weight: 500;
}

.breadcrumb-sep {
  color: var(--color-text-quaternary);
}

.topbar-actions {
  margin-left: auto;
  display: flex;
  align-items: center;
  gap: var(--space-2);
}

/* Search Bar — Linear style Command+K */
.search-trigger {
  display: flex;
  align-items: center;
  gap: var(--space-2);
  padding: 6px 12px;
  background: var(--color-bg-elevated);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-md);
  color: var(--color-text-tertiary);
  font-size: var(--text-sm);
  cursor: pointer;
  transition: all var(--transition-fast);
  min-width: 200px;
}

.search-trigger:hover {
  border-color: var(--color-border-hover);
  background: var(--color-bg-hover);
}

.search-shortcut {
  margin-left: auto;
  display: flex;
  gap: 3px;
}

.search-shortcut kbd {
  font-family: var(--font-sans);
  font-size: 10px;
  padding: 1px 5px;
  background: var(--color-bg-active);
  border: 1px solid var(--color-border);
  border-radius: 4px;
  color: var(--color-text-quaternary);
}

/* Icon Buttons */
.icon-btn {
  width: 32px;
  height: 32px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: var(--radius-md);
  color: var(--color-text-tertiary);
  transition: all var(--transition-fast);
  position: relative;
}

.icon-btn:hover {
  background: var(--color-bg-hover);
  color: var(--color-text-primary);
}

.icon-btn svg {
  width: 18px;
  height: 18px;
  stroke: currentColor;
  fill: none;
  stroke-width: 1.8;
  stroke-linecap: round;
  stroke-linejoin: round;
}

.icon-btn .notification-dot {
  position: absolute;
  top: 5px;
  right: 5px;
  width: 7px;
  height: 7px;
  background: var(--color-danger);
  border-radius: var(--radius-full);
  border: 1.5px solid var(--color-bg);
}

/* --- Content Area --- */
.content-area {
  flex: 1;
  overflow-y: auto;
  overflow-x: hidden;
  padding: var(--space-8) var(--space-8);
}

.content-area.no-padding {
  padding: 0;
}

/* --- Page Header --- */
.page-header {
  margin-bottom: var(--space-8);
}

.page-header-top {
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
  margin-bottom: var(--space-2);
}

.page-title {
  font-size: var(--text-3xl);
  font-weight: 700;
  letter-spacing: -0.5px;
  line-height: 1.2;
}

.page-subtitle {
  font-size: var(--text-base);
  color: var(--color-text-tertiary);
  margin-top: var(--space-2);
}

/* --- Buttons --- */
.btn {
  display: inline-flex;
  align-items: center;
  gap: var(--space-2);
  padding: 7px 14px;
  border-radius: var(--radius-md);
  font-size: var(--text-sm);
  font-weight: 500;
  transition: all var(--transition-fast);
  white-space: nowrap;
  border: 1px solid transparent;
}

.btn svg {
  width: 15px;
  height: 15px;
  stroke: currentColor;
  fill: none;
  stroke-width: 2;
  stroke-linecap: round;
  stroke-linejoin: round;
}

.btn-primary {
  background: var(--color-accent);
  color: white;
}

.btn-primary:hover {
  background: var(--color-accent-hover);
  box-shadow: var(--shadow-glow);
}

.btn-secondary {
  background: var(--color-bg-elevated);
  border-color: var(--color-border);
  color: var(--color-text-secondary);
}

.btn-secondary:hover {
  background: var(--color-bg-hover);
  border-color: var(--color-border-hover);
  color: var(--color-text-primary);
}

.btn-ghost {
  color: var(--color-text-tertiary);
}

.btn-ghost:hover {
  background: var(--color-bg-hover);
  color: var(--color-text-primary);
}

.btn-sm {
  padding: 4px 10px;
  font-size: var(--text-xs);
}

.btn-group {
  display: flex;
  gap: var(--space-2);
}

/* --- Cards — Apple glass-morphism inspired --- */
.card {
  background: var(--color-bg-elevated);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  transition: all var(--transition-base);
}

.card:hover {
  border-color: var(--color-border-hover);
}

.card-header {
  padding: var(--space-5) var(--space-5) var(--space-3);
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.card-title {
  font-size: var(--text-sm);
  font-weight: 600;
  color: var(--color-text-primary);
}

.card-subtitle {
  font-size: var(--text-xs);
  color: var(--color-text-tertiary);
}

.card-body {
  padding: var(--space-3) var(--space-5) var(--space-5);
}

/* --- Stat Cards (Dashboard) --- */
.stat-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: var(--space-4);
  margin-bottom: var(--space-6);
}

.stat-card {
  background: var(--color-bg-elevated);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  padding: var(--space-5);
  transition: all var(--transition-base);
}

.stat-card:hover {
  border-color: var(--color-border-hover);
  transform: translateY(-1px);
}

.stat-label {
  font-size: var(--text-xs);
  color: var(--color-text-tertiary);
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  margin-bottom: var(--space-3);
}

.stat-value {
  font-size: var(--text-3xl);
  font-weight: 700;
  letter-spacing: -1px;
  line-height: 1;
}

.stat-change {
  display: inline-flex;
  align-items: center;
  gap: 3px;
  font-size: var(--text-xs);
  font-weight: 500;
  margin-top: var(--space-2);
  padding: 2px 6px;
  border-radius: var(--radius-full);
}

.stat-change.positive {
  color: var(--color-success);
  background: var(--color-success-subtle);
}

.stat-change.negative {
  color: var(--color-danger);
  background: var(--color-danger-subtle);
}

.stat-icon {
  width: 36px;
  height: 36px;
  border-radius: var(--radius-md);
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: var(--space-3);
}

.stat-icon svg {
  width: 20px;
  height: 20px;
  stroke: currentColor;
  fill: none;
  stroke-width: 1.8;
  stroke-linecap: round;
  stroke-linejoin: round;
}

.stat-icon.purple {
  background: var(--color-accent-subtle);
  color: var(--color-accent);
}

.stat-icon.blue {
  background: var(--color-info-subtle);
  color: var(--color-info);
}

.stat-icon.green {
  background: var(--color-success-subtle);
  color: var(--color-success);
}

.stat-icon.orange {
  background: var(--color-warning-subtle);
  color: var(--color-warning);
}

/* --- Tags / Badges --- */
.tag {
  display: inline-flex;
  align-items: center;
  gap: 4px;
  padding: 2px 8px;
  border-radius: var(--radius-full);
  font-size: var(--text-xs);
  font-weight: 500;
}

.tag-default {
  background: var(--color-bg-hover);
  color: var(--color-text-secondary);
}

.tag-purple {
  background: var(--color-accent-subtle);
  color: var(--color-accent-text);
}

.tag-blue {
  background: var(--color-info-subtle);
  color: #93C5FD;
}

.tag-green {
  background: var(--color-success-subtle);
  color: #86EFAC;
}

.tag-orange {
  background: var(--color-warning-subtle);
  color: #FCD34D;
}

.tag-red {
  background: var(--color-danger-subtle);
  color: #FCA5A5;
}

/* Status Dot */
.status-dot {
  width: 7px;
  height: 7px;
  border-radius: var(--radius-full);
  flex-shrink: 0;
}

.status-dot.todo { background: var(--color-status-todo); }
.status-dot.in-progress { background: var(--color-status-inprogress); }
.status-dot.review { background: var(--color-status-review); }
.status-dot.done { background: var(--color-status-done); }
.status-dot.critical { background: var(--color-status-critical); }

/* --- Table — Airtable-inspired --- */
.data-table-container {
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  overflow: hidden;
  background: var(--color-bg-elevated);
}

.data-table {
  width: 100%;
  border-collapse: collapse;
}

.data-table thead {
  background: var(--color-surface);
}

.data-table th {
  padding: var(--space-3) var(--space-4);
  text-align: left;
  font-size: var(--text-xs);
  font-weight: 600;
  color: var(--color-text-tertiary);
  text-transform: uppercase;
  letter-spacing: 0.5px;
  border-bottom: 1px solid var(--color-border);
  white-space: nowrap;
}

.data-table td {
  padding: var(--space-3) var(--space-4);
  font-size: var(--text-sm);
  border-bottom: 1px solid var(--color-border);
  color: var(--color-text-secondary);
}

.data-table tr:last-child td {
  border-bottom: none;
}

.data-table tbody tr {
  transition: background var(--transition-fast);
}

.data-table tbody tr:hover {
  background: var(--color-bg-hover);
}

.data-table .cell-primary {
  color: var(--color-text-primary);
  font-weight: 500;
}

.data-table .cell-id {
  font-family: var(--font-mono);
  font-size: var(--text-xs);
  color: var(--color-text-tertiary);
}

/* --- Filter Bar --- */
.filter-bar {
  display: flex;
  align-items: center;
  gap: var(--space-2);
  padding: var(--space-4) 0;
  flex-wrap: wrap;
}

.filter-chip {
  display: inline-flex;
  align-items: center;
  gap: var(--space-2);
  padding: 5px 12px;
  border: 1px solid var(--color-border);
  border-radius: var(--radius-full);
  font-size: var(--text-xs);
  color: var(--color-text-secondary);
  cursor: pointer;
  transition: all var(--transition-fast);
}

.filter-chip:hover {
  border-color: var(--color-border-hover);
  background: var(--color-bg-hover);
}

.filter-chip.active {
  border-color: var(--color-accent);
  background: var(--color-accent-subtle);
  color: var(--color-accent-text);
}

.filter-chip svg {
  width: 13px;
  height: 13px;
  stroke: currentColor;
  fill: none;
  stroke-width: 2;
}

/* --- View Switcher --- */
.view-switcher {
  display: flex;
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-md);
  padding: 2px;
}

.view-switcher-btn {
  padding: 5px 12px;
  border-radius: var(--radius-sm);
  font-size: var(--text-xs);
  font-weight: 500;
  color: var(--color-text-tertiary);
  transition: all var(--transition-fast);
  display: flex;
  align-items: center;
  gap: var(--space-2);
}

.view-switcher-btn:hover {
  color: var(--color-text-secondary);
}

.view-switcher-btn.active {
  background: var(--color-bg-hover);
  color: var(--color-text-primary);
}

.view-switcher-btn svg {
  width: 14px;
  height: 14px;
  stroke: currentColor;
  fill: none;
  stroke-width: 2;
}

/* --- Kanban Board --- */
.kanban-board {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: var(--space-4);
  min-height: 500px;
}

.kanban-column {
  display: flex;
  flex-direction: column;
  gap: var(--space-3);
}

.kanban-column-header {
  display: flex;
  align-items: center;
  gap: var(--space-2);
  padding: var(--space-2) 0;
  margin-bottom: var(--space-1);
}

.kanban-column-title {
  font-size: var(--text-sm);
  font-weight: 600;
}

.kanban-column-count {
  font-size: var(--text-xs);
  color: var(--color-text-quaternary);
  background: var(--color-bg-hover);
  padding: 0 6px;
  border-radius: var(--radius-full);
  height: 18px;
  display: flex;
  align-items: center;
}

.kanban-card {
  background: var(--color-bg-elevated);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-md);
  padding: var(--space-4);
  cursor: pointer;
  transition: all var(--transition-base);
}

.kanban-card:hover {
  border-color: var(--color-border-hover);
  transform: translateY(-1px);
  box-shadow: var(--shadow-md);
}

.kanban-card-id {
  font-size: var(--text-xs);
  font-family: var(--font-mono);
  color: var(--color-text-quaternary);
  margin-bottom: var(--space-2);
}

.kanban-card-title {
  font-size: var(--text-sm);
  font-weight: 500;
  margin-bottom: var(--space-3);
  line-height: 1.4;
}

.kanban-card-meta {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.kanban-card-tags {
  display: flex;
  gap: var(--space-1);
}

.kanban-card-avatar {
  width: 22px;
  height: 22px;
  border-radius: var(--radius-full);
  background: linear-gradient(135deg, #6366F1, #8B5CF6);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 9px;
  font-weight: 600;
  color: white;
}

.kanban-card-priority {
  display: flex;
  gap: 2px;
}

.priority-bar {
  width: 3px;
  height: 12px;
  border-radius: 1px;
  background: var(--color-bg-active);
}

.priority-bar.filled.urgent { background: var(--color-danger); }
.priority-bar.filled.high { background: var(--color-warning); }
.priority-bar.filled.medium { background: var(--color-info); }
.priority-bar.filled.low { background: var(--color-text-quaternary); }

/* Add card */
.kanban-add-card {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: var(--space-2);
  padding: var(--space-3);
  border: 1px dashed var(--color-border);
  border-radius: var(--radius-md);
  color: var(--color-text-quaternary);
  font-size: var(--text-sm);
  cursor: pointer;
  transition: all var(--transition-fast);
}

.kanban-add-card:hover {
  border-color: var(--color-border-hover);
  color: var(--color-text-tertiary);
  background: var(--color-bg-subtle);
}

/* --- Tabs --- */
.tabs {
  display: flex;
  border-bottom: 1px solid var(--color-border);
  gap: 0;
  margin-bottom: var(--space-6);
}

.tab-item {
  padding: var(--space-3) var(--space-4);
  font-size: var(--text-sm);
  font-weight: 500;
  color: var(--color-text-tertiary);
  border-bottom: 2px solid transparent;
  margin-bottom: -1px;
  cursor: pointer;
  transition: all var(--transition-fast);
  white-space: nowrap;
}

.tab-item:hover {
  color: var(--color-text-secondary);
}

.tab-item.active {
  color: var(--color-text-primary);
  border-bottom-color: var(--color-accent);
}

/* --- Progress Bar --- */
.progress-bar {
  height: 4px;
  background: var(--color-bg-active);
  border-radius: var(--radius-full);
  overflow: hidden;
}

.progress-fill {
  height: 100%;
  border-radius: var(--radius-full);
  transition: width var(--transition-slow);
}

.progress-fill.purple { background: var(--color-accent); }
.progress-fill.blue { background: var(--color-info); }
.progress-fill.green { background: var(--color-success); }
.progress-fill.orange { background: var(--color-warning); }
.progress-fill.red { background: var(--color-danger); }

/* --- Avatar Group --- */
.avatar-group {
  display: flex;
}

.avatar-group .avatar {
  width: 26px;
  height: 26px;
  border-radius: var(--radius-full);
  background: linear-gradient(135deg, #6366F1, #8B5CF6);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 9px;
  font-weight: 600;
  color: white;
  border: 2px solid var(--color-bg-elevated);
  margin-left: -6px;
}

.avatar-group .avatar:first-child {
  margin-left: 0;
}

.avatar-group .avatar.green { background: linear-gradient(135deg, #059669, #22C55E); }
.avatar-group .avatar.blue { background: linear-gradient(135deg, #2563EB, #3B82F6); }
.avatar-group .avatar.orange { background: linear-gradient(135deg, #D97706, #F59E0B); }
.avatar-group .avatar.pink { background: linear-gradient(135deg, #DB2777, #EC4899); }
.avatar-group .avatar.more { background: var(--color-bg-active); color: var(--color-text-tertiary); }

/* --- Chart Placeholders --- */
.chart-placeholder {
  width: 100%;
  aspect-ratio: 16/9;
  background: var(--color-surface);
  border-radius: var(--radius-md);
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  color: var(--color-text-quaternary);
  font-size: var(--text-sm);
  gap: var(--space-2);
}

.chart-placeholder svg {
  width: 32px;
  height: 32px;
  stroke: currentColor;
  fill: none;
  stroke-width: 1.5;
}

/* Chart Bars (mini bar chart simulation) */
.mini-bars {
  display: flex;
  align-items: flex-end;
  gap: 3px;
  height: 48px;
}

.mini-bar {
  width: 6px;
  border-radius: 2px;
  background: var(--color-accent);
  opacity: 0.7;
}

.mini-bar:nth-child(odd) { opacity: 0.4; }

/* Sparkline placeholder */
.sparkline {
  width: 80px;
  height: 24px;
}

.sparkline svg {
  width: 100%;
  height: 100%;
}

/* --- Form Elements --- */
.form-group {
  margin-bottom: var(--space-5);
}

.form-label {
  display: block;
  font-size: var(--text-sm);
  font-weight: 500;
  color: var(--color-text-secondary);
  margin-bottom: var(--space-2);
}

.form-input {
  width: 100%;
  padding: 8px 12px;
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-md);
  color: var(--color-text-primary);
  font-size: var(--text-sm);
  transition: all var(--transition-fast);
  outline: none;
}

.form-input:focus {
  border-color: var(--color-accent);
  box-shadow: 0 0 0 3px var(--color-accent-subtle);
}

.form-input::placeholder {
  color: var(--color-text-quaternary);
}

.form-textarea {
  resize: vertical;
  min-height: 100px;
}

.form-select {
  appearance: none;
  background-image: url("data:image/svg+xml,%3Csvg width='12' height='12' viewBox='0 0 12 12' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M3 4.5L6 7.5L9 4.5' stroke='%2371717A' stroke-width='1.5' stroke-linecap='round' stroke-linejoin='round'/%3E%3C/svg%3E");
  background-repeat: no-repeat;
  background-position: right 10px center;
  padding-right: 32px;
}

/* Checkbox */
.checkbox-item {
  display: flex;
  align-items: center;
  gap: var(--space-3);
  padding: var(--space-2) 0;
  font-size: var(--text-sm);
  color: var(--color-text-secondary);
  cursor: pointer;
}

.checkbox-box {
  width: 16px;
  height: 16px;
  border: 1.5px solid var(--color-border-active);
  border-radius: 4px;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  transition: all var(--transition-fast);
}

.checkbox-box.checked {
  background: var(--color-accent);
  border-color: var(--color-accent);
}

.checkbox-box.checked svg {
  width: 10px;
  height: 10px;
  stroke: white;
  fill: none;
  stroke-width: 2.5;
}

/* --- Timeline / Activity Feed --- */
.timeline {
  position: relative;
  padding-left: var(--space-8);
}

.timeline::before {
  content: '';
  position: absolute;
  left: 11px;
  top: 0;
  bottom: 0;
  width: 1px;
  background: var(--color-border);
}

.timeline-item {
  position: relative;
  padding-bottom: var(--space-6);
}

.timeline-dot {
  position: absolute;
  left: -25px;
  top: 2px;
  width: 8px;
  height: 8px;
  border-radius: var(--radius-full);
  background: var(--color-text-quaternary);
  border: 2px solid var(--color-bg);
}

.timeline-dot.purple { background: var(--color-accent); }
.timeline-dot.green { background: var(--color-success); }
.timeline-dot.blue { background: var(--color-info); }
.timeline-dot.orange { background: var(--color-warning); }

.timeline-content {
  font-size: var(--text-sm);
  color: var(--color-text-secondary);
}

.timeline-time {
  font-size: var(--text-xs);
  color: var(--color-text-quaternary);
  margin-top: var(--space-1);
}

/* --- Modal / Dialog --- */
.modal-overlay {
  position: fixed;
  inset: 0;
  background: rgba(0,0,0,0.6);
  backdrop-filter: blur(4px);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1000;
}

.modal {
  background: var(--color-bg-elevated);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-xl);
  box-shadow: var(--shadow-lg);
  width: 100%;
  max-width: 560px;
  max-height: 85vh;
  display: flex;
  flex-direction: column;
}

.modal-header {
  padding: var(--space-5) var(--space-6);
  border-bottom: 1px solid var(--color-border);
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.modal-title {
  font-size: var(--text-lg);
  font-weight: 600;
}

.modal-body {
  padding: var(--space-6);
  overflow-y: auto;
  flex: 1;
}

.modal-footer {
  padding: var(--space-4) var(--space-6);
  border-top: 1px solid var(--color-border);
  display: flex;
  justify-content: flex-end;
  gap: var(--space-3);
}

/* --- Command Palette (Cmd+K) --- */
.command-palette {
  background: var(--color-bg-elevated);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-xl);
  box-shadow: var(--shadow-lg);
  width: 100%;
  max-width: 640px;
  overflow: hidden;
}

.command-input-wrapper {
  padding: var(--space-4) var(--space-5);
  border-bottom: 1px solid var(--color-border);
  display: flex;
  align-items: center;
  gap: var(--space-3);
}

.command-input-wrapper svg {
  width: 18px;
  height: 18px;
  stroke: var(--color-text-quaternary);
  fill: none;
  stroke-width: 2;
  flex-shrink: 0;
}

.command-input {
  flex: 1;
  background: none;
  border: none;
  outline: none;
  color: var(--color-text-primary);
  font-size: var(--text-md);
}

.command-input::placeholder {
  color: var(--color-text-quaternary);
}

.command-results {
  max-height: 360px;
  overflow-y: auto;
  padding: var(--space-2);
}

.command-group-label {
  font-size: var(--text-xs);
  font-weight: 600;
  color: var(--color-text-quaternary);
  padding: var(--space-3) var(--space-3) var(--space-2);
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.command-item {
  display: flex;
  align-items: center;
  gap: var(--space-3);
  padding: 8px var(--space-3);
  border-radius: var(--radius-md);
  cursor: pointer;
  transition: background var(--transition-fast);
}

.command-item:hover {
  background: var(--color-bg-hover);
}

.command-item-icon {
  width: 28px;
  height: 28px;
  border-radius: var(--radius-sm);
  background: var(--color-bg-active);
  display: flex;
  align-items: center;
  justify-content: center;
}

.command-item-icon svg {
  width: 14px;
  height: 14px;
  stroke: var(--color-text-tertiary);
  fill: none;
  stroke-width: 2;
}

.command-item-text {
  flex: 1;
}

.command-item-label {
  font-size: var(--text-sm);
}

.command-item-desc {
  font-size: var(--text-xs);
  color: var(--color-text-quaternary);
}

.command-item-shortcut {
  display: flex;
  gap: 3px;
}

.command-item-shortcut kbd {
  font-family: var(--font-sans);
  font-size: 10px;
  padding: 1px 5px;
  background: var(--color-bg-active);
  border: 1px solid var(--color-border);
  border-radius: 4px;
  color: var(--color-text-quaternary);
}

/* --- Two Column Layout --- */
.two-col {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: var(--space-6);
}

.three-col {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: var(--space-4);
}

/* --- Detail Panel (split view) --- */
.detail-layout {
  display: grid;
  grid-template-columns: 1fr 340px;
  gap: var(--space-6);
  align-items: flex-start;
}

.detail-sidebar {
  background: var(--color-bg-elevated);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  padding: var(--space-5);
}

.detail-field {
  margin-bottom: var(--space-5);
}

.detail-field-label {
  font-size: var(--text-xs);
  font-weight: 500;
  color: var(--color-text-quaternary);
  text-transform: uppercase;
  letter-spacing: 0.5px;
  margin-bottom: var(--space-2);
}

.detail-field-value {
  font-size: var(--text-sm);
  color: var(--color-text-primary);
}

/* --- Gantt Chart Placeholder --- */
.gantt-placeholder {
  background: var(--color-bg-elevated);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  padding: var(--space-5);
  overflow: hidden;
}

.gantt-header-row {
  display: grid;
  grid-template-columns: 200px repeat(12, 1fr);
  gap: 0;
  border-bottom: 1px solid var(--color-border);
  padding-bottom: var(--space-3);
  margin-bottom: var(--space-3);
}

.gantt-header-cell {
  font-size: var(--text-xs);
  color: var(--color-text-quaternary);
  text-align: center;
  padding: 0 var(--space-1);
}

.gantt-header-cell:first-child {
  text-align: left;
  font-weight: 600;
  color: var(--color-text-tertiary);
}

.gantt-row {
  display: grid;
  grid-template-columns: 200px 1fr;
  align-items: center;
  min-height: 36px;
  padding: var(--space-1) 0;
}

.gantt-task-name {
  font-size: var(--text-sm);
  font-weight: 500;
  padding-right: var(--space-4);
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.gantt-bar-container {
  position: relative;
  height: 24px;
}

.gantt-bar {
  position: absolute;
  height: 8px;
  top: 8px;
  border-radius: var(--radius-full);
  background: var(--color-accent);
  opacity: 0.8;
}

.gantt-bar.blue { background: var(--color-info); }
.gantt-bar.green { background: var(--color-success); }
.gantt-bar.orange { background: var(--color-warning); }
.gantt-bar.red { background: var(--color-danger); }

/* --- Empty State --- */
.empty-state {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: var(--space-16) var(--space-8);
  text-align: center;
}

.empty-state-icon {
  width: 56px;
  height: 56px;
  background: var(--color-bg-hover);
  border-radius: var(--radius-xl);
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: var(--space-5);
}

.empty-state-icon svg {
  width: 28px;
  height: 28px;
  stroke: var(--color-text-quaternary);
  fill: none;
  stroke-width: 1.5;
}

.empty-state-title {
  font-size: var(--text-lg);
  font-weight: 600;
  margin-bottom: var(--space-2);
}

.empty-state-desc {
  font-size: var(--text-sm);
  color: var(--color-text-tertiary);
  max-width: 360px;
  margin-bottom: var(--space-6);
}

/* --- Notification List --- */
.notification-list {
  display: flex;
  flex-direction: column;
}

.notification-item {
  display: flex;
  gap: var(--space-4);
  padding: var(--space-4) var(--space-5);
  border-bottom: 1px solid var(--color-border);
  transition: background var(--transition-fast);
  cursor: pointer;
}

.notification-item:hover {
  background: var(--color-bg-hover);
}

.notification-item.unread {
  background: var(--color-accent-subtle);
}

.notification-icon-wrap {
  width: 32px;
  height: 32px;
  border-radius: var(--radius-md);
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
}

.notification-icon-wrap svg {
  width: 16px;
  height: 16px;
  stroke: currentColor;
  fill: none;
  stroke-width: 2;
}

.notification-icon-wrap.purple { background: var(--color-accent-subtle); color: var(--color-accent); }
.notification-icon-wrap.blue { background: var(--color-info-subtle); color: var(--color-info); }
.notification-icon-wrap.green { background: var(--color-success-subtle); color: var(--color-success); }
.notification-icon-wrap.orange { background: var(--color-warning-subtle); color: var(--color-warning); }

.notification-body {
  flex: 1;
  min-width: 0;
}

.notification-title-text {
  font-size: var(--text-sm);
  font-weight: 500;
  margin-bottom: 2px;
}

.notification-desc {
  font-size: var(--text-xs);
  color: var(--color-text-tertiary);
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.notification-time {
  font-size: var(--text-xs);
  color: var(--color-text-quaternary);
  white-space: nowrap;
  flex-shrink: 0;
}

/* --- Accordion / Collapsible --- */
.accordion-item {
  border: 1px solid var(--color-border);
  border-radius: var(--radius-md);
  margin-bottom: var(--space-2);
  overflow: hidden;
}

.accordion-header {
  display: flex;
  align-items: center;
  gap: var(--space-3);
  padding: var(--space-4) var(--space-5);
  cursor: pointer;
  transition: background var(--transition-fast);
}

.accordion-header:hover {
  background: var(--color-bg-hover);
}

.accordion-chevron {
  width: 16px;
  height: 16px;
  color: var(--color-text-quaternary);
  transition: transform var(--transition-base);
}

.accordion-chevron svg {
  width: 100%;
  height: 100%;
  stroke: currentColor;
  fill: none;
  stroke-width: 2;
}

.accordion-title {
  font-size: var(--text-sm);
  font-weight: 500;
  flex: 1;
}

.accordion-body {
  padding: 0 var(--space-5) var(--space-5);
  font-size: var(--text-sm);
  color: var(--color-text-secondary);
}

/* --- Sidebar Detail Panel (Linear-style) --- */
.detail-side-panel {
  width: 380px;
  background: var(--color-bg-elevated);
  border-left: 1px solid var(--color-border);
  height: 100%;
  display: flex;
  flex-direction: column;
  flex-shrink: 0;
}

.detail-side-panel-header {
  padding: var(--space-4) var(--space-5);
  border-bottom: 1px solid var(--color-border);
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.detail-side-panel-body {
  flex: 1;
  overflow-y: auto;
  padding: var(--space-5);
}

/* --- Grid Layout for Dashboard --- */
.dashboard-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: var(--space-4);
}

.dashboard-grid .full-width {
  grid-column: 1 / -1;
}

/* --- Performance Radar Placeholder --- */
.radar-placeholder {
  width: 200px;
  height: 200px;
  margin: 0 auto;
  position: relative;
}

.radar-ring {
  position: absolute;
  border: 1px solid var(--color-border);
  border-radius: var(--radius-full);
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

/* --- Review Flow Steps --- */
.flow-steps {
  display: flex;
  align-items: center;
  gap: var(--space-1);
  padding: var(--space-4) 0;
}

.flow-step {
  display: flex;
  align-items: center;
  gap: var(--space-2);
}

.flow-step-number {
  width: 28px;
  height: 28px;
  border-radius: var(--radius-full);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: var(--text-xs);
  font-weight: 600;
  border: 1.5px solid var(--color-border-active);
  color: var(--color-text-tertiary);
}

.flow-step-number.active {
  background: var(--color-accent);
  border-color: var(--color-accent);
  color: white;
}

.flow-step-number.completed {
  background: var(--color-success);
  border-color: var(--color-success);
  color: white;
}

.flow-step-label {
  font-size: var(--text-xs);
  color: var(--color-text-tertiary);
  white-space: nowrap;
}

.flow-step-label.active {
  color: var(--color-text-primary);
  font-weight: 500;
}

.flow-connector {
  flex: 1;
  height: 1px;
  background: var(--color-border);
  min-width: 24px;
}

.flow-connector.completed {
  background: var(--color-success);
}

/* --- Score Ring --- */
.score-ring {
  width: 80px;
  height: 80px;
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
}

.score-ring svg {
  position: absolute;
  width: 100%;
  height: 100%;
  transform: rotate(-90deg);
}

.score-ring circle {
  fill: none;
  stroke-width: 4;
}

.score-ring .ring-bg {
  stroke: var(--color-bg-active);
}

.score-ring .ring-fill {
  stroke: var(--color-accent);
  stroke-dasharray: 226;
  stroke-dashoffset: 23;
  stroke-linecap: round;
}

.score-ring .ring-fill.green { stroke: var(--color-success); }
.score-ring .ring-fill.blue { stroke: var(--color-info); }

.score-value {
  font-size: var(--text-xl);
  font-weight: 700;
  letter-spacing: -0.5px;
}

/* --- Page Demo Navigation (for switching views) --- */
.demo-nav {
  position: fixed;
  bottom: 20px;
  left: 50%;
  transform: translateX(-50%);
  background: var(--color-bg-elevated);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-full);
  padding: 4px;
  display: flex;
  gap: 2px;
  z-index: 9999;
  box-shadow: var(--shadow-lg);
  backdrop-filter: blur(12px);
}

.demo-nav-btn {
  padding: 6px 14px;
  border-radius: var(--radius-full);
  font-size: var(--text-xs);
  font-weight: 500;
  color: var(--color-text-tertiary);
  transition: all var(--transition-fast);
  white-space: nowrap;
}

.demo-nav-btn:hover {
  color: var(--color-text-primary);
  background: var(--color-bg-hover);
}

.demo-nav-btn.active {
  background: var(--color-accent);
  color: white;
}

/* --- AI Chat Interface --- */
.ai-chat-container {
  display: flex;
  flex-direction: column;
  height: 100%;
}

.ai-messages {
  flex: 1;
  overflow-y: auto;
  padding: var(--space-6);
  display: flex;
  flex-direction: column;
  gap: var(--space-5);
}

.ai-message {
  display: flex;
  gap: var(--space-3);
  max-width: 720px;
}

.ai-message.user {
  align-self: flex-end;
  flex-direction: row-reverse;
}

.ai-avatar {
  width: 30px;
  height: 30px;
  border-radius: var(--radius-md);
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  font-size: var(--text-xs);
  font-weight: 600;
}

.ai-avatar.assistant {
  background: linear-gradient(135deg, var(--color-accent), #6366F1);
  color: white;
}

.ai-avatar.human {
  background: var(--color-bg-active);
  color: var(--color-text-secondary);
}

.ai-bubble {
  padding: var(--space-3) var(--space-4);
  border-radius: var(--radius-lg);
  font-size: var(--text-sm);
  line-height: 1.6;
}

.ai-message.assistant .ai-bubble {
  background: var(--color-bg-elevated);
  border: 1px solid var(--color-border);
  color: var(--color-text-secondary);
}

.ai-message.user .ai-bubble {background: var(--color-accent);
  color: white;
}

.ai-input-bar {
  padding: var(--space-4) var(--space-6);
  border-top: 1px solid var(--color-border);
  display: flex;
  align-items: flex-end;
  gap: var(--space-3);
}

.ai-input-field {
  flex: 1;
  padding: 10px 14px;
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  color: var(--color-text-primary);
  font-size: var(--text-sm);
  outline: none;
  resize: none;
  min-height: 40px;
  max-height: 120px;
  line-height: 1.5;
}

.ai-input-field:focus {
  border-color: var(--color-accent);
  box-shadow: 0 0 0 3px var(--color-accent-subtle);
}

.ai-send-btn {
  width: 36px;
  height: 36px;
  border-radius: var(--radius-md);
  background: var(--color-accent);
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  transition: all var(--transition-fast);
}

.ai-send-btn:hover {
  background: var(--color-accent-hover);
}

.ai-send-btn svg {
  width: 16px;
  height: 16px;
  stroke: white;
  fill: none;
  stroke-width: 2;
}

.ai-quick-actions {
  display: flex;
  gap: var(--space-2);
  padding: 0 var(--space-6) var(--space-3);
}

.ai-quick-btn {
  padding: 5px 12px;
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-full);
  font-size: var(--text-xs);
  color: var(--color-text-tertiary);
  cursor: pointer;
  transition: all var(--transition-fast);
}

.ai-quick-btn:hover {
  border-color: var(--color-accent);
  color: var(--color-accent-text);
  background: var(--color-accent-subtle);
}

/* --- Tree View (Org / Hierarchy) --- */
.tree-view {
  padding-left: var(--space-5);
}

.tree-node {
  position: relative;
  padding-left: var(--space-5);
}

.tree-node::before {
  content: '';
  position: absolute;
  left: 0;
  top: 0;
  bottom: 12px;
  width: 1px;
  background: var(--color-border);
}

.tree-node-item {
  display: flex;
  align-items: center;
  gap: var(--space-3);
  padding: var(--space-2) var(--space-3);
  border-radius: var(--radius-md);
  cursor: pointer;
  transition: background var(--transition-fast);
  position: relative;
}

.tree-node-item::before {
  content: '';
  position: absolute;
  left: -20px;
  top: 50%;
  width: 16px;
  height: 1px;
  background: var(--color-border);
}

.tree-node-item:hover {
  background: var(--color-bg-hover);
}

/* --- Toggle Switch --- */
.toggle {
  width: 36px;
  height: 20px;
  border-radius: var(--radius-full);
  background: var(--color-bg-active);
  position: relative;
  cursor: pointer;
  transition: background var(--transition-base);
}

.toggle.active {
  background: var(--color-accent);
}

.toggle-knob {
  width: 16px;
  height: 16px;
  border-radius: var(--radius-full);
  background: white;
  position: absolute;
  top: 2px;
  left: 2px;
  transition: transform var(--transition-base);
}

.toggle.active .toggle-knob {
  transform: translateX(16px);
}

/* --- Divider --- */
.divider {
  height: 1px;
  background: var(--color-border);
  margin: var(--space-4) 0;
}

/* --- List Item (Settings style) --- */
.settings-item {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: var(--space-4) var(--space-5);
  border-bottom: 1px solid var(--color-border);
}

.settings-item-left {
  display: flex;
  flex-direction: column;
  gap: 2px;
}

.settings-item-title {
  font-size: var(--text-sm);
  font-weight: 500;
}

.settings-item-desc {
  font-size: var(--text-xs);
  color: var(--color-text-tertiary);
}

/* --- Heatmap Grid --- */
.heatmap-grid {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  gap: 3px;
}

.heatmap-cell {
  aspect-ratio: 1;
  border-radius: 3px;
  background: var(--color-bg-active);
}

.heatmap-cell.level-1 { background: rgba(139,92,246,0.2); }
.heatmap-cell.level-2 { background: rgba(139,92,246,0.4); }
.heatmap-cell.level-3 { background: rgba(139,92,246,0.6); }
.heatmap-cell.level-4 { background: rgba(139,92,246,0.85); }

/* --- Risk Matrix --- */
.risk-matrix {
  display: grid;
  grid-template-columns: 40px repeat(5, 1fr);
  grid-template-rows: repeat(5, 48px) 30px;
  gap: 2px;
}

.risk-matrix-cell {
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 4px;
  font-size: var(--text-xs);
  font-weight: 500;
}

.risk-low { background: rgba(34,197,94,0.15); color: #86EFAC; }
.risk-medium { background: rgba(245,158,11,0.15); color: #FCD34D; }
.risk-high { background: rgba(239,68,68,0.15); color: #FCA5A5; }
.risk-critical { background: rgba(239,68,68,0.3); color: #FCA5A5; }

.risk-axis-label {
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: var(--text-xs);
  color: var(--color-text-quaternary);
  writing-mode: vertical-rl;
  transform: rotate(180deg);
}

.risk-axis-label.horizontal {
  writing-mode: horizontal-tb;
  transform: none;
}

/* --- Patent / Document Card --- */
.doc-card {
  background: var(--color-bg-elevated);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  padding: var(--space-5);
  transition: all var(--transition-base);
  cursor: pointer;
}

.doc-card:hover {
  border-color: var(--color-border-hover);
  transform: translateY(-1px);
  box-shadow: var(--shadow-md);
}

.doc-card-type {
  display: inline-flex;
  align-items: center;
  gap: var(--space-2);
  font-size: var(--text-xs);
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  margin-bottom: var(--space-3);
}

.doc-card-title {
  font-size: var(--text-md);
  font-weight: 600;
  margin-bottom: var(--space-2);
  line-height: 1.4;
}

.doc-card-desc {
  font-size: var(--text-sm);
  color: var(--color-text-tertiary);
  margin-bottom: var(--space-4);
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.doc-card-footer {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

/* --- Responsive helpers --- */
@media (max-width: 1200px) {
  .stat-grid {
    grid-template-columns: repeat(2, 1fr);
  }
  .kanban-board {
    grid-template-columns: repeat(2, 1fr);
  }
  .detail-layout {
    grid-template-columns: 1fr;
  }
}

</style>
</head>
<body>

<!-- ============================================================
     DEMO NAVIGATION (bottom floating bar for switching pages)
     ============================================================ -->
<nav class="demo-nav" id="demoNav">
  <button class="demo-nav-btn active" onclick="showPage('dashboard')">Dashboard</button>
  <button class="demo-nav-btn" onclick="showPage('tasks')">Tasks</button>
  <button class="demo-nav-btn" onclick="showPage('projects')">Projects</button>
  <button class="demo-nav-btn" onclick="showPage('safety')">Safety Review</button>
  <button class="demo-nav-btn" onclick="showPage('performance')">Performance</button>
  <button class="demo-nav-btn" onclick="showPage('patent')">Patent / IP</button>
  <button class="demo-nav-btn" onclick="showPage('reports')">Reports</button>
  <button class="demo-nav-btn" onclick="showPage('ai')">AI Assistant</button>
  <button class="demo-nav-btn" onclick="showPage('settings')">Settings</button>
</nav>

<!-- ============================================================
     PAGE 1 — DASHBOARD
     ============================================================ -->
<div class="page-section active" id="page-dashboard">
  <div class="app-shell">

    <!-- SIDEBAR -->
    <aside class="sidebar">
      <div class="sidebar-header">
        <div class="sidebar-logo">B</div>
        <span class="sidebar-title">BST Platform</span>
        <span class="sidebar-version">v2.0</span>
      </div>

      <nav class="sidebar-nav">
        <div class="nav-section-label">Overview</div>
        <div class="nav-item active">
          <span class="nav-icon">
            <svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg>
          </span>
          Dashboard
        </div>
        <div class="nav-item">
          <span class="nav-icon">
            <svg viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
          </span>
          Search
          <span style="margin-left:auto;display:flex;gap:3px">
            <kbd style="font-family:var(--font-sans);font-size:10px;padding:1px 5px;background:var(--color-bg-active);border:1px solid var(--color-border);border-radius:4px;color:var(--color-text-quaternary)">Ctrl</kbd>
            <kbd style="font-family:var(--font-sans);font-size:10px;padding:1px 5px;background:var(--color-bg-active);border:1px solid var(--color-border);border-radius:4px;color:var(--color-text-quaternary)">K</kbd>
          </span>
        </div>
        <div class="nav-item">
          <span class="nav-icon">
            <svg viewBox="0 0 24 24"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/><path d="M13.73 21a2 2 0 0 1-3.46 0"/></svg>
          </span>
          Notifications
          <span class="nav-badge">3</span>
        </div>

        <div class="nav-section-label">Workspace</div>
        <div class="nav-item">
          <span class="nav-icon">
            <svg viewBox="0 0 24 24"><path d="M9 11l3 3L22 4"/><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/></svg>
          </span>
          Task Management
          <span class="nav-badge muted">12</span>
        </div>
        <div class="nav-item">
          <span class="nav-icon">
            <svg viewBox="0 0 24 24"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg>
          </span>
          Project Center
        </div>
        <div class="nav-item">
          <span class="nav-icon">
            <svg viewBox="0 0 24 24"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
          </span>
          Safety Review
          <span class="nav-badge">1</span>
        </div>
        <div class="nav-item">
          <span class="nav-icon">
            <svg viewBox="0 0 24 24"><line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/></svg>
          </span>
          Performance
        </div>
        <div class="nav-item">
          <span class="nav-icon">
            <svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
          </span>
          Patent / IP
        </div>

        <div class="nav-section-label">Intelligence</div>
        <div class="nav-item">
          <span class="nav-icon">
            <svg viewBox="0 0 24 24"><path d="M12 2a10 10 0 1 0 10 10H12V2z"/><path d="M20 12a8 8 0 0 0-8-8v8h8z" opacity="0.4"/></svg>
          </span>
          Report Center
        </div>
        <div class="nav-item">
          <span class="nav-icon">
            <svg viewBox="0 0 24 24"><rect x="2" y="2" width="20" height="20" rx="5"/><path d="M8 12h8M12 8v8" opacity="0.5"/></svg>
          </span>
          AI Assistant
        </div>
      </nav>

      <div class="sidebar-footer">
        <div class="sidebar-user">
          <div class="user-avatar">ZG</div>
          <div class="user-info">
            <div class="user-name">Zhang Gong</div>
            <div class="user-role">Senior Engineer</div>
          </div>
        </div>
      </div>
    </aside>

    <!-- MAIN CONTENT -->
    <div class="main-content">
      <!-- Top Bar -->
      <header class="topbar">
        <div class="topbar-breadcrumb">
          Workspace <span class="breadcrumb-sep">/</span> <span>Dashboard</span>
        </div>
        <div class="topbar-actions">
          <div class="search-trigger">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
            Search anything...
            <span class="search-shortcut"><kbd>Ctrl</kbd><kbd>K</kbd></span>
          </div>
          <button class="icon-btn">
            <svg viewBox="0 0 24 24"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/><path d="M13.73 21a2 2 0 0 1-3.46 0"/></svg>
            <span class="notification-dot"></span>
          </button>
          <button class="icon-btn">
            <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="3"/><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1-2.83 2.83l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-4 0v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83-2.83l.06-.06A1.65 1.65 0 0 0 4.68 15a1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1 0-4h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 2.83-2.83l.06.06A1.65 1.65 0 0 0 9 4.68a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 4 0v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 2.83l-.06.06A1.65 1.65 0 0 0 19.4 9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 0 4h-.09a1.65 1.65 0 0 0-1.51 1z"/></svg>
          </button>
        </div>
      </header>

      <!-- Content -->
      <div class="content-area">
        <!-- Page Header -->
        <div class="page-header">
          <div class="page-header-top">
            <div>
              <h1 class="page-title">Good morning, Zhang Gong</h1>
              <p class="page-subtitle">Here is your workspace overview for today. 3 tasks require your attention.</p>
            </div>
            <div class="btn-group">
              <button class="btn btn-secondary">
                <svg viewBox="0 0 24 24"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
                Export
              </button>
              <button class="btn btn-primary">
                <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
                New Task
              </button>
            </div>
          </div>
        </div>

        <!-- Stat Grid -->
        <div class="stat-grid">
          <div class="stat-card">
            <div class="stat-icon purple">
              <svg viewBox="0 0 24 24"><path d="M9 11l3 3L22 4"/><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/></svg>
            </div>
            <div class="stat-label">Active Tasks</div>
            <div class="stat-value">24</div>
            <div class="stat-change positive">+12% vs last week</div>
          </div>
          <div class="stat-card">
            <div class="stat-icon blue">
              <svg viewBox="0 0 24 24"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg>
            </div>
            <div class="stat-label">Active Projects</div>
            <div class="stat-value">6</div>
            <div class="stat-change positive">+2 this month</div>
          </div>
          <div class="stat-card">
            <div class="stat-icon orange">
              <svg viewBox="0 0 24 24"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
            </div>
            <div class="stat-label">Pending Reviews</div>
            <div class="stat-value">3</div>
            <div class="stat-change negative">1 overdue</div>
          </div>
          <div class="stat-card">
            <div class="stat-icon green">
              <svg viewBox="0 0 24 24"><line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/></svg>
            </div>
            <div class="stat-label">Performance Score</div>
            <div class="stat-value">92</div>
            <div class="stat-change positive">+5 vs last month</div>
          </div>
        </div>

        <!-- Dashboard Grid -->
        <div class="dashboard-grid">
          <!-- Today's Focus -->
          <div class="card">
            <div class="card-header">
              <span class="card-title">Today's Focus</span>
              <button class="btn btn-ghost btn-sm">View All</button>
            </div>
            <div class="card-body">
              <div style="display:flex;flex-direction:column;gap:var(--space-3)">
                <!-- Task Item 1 -->
                <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-3);border-radius:var(--radius-md);background:var(--color-surface);border:1px solid var(--color-border)">
                  <div class="checkbox-box">
                  </div>
                  <div style="flex:1;min-width:0">
                    <div style="font-size:var(--text-sm);font-weight:500;margin-bottom:2px">Complete thermal model simulation report</div>
                    <div style="display:flex;align-items:center;gap:var(--space-2)">
                      <span class="tag tag-blue">BMS-2024</span>
                      <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Due Jan 18</span>
                    </div>
                  </div>
                  <div class="kanban-card-priority">
                    <div class="priority-bar filled high"></div>
                    <div class="priority-bar filled high"></div>
                    <div class="priority-bar filled high"></div>
                    <div class="priority-bar"></div>
                  </div>
                </div>
                <!-- Task Item 2 -->
                <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-3);border-radius:var(--radius-md);background:var(--color-surface);border:1px solid var(--color-border)">
                  <div class="checkbox-box">
                  </div>
                  <div style="flex:1;min-width:0">
                    <div style="font-size:var(--text-sm);font-weight:500;margin-bottom:2px">Safety review document preparation</div>
                    <div style="display:flex;align-items:center;gap:var(--space-2)">
                      <span class="tag tag-red">SR-001</span>
                      <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Due Jan 20</span>
                    </div>
                  </div>
                  <div class="kanban-card-priority">
                    <div class="priority-bar filled urgent"></div>
                    <div class="priority-bar filled urgent"></div>
                    <div class="priority-bar filled urgent"></div>
                    <div class="priority-bar filled urgent"></div>
                  </div>
                </div>
                <!-- Task Item 3 -->
                <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-3);border-radius:var(--radius-md);background:var(--color-surface);border:1px solid var(--color-border)">
                  <div class="checkbox-box checked">
                    <svg viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg>
                  </div>
                  <div style="flex:1;min-width:0">
                    <div style="font-size:var(--text-sm);font-weight:500;margin-bottom:2px;text-decoration:line-through;color:var(--color-text-tertiary)">Update hazard analysis data</div>
                    <div style="display:flex;align-items:center;gap:var(--space-2)">
                      <span class="tag tag-green">Completed</span>
                    </div>
                  </div>
                </div>
                <!-- Task Item 4 -->
                <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-3);border-radius:var(--radius-md);background:var(--color-surface);border:1px solid var(--color-border)">
                  <div class="checkbox-box">
                  </div>
                  <div style="flex:1;min-width:0">
                    <div style="font-size:var(--text-sm);font-weight:500;margin-bottom:2px">Patent application draft - thermal management</div>
                    <div style="display:flex;align-items:center;gap:var(--space-2)">
                      <span class="tag tag-purple">Patent</span>
                      <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Due Jan 25</span>
                    </div>
                  </div>
                  <div class="kanban-card-priority">
                    <div class="priority-bar filled medium"></div>
                    <div class="priority-bar filled medium"></div>
                    <div class="priority-bar"></div>
                    <div class="priority-bar"></div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Project Progress -->
          <div class="card">
            <div class="card-header">
              <span class="card-title">Project Progress</span>
              <button class="btn btn-ghost btn-sm">Details</button>
            </div>
            <div class="card-body">
              <div style="display:flex;flex-direction:column;gap:var(--space-5)">
                <!-- Project 1 -->
                <div>
                  <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-2)">
                    <div style="display:flex;align-items:center;gap:var(--space-2)">
                      <div style="width:8px;height:8px;border-radius:2px;background:var(--color-accent)"></div>
                      <span style="font-size:var(--text-sm);font-weight:500">BMS Safety Certification</span>
                    </div>
                    <span style="font-size:var(--text-xs);color:var(--color-text-tertiary);font-family:var(--font-mono)">72%</span>
                  </div>
                  <div class="progress-bar">
                    <div class="progress-fill purple" style="width:72%"></div>
                  </div>
                  <div style="display:flex;align-items:center;justify-content:space-between;margin-top:var(--space-2)">
                    <div class="avatar-group">
                      <div class="avatar">ZG</div>
                      <div class="avatar blue">LG</div>
                      <div class="avatar green">WL</div>
                    </div>
                    <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Due Jun 30</span>
                  </div>
                </div>
                <!-- Project 2 -->
                <div>
                  <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-2)">
                    <div style="display:flex;align-items:center;gap:var(--space-2)">
                      <div style="width:8px;height:8px;border-radius:2px;background:var(--color-info)"></div>
                      <span style="font-size:var(--text-sm);font-weight:500">Thermal Management R&D</span>
                    </div>
                    <span style="font-size:var(--text-xs);color:var(--color-text-tertiary);font-family:var(--font-mono)">45%</span>
                  </div>
                  <div class="progress-bar">
                    <div class="progress-fill blue" style="width:45%"></div>
                  </div>
                  <div style="display:flex;align-items:center;justify-content:space-between;margin-top:var(--space-2)">
                    <div class="avatar-group">
                      <div class="avatar orange">CK</div>
                      <div class="avatar pink">HL</div>
                    </div>
                    <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Due Mar 15</span>
                  </div>
                </div>
                <!-- Project 3 -->
                <div>
                  <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-2)">
                    <div style="display:flex;align-items:center;gap:var(--space-2)">
                      <div style="width:8px;height:8px;border-radius:2px;background:var(--color-success)"></div>
                      <span style="font-size:var(--text-sm);font-weight:500">Cell Consistency Analysis</span>
                    </div>
                    <span style="font-size:var(--text-xs);color:var(--color-text-tertiary);font-family:var(--font-mono)">88%</span>
                  </div>
                  <div class="progress-bar">
                    <div class="progress-fill green" style="width:88%"></div>
                  </div>
                  <div style="display:flex;align-items:center;justify-content:space-between;margin-top:var(--space-2)">
                    <div class="avatar-group">
                      <div class="avatar">ZG</div>
                      <div class="avatar blue">LG</div>
                    </div>
                    <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Due Feb 28</span>
                  </div>
                </div>
                <!-- Project 4 -->
                <div>
                  <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-2)">
                    <div style="display:flex;align-items:center;gap:var(--space-2)">
                      <div style="width:8px;height:8px;border-radius:2px;background:var(--color-warning)"></div>
                      <span style="font-size:var(--text-sm);font-weight:500">FMEA Documentation</span>
                    </div>
                    <span style="font-size:var(--text-xs);color:var(--color-text-tertiary);font-family:var(--font-mono)">31%</span>
                  </div>
                  <div class="progress-bar">
                    <div class="progress-fill orange" style="width:31%"></div>
                  </div>
                  <div style="display:flex;align-items:center;justify-content:space-between;margin-top:var(--space-2)">
                    <div class="avatar-group">
                      <div class="avatar green">WL</div>
                    </div>
                    <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Due Apr 20</span>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Recent Activity Timeline -->
          <div class="card">
            <div class="card-header">
              <span class="card-title">Recent Activity</span>
              <button class="btn btn-ghost btn-sm">View All</button>
            </div>
            <div class="card-body">
              <div class="timeline">
                <div class="timeline-item">
                  <div class="timeline-dot green"></div>
                  <div class="timeline-content">
                    <strong>Li Gong</strong> completed task <span style="color:var(--color-accent-text)">"Cell testing data collation"</span>
                  </div>
                  <div class="timeline-time">15 min ago</div>
                </div>
                <div class="timeline-item">
                  <div class="timeline-dot purple"></div>
                  <div class="timeline-content">
                    Safety review <span style="color:var(--color-accent-text)">SR-001</span> status changed to <span class="tag tag-orange" style="font-size:10px">Under Review</span>
                  </div>
                  <div class="timeline-time">1 hour ago</div>
                </div>
                <div class="timeline-item">
                  <div class="timeline-dot blue"></div>
                  <div class="timeline-content">
                    <strong>Wang Lei</strong> submitted patent disclosure <span style="color:var(--color-accent-text)">"Adaptive thermal management method"</span>
                  </div>
                  <div class="timeline-time">3 hours ago</div>
                </div>
                <div class="timeline-item">
                  <div class="timeline-dot orange"></div>
                  <div class="timeline-content">
                    Project <span style="color:var(--color-accent-text)">BMS Safety Certification</span> milestone "Phase 2 Validation" approaching deadline
                  </div>
                  <div class="timeline-time">Yesterday</div>
                </div>
                <div class="timeline-item">
                  <div class="timeline-dot"></div>
                  <div class="timeline-content">
                    Monthly performance report for December has been generated
                  </div>
                  <div class="timeline-time">2 days ago</div>
                </div>
              </div>
            </div>
          </div>

          <!-- Safety Review Alerts -->
          <div class="card">
            <div class="card-header">
              <span class="card-title">Safety Review Alerts</span>
              <span class="tag tag-red">3 Active</span>
            </div>
            <div class="card-body">
              <div style="display:flex;flex-direction:column;gap:var(--space-3)">
                <div style="display:flex;gap:var(--space-3);padding:var(--space-3);border-radius:var(--radius-md);background:var(--color-danger-subtle);border:1px solid rgba(239,68,68,0.15)">
                  <div style="width:32px;height:32px;border-radius:var(--radius-md);background:var(--color-danger-subtle);display:flex;align-items:center;justify-content:center;flex-shrink:0;color:var(--color-danger)">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"/><line x1="12" y1="9" x2="12" y2="13"/><line x1="12" y1="17" x2="12.01" y2="17"/></svg>
                  </div>
                  <div style="flex:1">
                    <div style="font-size:var(--text-sm);font-weight:500;margin-bottom:2px">SR-001: Thermal runaway risk assessment overdue</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-tertiary)">BMS Safety Certification -- 3 days overdue</div>
                  </div>
                  <button class="btn btn-sm btn-secondary">Review</button>
                </div>
                <div style="display:flex;gap:var(--space-3);padding:var(--space-3);border-radius:var(--radius-md);background:var(--color-warning-subtle);border:1px solid rgba(245,158,11,0.15)">
                  <div style="width:32px;height:32px;border-radius:var(--radius-md);background:var(--color-warning-subtle);display:flex;align-items:center;justify-content:center;flex-shrink:0;color:var(--color-warning)">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
                  </div>
                  <div style="flex:1">
                    <div style="font-size:var(--text-sm);font-weight:500;margin-bottom:2px">SR-002: Electrical isolation test pending</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-tertiary)">BMS Safety Certification -- Due in 5 days</div>
                  </div>
                  <button class="btn btn-sm btn-secondary">Review</button>
                </div>
                <div style="display:flex;gap:var(--space-3);padding:var(--space-3);border-radius:var(--radius-md);border:1px solid var(--color-border)">
                  <div style="width:32px;height:32px;border-radius:var(--radius-md);background:var(--color-info-subtle);display:flex;align-items:center;justify-content:center;flex-shrink:0;color:var(--color-info)">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
                  </div>
                  <div style="flex:1">
                    <div style="font-size:var(--text-sm);font-weight:500;margin-bottom:2px">SR-003: FMEA update review scheduled</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-tertiary)">FMEA Documentation -- Scheduled Jan 22</div>
                  </div>
                  <button class="btn btn-sm btn-secondary">Details</button>
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
     PAGE 2 — TASK MANAGEMENT (Kanban View)
     ============================================================ -->
<div class="page-section" id="page-tasks">
  <div class="app-shell">
    <aside class="sidebar">
      <div class="sidebar-header">
        <div class="sidebar-logo">B</div>
        <span class="sidebar-title">BST Platform</span>
        <span class="sidebar-version">v2.0</span>
      </div>
      <nav class="sidebar-nav">
        <div class="nav-section-label">Overview</div>
        <div class="nav-item">
          <span class="nav-icon"><svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg></span>
          Dashboard
        </div>
        <div class="nav-section-label">Workspace</div>
        <div class="nav-item active">
          <span class="nav-icon"><svg viewBox="0 0 24 24"><path d="M9 11l3 3L22 4"/><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/></svg></span>
          Task Management
          <span class="nav-badge muted">12</span>
        </div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg></span>Project Center</div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg></span>Safety Review</div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/></svg></span>Performance</div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg></span>Patent / IP</div>
      </nav>
      <div class="sidebar-footer">
        <div class="sidebar-user">
          <div class="user-avatar">ZG</div>
          <div class="user-info"><div class="user-name">Zhang Gong</div><div class="user-role">Senior Engineer</div></div>
        </div>
      </div>
    </aside>

    <div class="main-content">
      <header class="topbar">
        <div class="topbar-breadcrumb">
          Workspace <span class="breadcrumb-sep">/</span> <span>Task Management</span>
        </div>
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
              <p class="page-subtitle">Manage and track all your tasks across projects.</p>
            </div>
            <div class="btn-group">
              <div class="view-switcher">
                <button class="view-switcher-btn active">
                  <svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/></svg>
                  Board
                </button>
                <button class="view-switcher-btn">
                  <svg viewBox="0 0 24 24"><line x1="8" y1="6" x2="21" y2="6"/><line x1="8" y1="12" x2="21" y2="12"/><line x1="8" y1="18" x2="21" y2="18"/><line x1="3" y1="6" x2="3.01" y2="6"/><line x1="3" y1="12" x2="3.01" y2="12"/><line x1="3" y1="18" x2="3.01" y2="18"/></svg>
                  List
                </button>
                <button class="view-switcher-btn">
                  <svg viewBox="0 0 24 24"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
                  Calendar
                </button>
              </div>
              <button class="btn btn-primary">
                <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
                New Task
              </button>
            </div>
          </div>
        </div>

        <!-- Filter Bar -->
        <div class="filter-bar">
          <button class="filter-chip active">
            <span class="status-dot in-progress"></span>
            All Tasks
          </button>
          <button class="filter-chip">
            <svg viewBox="0 0 24 24"><polygon points="22 3 2 3 10 12.46 10 19 14 21 14 12.46 22 3"/></svg>
            Priority
          </button>
          <button class="filter-chip">
            <svg viewBox="0 0 24 24"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
            Assignee
          </button>
          <button class="filter-chip">
            <svg viewBox="0 0 24 24"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/></svg>
            Due Date
          </button>
          <button class="filter-chip">
            <svg viewBox="0 0 24 24"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg>
            Project
          </button>
        </div>

        <!-- Kanban Board -->
        <div class="kanban-board">
          <!-- Column: Backlog -->
          <div class="kanban-column">
            <div class="kanban-column-header">
              <span class="status-dot todo"></span>
              <span class="kanban-column-title">Backlog</span>
              <span class="kanban-column-count">4</span>
            </div>
            <div class="kanban-card">
              <div class="kanban-card-id">TSK-024</div>
              <div class="kanban-card-title">Update DFMEA documentation for battery module design changes</div>
              <div class="kanban-card-meta">
                <div class="kanban-card-tags">
                  <span class="tag tag-blue" style="font-size:10px;padding:1px 6px">BMS-2024</span>
                </div>
                <div class="kanban-card-avatar">WL</div>
              </div>
            </div>
            <div class="kanban-card">
              <div class="kanban-card-id">TSK-023</div>
              <div class="kanban-card-title">Prepare test matrix for cell characterization</div>
              <div class="kanban-card-meta">
                <div class="kanban-card-tags">
                  <span class="tag tag-purple" style="font-size:10px;padding:1px 6px">Research</span>
                </div>
                <div class="kanban-card-avatar" style="background:linear-gradient(135deg,#059669,#22C55E)">LG</div>
              </div>
            </div>
            <div class="kanban-card">
              <div class="kanban-card-id">TSK-022</div>
              <div class="kanban-card-title">Literature review: SOC estimation algorithms</div>
              <div class="kanban-card-meta">
                <div class="kanban-card-tags">
                  <span class="tag tag-default" style="font-size:10px;padding:1px 6px">Low</span>
                </div>
                <div class="kanban-card-avatar">ZG</div>
              </div>
            </div>
            <div class="kanban-add-card">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
              Add task
            </div>
          </div>

          <!-- Column: In Progress -->
          <div class="kanban-column">
            <div class="kanban-column-header">
              <span class="status-dot in-progress"></span>
              <span class="kanban-column-title">In Progress</span>
              <span class="kanban-column-count">3</span>
            </div>
            <div class="kanban-card" style="border-left:3px solid var(--color-danger)">
              <div class="kanban-card-id">TSK-019</div>
              <div class="kanban-card-title">Thermal runaway simulation model validation</div>
              <div style="display:flex;align-items:center;gap:var(--space-2);margin-bottom:var(--space-3)">
                <div class="progress-bar" style="flex:1">
                  <div class="progress-fill orange" style="width:65%"></div>
                </div>
                <span style="font-size:var(--text-xs);color:var(--color-text-quaternary);font-family:var(--font-mono)">65%</span>
              </div>
              <div class="kanban-card-meta">
                <div class="kanban-card-tags">
                  <span class="tag tag-red" style="font-size:10px;padding:1px 6px">Urgent</span>
                </div>
                <div class="kanban-card-avatar">ZG</div>
              </div>
            </div>
            <div class="kanban-card">
              <div class="kanban-card-id">TSK-018</div>
              <div class="kanban-card-title">Safety review document preparation SR-001</div>
              <div style="display:flex;align-items:center;gap:var(--space-2);margin-bottom:var(--space-3)">
                <div class="progress-bar" style="flex:1">
                  <div class="progress-fill blue" style="width:40%"></div>
                </div>
                <span style="font-size:var(--text-xs);color:var(--color-text-quaternary);font-family:var(--font-mono)">40%</span>
              </div>
              <div class="kanban-card-meta">
                <div class="kanban-card-tags">
                  <span class="tag tag-orange" style="font-size:10px;padding:1px 6px">High</span>
                </div>
                <div class="kanban-card-avatar">ZG</div>
              </div>
            </div>
            <div class="kanban-card">
              <div class="kanban-card-id">TSK-017</div>
              <div class="kanban-card-title">Electrical isolation test protocol development</div>
              <div style="display:flex;align-items:center;gap:var(--space-2);margin-bottom:var(--space-3)">
                <div class="progress-bar" style="flex:1">
                  <div class="progress-fill purple" style="width:80%"></div>
                </div>
                <span style="font-size:var(--text-xs);color:var(--color-text-quaternary);font-family:var(--font-mono)">80%</span>
              </div>
              <div class="kanban-card-meta">
                <div class="kanban-card-tags">
                  <span class="tag tag-blue" style="font-size:10px;padding:1px 6px">BMS-2024</span>
                </div>
                <div class="kanban-card-avatar" style="background:linear-gradient(135deg,#059669,#22C55E)">LG</div>
              </div>
            </div>
          </div>

          <!-- Column: In Review -->
          <div class="kanban-column">
            <div class="kanban-column-header">
              <span class="status-dot review"></span>
              <span class="kanban-column-title">In Review</span>
              <span class="kanban-column-count">2</span>
            </div>
            <div class="kanban-card">
              <div class="kanban-card-id">TSK-015</div>
              <div class="kanban-card-title">BMS control algorithm optimization report</div>
              <div class="kanban-card-meta">
                <div class="kanban-card-tags">
                  <span class="tag tag-purple" style="font-size:10px;padding:1px 6px">Review</span>
                </div>
                <div class="kanban-card-avatar" style="background:linear-gradient(135deg,#D97706,#F59E0B)">CK</div>
              </div>
            </div>
            <div class="kanban-card">
              <div class="kanban-card-id">TSK-014</div>
              <div class="kanban-card-title">Cell aging model parameter update</div>
              <div class="kanban-card-meta">
                <div class="kanban-card-tags">
                  <span class="tag tag-blue" style="font-size:10px;padding:1px 6px">Data</span>
                </div>
                <div class="kanban-card-avatar">ZG</div>
              </div>
            </div>
            <div class="kanban-add-card">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
              Add task
            </div>
          </div>

          <!-- Column: Done -->
          <div class="kanban-column">
            <div class="kanban-column-header">
              <span class="status-dot done"></span>
              <span class="kanban-column-title">Done</span>
              <span class="kanban-column-count">8</span>
            </div>
            <div class="kanban-card" style="opacity:0.7">
              <div class="kanban-card-id">TSK-013</div>
              <div class="kanban-card-title">Hazard analysis data compilation and update</div>
              <div class="kanban-card-meta">
                <div class="kanban-card-tags">
                  <span class="tag tag-green" style="font-size:10px;padding:1px 6px">Done</span>
                </div>
                <div class="kanban-card-avatar">ZG</div>
              </div>
            </div>
            <div class="kanban-card" style="opacity:0.7">
              <div class="kanban-card-id">TSK-012</div>
              <div class="kanban-card-title">Voltage monitoring circuit design review</div>
              <div class="kanban-card-meta">
                <div class="kanban-card-tags">
                  <span class="tag tag-green" style="font-size:10px;padding:1px 6px">Done</span>
                </div>
                <div class="kanban-card-avatar" style="background:linear-gradient(135deg,#D97706,#F59E0B)">CK</div>
              </div>
            </div>
            <div class="kanban-card" style="opacity:0.7">
              <div class="kanban-card-id">TSK-011</div>
              <div class="kanban-card-title">SOC estimation accuracy validation report</div>
              <div class="kanban-card-meta">
                <div class="kanban-card-tags">
                  <span class="tag tag-green" style="font-size:10px;padding:1px 6px">Done</span>
                </div>
                <div class="kanban-card-avatar">ZG</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- ============================================================
     PAGE 3 — PROJECT CENTER
     ============================================================ -->
<div class="page-section" id="page-projects">
  <div class="app-shell">
    <aside class="sidebar">
      <div class="sidebar-header">
        <div class="sidebar-logo">B</div>
        <span class="sidebar-title">BST Platform</span>
        <span class="sidebar-version">v2.0</span>
      </div>
      <nav class="sidebar-nav">
        <div class="nav-section-label">Overview</div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg></span>Dashboard</div>
        <div class="nav-section-label">Workspace</div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><path d="M9 11l3 3L22 4"/><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/></svg></span>Task Management</div>
        <div class="nav-item active"><span class="nav-icon"><svg viewBox="0 0 24 24"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg></span>Project Center</div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg></span>Safety Review</div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/></svg></span>Performance</div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg></span>Patent / IP</div>
      </nav>
      <div class="sidebar-footer">
        <div class="sidebar-user"><div class="user-avatar">ZG</div><div class="user-info"><div class="user-name">Zhang Gong</div><div class="user-role">Senior Engineer</div></div></div>
      </div>
    </aside>

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
              <p class="page-subtitle">Manage battery safety projects, track milestones, and coordinate team efforts.</p>
            </div>
            <div class="btn-group">
              <button class="btn btn-secondary">
                <svg viewBox="0 0 24 24"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
                Export
              </button>
              <button class="btn btn-primary">
                <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
                New Project
              </button>
            </div>
          </div>
        </div>

        <!-- Project Tabs -->
        <div class="tabs">
          <div class="tab-item active">All Projects</div>
          <div class="tab-item">Active</div>
          <div class="tab-item">Planning</div>
          <div class="tab-item">Completed</div>
          <div class="tab-item">Archived</div>
        </div>

        <!-- Project Cards Grid -->
        <div class="three-col" style="margin-bottom:var(--space-8)">
          <!-- Project Card 1 -->
          <div class="card" style="cursor:pointer">
            <div class="card-body" style="padding:var(--space-5)">
              <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-4)">
                <div style="display:flex;align-items:center;gap:var(--space-3)">
                  <div style="width:36px;height:36px;border-radius:var(--radius-md);background:linear-gradient(135deg,var(--color-accent),#6366F1);display:flex;align-items:center;justify-content:center">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
                  </div>
                  <div>
                    <div style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">PRJ-001</div>
                    <div style="font-size:var(--text-md);font-weight:600">BMS Safety Certification</div>
                  </div>
                </div>
                <span class="tag tag-green">Active</span>
              </div>
              <p style="font-size:var(--text-sm);color:var(--color-text-tertiary);margin-bottom:var(--space-4);line-height:1.5">Complete functional safety certification for next-gen BMS, covering FMEA, FTA, safety requirements, and validation testing per ISO 26262.</p>
              <div style="margin-bottom:var(--space-4)">
                <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                  <span style="font-size:var(--text-xs);color:var(--color-text-tertiary)">Progress</span>
                  <span style="font-size:var(--text-xs);color:var(--color-text-tertiary);font-family:var(--font-mono)">72%</span>
                </div>
                <div class="progress-bar"><div class="progress-fill purple" style="width:72%"></div></div>
              </div>
              <div style="display:flex;align-items:center;justify-content:space-between">
                <div class="avatar-group">
                  <div class="avatar">ZG</div>
                  <div class="avatar blue">LG</div>
                  <div class="avatar green">WL</div>
                  <div class="avatar orange">CK</div>
                  <div class="avatar more">+2</div>
                </div>
                <div style="display:flex;align-items:center;gap:var(--space-2)">
                  <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="var(--color-text-quaternary)" stroke-width="2"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/></svg>
                  <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Jun 30, 2024</span>
                </div>
              </div>
            </div>
          </div>

          <!-- Project Card 2 -->
          <div class="card" style="cursor:pointer">
            <div class="card-body" style="padding:var(--space-5)">
              <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-4)">
                <div style="display:flex;align-items:center;gap:var(--space-3)">
                  <div style="width:36px;height:36px;border-radius:var(--radius-md);background:linear-gradient(135deg,#2563EB,#3B82F6);display:flex;align-items:center;justify-content:center">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z"/></svg>
                  </div>
                  <div>
                    <div style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">PRJ-002</div>
                    <div style="font-size:var(--text-md);font-weight:600">Thermal Management R&D</div>
                  </div>
                </div>
                <span class="tag tag-green">Active</span>
              </div>
              <p style="font-size:var(--text-sm);color:var(--color-text-tertiary);margin-bottom:var(--space-4);line-height:1.5">Research and develop advanced thermal management solutions for high-energy-density battery packs, including simulation and prototype testing.</p>
              <div style="margin-bottom:var(--space-4)">
                <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                  <span style="font-size:var(--text-xs);color:var(--color-text-tertiary)">Progress</span>
                  <span style="font-size:var(--text-xs);color:var(--color-text-tertiary);font-family:var(--font-mono)">45%</span>
                </div>
                <div class="progress-bar"><div class="progress-fill blue" style="width:45%"></div></div>
              </div>
              <div style="display:flex;align-items:center;justify-content:space-between">
                <div class="avatar-group">
                  <div class="avatar orange">CK</div>
                  <div class="avatar pink">HL</div>
                </div>
                <div style="display:flex;align-items:center;gap:var(--space-2)">
                  <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="var(--color-text-quaternary)" stroke-width="2"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/></svg>
                  <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Mar 15, 2024</span>
                </div>
              </div>
            </div>
          </div>

          <!-- Project Card 3 -->
          <div class="card" style="cursor:pointer">
            <div class="card-body" style="padding:var(--space-5)">
              <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-4)">
                <div style="display:flex;align-items:center;gap:var(--space-3)">
                  <div style="width:36px;height:36px;border-radius:var(--radius-md);background:linear-gradient(135deg,#059669,#22C55E);display:flex;align-items:center;justify-content:center">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/></svg>
                  </div>
                  <div>
                    <div style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">PRJ-003</div>
                    <div style="font-size:var(--text-md);font-weight:600">Cell Consistency Analysis</div>
                  </div>
                </div>
                <span class="tag tag-blue">Near Complete</span>
              </div>
              <p style="font-size:var(--text-sm);color:var(--color-text-tertiary);margin-bottom:var(--space-4);line-height:1.5">Statistical analysis of cell-to-cell variation and its impact on pack-level performance and safety margins.</p>
              <div style="margin-bottom:var(--space-4)">
                <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                  <span style="font-size:var(--text-xs);color:var(--color-text-tertiary)">Progress</span>
                  <span style="font-size:var(--text-xs);color:var(--color-text-tertiary);font-family:var(--font-mono)">88%</span>
                </div>
                <div class="progress-bar"><div class="progress-fill green" style="width:88%"></div></div>
              </div>
              <div style="display:flex;align-items:center;justify-content:space-between">
                <div class="avatar-group">
                  <div class="avatar">ZG</div>
                  <div class="avatar blue">LG</div>
                </div>
                <div style="display:flex;align-items:center;gap:var(--space-2)">
                  <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="var(--color-text-quaternary)" stroke-width="2"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/></svg>
                  <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Feb 28, 2024</span>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Project Detail Section: Gantt-style Timeline -->
        <div style="margin-bottom:var(--space-6)">
          <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-4)">
            <h2 style="font-size:var(--text-xl);font-weight:600">Project Timeline</h2>
            <div class="view-switcher">
              <button class="view-switcher-btn active">Timeline</button>
              <button class="view-switcher-btn">Table</button>
            </div>
          </div>
          <div class="gantt-placeholder">
            <div class="gantt-header-row">
              <div class="gantt-header-cell">Task</div>
              <div class="gantt-header-cell">Jan</div>
              <div class="gantt-header-cell">Feb</div>
              <div class="gantt-header-cell">Mar</div>
              <div class="gantt-header-cell">Apr</div>
              <div class="gantt-header-cell">May</div>
              <div class="gantt-header-cell">Jun</div>
              <div class="gantt-header-cell">Jul</div>
              <div class="gantt-header-cell">Aug</div>
              <div class="gantt-header-cell">Sep</div>
              <div class="gantt-header-cell">Oct</div>
              <div class="gantt-header-cell">Nov</div>
              <div class="gantt-header-cell">Dec</div>
            </div>
            <div class="gantt-row">
              <div class="gantt-task-name">FMEA Analysis</div>
              <div class="gantt-bar-container"><div class="gantt-bar" style="left:0%;width:25%"></div></div>
            </div>
            <div class="gantt-row">
              <div class="gantt-task-name">FTA Development</div>
              <div class="gantt-bar-container"><div class="gantt-bar blue" style="left:8%;width:20%"></div></div>
            </div>
            <div class="gantt-row">
              <div class="gantt-task-name">Safety Requirements</div>
              <div class="gantt-bar-container"><div class="gantt-bar green" style="left:16%;width:22%"></div></div>
            </div>
            <div class="gantt-row">
              <div class="gantt-task-name">Design Validation</div>
              <div class="gantt-bar-container"><div class="gantt-bar orange" style="left:30%;width:25%"></div></div>
            </div>
            <div class="gantt-row">
              <div class="gantt-task-name">Test Verification</div>
              <div class="gantt-bar-container"><div class="gantt-bar" style="left:42%;width:20%"></div></div>
            </div>
            <div class="gantt-row">
              <div class="gantt-task-name">Thermal Simulation</div>
              <div class="gantt-bar-container"><div class="gantt-bar blue" style="left:5%;width:18%"></div></div>
            </div>
            <div class="gantt-row">
              <div class="gantt-task-name">Prototype Testing</div>
              <div class="gantt-bar-container"><div class="gantt-bar red" style="left:20%;width:15%"></div></div>
            </div>
            <div class="gantt-row">
              <div class="gantt-task-name">Final Report</div>
              <div class="gantt-bar-container"><div class="gantt-bar green" style="left:55%;width:12%"></div></div>
            </div>
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
  <div class="app-shell">
    <aside class="sidebar">
      <div class="sidebar-header">
        <div class="sidebar-logo">B</div>
        <span class="sidebar-title">BST Platform</span>
        <span class="sidebar-version">v2.0</span>
      </div>
      <nav class="sidebar-nav">
        <div class="nav-section-label">Overview</div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg></span>Dashboard</div>
        <div class="nav-section-label">Workspace</div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><path d="M9 11l3 3L22 4"/><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/></svg></span>Task Management</div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg></span>Project Center</div>
        <div class="nav-item active"><span class="nav-icon"><svg viewBox="0 0 24 24"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg></span>Safety Review<span class="nav-badge">1</span></div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/></svg></span>Performance</div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg></span>Patent / IP</div>
      </nav>
      <div class="sidebar-footer">
        <div class="sidebar-user"><div class="user-avatar">ZG</div><div class="user-info"><div class="user-name">Zhang Gong</div><div class="user-role">Senior Engineer</div></div></div>
      </div>
    </aside>

    <div class="main-content">
      <header class="topbar">
        <div class="topbar-breadcrumb">Workspace <span class="breadcrumb-sep">/</span> <span>Safety Review</span></div>
        <div class="topbar-actions">
          <div class="search-trigger">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
            Search reviews...
            <span class="search-shortcut"><kbd>Ctrl</kbd><kbd>K</kbd></span>
          </div>
        </div>
      </header>

      <div class="content-area">
        <div class="page-header">
          <div class="page-header-top">
            <div>
              <h1 class="page-title">Safety Review</h1>
              <p class="page-subtitle">Manage safety assessments, FMEA reviews, NUDD checklists, and risk tracking.</p>
            </div>
            <button class="btn btn-primary">
              <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
              Initiate Review
            </button>
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
        <div class="tabs">
          <div class="tab-item active">Active Reviews</div>
          <div class="tab-item">NUDD Checklist</div>
          <div class="tab-item">Risk Matrix</div>
          <div class="tab-item">Issue Tracking</div>
          <div class="tab-item">Test Validation</div>
          <div class="tab-item">History</div>
        </div>

        <!-- Active Reviews Table -->
        <div class="data-table-container">
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
                <td><span class="tag tag-purple" style="font-size:10px">BMS Safety Cert</span></td>
                <td>Risk Assessment</td>
                <td><span class="tag tag-red">Critical</span></td>
                <td>
                  <div style="display:flex;align-items:center;gap:var(--space-2)">
                    <div class="kanban-card-avatar" style="width:20px;height:20px;font-size:8px">ZG</div>
                    Zhang Gong
                  </div>
                </td>
                <td style="color:var(--color-danger)">Jan 15 (Overdue)</td>
                <td><span class="tag tag-orange">In Review</span></td>
              </tr>
              <tr>
                <td class="cell-id">SR-002</td>
                <td class="cell-primary">Electrical Isolation Test Review</td>
                <td><span class="tag tag-purple" style="font-size:10px">BMS Safety Cert</span></td>
                <td>Test Validation</td>
                <td><span class="tag tag-orange">High</span></td>
                <td>
                  <div style="display:flex;align-items:center;gap:var(--space-2)">
                    <div class="kanban-card-avatar" style="width:20px;height:20px;font-size:8px;background:linear-gradient(135deg,#059669,#22C55E)">LG</div>
                    Li Gong
                  </div>
                </td>
                <td>Jan 20</td>
                <td><span class="tag tag-blue">Pending</span></td>
              </tr>
              <tr>
                <td class="cell-id">SR-003</td>
                <td class="cell-primary">FMEA Update for Control Algorithm</td>
                <td><span class="tag tag-blue" style="font-size:10px">FMEA Doc</span></td>
                <td>NUDD Analysis</td>
                <td><span class="tag tag-default">Medium</span></td>
                <td>
                  <div style="display:flex;align-items:center;gap:var(--space-2)">
                    <div class="kanban-card-avatar" style="width:20px;height:20px;font-size:8px;background:linear-gradient(135deg,#D97706,#F59E0B)">CK</div>
                    Chen Ke
                  </div>
                </td>
                <td>Jan 22</td>
                <td><span class="tag tag-blue">Scheduled</span></td>
              </tr>
              <tr>
                <td class="cell-id">SR-004</td>
                <td class="cell-primary">Vibration & Shock Safety Validation</td>
                <td><span class="tag tag-purple" style="font-size:10px">BMS Safety Cert</span></td>
                <td>Initiation</td>
                <td><span class="tag tag-default">Low</span></td>
                <td>
                  <div style="display:flex;align-items:center;gap:var(--space-2)">
                    <div class="kanban-card-avatar" style="width:20px;height:20px;font-size:8px;background:linear-gradient(135deg,#DB2777,#EC4899)">HL</div>
                    Huang Lei
                  </div>
                </td>
                <td>Feb 10</td>
                <td><span class="tag tag-default">Draft</span></td>
              </tr>
            </tbody>
          </table>
        </div>

        <!-- Risk Matrix Section -->
        <div style="margin-top:var(--space-8)">
          <h2 style="font-size:var(--text-xl);font-weight:600;margin-bottom:var(--space-4)">Risk Assessment Matrix</h2>
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
                <div style="display:flex;justify-content:space-between;margin-top:var(--space-3)">
                  <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Severity --></span>
                </div>
              </div>
            </div>

            <!-- NUDD Checklist Summary -->
            <div class="card">
              <div class="card-header">
                <span class="card-title">NUDD Checklist Summary</span>
                <button class="btn btn-ghost btn-sm">Edit</button>
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
                    <div style="margin-top:var(--space-2)">
                      <div class="checkbox-item"><div class="checkbox-box checked"><svg viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg></div>New high-voltage topology (Buck to LLC)</div>
                      <div class="checkbox-item"><div class="checkbox-box checked"><svg viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg></div>New cell supplier</div>
                      <div class="checkbox-item"><div class="checkbox-box checked"><svg viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg></div>New BMS algorithm</div>
                      <div class="checkbox-item"><div class="checkbox-box"></div>New connector design</div>
                    </div>
                  </div>
                  <div class="divider"></div>
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
                  <div class="divider"></div>
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
                  <div class="divider"></div>
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
</div>

<!-- ============================================================
     PAGE 5 — PERFORMANCE MANAGEMENT
     ============================================================ -->
<div class="page-section" id="page-performance">
  <div class="app-shell">
    <aside class="sidebar">
      <div class="sidebar-header">
        <div class="sidebar-logo">B</div>
        <span class="sidebar-title">BST Platform</span>
        <span class="sidebar-version">v2.0</span>
      </div>
      <nav class="sidebar-nav">
        <div class="nav-section-label">Overview</div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg></span>Dashboard</div>
        <div class="nav-section-label">Workspace</div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><path d="M9 11l3 3L22 4"/><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/></svg></span>Task Management</div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg></span>Project Center</div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg></span>Safety Review</div>
        <div class="nav-item active"><span class="nav-icon"><svg viewBox="0 0 24 24"><line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/></svg></span>Performance</div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg></span>Patent / IP</div>
      </nav>
      <div class="sidebar-footer">
        <div class="sidebar-user"><div class="user-avatar">ZG</div><div class="user-info"><div class="user-name">Zhang Gong</div><div class="user-role">Senior Engineer</div></div></div>
      </div>
    </aside>

    <div class="main-content">
      <header class="topbar">
        <div class="topbar-breadcrumb">Workspace <span class="breadcrumb-sep">/</span> <span>Performance Management</span></div>
        <div class="topbar-actions">
          <div class="search-trigger">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
            Search...
            <span class="search-shortcut"><kbd>Ctrl</kbd><kbd>K</kbd></span>
          </div>
        </div>
      </header>

      <div class="content-area">
        <div class="page-header">
          <div class="page-header-top">
            <div>
              <h1 class="page-title">Performance Management</h1>
              <p class="page-subtitle">Track KPIs, review monthly performance, and manage goal-setting workflows.</p>
            </div>
            <div class="btn-group">
              <button class="btn btn-secondary">
                <svg viewBox="0 0 24 24"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
                Export Report
              </button>
              <button class="btn btn-primary">
                <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
                New Goal
              </button>
            </div>
          </div>
        </div>

        <div class="tabs">
          <div class="tab-item active">Overview</div>
          <div class="tab-item">Monthly Goals</div>
          <div class="tab-item">KPI Tracking</div>
          <div class="tab-item">Team Analytics</div>
          <div class="tab-item">Review History</div>
        </div>

        <!-- Performance Stat Cards -->
        <div class="stat-grid" style="margin-bottom:var(--space-6)">
          <div class="stat-card">
            <div class="stat-label">Overall Score</div>
            <div style="display:flex;align-items:center;gap:var(--space-4)">
              <div class="score-ring">
                <svg viewBox="0 0 80 80">
                  <circle class="ring-bg" cx="40" cy="40" r="36"/>
                  <circle class="ring-fill green" cx="40" cy="40" r="36" style="stroke-dashoffset:18"/>
                </svg>
                <span class="score-value">92</span>
              </div>
              <div>
                <div class="stat-change positive">+5 vs last month</div>
                <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:var(--space-1)">Department avg: 85</div>
              </div>
            </div>
          </div>
          <div class="stat-card">
            <div class="stat-label">Task Completion Rate</div>
            <div class="stat-value">87%</div>
            <div style="margin-top:var(--space-3)">
              <div class="progress-bar"><div class="progress-fill green" style="width:87%"></div></div>
            </div>
            <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:var(--space-2)">21/24 tasks completed on time</div>
          </div>
          <div class="stat-card">
            <div class="stat-label">Patent Output</div>
            <div class="stat-value">3</div>
            <div class="stat-change positive">Target: 4 / year</div>
            <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:var(--space-1)">1 granted, 2 pending</div>
          </div>
          <div class="stat-card">
            <div class="stat-label">Innovation Index</div>
            <div class="stat-value">78</div>
            <div class="stat-change positive">+12 vs last quarter</div>
            <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:var(--space-1)">Based on patents + proposals</div>
          </div>
        </div>

        <div class="two-col">
          <!-- Monthly Goal Breakdown -->
          <div class="card">
            <div class="card-header">
              <span class="card-title">January 2024 Goal Breakdown</span>
              <span class="tag tag-blue">Current Month</span>
            </div>
            <div class="card-body">
              <div style="display:flex;flex-direction:column;gap:var(--space-1)">
                <!-- Goal Item - Airtable row style -->
                <div style="display:grid;grid-template-columns:2fr 80px 80px 100px 60px;align-items:center;padding:var(--space-3);border-radius:var(--radius-md);background:var(--color-surface);border:1px solid var(--color-border);font-size:var(--text-sm);gap:var(--space-3)">
                  <div>
                    <div style="font-weight:500">Thermal runaway simulation report</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">BMS-2024 Project</div>
                  </div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Weight: 30%</div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Jan 18</div>
                  <div class="progress-bar" style="height:3px"><div class="progress-fill purple" style="width:65%"></div></div>
                  <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-tertiary);text-align:right">65%</span>
                </div>
                <div style="display:grid;grid-template-columns:2fr 80px 80px 100px 60px;align-items:center;padding:var(--space-3);border-radius:var(--radius-md);background:var(--color-surface);border:1px solid var(--color-border);font-size:var(--text-sm);gap:var(--space-3)">
                  <div>
                    <div style="font-weight:500">Safety review document preparation</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">BMS-2024 Project</div>
                  </div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Weight: 20%</div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Jan 20</div>
                  <div class="progress-bar" style="height:3px"><div class="progress-fill blue" style="width:40%"></div></div>
                  <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-tertiary);text-align:right">40%</span>
                </div>
                <div style="display:grid;grid-template-columns:2fr 80px 80px 100px 60px;align-items:center;padding:var(--space-3);border-radius:var(--radius-md);background:var(--color-surface);border:1px solid var(--color-border);font-size:var(--text-sm);gap:var(--space-3)">
                  <div>
                    <div style="font-weight:500">Thermal diffusion test plan</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">THERM-03 Project</div>
                  </div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Weight: 40%</div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Jan 28</div>
                  <div class="progress-bar" style="height:3px"><div class="progress-fill orange" style="width:20%"></div></div>
                  <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-tertiary);text-align:right">20%</span>
                </div>
                <div style="display:grid;grid-template-columns:2fr 80px 80px 100px 60px;align-items:center;padding:var(--space-3);border-radius:var(--radius-md);background:var(--color-surface);border:1px solid var(--color-border);font-size:var(--text-sm);gap:var(--space-3)">
                  <div>
                    <div style="font-weight:500">Department meetings & tech sharing</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Routine Work</div>
                  </div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Weight: 10%</div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Ongoing</div>
                  <div class="progress-bar" style="height:3px"><div class="progress-fill green" style="width:100%"></div></div>
                  <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-tertiary);text-align:right">100%</span>
                </div>
              </div>
              <div style="display:flex;align-items:center;justify-content:space-between;margin-top:var(--space-4);padding-top:var(--space-3);border-top:1px solid var(--color-border)">
                <span style="font-size:var(--text-xs);color:var(--color-text-tertiary)">Total Weight: 100%</span>
                <button class="btn btn-sm btn-secondary">Submit for Approval</button>
              </div>
            </div>
          </div>

          <!-- Performance Trend Chart Placeholder -->
          <div class="card">
            <div class="card-header">
              <span class="card-title">Score Trend (6 Months)</span>
              <div class="view-switcher">
                <button class="view-switcher-btn active">Line</button>
                <button class="view-switcher-btn">Bar</button>
              </div>
            </div>
            <div class="card-body">
              <div style="position:relative;height:260px;display:flex;flex-direction:column;justify-content:space-between">
                <!-- Y-axis -->
                <div style="display:flex;align-items:center;gap:var(--space-3)">
                  <span style="font-size:var(--text-xs);color:var(--color-text-quaternary);width:24px;text-align:right">100</span>
                  <div style="flex:1;height:1px;background:var(--color-border)"></div>
                </div>
                <div style="display:flex;align-items:center;gap:var(--space-3)">
                  <span style="font-size:var(--text-xs);color:var(--color-text-quaternary);width:24px;text-align:right">90</span>
                  <div style="flex:1;height:1px;background:var(--color-border)"></div>
                </div>
                <div style="display:flex;align-items:center;gap:var(--space-3)">
                  <span style="font-size:var(--text-xs);color:var(--color-text-quaternary);width:24px;text-align:right">80</span>
                  <div style="flex:1;height:1px;background:var(--color-border)"></div>
                </div>
                <div style="display:flex;align-items:center;gap:var(--space-3)">
                  <span style="font-size:var(--text-xs);color:var(--color-text-quaternary);width:24px;text-align:right">70</span>
                  <div style="flex:1;height:1px;background:var(--color-border)"></div>
                </div>
                <div style="display:flex;align-items:center;gap:var(--space-3)">
                  <span style="font-size:var(--text-xs);color:var(--color-text-quaternary);width:24px;text-align:right">60</span>
                  <div style="flex:1;height:1px;background:var(--color-border)"></div>
                </div>
                <!-- Simulated line chart area -->
                <div style="position:absolute;bottom:30px;left:40px;right:0;top:10px;display:flex;align-items:flex-end;justify-content:space-around;">
                  <div style="display:flex;flex-direction:column;align-items:center;gap:var(--space-1)">
                    <div style="width:8px;height:70%;background:linear-gradient(to top,var(--color-accent),rgba(139,92,246,0.3));border-radius:4px 4px 0 0"></div>
                    <span style="font-size:9px;color:var(--color-text-quaternary)">Aug</span>
                  </div>
                  <div style="display:flex;flex-direction:column;align-items:center;gap:var(--space-1)">
                    <div style="width:8px;height:75%;background:linear-gradient(to top,var(--color-accent),rgba(139,92,246,0.3));border-radius:4px 4px 0 0"></div>
                    <span style="font-size:9px;color:var(--color-text-quaternary)">Sep</span>
                  </div>
                  <div style="display:flex;flex-direction:column;align-items:center;gap:var(--space-1)">
                    <div style="width:8px;height:68%;background:linear-gradient(to top,var(--color-accent),rgba(139,92,246,0.3));border-radius:4px 4px 0 0"></div>
                    <span style="font-size:9px;color:var(--color-text-quaternary)">Oct</span>
                  </div>
                  <div style="display:flex;flex-direction:column;align-items:center;gap:var(--space-1)">
                    <div style="width:8px;height:80%;background:linear-gradient(to top,var(--color-accent),rgba(139,92,246,0.3));border-radius:4px 4px 0 0"></div>
                    <span style="font-size:9px;color:var(--color-text-quaternary)">Nov</span>
                  </div>
                  <div style="display:flex;flex-direction:column;align-items:center;gap:var(--space-1)">
                    <div style="width:8px;height:85%;background:linear-gradient(to top,var(--color-accent),rgba(139,92,246,0.3));border-radius:4px 4px 0 0"></div>
                    <span style="font-size:9px;color:var(--color-text-quaternary)">Dec</span>
                  </div>
                  <div style="display:flex;flex-direction:column;align-items:center;gap:var(--space-1)">
                    <div style="width:8px;height:92%;background:linear-gradient(to top,var(--color-accent),rgba(139,92,246,0.5));border-radius:4px 4px 0 0;box-shadow:0 0 8px rgba(139,92,246,0.3)"></div>
                    <span style="font-size:9px;color:var(--color-accent-text);font-weight:600">Jan</span>
                  </div>
                </div>
              </div>
              <!-- Legend -->
              <div style="display:flex;gap:var(--space-5);margin-top:var(--space-4);padding-top:var(--space-3);border-top:1px solid var(--color-border)">
                <div style="display:flex;align-items:center;gap:var(--space-2);font-size:var(--text-xs);color:var(--color-text-tertiary)">
                  <div style="width:10px;height:3px;border-radius:2px;background:var(--color-accent)"></div>
                  Your Score
                </div>
                <div style="display:flex;align-items:center;gap:var(--space-2);font-size:var(--text-xs);color:var(--color-text-tertiary)">
                  <div style="width:10px;height:3px;border-radius:2px;background:var(--color-text-quaternary)"></div>
                  Dept. Average
                </div>
              </div>
            </div>
          </div>

          <!-- KPI Dimension Breakdown -->
          <div class="card">
            <div class="card-header">
              <span class="card-title">KPI Dimension Breakdown</span>
              <button class="btn btn-ghost btn-sm">Detail</button>
            </div>
            <div class="card-body">
              <div style="display:flex;flex-direction:column;gap:var(--space-5)">
                <!-- Dimension 1 -->
                <div>
                  <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-2)">
                    <span style="font-size:var(--text-sm);font-weight:500">Task Completion</span>
                    <span style="font-size:var(--text-sm);font-weight:600;color:var(--color-success)">95</span>
                  </div>
                  <div class="progress-bar" style="height:6px"><div class="progress-fill green" style="width:95%"></div></div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:var(--space-1)">Weight: 30% | Weighted Score: 28.5</div>
                </div>
                <!-- Dimension 2 -->
                <div>
                  <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-2)">
                    <span style="font-size:var(--text-sm);font-weight:500">Quality Score</span>
                    <span style="font-size:var(--text-sm);font-weight:600;color:var(--color-info)">88</span>
                  </div>
                  <div class="progress-bar" style="height:6px"><div class="progress-fill blue" style="width:88%"></div></div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:var(--space-1)">Weight: 25% | Weighted Score: 22.0</div>
                </div>
                <!-- Dimension 3 -->
                <div>
                  <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-2)">
                    <span style="font-size:var(--text-sm);font-weight:500">Timeliness</span>
                    <span style="font-size:var(--text-sm);font-weight:600;color:var(--color-accent)">90</span>
                  </div>
                  <div class="progress-bar" style="height:6px"><div class="progress-fill purple" style="width:90%"></div></div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:var(--space-1)">Weight: 20% | Weighted Score: 18.0</div>
                </div>
                <!-- Dimension 4 -->
                <div>
                  <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-2)">
                    <span style="font-size:var(--text-sm);font-weight:500">Innovation</span>
                    <span style="font-size:var(--text-sm);font-weight:600;color:var(--color-warning)">78</span>
                  </div>
                  <div class="progress-bar" style="height:6px"><div class="progress-fill orange" style="width:78%"></div></div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:var(--space-1)">Weight: 15% | Weighted Score: 11.7</div>
                </div>
                <!-- Dimension 5 -->
                <div>
                  <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-2)">
                    <span style="font-size:var(--text-sm);font-weight:500">Collaboration</span>
                    <span style="font-size:var(--text-sm);font-weight:600;color:var(--color-success)">92</span>
                  </div>
                  <div class="progress-bar" style="height:6px"><div class="progress-fill green" style="width:92%"></div></div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:var(--space-1)">Weight: 10% | Weighted Score: 9.2</div>
                </div>
              </div>
              <div style="margin-top:var(--space-5);padding-top:var(--space-4);border-top:1px solid var(--color-border);display:flex;justify-content:space-between;align-items:center">
                <span style="font-size:var(--text-sm);font-weight:600">Total Weighted Score</span>
                <span style="font-size:var(--text-xl);font-weight:700;color:var(--color-accent)">89.4</span>
              </div>
            </div>
          </div>

          <!-- Contribution Heatmap -->
          <div class="card">
            <div class="card-header">
              <span class="card-title">Activity Heatmap</span>
              <span class="card-subtitle">Last 12 weeks</span>
            </div>
            <div class="card-body">
              <div style="display:flex;gap:3px;flex-wrap:wrap;margin-bottom:var(--space-3)">
                <!-- 84 cells = 12 weeks x 7 days -->
                <div class="heatmap-cell" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-1" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-2" style="width:12px;height:12px"></div>
                <div class="heatmap-cell" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-1" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-3" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-2" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-1" style="width:12px;height:12px"></div>
                <div class="heatmap-cell" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-4" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-3" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-2" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-1" style="width:12px;height:12px"></div>
                <div class="heatmap-cell" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-2" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-4" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-3" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-1" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-2" style="width:12px;height:12px"></div>
                <div class="heatmap-cell" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-1" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-3" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-4" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-2" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-3" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-1" style="width:12px;height:12px"></div>
                <div class="heatmap-cell" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-2" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-1" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-4" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-3" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-2" style="width:12px;height:12px"></div>
                <div class="heatmap-cell" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-1" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-2" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-4" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-3" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-1" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-2" style="width:12px;height:12px"></div>
                <div class="heatmap-cell" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-3" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-4" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-2" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-1" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-3" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-2" style="width:12px;height:12px"></div>
                <div class="heatmap-cell" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-1" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-4" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-3" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-2" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-1" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-3" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-4" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-2" style="width:12px;height:12px"></div>
                <div class="heatmap-cell level-1" style="width:12px;height:12px"></div>
              </div>
              <div style="display:flex;align-items:center;gap:var(--space-3);font-size:var(--text-xs);color:var(--color-text-quaternary)">
                <span>Less</span>
                <div class="heatmap-cell" style="width:10px;height:10px;display:inline-block"></div>
                <div class="heatmap-cell level-1" style="width:10px;height:10px;display:inline-block"></div>
                <div class="heatmap-cell level-2" style="width:10px;height:10px;display:inline-block"></div>
                <div class="heatmap-cell level-3" style="width:10px;height:10px;display:inline-block"></div>
                <div class="heatmap-cell level-4" style="width:10px;height:10px;display:inline-block"></div>
                <span>More</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- ============================================================
     PAGE 6 — PATENT / IP MANAGEMENT
     ============================================================ -->
<div class="page-section" id="page-patent">
  <div class="app-shell">
    <aside class="sidebar">
      <div class="sidebar-header">
        <div class="sidebar-logo">B</div>
        <span class="sidebar-title">BST Platform</span>
        <span class="sidebar-version">v2.0</span>
      </div>
      <nav class="sidebar-nav">
        <div class="nav-section-label">Overview</div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg></span>Dashboard</div>
        <div class="nav-section-label">Workspace</div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><path d="M9 11l3 3L22 4"/><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/></svg></span>Task Management</div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg></span>Project Center</div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg></span>Safety Review</div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/></svg></span>Performance</div>
        <div class="nav-item active"><span class="nav-icon"><svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg></span>Patent / IP</div>
      </nav>
      <div class="sidebar-footer">
        <div class="sidebar-user"><div class="user-avatar">ZG</div><div class="user-info"><div class="user-name">Zhang Gong</div><div class="user-role">Senior Engineer</div></div></div>
      </div>
    </aside>

    <div class="main-content">
      <header class="topbar">
        <div class="topbar-breadcrumb">Workspace <span class="breadcrumb-sep">/</span> <span>Patent / IP Management</span></div>
        <div class="topbar-actions">
          <div class="search-trigger">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
            Search patents...
            <span class="search-shortcut"><kbd>Ctrl</kbd><kbd>K</kbd></span>
          </div>
        </div>
      </header>

      <div class="content-area">
        <div class="page-header">
          <div class="page-header-top">
            <div>
              <h1 class="page-title">Patent / IP Management</h1>
              <p class="page-subtitle">Track patent applications, disclosures, and intellectual property portfolio.</p>
            </div>
            <button class="btn btn-primary">
              <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
              New Disclosure
            </button>
          </div>
        </div>

        <!-- Patent Stats -->
        <div class="stat-grid" style="grid-template-columns:repeat(5,1fr);margin-bottom:var(--space-6)">
          <div class="stat-card">
            <div class="stat-label">Total Patents</div>
            <div class="stat-value">12</div>
            <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:var(--space-1)">Lifetime</div>
          </div>
          <div class="stat-card">
            <div class="stat-label">Granted</div>
            <div class="stat-value" style="color:var(--color-success)">6</div>
            <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:var(--space-1)">50% grant rate</div>
          </div>
          <div class="stat-card">
            <div class="stat-label">Pending</div>
            <div class="stat-value" style="color:var(--color-info)">3</div>
            <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:var(--space-1)">Under examination</div>
          </div>
          <div class="stat-card">
            <div class="stat-label">Disclosures</div>
            <div class="stat-value" style="color:var(--color-warning)">2</div>
            <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:var(--space-1)">Awaiting review</div>
          </div>
          <div class="stat-card">
            <div class="stat-label">This Year Target</div>
            <div class="stat-value">4</div>
            <div style="margin-top:var(--space-2)">
              <div class="progress-bar" style="height:3px"><div class="progress-fill purple" style="width:75%"></div></div>
              <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:var(--space-1)">3/4 achieved</div>
            </div>
          </div>
        </div>

        <div class="tabs">
          <div class="tab-item active">All Patents</div>
          <div class="tab-item">Disclosures</div>
          <div class="tab-item">Under Review</div>
          <div class="tab-item">Granted</div>
          <div class="tab-item">Analytics</div>
        </div>

        <!-- Patent Card Grid -->
        <div class="three-col" style="margin-bottom:var(--space-6)">
          <!-- Patent Card 1 -->
          <div class="doc-card">
            <div class="doc-card-type" style="color:var(--color-success)">
              <div style="width:6px;height:6px;border-radius:var(--radius-full);background:var(--color-success)"></div>
              Granted -- Invention Patent
            </div>
            <div class="doc-card-title">Adaptive Battery Thermal Management System and Method</div>
            <div class="doc-card-desc">A novel thermal management approach using phase-change materials combined with active liquid cooling for high energy density battery packs in electric vehicles.</div>
            <div style="display:flex;flex-wrap:wrap;gap:var(--space-1);margin-bottom:var(--space-3)">
              <span class="tag tag-default">Thermal Management</span>
              <span class="tag tag-default">Battery Pack</span>
              <span class="tag tag-default">PCM</span>
            </div>
            <div class="doc-card-footer">
              <div style="display:flex;align-items:center;gap:var(--space-2)">
                <div class="kanban-card-avatar" style="width:20px;height:20px;font-size:8px">ZG</div>
                <span style="font-size:var(--text-xs);color:var(--color-text-tertiary)">Zhang Gong</span>
              </div>
              <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">CN202310xxxxx.X</span>
            </div>
          </div>

          <!-- Patent Card 2 -->
          <div class="doc-card">
            <div class="doc-card-type" style="color:var(--color-info)">
              <div style="width:6px;height:6px;border-radius:var(--radius-full);background:var(--color-info)"></div>
              Pending -- Invention Patent
            </div>
            <div class="doc-card-title">Multi-Cell SOC Consistency Balancing Algorithm</div>
            <div class="doc-card-desc">An improved active balancing algorithm that reduces cell-to-cell SOC deviation by 40% compared to passive methods through predictive energy redistribution.</div>
            <div style="display:flex;flex-wrap:wrap;gap:var(--space-1);margin-bottom:var(--space-3)">
              <span class="tag tag-default">BMS</span>
              <span class="tag tag-default">Algorithm</span>
              <span class="tag tag-default">Balancing</span>
            </div>
            <div class="doc-card-footer">
              <div style="display:flex;align-items:center;gap:var(--space-2)">
                <div class="kanban-card-avatar" style="width:20px;height:20px;font-size:8px">ZG</div>
                <span style="font-size:var(--text-xs);color:var(--color-text-tertiary)">Zhang Gong, Li Gong</span>
              </div>
              <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">Filed 2024-01</span>
            </div>
          </div>

          <!-- Patent Card 3 -->
          <div class="doc-card">
            <div class="doc-card-type" style="color:var(--color-warning)">
              <div style="width:6px;height:6px;border-radius:var(--radius-full);background:var(--color-warning)"></div>
              Disclosure -- Awaiting Review
            </div>
            <div class="doc-card-title">Early Warning Method for Thermal Runaway Based on Impedance Spectroscopy</div>
            <div class="doc-card-desc">A real-time monitoring system utilizing electrochemical impedance spectroscopy to detect early signs of internal short circuits and thermal runaway.</div>
            <div style="display:flex;flex-wrap:wrap;gap:var(--space-1);margin-bottom:var(--space-3)">
              <span class="tag tag-default">Safety</span>
              <span class="tag tag-default">EIS</span>
              <span class="tag tag-default">Early Warning</span>
            </div>
            <div class="doc-card-footer">
              <div style="display:flex;align-items:center;gap:var(--space-2)">
                <div class="kanban-card-avatar" style="width:20px;height:20px;font-size:8px;background:linear-gradient(135deg,#059669,#22C55E)">WL</div>
                <span style="font-size:var(--text-xs);color:var(--color-text-tertiary)">Wang Lei</span>
              </div>
              <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Submitted Jan 12</span>
            </div>
          </div>
        </div>

        <!-- Patent Pipeline Table -->
        <div style="margin-bottom:var(--space-6)">
          <h2 style="font-size:var(--text-xl);font-weight:600;margin-bottom:var(--space-4)">Patent Pipeline</h2>
          <div class="data-table-container">
            <table class="data-table">
              <thead>
                <tr>
                  <th>Application No.</th>
                  <th>Title</th>
                  <th>Type</th>
                  <th>Inventors</th>
                  <th>Filed</th>
                  <th>Stage</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="cell-id">CN202310xxxxx.X</td>
                  <td class="cell-primary">Adaptive Battery Thermal Management System</td>
                  <td><span class="tag tag-purple" style="font-size:10px">Invention</span></td>
                  <td>Zhang Gong</td>
                  <td>2023-06</td>
                  <td>Granted</td>
                  <td><span class="tag tag-green">Granted</span></td>
                </tr>
                <tr>
                  <td class="cell-id">CN202410xxxxx.0</td>
                  <td class="cell-primary">Multi-Cell SOC Consistency Balancing</td>
                  <td><span class="tag tag-purple" style="font-size:10px">Invention</span></td>
                  <td>Zhang Gong, Li Gong</td>
                  <td>2024-01</td>
                  <td>Substantive Exam</td>
                  <td><span class="tag tag-blue">Pending</span></td>
                </tr>
                <tr>
                  <td class="cell-id">CN202410xxxxx.5</td>
                  <td class="cell-primary">BMS High-Voltage Interlock Detection</td>
                  <td><span class="tag tag-blue" style="font-size:10px">Utility Model</span></td>
                  <td>Chen Ke</td>
                  <td>2024-01</td>
                  <td>Preliminary Exam</td>
                  <td><span class="tag tag-blue">Pending</span></td>
                </tr>
                <tr>
                  <td class="cell-id">--</td>
                  <td class="cell-primary">Impedance-Based Thermal Runaway Early Warning</td>
                  <td><span class="tag tag-purple" style="font-size:10px">Invention</span></td>
                  <td>Wang Lei</td>
                  <td>--</td>
                  <td>Disclosure</td>
                  <td><span class="tag tag-orange">Under Review</span></td>
                </tr>
                <tr>
                  <td class="cell-id">--</td>
                  <td class="cell-primary">AI-Driven Battery Degradation Prediction</td>
                  <td><span class="tag tag-purple" style="font-size:10px">Invention</span></td>
                  <td>Zhang Gong</td>
                  <td>--</td>
                  <td>Disclosure</td>
                  <td><span class="tag tag-default">Draft</span></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- ============================================================
     PAGE 7 — REPORT CENTER
     ============================================================ -->
<div class="page-section" id="page-reports">
  <div class="app-shell">
    <aside class="sidebar">
      <div class="sidebar-header">
        <div class="sidebar-logo">B</div>
        <span class="sidebar-title">BST Platform</span>
        <span class="sidebar-version">v2.0</span>
      </div>
      <nav class="sidebar-nav">
        <div class="nav-section-label">Overview</div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg></span>Dashboard</div>
        <div class="nav-section-label">Intelligence</div>
        <div class="nav-item active"><span class="nav-icon"><svg viewBox="0 0 24 24"><path d="M12 2a10 10 0 1 0 10 10H12V2z"/><path d="M20 12a8 8 0 0 0-8-8v8h8z" opacity="0.4"/></svg></span>Report Center</div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><rect x="2" y="2" width="20" height="20" rx="5"/><path d="M8 12h8M12 8v8" opacity="0.5"/></svg></span>AI Assistant</div>
      </nav>
      <div class="sidebar-footer">
        <div class="sidebar-user"><div class="user-avatar">ZG</div><div class="user-info"><div class="user-name">Zhang Gong</div><div class="user-role">Senior Engineer</div></div></div>
      </div>
    </aside>

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
          <div class="data-table-container">
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
                  <td><span class="tag tag-purple" style="font-size:10px">Personal</span></td>
                  <td>Zhang Gong</td>
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
                  <td><span class="tag tag-blue" style="font-size:10px">Department</span></td>
                  <td>All Members</td>
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
                  <td><span class="tag tag-orange" style="font-size:10px">Safety</span></td>
                  <td>Zhang Gong</td>
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
          <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:var(--space-3);padding:var(--space-2) 0">
            Watermark: All reports auto-include "BST Internal / Generated by / Timestamp" watermark.
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- ============================================================
     PAGE 8 — AI ASSISTANT
     ============================================================ -->
<div class="page-section" id="page-ai">
  <div class="app-shell">
    <aside class="sidebar">
      <div class="sidebar-header">
        <div class="sidebar-logo">B</div>
        <span class="sidebar-title">BST Platform</span>
        <span class="sidebar-version">v2.0</span>
      </div>
      <nav class="sidebar-nav">
        <div class="nav-section-label">Overview</div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg></span>Dashboard</div>
        <div class="nav-section-label">Intelligence</div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><path d="M12 2a10 10 0 1 0 10 10H12V2z"/></svg></span>Report Center</div>
        <div class="nav-item active"><span class="nav-icon"><svg viewBox="0 0 24 24"><rect x="2" y="2" width="20" height="20" rx="5"/><path d="M8 12h8M12 8v8" opacity="0.5"/></svg></span>AI Assistant</div>
      </nav>
      <div class="sidebar-footer">
        <div class="sidebar-user"><div class="user-avatar">ZG</div><div class="user-info"><div class="user-name">Zhang Gong</div><div class="user-role">Senior Engineer</div></div></div>
      </div>
    </aside>

    <div class="main-content">
      <header class="topbar">
        <div class="topbar-breadcrumb">Intelligence <span class="breadcrumb-sep">/</span> <span>AI Assistant</span></div>
        <div class="topbar-actions">
          <button class="btn btn-sm btn-secondary">New Chat</button>
        </div>
      </header>

      <div class="content-area no-padding" style="display:flex;flex-direction:column;height:calc(100vh - var(--header-height))">
        <!-- AI Chat Messages -->
        <div class="ai-messages" style="flex:1;overflow-y:auto;padding:var(--space-8) var(--space-8)">
          <!-- Welcome Message -->
          <div style="text-align:center;padding:var(--space-8) 0;max-width:480px;margin:0 auto">
            <div style="width:56px;height:56px;border-radius:var(--radius-xl);background:linear-gradient(135deg,var(--color-accent),#6366F1);display:flex;align-items:center;justify-content:center;margin:0 auto var(--space-5)">
              <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="2" width="20" height="20" rx="5"/><path d="M8 12h8M12 8v8" opacity="0.7"/></svg>
            </div>
            <h2 style="font-size:var(--text-2xl);font-weight:700;margin-bottom:var(--space-2)">BST AI Assistant</h2>
            <p style="font-size:var(--text-sm);color:var(--color-text-tertiary);line-height:1.6">I can help you with task summaries, safety analysis, report generation, patent drafting, and data insights. What would you like to do?</p>
          </div>

          <!-- Conversation -->
          <div class="ai-message user">
            <div class="ai-avatar human">ZG</div>
            <div class="ai-bubble">Help me summarize the current status of SR-001 thermal runaway risk assessment, including all open issues and pending actions.</div>
          </div>

          <div class="ai-message assistant">
            <div class="ai-avatar assistant">AI</div>
            <div class="ai-bubble">
              <div style="margin-bottom:var(--space-3)"><strong>SR-001 Thermal Runaway Risk Assessment -- Status Summary</strong></div>
              <div style="margin-bottom:var(--space-3)">
                <div style="display:flex;align-items:center;gap:var(--space-2);margin-bottom:var(--space-2)">
                  <span class="tag tag-red">Critical</span>
                  <span class="tag tag-orange">Overdue by 3 days</span>
                </div>
              </div>
              <div style="margin-bottom:var(--space-3)">
                <strong>Current Phase:</strong> Risk Assessment (Step 3 of 6)<br>
                <strong>Owner:</strong> Zhang Gong<br>
                <strong>Project:</strong> BMS Safety Certification (PRJ-001)
              </div>
              <div style="margin-bottom:var(--space-3)">
                <strong>Open Issues (3):</strong>
                <div style="padding-left:var(--space-3);margin-top:var(--space-2);border-left:2px solid var(--color-border)">
                  <div style="margin-bottom:var(--space-2)">1. Thermal propagation simulation model needs validation against test data -- <span style="color:var(--color-warning)">In Progress (65%)</span></div>
                  <div style="margin-bottom:var(--space-2)">2. Cell vendor thermal abuse test reports incomplete -- <span style="color:var(--color-danger)">Blocked</span></div>
                  <div>3. Safety margin criteria need alignment with updated ISO 26262 -- <span style="color:var(--color-info)">Pending Review</span></div>
                </div>
              </div>
              <div>
                <strong>Recommended Actions:</strong>
                <div style="padding-left:var(--space-3);margin-top:var(--space-2);border-left:2px solid var(--color-accent)">
                  <div style="margin-bottom:var(--space-2)">1. Expedite vendor test report request (contact by Jan 16)</div>
                  <div style="margin-bottom:var(--space-2)">2. Schedule model validation review with Li Gong</div>
                  <div>3. Update safety criteria document and circulate for approval</div>
                </div>
              </div>
            </div>
          </div>

          <div class="ai-message user">
            <div class="ai-avatar human">ZG</div>
            <div class="ai-bubble">Create a task for item 1 -- "Request vendor thermal abuse test report" assigned to Li Gong, due Jan 16, linked to SR-001.</div>
          </div>

          <div class="ai-message assistant">
            <div class="ai-avatar assistant">AI</div>
            <div class="ai-bubble">
              <div style="margin-bottom:var(--space-3)">Task created successfully:</div>
              <div style="background:var(--color-surface);border:1px solid var(--color-border);border-radius:var(--radius-md);padding:var(--space-3)">
                <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-2)">
                  <span style="font-family:var(--font-mono);font-size:var(--text-xs);color:var(--color-text-quaternary)">TSK-025</span>
                  <span class="tag tag-red" style="font-size:10px">Urgent</span>
                </div>
                <div style="font-weight:500;margin-bottom:var(--space-2)">Request vendor thermal abuse test report</div>
                <div style="display:flex;gap:var(--space-4);font-size:var(--text-xs);color:var(--color-text-tertiary)">
                  <span>Assignee: Li Gong</span>
                  <span>Due: Jan 16</span>
                  <span>Linked: SR-001</span>
                </div>
              </div>
              <div style="margin-top:var(--space-3);font-size:var(--text-xs);color:var(--color-text-tertiary)">The task has been added to Li Gong's task board and linked to safety review SR-001. A notification has been sent.</div>
            </div>
          </div>
        </div>

        <!-- Quick Actions -->
        <div class="ai-quick-actions">
          <button class="ai-quick-btn">Summarize my tasks</button>
          <button class="ai-quick-btn">Generate monthly report</button>
          <button class="ai-quick-btn">Analyze risk matrix</button>
          <button class="ai-quick-btn">Draft patent abstract</button>
          <button class="ai-quick-btn">Project status overview</button>
        </div>

        <!-- AI Input -->
        <div class="ai-input-bar">
          <textarea class="ai-input-field" placeholder="Ask BST AI anything... (Ctrl+Enter to send)" rows="1"></textarea>
          <button class="ai-send-btn">
            <svg viewBox="0 0 24 24"><line x1="22" y1="2" x2="11" y2="13"/><polygon points="22 2 15 22 11 13 2 9 22 2"/></svg>
          </button>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- ============================================================
     PAGE 9 — SETTINGS
     ============================================================ -->
<div class="page-section" id="page-settings">
  <div class="app-shell">
    <aside class="sidebar">
      <div class="sidebar-header">
        <div class="sidebar-logo">B</div>
        <span class="sidebar-title">BST Platform</span>
        <span class="sidebar-version">v2.0</span>
      </div>
      <nav class="sidebar-nav">
        <div class="nav-section-label">Overview</div>
        <div class="nav-item"><span class="nav-icon"><svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg></span>Dashboard</div>
        <div class="nav-section-label">System</div>
        <div class="nav-item active"><span class="nav-icon"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="3"/><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1-2.83 2.83l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-4 0v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 2.83-2.83l.06.06A1.65 1.65 0 0 0 9 4.68a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 4 0v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 2.83l-.06.06A1.65 1.65 0 0 0 19.4 9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 0 4h-.09a1.65 1.65 0 0 0-1.51 1z"/></svg></span>Settings</div>
      </nav>
      <div class="sidebar-footer">
        <div class="sidebar-user"><div class="user-avatar">ZG</div><div class="user-info"><div class="user-name">Zhang Gong</div><div class="user-role">Senior Engineer</div></div></div>
      </div>
    </aside>

    <div class="main-content">
      <header class="topbar">
        <div class="topbar-breadcrumb">System <span class="breadcrumb-sep">/</span> <span>Settings</span></div>
        <div class="topbar-actions"></div>
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

        <!-- Settings Layout: Sidebar + Content -->
        <div style="display:grid;grid-template-columns:220px 1fr;gap:var(--space-8)">
          <!-- Settings Sidebar -->
          <div style="display:flex;flex-direction:column;gap:var(--space-1)">
            <div class="nav-section-label" style="padding-left:0">Account</div>
            <div class="nav-item active" style="margin-bottom:0">
              <span class="nav-icon"><svg viewBox="0 0 24 24"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg></span>
              Profile
            </div>
            <div class="nav-item">
              <span class="nav-icon"><svg viewBox="0 0 24 24"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg></span>
              Security
            </div>
            <div class="nav-item">
              <span class="nav-icon"><svg viewBox="0 0 24 24"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/><path d="M13.73 21a2 2 0 0 1-3.46 0"/></svg></span>
              Notifications
            </div>
            <div class="nav-section-label" style="padding-left:0">Workspace</div>
            <div class="nav-item">
              <span class="nav-icon"><svg viewBox="0 0 24 24"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg></span>
              Team Management
            </div>
            <div class="nav-item">
              <span class="nav-icon"><svg viewBox="0 0 24 24"><polyline points="22 12 18 12 15 21 9 3 6 12 2 12"/></svg></span>
              Workflow
            </div>
            <div class="nav-item">
              <span class="nav-icon"><svg viewBox="0 0 24 24"><rect x="2" y="3" width="20" height="14" rx="2"/><line x1="8" y1="21" x2="16" y2="21"/><line x1="12" y1="17" x2="12" y2="21"/></svg></span>
              Integrations
            </div>
            <div class="nav-section-label" style="padding-left:0">System</div>
            <div class="nav-item">
              <span class="nav-icon"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="5"/><line x1="12" y1="1" x2="12" y2="3"/><line x1="12" y1="21" x2="12" y2="23"/><line x1="4.22" y1="4.22" x2="5.64" y2="5.64"/><line x1="18.36" y1="18.36" x2="19.78" y2="19.78"/><line x1="1" y1="12" x2="3" y2="12"/><line x1="21" y1="12" x2="23" y2="12"/><line x1="4.22" y1="19.78" x2="5.64" y2="18.36"/><line x1="18.36" y1="5.64" x2="19.78" y2="4.22"/></svg></span>
              Appearance
            </div>
            <div class="nav-item">
              <span class="nav-icon"><svg viewBox="0 0 24 24"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg></span>
              Permissions
            </div>
            <div class="nav-item">
              <span class="nav-icon"><svg viewBox="0 0 24 24"><ellipse cx="12" cy="5" rx="9" ry="3"/><path d="M21 12c0 1.66-4 3-9 3s-9-1.34-9-3"/><path d="M3 5v14c0 1.66 4 3 9 3s9-1.34 9-3V5"/></svg></span>
              Data & Backup
            </div>
          </div>

          <!-- Settings Content Area: Profile -->
          <div>
            <h2 style="font-size:var(--text-xl);font-weight:600;margin-bottom:var(--space-6)">Profile Settings</h2>

            <!-- Profile Card -->
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
                  <div class="form-group">
                    <label class="form-label">Full Name</label>
                    <input type="text" class="form-input" value="Zhang Gong">
                  </div>
                  <div class="form-group">
                    <label class="form-label">Employee ID</label>
                    <input type="text" class="form-input" value="EMP-2021-0087" disabled style="opacity:0.5">
                  </div>
                  <div class="form-group">
                    <label class="form-label">Email</label>
                    <input type="email" class="form-input" value="zhang.gong@company.com">
                  </div>
                  <div class="form-group">
                    <label class="form-label">Phone</label>
                    <input type="tel" class="form-input" value="+86 138 xxxx xxxx">
                  </div>
                  <div class="form-group">
                    <label class="form-label">Department</label>
                    <select class="form-input form-select">
                      <option selected>Battery Safety Engineering</option>
                      <option>BMS Development</option>
                      <option>Testing & Validation</option>
                    </select>
                  </div>
                  <div class="form-group">
                    <label class="form-label">Role</label>
                    <select class="form-input form-select">
                      <option selected>Senior Engineer</option>
                      <option>Team Lead</option>
                      <option>Manager</option>
                    </select>
                  </div>
                </div>
              </div>
            </div>

            <!-- Notification Preferences -->
            <h2 style="font-size:var(--text-xl);font-weight:600;margin-bottom:var(--space-4)">Notification Preferences</h2>
            <div class="card" style="margin-bottom:var(--space-6)">
              <div style="display:flex;flex-direction:column">
                <div class="settings-item">
                  <div class="settings-item-left">
                    <span class="settings-item-title">Task Assignments</span>
                    <span class="settings-item-desc">Receive notifications when new tasks are assigned to you</span>
                  </div>
                  <div class="toggle active"><div class="toggle-knob"></div></div>
                </div>
                <div class="settings-item">
                  <div class="settings-item-left">
                    <span class="settings-item-title">Safety Review Alerts</span>
                    <span class="settings-item-desc">Critical alerts for safety reviews requiring your attention</span>
                  </div>
                  <div class="toggle active"><div class="toggle-knob"></div></div>
                </div>
                <div class="settings-item">
                  <div class="settings-item-left">
                    <span class="settings-item-title">Project Milestones</span>
                    <span class="settings-item-desc">Notify when project milestones are approaching or completed</span>
                  </div>
                  <div class="toggle active"><div class="toggle-knob"></div></div>
                </div>
                <div class="settings-item">
                  <div class="settings-item-left">
                    <span class="settings-item-title">Performance Updates</span>
                    <span class="settings-item-desc">Monthly performance score and ranking notifications</span>
                  </div>
                  <div class="toggle"><div class="toggle-knob"></div></div>
                </div>
                <div class="settings-item">
                  <div class="settings-item-left">
                    <span class="settings-item-title">Patent Status Changes</span>
                    <span class="settings-item-desc">Updates on patent application status changes</span>
                  </div>
                  <div class="toggle active"><div class="toggle-knob"></div></div>
                </div>
                <div class="settings-item" style="border-bottom:none">
                  <div class="settings-item-left">
                    <span class="settings-item-title">Email Digest</span>
                    <span class="settings-item-desc">Receive daily email summary of all activities</span>
                  </div>
                  <div class="toggle"><div class="toggle-knob"></div></div>
                </div>
              </div>
            </div>

            <!-- Appearance Settings -->
            <h2 style="font-size:var(--text-xl);font-weight:600;margin-bottom:var(--space-4)">Appearance</h2>
            <div class="card" style="margin-bottom:var(--space-6)">
              <div class="card-body" style="padding:var(--space-6)">
                <div class="form-group">
                  <label class="form-label">Theme</label>
                  <div style="display:flex;gap:var(--space-3)">
                    <!-- Theme Options -->
                    <div style="flex:1;padding:var(--space-4);border:2px solid var(--color-accent);border-radius:var(--radius-lg);background:var(--color-bg);cursor:pointer;text-align:center">
                      <div style="width:100%;height:40px;border-radius:var(--radius-md);background:linear-gradient(135deg,#09090B,#18181B);margin-bottom:var(--space-2);border:1px solid var(--color-border)"></div>
                      <span style="font-size:var(--text-xs);font-weight:500;color:var(--color-accent-text)">Dark</span>
                    </div>
                    <div style="flex:1;padding:var(--space-4);border:2px solid var(--color-border);border-radius:var(--radius-lg);background:var(--color-bg);cursor:pointer;text-align:center">
                      <div style="width:100%;height:40px;border-radius:var(--radius-md);background:linear-gradient(135deg,#FFFFFF,#F4F4F5);margin-bottom:var(--space-2);border:1px solid var(--color-border)"></div>
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
                    <div style="width:32px;height:32px;border-radius:var(--radius-full);background:#3B82F6;cursor:pointer"></div>
                    <div style="width:32px;height:32px;border-radius:var(--radius-full);background:#22C55E;cursor:pointer"></div>
                    <div style="width:32px;height:32px;border-radius:var(--radius-full);background:#F59E0B;cursor:pointer"></div>
                    <div style="width:32px;height:32px;border-radius:var(--radius-full);background:#EF4444;cursor:pointer"></div>
                    <div style="width:32px;height:32px;border-radius:var(--radius-full);background:#EC4899;cursor:pointer"></div>
                    <div style="width:32px;height:32px;border-radius:var(--radius-full);background:#06B6D4;cursor:pointer"></div>
                  </div>
                </div>

                <div class="form-group" style="margin-top:var(--space-5)">
                  <label class="form-label">Language</label>
                  <select class="form-input form-select" style="max-width:300px">
                    <option>English</option>
                    <option selected>Chinese (Simplified)</option>
                    <option>Japanese</option>
                  </select>
                </div>

                <div class="form-group" style="margin-top:var(--space-5)">
                  <label class="form-label">Sidebar Density</label>
                  <div class="view-switcher" style="display:inline-flex">
                    <button class="view-switcher-btn">Compact</button>
                    <button class="view-switcher-btn active">Comfortable</button>
                    <button class="view-switcher-btn">Spacious</button>
                  </div>
                </div>
              </div>
            </div>

            <!-- Data & Integrations -->
            <h2 style="font-size:var(--text-xl);font-weight:600;margin-bottom:var(--space-4)">Integrations</h2>
            <div class="card" style="margin-bottom:var(--space-6)">
              <div style="display:flex;flex-direction:column">
                <div class="settings-item">
                  <div style="display:flex;align-items:center;gap:var(--space-4)">
                    <div style="width:36px;height:36px;border-radius:var(--radius-md);background:var(--color-bg-active);display:flex;align-items:center;justify-content:center">
                      <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="var(--color-text-tertiary)" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/></svg>
                    </div>
                    <div class="settings-item-left">
                      <span class="settings-item-title">Email (SMTP)</span>
                      <span class="settings-item-desc">Connected to company email server</span>
                    </div>
                  </div>
                  <span class="tag tag-green">Connected</span>
                </div>
                <div class="settings-item">
                  <div style="display:flex;align-items:center;gap:var(--space-4)">
                    <div style="width:36px;height:36px;border-radius:var(--radius-md);background:var(--color-bg-active);display:flex;align-items:center;justify-content:center">
                      <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="var(--color-text-tertiary)" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
                    </div>
                    <div class="settings-item-left">
                      <span class="settings-item-title">Calendar Sync</span>
                      <span class="settings-item-desc">Sync deadlines and milestones with calendar</span>
                    </div>
                  </div>
                  <span class="tag tag-green">Connected</span>
                </div>
                <div class="settings-item">
                  <div style="display:flex;align-items:center;gap:var(--space-4)">
                    <div style="width:36px;height:36px;border-radius:var(--radius-md);background:var(--color-bg-active);display:flex;align-items:center;justify-content:center">
                      <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="var(--color-text-tertiary)" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M21 2l-2 2m-7.61 7.61a5.5 5.5 0 1 1-7.778 7.778 5.5 5.5 0 0 1 7.777-7.777zm0 0L15.5 7.5m0 0l3 3L22 7l-3-3m-3.5 3.5L19 4"/></svg>
                    </div>
                    <div class="settings-item-left">
                      <span class="settings-item-title">JIRA Sync</span>
                      <span class="settings-item-desc">Bi-directional sync with company JIRA instance</span>
                    </div>
                  </div>
                  <button class="btn btn-sm btn-secondary">Connect</button>
                </div>
                <div class="settings-item" style="border-bottom:none">
                  <div style="display:flex;align-items:center;gap:var(--space-4)">
                    <div style="width:36px;height:36px;border-radius:var(--radius-md);background:var(--color-bg-active);display:flex;align-items:center;justify-content:center">
                      <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="var(--color-text-tertiary)" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><ellipse cx="12" cy="5" rx="9" ry="3"/><path d="M21 12c0 1.66-4 3-9 3s-9-1.34-9-3"/><path d="M3 5v14c0 1.66 4 3 9 3s9-1.34 9-3V5"/></svg>
                    </div>
                    <div class="settings-item-left">
                      <span class="settings-item-title">Data Export API</span>
                      <span class="settings-item-desc">REST API access for external data consumption</span>
                    </div>
                  </div>
                  <button class="btn btn-sm btn-secondary">Configure</button>
                </div>
              </div>
            </div>

            <!-- Save Bar -->
            <div style="display:flex;justify-content:flex-end;gap:var(--space-3);padding:var(--space-4) 0;border-top:1px solid var(--color-border)">
              <button class="btn btn-secondary">Reset to Default</button>
              <button class="btn btn-primary">Save Changes</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- ============================================================
     COMMAND PALETTE OVERLAY (hidden by default, shown for demo)
     ============================================================ -->
<div class="modal-overlay" id="commandPalette" style="display:none">
  <div class="command-palette">
    <div class="command-input-wrapper">
      <svg viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
      <input class="command-input" type="text" placeholder="Type a command or search..." autofocus>
      <kbd style="font-family:var(--font-sans);font-size:10px;padding:2px 6px;background:var(--color-bg-active);border:1px solid var(--color-border);border-radius:4px;color:var(--color-text-quaternary)">ESC</kbd>
    </div>
    <div class="command-results">
      <div class="command-group-label">Quick Actions</div>
      <div class="command-item">
        <div class="command-item-icon">
          <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
        </div>
        <div class="command-item-text">
          <div class="command-item-label">Create New Task</div>
        </div>
        <div class="command-item-shortcut"><kbd>Ctrl</kbd><kbd>N</kbd></div>
      </div>
      <div class="command-item">
        <div class="command-item-icon">
          <svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
        </div>
        <div class="command-item-text">
          <div class="command-item-label">Generate Monthly Report</div>
        </div>
        <div class="command-item-shortcut"><kbd>Ctrl</kbd><kbd>R</kbd></div>
      </div>
      <div class="command-item">
        <div class="command-item-icon">
          <svg viewBox="0 0 24 24"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
        </div>
        <div class="command-item-text">
          <div class="command-item-label">Start Safety Review</div>
        </div>
      </div>

      <div class="command-group-label">Navigation</div>
      <div class="command-item">
        <div class="command-item-icon">
          <svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg>
        </div>
        <div class="command-item-text">
          <div class="command-item-label">Go to Dashboard</div>
          <div class="command-item-desc">Overview and quick stats</div>
        </div>
        <div class="command-item-shortcut"><kbd>G</kbd><kbd>D</kbd></div>
      </div>
      <div class="command-item">
        <div class="command-item-icon">
          <svg viewBox="0 0 24 24"><path d="M9 11l3 3L22 4"/><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/></svg>
        </div>
        <div class="command-item-text">
          <div class="command-item-label">Go to Task Board</div>
          <div class="command-item-desc">Kanban and list views</div>
        </div>
        <div class="command-item-shortcut"><kbd>G</kbd><kbd>T</kbd></div>
      </div>
      <div class="command-item">
        <div class="command-item-icon">
          <svg viewBox="0 0 24 24"><rect x="2" y="2" width="20" height="20" rx="5"/><path d="M8 12h8M12 8v8" opacity="0.5"/></svg>
        </div>
        <div class="command-item-text">
          <div class="command-item-label">Open AI Assistant</div>
          <div class="command-item-desc">Chat with BST AI</div>
        </div>
        <div class="command-item-shortcut"><kbd>G</kbd><kbd>A</kbd></div>
      </div>

      <div class="command-group-label">Recent Tasks</div>
      <div class="command-item">
        <div class="command-item-icon" style="background:var(--color-danger-subtle)">
          <svg viewBox="0 0 24 24" style="stroke:var(--color-danger)"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
        </div>
        <div class="command-item-text">
          <div class="command-item-label">TSK-019: Thermal runaway simulation model validation</div>
          <div class="command-item-desc">In Progress -- 65% -- Urgent</div>
        </div>
      </div>
      <div class="command-item">
        <div class="command-item-icon">
          <svg viewBox="0 0 24 24"><path d="M9 11l3 3L22 4"/><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/></svg>
        </div>
        <div class="command-item-text">
          <div class="command-item-label">TSK-018: Safety review document preparation SR-001</div>
          <div class="command-item-desc">In Progress -- 40% -- High</div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- ============================================================
     NOTIFICATION PANEL OVERLAY (demo)
     ============================================================ -->
<div class="modal-overlay" id="notificationPanel" style="display:none">
  <div class="modal" style="max-width:420px;position:absolute;top:60px;right:20px">
    <div class="modal-header">
      <span class="modal-title">Notifications</span>
      <button class="btn btn-ghost btn-sm">Mark all read</button>
    </div>
    <div style="max-height:400px;overflow-y:auto">
      <div class="notification-list">
        <div class="notification-item unread">
          <div class="notification-icon-wrap orange">
            <svg viewBox="0 0 24 24"><path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"/><line x1="12" y1="9" x2="12" y2="13"/><line x1="12" y1="17" x2="12.01" y2="17"/></svg>
          </div>
          <div class="notification-body">
            <div class="notification-title-text">SR-001 review is overdue</div>
            <div class="notification-desc">Thermal runaway risk assessment was due Jan 15</div>
          </div>
          <span class="notification-time">15m</span>
        </div>
        <div class="notification-item unread">
          <div class="notification-icon-wrap green">
            <svg viewBox="0 0 24 24"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
          </div>
          <div class="notification-body">
            <div class="notification-title-text">Li Gong completed a task</div>
            <div class="notification-desc">"Cell testing data collation" marked as done</div>
          </div>
          <span class="notification-time">1h</span>
        </div>
        <div class="notification-item unread">
          <div class="notification-icon-wrap purple">
            <svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
          </div>
          <div class="notification-body">
            <div class="notification-title-text">New patent disclosure submitted</div>
            <div class="notification-desc">Wang Lei submitted "Impedance-based thermal runaway early warning"</div>
          </div>
          <span class="notification-time">3h</span>
        </div>
        <div class="notification-item">
          <div class="notification-icon-wrap blue">
            <svg viewBox="0 0 24 24"><line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/></svg>
          </div>
          <div class="notification-body">
            <div class="notification-title-text">December performance report ready</div>
            <div class="notification-desc">Your monthly performance report has been generated</div>
          </div>
          <span class="notification-time">2d</span>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- ============================================================
     PAGE SWITCHING SCRIPT
     ============================================================ -->
<script>
function showPage(pageId) {
  // Hide all pages
  document.querySelectorAll('.page-section').forEach(function(section) {
    section.classList.remove('active');
  });
  // Show target page
  var target = document.getElementById('page-' + pageId);
  if (target) {
    target.classList.add('active');
  }
  // Update nav buttons
  document.querySelectorAll('.demo-nav-btn').forEach(function(btn) {
    btn.classList.remove('active');
    if (btn.textContent.trim().toLowerCase().replace(/\s*\/\s*/g, '').indexOf(pageId) !== -1) {
      btn.classList.add('active');
    }
  });
  // Explicit match for buttons
  var btnMap = {
    'dashboard': 'Dashboard',
    'tasks': 'Tasks',
    'projects': 'Projects',
    'safety': 'Safety Review',
    'performance': 'Performance',
    'patent': 'Patent / IP',
    'reports': 'Reports',
    'ai': 'AI Assistant',
    'settings': 'Settings'
  };
  document.querySelectorAll('.demo-nav-btn').forEach(function(btn) {
    btn.classList.remove('active');
    if (btn.textContent.trim() === btnMap[pageId]) {
      btn.classList.add('active');
    }
  });
}
</script>

</body>
</html>
