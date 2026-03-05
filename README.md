总体效果，我比较满意.
但是还有一下8点需要优化：
1.默认首页改回bstv1.md中的首页，且有dashboard、tasks、projects、safetyreview、performance、patent/ip、reports、setting。
2.保留最新版的AI模式首页；
3.删除左栏的菜单栏，保留页面底部的横向菜单栏；
4.tasks改回bstv1.md中的tasks界面，且要有看板模式、列表模式、甘特图模式的切换。
5.项目视图中的wbs和数据统计是空的，请优化补充一下；
6.月度绩效模块是空的，请借鉴bstv1.md中的performance模块设计，要有汇总、于都、kpitracking、review history、team analytics这几个维度；
7.safetyreview模块改回bstv1.md中的safetyreview模块；
8.patent/ip、reports、setting。这几个模块都沿用bstv1.md的设计.
强调一点：bstv1.md的html代码所呈现的网站界面我非常喜欢，禁止修改里面的设计(包括字体大小格式、颜色等)，严格保持原有的所有ui设计，优化和新增的功能和模块必须严格按照相同的设计理念和风格导入。
请帮我输出完整html代码，当出现文字或token限制而导致需要多次输出时，前后代码要有一点衔接，方便我再拷贝的过程中不出现代码格式错误、代码重复和代码漏填。
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BST Platform V2.0 — Battery System Technology</title>
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
  
  /* Border Colors */
  --color-border: #27272A;
  --color-border-subtle: #1E1E22;
  --color-border-hover: #3F3F46;
  
  /* Text Colors */
  --color-text-primary: #FAFAFA;
  --color-text-secondary: #D4D4D8;
  --color-text-tertiary: #A1A1AA;
  --color-text-quaternary: #71717A;
  --color-text-disabled: #52525B;
  
  /* Accent Colors */
  --color-accent: #6366F1;
  --color-accent-hover: #818CF8;
  --color-accent-subtle: rgba(99, 102, 241, 0.1);
  --color-accent-border: rgba(99, 102, 241, 0.2);
  
  /* Semantic Colors */
  --color-success: #22C55E;
  --color-success-subtle: rgba(34, 197, 94, 0.1);
  --color-success-border: rgba(34, 197, 94, 0.2);
  --color-warning: #EAB308;
  --color-warning-subtle: rgba(234, 179, 8, 0.1);
  --color-warning-border: rgba(234, 179, 8, 0.2);
  
  --color-error: #EF4444;
  --color-error-subtle: rgba(239, 68, 68, 0.1);
  --color-error-border: rgba(239, 68, 68, 0.2);
  
  --color-info: #3B82F6;
  --color-info-subtle: rgba(59, 130, 246, 0.1);
  --color-info-border: rgba(59, 130, 246, 0.2);
  
  /* Extended Palette */
  --color-purple: #A855F7;
  --color-purple-subtle: rgba(168, 85, 247, 0.1);
  --color-purple-border: rgba(168, 85, 247, 0.2);
  
  --color-pink: #EC4899;
  --color-pink-subtle: rgba(236, 72, 153, 0.1);
  --color-pink-border: rgba(236, 72, 153, 0.2);
  
  --color-orange: #F97316;
  --color-orange-subtle: rgba(249, 115, 22, 0.1);
  --color-orange-border: rgba(249, 115, 22, 0.2);
  
  --color-teal: #14B8A6;
  --color-teal-subtle: rgba(20, 184, 166, 0.1);
  --color-teal-border: rgba(20, 184, 166, 0.2);
  
  /* Shortcuts */
  --color-blue: var(--color-info);
  --color-blue-subtle: var(--color-info-subtle);
  --color-blue-border: var(--color-info-border);
  --color-green: var(--color-success);
  --color-green-subtle: var(--color-success-subtle);
  --color-green-border: var(--color-success-border);
  --color-yellow: var(--color-warning);
  --color-yellow-subtle: var(--color-warning-subtle);
  --color-yellow-border: var(--color-warning-border);
  --color-red: var(--color-error);
  --color-red-subtle: var(--color-error-subtle);
  --color-red-border: var(--color-error-border);
  /* Typography */
  --font-sans: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
  --font-mono: "SF Mono", Monaco, "Cascadia Code", "Roboto Mono", Consolas, "Courier New", monospace;
  
  --text-xs: 0.6875rem;    /* 11px */
  --text-sm: 0.8125rem;    /* 13px */
  --text-base: 0.9375rem;  /* 15px */
  --text-lg: 1.0625rem;    /* 17px */
  --text-xl: 1.25rem;      /* 20px */
  --text-2xl: 1.5rem;      /* 24px */
  --text-3xl: 1.875rem;    /* 30px */
  --text-4xl: 2.25rem;     /* 36px */
  
  --font-weight-normal: 400;
  --font-weight-medium: 500;
  --font-weight-semibold: 600;
  --font-weight-bold: 700;
  
  --line-height-tight: 1.25;
  --line-height-normal: 1.5;
  --line-height-relaxed: 1.75;
  
  /* Spacing */
  --space-1: 0.25rem;   /* 4px */
  --space-2: 0.5rem;    /* 8px */
  --space-3: 0.75rem;   /* 12px */
  --space-4: 1rem;      /* 16px */
  --space-5: 1.25rem;   /* 20px */
  --space-6: 1.5rem;    /* 24px */
  --space-8: 2rem;      /* 32px */
  --space-10: 2.5rem;   /* 40px */
  --space-12: 3rem;     /* 48px */
  --space-16: 4rem;     /* 64px */
  /* Border Radius */
  --radius-sm: 0.375rem;   /* 6px */
  --radius-md: 0.5rem;     /* 8px */
  --radius-lg: 0.75rem;    /* 12px */
  --radius-xl: 1rem;       /* 16px */
  --radius-2xl: 1.5rem;    /* 24px */
  --radius-full: 9999px;
  
  /* Shadows */
  --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.3);
  --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.4), 0 2px 4px -1px rgba(0, 0, 0, 0.3);
  --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.4), 0 4px 6px -2px rgba(0, 0, 0, 0.3);
  --shadow-xl: 0 20px 25px -5px rgba(0, 0, 0, 0.4), 0 10px 10px -5px rgba(0, 0, 0, 0.3);
  
  /* Transitions */
  --transition-fast: 150ms cubic-bezier(0.4, 0, 0.2, 1);
  --transition-base: 200ms cubic-bezier(0.4, 0, 0.2, 1);
  --transition-slow: 300ms cubic-bezier(0.4, 0, 0.2, 1);
  
  /* Z-index */
  --z-dropdown: 1000;
  --z-sticky: 1020;
  --z-fixed: 1030;
  --z-modal-backdrop: 1040;
  --z-modal: 1050;
  --z-popover: 1060;
  --z-tooltip: 1070;
}

/* Light Theme */
[data-theme="light"] {
  --color-bg: #FFFFFF;
  --color-bg-elevated: #F9FAFB;
  --color-bg-subtle: #F3F4F6;
  --color-bg-hover: #E5E7EB;
  --color-bg-active: #D1D5DB;
  --color-surface: #FAFAFA;
  --color-surface-hover: #F5F5F5;
  
  --color-border: #E5E7EB;
  --color-border-subtle: #F3F4F6;
  --color-border-hover: #D1D5DB;
  
  --color-text-primary: #18181B;
  --color-text-secondary: #3F3F46;
  --color-text-tertiary: #71717A;
  --color-text-quaternary: #A1A1AA;
  --color-text-disabled: #D4D4D8;
  
  --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
  --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
  --shadow-xl: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
}

/* --- Base Styles --- */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html {
  font-size: 16px;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

body {
  font-family: var(--font-sans);
  font-size: var(--text-base);
  line-height: var(--line-height-normal);
  color: var(--color-text-primary);
  background: var(--color-bg);
  overflow-x: hidden;
}

/* --- Page Navigation --- */
.page-nav {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  height: 64px;
  background: var(--color-bg-elevated);
  border-top: 1px solid var(--color-border);
  display: flex;
  align-items: center;
  justify-content: center;
  gap: var(--space-2);
  padding: 0 var(--space-4);
  z-index: var(--z-fixed);
  backdrop-filter: blur(12px);
  -webkit-backdrop-filter: blur(12px);
}

.page-nav-btn {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 4px;
  padding: var(--space-2) var(--space-4);
  border-radius: var(--radius-lg);
  background: transparent;
  border: none;
  color: var(--color-text-tertiary);
  font-size: var(--text-xs);
  font-weight: var(--font-weight-medium);
  cursor: pointer;
  transition: all var(--transition-fast);
  min-width: 72px;
}

.page-nav-btn svg {
  width: 20px;
  height: 20px;
  stroke: currentColor;
  stroke-width: 2;
  fill: none;
  stroke-linecap: round;
  stroke-linejoin: round;
}

.page-nav-btn:hover {
  background: var(--color-bg-hover);
  color: var(--color-text-secondary);
}

.page-nav-btn.active {
  background: var(--color-accent-subtle);
  color: var(--color-accent);
  border: 1px solid var(--color-accent-border);
}

/* --- Page Sections --- */
.page-section {
  display: none;
  min-height: 100vh;
  padding-bottom: 80px;
}

.page-section.active {
  display: block;
}

/* --- App Shell --- */
.app-shell {
  display: flex;
  min-height: 100vh;
}

/* --- Content Area --- */
.content-area {
  flex: 1;
  display: flex;
  flex-direction: column;
  overflow-x: hidden;
}

/* --- Page Header --- */
.page-header {
  position: sticky;
  top: 0;
  z-index: var(--z-sticky);
  background: var(--color-bg);
  border-bottom: 1px solid var(--color-border);
  backdrop-filter: blur(12px);
  -webkit-backdrop-filter: blur(12px);
}

.page-header-top {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: var(--space-4) var(--space-6);
  gap: var(--space-4);
}

.page-title {
  font-size: var(--text-2xl);
  font-weight: var(--font-weight-bold);
  color: var(--color-text-primary);
  letter-spacing: -0.02em;
}

.page-subtitle {
  font-size: var(--text-sm);
  color: var(--color-text-tertiary);
  margin-top: var(--space-1);
}

/* --- Content Body --- */
.content-body {
  flex: 1;
  padding: var(--space-6);
  display: flex;
  flex-direction: column;
  gap: var(--space-6);
}

/* --- Cards --- */
.card {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-xl);
  overflow: hidden;
  transition: all var(--transition-base);
}

.card:hover {
  border-color: var(--color-border-hover);
}

.card-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: var(--space-4) var(--space-5);
  border-bottom: 1px solid var(--color-border);
}

.card-title {
  font-size: var(--text-base);
  font-weight: var(--font-weight-semibold);
  color: var(--color-text-primary);
}

.card-body {
  padding: var(--space-5);
}

/* --- Buttons --- */
.btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: var(--space-2);
  padding: var(--space-2) var(--space-4);
  border-radius: var(--radius-md);
  font-size: var(--text-sm);
  font-weight: var(--font-weight-medium);
  line-height: 1;
  cursor: pointer;
  transition: all var(--transition-fast);
  border: 1px solid transparent;
  white-space: nowrap;
}

.btn svg {
  width: 14px;
  height: 14px;
  stroke: currentColor;
  stroke-width: 2;
  fill: none;
}

.btn-primary {
  background: var(--color-accent);
  color: white;
  border-color: var(--color-accent);
}

.btn-primary:hover {
  background: var(--color-accent-hover);
  border-color: var(--color-accent-hover);
}

.btn-secondary {
  background: var(--color-bg-subtle);
  color: var(--color-text-primary);
  border-color: var(--color-border);
}

.btn-secondary:hover {
  background: var(--color-bg-hover);
  border-color: var(--color-border-hover);
}

.btn-ghost {
  background: transparent;
  color: var(--color-text-secondary);
}

.btn-ghost:hover {
  background: var(--color-bg-hover);
  color: var(--color-text-primary);
}

.btn-sm {
  padding: var(--space-1) var(--space-3);
  font-size: var(--text-xs);
}

.btn-group {
  display: flex;
  align-items: center;
  gap: var(--space-2);
}

/* --- Tags --- */
.tag {
  display: inline-flex;
  align-items: center;
  padding: 2px var(--space-2);
  border-radius: var(--radius-sm);
  font-size: var(--text-xs);
  font-weight: var(--font-weight-medium);
  line-height: 1.5;
  white-space: nowrap;
}

.tag-neutral {
  background: var(--color-bg-subtle);
  color: var(--color-text-tertiary);
  border: 1px solid var(--color-border);
}

.tag-blue {
  background: var(--color-blue-subtle);
  color: var(--color-blue);
  border: 1px solid var(--color-blue-border);
}

.tag-green {
  background: var(--color-green-subtle);
  color: var(--color-green);
  border: 1px solid var(--color-green-border);
}

.tag-yellow {
  background: var(--color-yellow-subtle);
  color: var(--color-yellow);
  border: 1px solid var(--color-yellow-border);
}

.tag-red {
  background: var(--color-red-subtle);
  color: var(--color-red);
  border: 1px solid var(--color-red-border);
}

.tag-purple {
  background: var(--color-purple-subtle);
  color: var(--color-purple);
  border: 1px solid var(--color-purple-border);
}

.tag-orange {
  background: var(--color-orange-subtle);
  color: var(--color-orange);
  border: 1px solid var(--color-orange-border);
}

/* --- Stats Grid --- */
.stats-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: var(--space-4);
}

.stat-card {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  padding: var(--space-4);
  transition: all var(--transition-base);
}

.stat-card:hover {
  border-color: var(--color-border-hover);
  transform: translateY(-2px);
}

.stat-label {
  font-size: var(--text-xs);
  color: var(--color-text-quaternary);
  text-transform: uppercase;
  letter-spacing: 0.05em;
  margin-bottom: var(--space-2);
}

.stat-value {
  font-size: var(--text-3xl);
  font-weight: var(--font-weight-bold);
  color: var(--color-text-primary);
  font-family: var(--font-mono);
  line-height: 1;
}

.stat-change {
  font-size: var(--text-xs);
  margin-top: var(--space-2);
  display: flex;
  align-items: center;
  gap: var(--space-1);
}

.stat-change.up {
  color: var(--color-success);
}

.stat-change.down {
  color: var(--color-error);
}

/* --- Grid Layouts --- */
.grid-2 {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: var(--space-4);
}

.grid-3 {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: var(--space-4);
}

.grid-4 {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: var(--space-4);
}

/* --- Progress Bar --- */
.progress-bar {
  height: 6px;
  background: var(--color-bg-subtle);
  border-radius: var(--radius-full);
  overflow: hidden;
}

.progress-fill {
  height: 100%;
  border-radius: var(--radius-full);
  transition: width var(--transition-slow);
}

.progress-fill.blue {
  background: linear-gradient(90deg, var(--color-blue), var(--color-accent));
}

.progress-fill.green {
  background: linear-gradient(90deg, var(--color-green), #34D399);
}

.progress-fill.yellow {
  background: linear-gradient(90deg, var(--color-yellow), #FCD34D);
}

.progress-fill.red {
  background: linear-gradient(90deg, var(--color-red), #F87171);
}

.progress-fill.purple {
  background: linear-gradient(90deg, var(--color-purple), #C084FC);
}

/* --- Priority Dots --- */
.priority-dot {
  width: 8px;
  height: 8px;
  border-radius: 50%;
  display: inline-block;
}

.priority-dot.high {
  background: var(--color-red);
  box-shadow: 0 0 8px var(--color-red);
}

.priority-dot.medium {
  background: var(--color-yellow);
  box-shadow: 0 0 8px var(--color-yellow);
}

.priority-dot.low {
  background: var(--color-green);
  box-shadow: 0 0 8px var(--color-green);
}

/* --- Data Table --- */
.data-table {
  width: 100%;
  border-collapse: collapse;
  font-size: var(--text-sm);
}

.data-table thead {
  background: var(--color-bg-subtle);
  border-bottom: 1px solid var(--color-border);
}

.data-table th {
  padding: var(--space-3) var(--space-4);
  text-align: left;
  font-weight: var(--font-weight-semibold);
  color: var(--color-text-secondary);
  font-size: var(--text-xs);
  text-transform: uppercase;
  letter-spacing: 0.05em;
}

.data-table td {
  padding: var(--space-3) var(--space-4);
  border-bottom: 1px solid var(--color-border-subtle);
  color: var(--color-text-secondary);
}

.data-table tbody tr {
  transition: background var(--transition-fast);
}

.data-table tbody tr:hover {
  background: var(--color-surface-hover);
}

/* --- Theme Toggle --- */
.theme-toggle {
  position: fixed;
  top: var(--space-4);
  right: var(--space-4);
  z-index: 1000;
  display: flex;
  align-items: center;
  gap: var(--space-2);
  padding: var(--space-2) var(--space-3);
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  font-size: var(--text-xs);
  color: var(--color-text-secondary);
  cursor: pointer;
  transition: all var(--transition-fast);
}

.theme-toggle:hover {
  background: var(--color-surface-hover);
  border-color: var(--color-border-hover);
}

/* --- View Switcher --- */
.view-switcher {
  display: inline-flex;
  background: var(--color-bg-subtle);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-md);
  padding: 2px;
  gap: 2px;
}

.view-switcher-btn {
  display: flex;
  align-items: center;
  gap: var(--space-2);
  padding: var(--space-2) var(--space-3);
  border-radius: var(--radius-sm);
  font-size: var(--text-xs);
  font-weight: var(--font-weight-medium);
  color: var(--color-text-tertiary);
  background: transparent;
  border: none;
  cursor: pointer;
  transition: all var(--transition-fast);
  white-space: nowrap;
}

.view-switcher-btn svg {
  width: 14px;
  height: 14px;
  stroke: currentColor;
  stroke-width: 2;
  fill: none;
}

.view-switcher-btn:hover {
  color: var(--color-text-secondary);
  background: var(--color-bg-hover);
}

.view-switcher-btn.active {
  background: var(--color-surface);
  color: var(--color-text-primary);
  box-shadow: var(--shadow-sm);
}

/* --- View Panels --- */
.view-panel {
  display: none;
}

.view-panel.active {
  display: block;
}

/* --- AI Mode Styles --- */
.ai-mode-container {
  display: none;
  flex-direction: column;
  gap: var(--space-6);
}

.ai-mode-container.active {
  display: flex;
}

.ai-greeting-card {
  background: linear-gradient(135deg, var(--color-accent-subtle), var(--color-purple-subtle));
  border: 1px solid var(--color-accent-border);
  border-radius: var(--radius-xl);
  padding: var(--space-6);
}

.ai-greeting-header {
  display: flex;
  align-items: center;
  gap: var(--space-3);
  margin-bottom: var(--space-4);
}

.ai-avatar {
  width: 48px;
  height: 48px;
  border-radius: var(--radius-lg);
  background: linear-gradient(135deg, var(--color-accent), var(--color-purple));
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: var(--text-xl);
  font-weight: var(--font-weight-bold);
  color: white;
}

.ai-greeting-text {
  font-size: var(--text-base);
  line-height: var(--line-height-relaxed);
  color: var(--color-text-primary);
}

.ai-suggestions {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: var(--space-4);
  margin-top: var(--space-4);
}

.ai-suggestion-card {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  padding: var(--space-4);
  cursor: pointer;
  transition: all var(--transition-fast);
}

.ai-suggestion-card:hover {
  border-color: var(--color-accent-border);
  transform: translateY(-2px);
  box-shadow: var(--shadow-md);
}

.ai-suggestion-icon {
  font-size: var(--text-2xl);
  margin-bottom: var(--space-2);
}

.ai-suggestion-title {
  font-size: var(--text-sm);
  font-weight: var(--font-weight-semibold);
  color: var(--color-text-primary);
  margin-bottom: var(--space-1);
}

.ai-suggestion-desc {
  font-size: var(--text-xs);
  color: var(--color-text-tertiary);
  line-height: var(--line-height-relaxed);
}

/* --- Kanban Board --- */
.kanban-board {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: var(--space-4);
  padding: var(--space-4);
}

.kanban-column {
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-lg);
  padding: var(--space-4);
  min-height: 400px;
}

.kanban-column-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: var(--space-4);
  padding-bottom: var(--space-3);
  border-bottom: 1px solid var(--color-border);
}

.kanban-column-title {
  font-size: var(--text-sm);
  font-weight: var(--font-weight-semibold);
  color: var(--color-text-primary);
}

.kanban-column-count {
  font-size: var(--text-xs);
  color: var(--color-text-quaternary);
  background: var(--color-bg-subtle);
  padding: 2px var(--space-2);
  border-radius: var(--radius-sm);
  font-family: var(--font-mono);
}

.kanban-card {
  background: var(--color-bg-elevated);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-md);
  padding: var(--space-3);
  margin-bottom: var(--space-3);
  cursor: pointer;transition: all var(--transition-fast);
}

.kanban-card:hover {
  border-color: var(--color-border-hover);
  transform: translateY(-2px);
  box-shadow: var(--shadow-md);
}

.kanban-card-title {
  font-size: var(--text-sm);
  font-weight: var(--font-weight-semibold);
  color: var(--color-text-primary);
  margin-bottom: var(--space-2);
}

.kanban-card-meta {
  display: flex;
  align-items: center;
  justify-content: space-between;
  font-size: var(--text-xs);
  color: var(--color-text-quaternary);
  margin-top: var(--space-2);
}

/* --- Responsive --- */
@media (max-width: 768px) {
  .page-nav {
    gap: 0;
    padding: 0 var(--space-2);
  }
  
  .page-nav-btn {
    min-width: 60px;
    padding: var(--space-2);
  }
  
  .content-body {
    padding: var(--space-4);
  }
  
  .grid-2, .grid-3, .grid-4 {
    grid-template-columns: 1fr;
  }
  
  .kanban-board {
    grid-template-columns: 1fr;
  }
}
</style>
</head>
<body>

<!-- Theme Toggle -->
<div class="theme-toggle" onclick="toggleTheme()">
  <span id="themeIcon">🌙</span>
  <span id="themeLabel">切换白天</span>
</div>

<!-- ============================================================PAGE 1: DASHBOARD (首页)
     ============================================================ -->
<div class="page-section active" id="page-dashboard">
  <div class="app-shell">
    <div class="content-area">
      <!-- Normal Mode Header -->
      <div class="page-header" id="normalHeader">
        <div class="page-header-top">
          <div>
            <div class="page-title">工作台</div>
            <div class="page-subtitle">2025年7月21日 星期一 · 欢迎回来，张工</div>
          </div>
          <div class="btn-group">
            <button class="btn btn-secondary" id="aiModeBtn" onclick="toggleAIMode()">
              <span>✦</span>
              <span>AI 智能模式</span>
              <span style="background:linear-gradient(135deg,#6366F1,#A855F7);color:white;padding:2px 6px;border-radius:4px;font-size:10px;margin-left:4px">BETA</span>
            </button>
          </div>
        </div></div>

      <!-- Normal Mode Body -->
      <div class="content-body" id="normalHomeBody">
        <!-- Stats Overview -->
        <div class="stats-grid">
          <div class="stat-card">
            <div class="stat-label">待办任务</div>
            <div class="stat-value">8</div>
            <div class="stat-change up">
              <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="18 15 12 9 6 15"/></svg>
              <span>+2 今日新增</span>
            </div>
          </div>
          <div class="stat-card">
            <div class="stat-label">进行中项目</div>
            <div class="stat-value">4</div>
            <div class="stat-change">
              <span style="color:var(--color-text-quaternary)">平均进度 67%</span>
            </div>
          </div>
          <div class="stat-card">
            <div class="stat-label">安全评审</div>
            <div class="stat-value">2</div>
            <div class="stat-change">
              <span style="color:var(--color-warning)">1个待审核</span>
            </div>
          </div><div class="stat-card">
            <div class="stat-label">本月绩效</div>
            <div class="stat-value">87</div>
            <div class="stat-change up">
              <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="18 15 12 9 6 15"/></svg>
              <span>+5 较上月</span>
            </div>
          </div>
        </div>

        <!-- Quick Actions & Recent Tasks -->
        <div class="grid-2">
          <div class="card">
            <div class="card-header">
              <span class="card-title">快速操作</span>
            </div>
            <div class="card-body">
              <div style="display:grid;grid-template-columns:repeat(2,1fr);gap:var(--space-3)">
                <button class="btn btn-secondary" style="justify-content:flex-start;padding:var(--space-3)">
                  <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
                  <span>新建任务</span>
                </button>
                <button class="btn btn-secondary" style="justify-content:flex-start;padding:var(--space-3)">
                  <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
                  <span>创建项目</span>
                </button>
                <button class="btn btn-secondary" style="justify-content:flex-start;padding:var(--space-3)">
                  <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
                  <span>安全评审</span>
                </button>
                <button class="btn btn-secondary" style="justify-content:flex-start;padding:var(--space-3)">
                  <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
                  <span>导出报告</span>
                </button>
              </div>
            </div>
          </div>

          <div class="card">
            <div class="card-header">
              <span class="card-title">今日待办</span>
              <span class="tag tag-red">3个紧急</span>
            </div>
            <div class="card-body">
              <div style="display:flex;flex-direction:column;gap:var(--space-3)">
                <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-3);background:var(--color-bg-subtle);border-radius:var(--radius-md);cursor:pointer;transition:all var(--transition-fast)" onmouseover="this.style.background='var(--color-bg-hover)'" onmouseout="this.style.background='var(--color-bg-subtle)'">
                  <span class="priority-dot high"></span>
                  <div style="flex:1">
                    <div style="font-size:var(--text-sm);font-weight:500;color:var(--color-text-primary)">TSK-019 热失控仿真模型验证</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:2px">进度 65% · 今日截止</div>
                  </div>
                  <span class="tag tag-red">紧急</span>
                </div>
                <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-3);background:var(--color-bg-subtle);border-radius:var(--radius-md);cursor:pointer;transition:all var(--transition-fast)" onmouseover="this.style.background='var(--color-bg-hover)'" onmouseout="this.style.background='var(--color-bg-subtle)'">
                  <span class="priority-dot high"></span>
                  <div style="flex:1">
                    <div style="font-size:var(--text-sm);font-weight:500;color:var(--color-text-primary)">TSK-018 安全评审文档准备 SR-001</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:2px">进度 40% · 明日截止</div>
                  </div>
                  <span class="tag tag-yellow">高优先级</span>
                </div>
                <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-3);background:var(--color-bg-subtle);border-radius:var(--radius-md);cursor:pointer;transition:all var(--transition-fast)" onmouseover="this.style.background='var(--color-bg-hover)'" onmouseout="this.style.background='var(--color-bg-subtle)'">
                  <span class="priority-dot medium"></span>
                  <div style="flex:1">
                    <div style="font-size:var(--text-sm);font-weight:500;color:var(--color-text-primary)">TSK-020 BMS算法优化测试</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:2px">进度 30% · 本周内</div>
                  </div>
                  <span class="tag tag-blue">中优先级</span>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Projects & Performance -->
        <div class="grid-2">
          <div class="card">
            <div class="card-header">
              <span class="card-title">进行中的项目</span>
              <button class="btn btn-ghost btn-sm">查看全部 →</button>
            </div>
            <div class="card-body">
              <div style="display:flex;flex-direction:column;gap:var(--space-4)">
                <div>
                  <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-2)">
                    <div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);font-family:var(--font-mono)">PRJ-001</div>
                      <div style="font-size:var(--text-sm);font-weight:600;color:var(--color-text-primary)">新型高压拓扑研究</div>
                    </div>
                    <span class="tag tag-blue">进行中</span>
                  </div>
                  <div class="progress-bar" style="height:8px;margin-bottom:var(--space-1)">
                    <div class="progress-fill blue" style="width:78%"></div>
                  </div>
                  <div style="display:flex;justify-content:space-between;font-size:var(--text-xs);color:var(--color-text-quaternary)">
                    <span>进度 78%</span>
                    <span>截止 09/30</span>
                  </div>
                </div>
                <div>
                  <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-2)">
                    <div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);font-family:var(--font-mono)">PRJ-002</div>
                      <div style="font-size:var(--text-sm);font-weight:600;color:var(--color-text-primary)">BMS热管理优化</div>
                    </div>
                    <span class="tag tag-yellow">延期</span>
                  </div>
                  <div class="progress-bar" style="height:8px;margin-bottom:var(--space-1)">
                    <div class="progress-fill yellow" style="width:45%"></div>
                  </div>
                  <div style="display:flex;justify-content:space-between;font-size:var(--text-xs);color:var(--color-text-quaternary)">
                    <span>进度 45%</span>
                    <span>截止 10/31</span>
                  </div>
                </div>
                <div>
                  <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-2)">
                    <div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);font-family:var(--font-mono)">PRJ-003</div>
                      <div style="font-size:var(--text-sm);font-weight:600;color:var(--color-text-primary)">电芯一致性分析</div>
                    </div>
                    <span class="tag tag-green">接近完成</span>
                  </div>
                  <div class="progress-bar" style="height:8px;margin-bottom:var(--space-1)">
                    <div class="progress-fill green" style="width:92%"></div>
                  </div>
                  <div style="display:flex;justify-content:space-between;font-size:var(--text-xs);color:var(--color-text-quaternary)">
                    <span>进度 92%</span>
                    <span>截止 07/25</span>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="card">
            <div class="card-header">
              <span class="card-title">本月绩效概览</span>
              <span class="tag tag-green">优秀</span>
            </div>
            <div class="card-body">
              <div style="text-align:center;margin-bottom:var(--space-4)">
                <div style="font-size:var(--text-4xl);font-weight:800;color:var(--color-accent);font-family:var(--font-mono)">87</div>
                <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:var(--space-1)">综合得分</div>
              </div>
              <div style="display:flex;flex-direction:column;gap:var(--space-3)">
                <div>
                  <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-1)">
                    <span style="font-size:var(--text-xs);color:var(--color-text-secondary)">任务完成率</span>
                    <span style="font-size:var(--text-xs);font-weight:600;font-family:var(--font-mono);color:var(--color-green)">92</span>
                  </div>
                  <div class="progress-bar"><div class="progress-fill green" style="width:92%"></div></div>
                </div>
                <div>
                  <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-1)">
                    <span style="font-size:var(--text-xs);color:var(--color-text-secondary)">安全评审质量</span>
                    <span style="font-size:var(--text-xs);font-weight:600;font-family:var(--font-mono);color:var(--color-blue)">85</span>
                  </div>
                  <div class="progress-bar"><div class="progress-fill blue" style="width:85%"></div></div>
                </div>
                <div>
                  <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-1)">
                    <span style="font-size:var(--text-xs);color:var(--color-text-secondary)">专利输出</span>
                    <span style="font-size:var(--text-xs);font-weight:600;font-family:var(--font-mono);color:var(--color-yellow)">60</span>
                  </div>
                  <div class="progress-bar"><div class="progress-fill yellow" style="width:60%"></div></div>
                </div>
                <div>
                  <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-1)">
                    <span style="font-size:var(--text-xs);color:var(--color-text-secondary)">技术分享</span>
                    <span style="font-size:var(--text-xs);font-weight:600;font-family:var(--font-mono);color:var(--color-green)">100</span>
                  </div>
                  <div class="progress-bar"><div class="progress-fill green" style="width:100%"></div></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- AI Mode Body -->
      <div class="ai-mode-container" id="aiHomeBody">
        <div style="padding:var(--space-6)">
          <div class="ai-greeting-card">
            <div class="ai-greeting-header">
              <div class="ai-avatar">AI</div>
              <div>
                <div style="font-size:var(--text-lg);font-weight:600;color:var(--color-text-primary)">智能工作助手</div>
                <div style="font-size:var(--text-xs);color:var(--color-text-tertiary)">基于您的工作数据智能分析</div>
              </div>
            </div>
            <div class="ai-greeting-text" id="aiGreetingText">
              我已经分析了你的工作状态和项目进展。今天有 <strong>3个紧急任务</strong> 需要优先处理，其中 <strong>TSK-019 热失控仿真验证</strong> 最为紧急。你的本月 KPI 完成度为 <strong>87%</strong>，距离优秀评级还差 <strong>5分</strong>。我建议优先完成安全评审相关任务，这将显著提升你的绩效得分。需要我为你生成今日工作计划吗？
            </div>
            <div class="ai-suggestions">
              <div class="ai-suggestion-card">
                <div class="ai-suggestion-icon">📋</div>
                <div class="ai-suggestion-title">生成今日工作计划</div>
                <div class="ai-suggestion-desc">基于优先级和截止时间智能排序</div>
              </div>
              <div class="ai-suggestion-card">
                <div class="ai-suggestion-icon">⚡</div>
                <div class="ai-suggestion-title">优化任务分配</div>
                <div class="ai-suggestion-desc">分析工作负载，建议任务调整</div>
              </div>
              <div class="ai-suggestion-card">
                <div class="ai-suggestion-icon">📊</div>
                <div class="ai-suggestion-title">绩效提升建议</div>
                <div class="ai-suggestion-desc">识别薄弱环节，提供改进方案</div>
              </div>
            </div>
          </div>

          <!-- AI Insights Grid -->
          <div class="grid-3" style="margin-top:var(--space-6)">
            <div class="card">
              <div class="card-header">
                <span class="card-title">🎯 优先级建议</span>
              </div>
              <div class="card-body">
                <div style="display:flex;flex-direction:column;gap:var(--space-3)">
                  <div style="padding:var(--space-3);background:var(--color-red-subtle);border:1px solid var(--color-red-border);border-radius:var(--radius-md)">
                    <div style="font-size:var(--text-sm);font-weight:600;color:var(--color-text-primary);margin-bottom:var(--space-1)">立即处理</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-secondary)">TSK-019 今日截止，建议优先完成</div>
                  </div>
                  <div style="padding:var(--space-3);background:var(--color-yellow-subtle);border:1px solid var(--color-yellow-border);border-radius:var(--radius-md)">
                    <div style="font-size:var(--text-sm);font-weight:600;color:var(--color-text-primary);margin-bottom:var(--space-1)">今日完成</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-secondary)">TSK-018 明日截止，需加快进度</div>
                  </div>
                  <div style="padding:var(--space-3);background:var(--color-blue-subtle);border:1px solid var(--color-blue-border);border-radius:var(--radius-md)">
                    <div style="font-size:var(--text-sm);font-weight:600;color:var(--color-text-primary);margin-bottom:var(--space-1)">本周安排</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-secondary)">TSK-020 可灵活安排时间</div>
                  </div>
                </div>
              </div>
            </div>

            <div class="card">
              <div class="card-header">
                <span class="card-title">💡 智能洞察</span>
              </div>
              <div class="card-body">
                <div style="display:flex;flex-direction:column;gap:var(--space-4)">
                  <div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-bottom:var(--space-2)">工作效率分析</div>
                    <div style="font-size:var(--text-sm);color:var(--color-text-secondary);line-height:1.6)">本周任务完成速度较上周提升 <strong style="color:var(--color-green)">23%</strong>，保持良好状态</div>
                  </div>
                  <div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-bottom:var(--space-2)">时间分配建议</div>
                    <div style="font-size:var(--text-sm);color:var(--color-text-secondary);line-height:1.6">建议将 <strong style="color:var(--color-accent)">40%</strong> 时间用于紧急任务，<strong style="color:var(--color-accent)">30%</strong> 用于项目推进</div>
                  </div>
                  <div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-bottom:var(--space-2)">风险预警</div>
                    <div style="font-size:var(--text-sm);color:var(--color-text-secondary);line-height:1.6">PRJ-002 进度落后，可能影响整体交付时间</div>
                  </div>
                </div>
              </div>
            </div>

            <div class="card">
              <div class="card-header">
                <span class="card-title">📈 绩效预测</span>
              </div>
              <div class="card-body">
                <div style="text-align:center;margin-bottom:var(--space-4)">
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-bottom:var(--space-2)">月末预测得分</div>
                  <div style="font-size:var(--text-3xl);font-weight:800;color:var(--color-accent);font-family:var(--font-mono)">92</div>
                  <div style="font-size:var(--text-xs);color:var(--color-green);margin-top:var(--space-1)">↑ +5 分</div>
                </div>
                <div style="padding:var(--space-3);background:var(--color-accent-subtle);border:1px solid var(--color-accent-border);border-radius:var(--radius-md)">
                  <div style="font-size:var(--text-xs);color:var(--color-text-secondary);line-height:1.6">
                    按当前进度，完成以下任务可达成目标：
                    <ul style="margin-top:var(--space-2);padding-left:var(--space-4)">
                      <li>完成2篇专利交底书 (+3分)</li>
                      <li>主导1次安全评审 (+2分)</li>
                    </ul>
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

<!-- ============================================================PAGE 2: TASKS (任务管理)
     ============================================================ -->
<div class="page-section" id="page-tasks">
  <div class="app-shell">
    <div class="content-area">
      <div class="page-header">
        <div class="page-header-top">
          <div>
            <div class="page-title">任务管理</div>
            <div class="page-subtitle">8个待办 · 12个进行中 · 45个已完成</div>
          </div>
          <div class="btn-group">
            <div class="view-switcher" id="taskViewSwitcher">
              <button class="view-switcher-btn active" onclick="switchTaskView('list', this)">
                <svg viewBox="0 0 24 24"><line x1="8" y1="6" x2="21" y2="6"/><line x1="8" y1="12" x2="21" y2="12"/><line x1="8" y1="18" x2="21" y2="18"/><line x1="3" y1="6" x2="3.01" y2="6"/><line x1="3" y1="12" x2="3.01" y2="12"/><line x1="3" y1="18" x2="3.01" y2="18"/></svg>
                列表
              </button>
              <button class="view-switcher-btn" onclick="switchTaskView('kanban', this)">
                <svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>
                看板
              </button>
              <button class="view-switcher-btn" onclick="switchTaskView('gantt', this)">
                <svg viewBox="0 0 24 24"><line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/></svg>
                甘特图
              </button>
            </div>
            <button class="btn btn-primary">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
              新建任务
            </button>
          </div>
        </div>
      </div>

      <div class="content-body">
        <!-- List View -->
        <div id="taskListView" class="view-panel active">
          <div class="card">
            <div style="overflow-x:auto">
              <table class="data-table">
                <thead>
                  <tr>
                    <th style="width:40px"></th>
                    <th>任务</th>
                    <th>项目</th>
                    <th>优先级</th>
                    <th>状态</th>
                    <th>进度</th>
                    <th>负责人</th>
                    <th>截止日期</th>
                  </tr>
                </thead>
                <tbody><tr>
                    <td><input type="checkbox"/></td>
                    <td>
                      <div style="font-weight:500;color:var(--color-text-primary)">TSK-019 热失控仿真模型验证</div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:2px">完成ANSYS仿真并验证结果准确性</div>
                    </td>
                    <td><spanclass="tag tag-blue">PRJ-001</span></td>
                    <td><span class="priority-dot high"></span> <span style="margin-left:var(--space-2)">紧急</span></td>
                    <td><span class="tag tag-yellow">进行中</span></td>
                    <td>
                      <div style="display:flex;align-items:center;gap:var(--space-2)">
                        <div class="progress-bar" style="width:80px;height:6px"><div class="progress-fill blue" style="width:65%"></div></div>
                        <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-tertiary)">65%</span>
                      </div>
                    </td>
                    <td>张工</td>
                    <td><span style="color:var(--color-red)">今天</span></td>
                  </tr>
                  <tr>
                    <td><input type="checkbox"/></td>
                    <td>
                      <div style="font-weight:500;color:var(--color-text-primary)">TSK-018 安全评审文档准备 SR-001</div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:2px">准备高压拓扑安全评审材料</div>
                    </td>
                    <td><span class="tag tag-blue">PRJ-001</span></td>
                    <td><span class="priority-dot high"></span> <span style="margin-left:var(--space-2)">高</span></td>
                    <td><span class="tag tag-yellow">进行中</span></td>
                    <td>
                      <div style="display:flex;align-items:center;gap:var(--space-2)">
                        <div class="progress-bar" style="width:80px;height:6px"><div class="progress-fill yellow" style="width:40%"></div></div>
                        <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-tertiary)">40%</span>
                      </div>
                    </td>
                    <td>张工</td>
                    <td>明天</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox"/></td>
                    <td>
                      <div style="font-weight:500;color:var(--color-text-primary)">TSK-020 BMS算法优化测试</div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:2px">完成SOC/SOH算法优化并测试</div>
                    </td>
                    <td><span class="tag tag-green">PRJ-002</span></td>
                    <td><span class="priority-dot medium"></span> <span style="margin-left:var(--space-2)">中</span></td>
                    <td><span class="tag tag-blue">待开始</span></td>
                    <td>
                      <div style="display:flex;align-items:center;gap:var(--space-2)">
                        <div class="progress-bar" style="width:80px;height:6px"><div class="progress-fill green" style="width:30%"></div></div>
                        <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-tertiary)">30%</span>
                      </div>
                    </td>
                    <td>张工</td>
                    <td>07/25</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox"/></td>
                    <td>
                      <div style="font-weight:500;color:var(--color-text-primary)">TSK-021 电芯测试数据分析</div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:2px">分析100组电芯测试数据</div>
                    </td>
                    <td><span class="tag tag-purple">PRJ-003</span></td>
                    <td><span class="priority-dot low"></span> <span style="margin-left:var(--space-2)">低</span></td>
                    <td><span class="tag tag-green">已完成</span></td>
                    <td>
                      <div style="display:flex;align-items:center;gap:var(--space-2)">
                        <div class="progress-bar" style="width:80px;height:6px"><div class="progress-fill green" style="width:100%"></div></div>
                        <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-tertiary)">100%</span>
                      </div>
                    </td>
                    <td>张工</td>
                    <td>07/20</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox"/></td>
                    <td>
                      <div style="font-weight:500;color:var(--color-text-primary)">TSK-022 专利交底书撰写</div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:2px">完成热管理优化专利文档</div>
                    </td>
                    <td><span class="tag tag-orange">专利</span></td>
                    <td><span class="priority-dot medium"></span> <span style="margin-left:var(--space-2)">中</span></td>
                    <td><span class="tag tag-yellow">进行中</span></td>
                    <td>
                      <div style="display:flex;align-items:center;gap:var(--space-2)">
                        <div class="progress-bar" style="width:80px;height:6px"><div class="progress-fill purple" style="width:55%"></div></div>
                        <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-tertiary)">55%</span>
                      </div>
                    </td>
                    <td>张工</td>
                    <td>07/28</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <!-- Kanban View -->
        <div id="taskKanbanView" class="view-panel">
          <div class="kanban-board">
            <div class="kanban-column">
              <div class="kanban-column-header">
                <span class="kanban-column-title">待开始</span>
                <span class="kanban-column-count">3</span>
              </div>
              <div class="kanban-card">
                <div style="display:flex;align-items:center;gap:var(--space-2);margin-bottom:var(--space-2)">
                  <span class="priority-dot medium"></span>
                  <span class="tag tag-blue" style="font-size:10px">PRJ-001</span>
                </div>
                <div class="kanban-card-title">TSK-020 BMS算法优化测试</div>
                <div style="font-size:var(--text-xs);color:var(--color-text-tertiary);margin-top:var(--space-2)">完成SOC/SOH算法优化并测试</div>
                <div class="kanban-card-meta">
                  <span>张工</span>
                  <span>07/25</span>
                </div>
              </div>
              <div class="kanban-card">
                <div style="display:flex;align-items:center;gap:var(--space-2);margin-bottom:var(--space-2)">
                  <span class="priority-dot low"></span>
                  <span class="tag tag-purple" style="font-size:10px">PRJ-003</span>
                </div>
                <div class="kanban-card-title">TSK-023 技术文档整理</div>
                <div style="font-size:var(--text-xs);color:var(--color-text-tertiary);margin-top:var(--space-2)">整理Q2技术文档归档</div>
                <div class="kanban-card-meta">
                  <span>张工</span>
                  <span>07/30</span>
                </div>
              </div>
              <div class="kanban-card">
                <div style="display:flex;align-items:center;gap:var(--space-2);margin-bottom:var(--space-2)">
                  <span class="priority-dot low"></span>
                  <span class="tag tag-green" style="font-size:10px">PRJ-002</span>
                </div>
                <div class="kanban-card-title">TSK-024 团队技术分享准备</div>
                <div style="font-size:var(--text-xs);color:var(--color-text-tertiary);margin-top:var(--space-2)">准备热管理技术分享材料</div>
                <div class="kanban-card-meta">
                  <span>张工</span>
                  <span>08/05</span>
                </div>
              </div>
            </div>

            <div class="kanban-column">
              <div class="kanban-column-header">
                <span class="kanban-column-title">进行中</span>
                <span class="kanban-column-count">3</span>
              </div>
              <div class="kanban-card">
                <div style="display:flex;align-items:center;gap:var(--space-2);margin-bottom:var(--space-2)">
                  <span class="priority-dot high"></span>
                  <span class="tag tag-blue" style="font-size:10px">PRJ-001</span>
                </div>
                <div class="kanban-card-title">TSK-019 热失控仿真模型验证</div>
                <div style="font-size:var(--text-xs);color:var(--color-text-tertiary);margin-top:var(--space-2)">完成ANSYS仿真并验证结果准确性</div>
                <div class="progress-bar" style="margin-top:var(--space-2);height:4px"><div class="progress-fill blue" style="width:65%"></div></div>
                <div class="kanban-card-meta">
                  <span>张工</span>
                  <span style="color:var(--color-red)">今天</span>
                </div>
              </div>
              <div class="kanban-card">
                <div style="display:flex;align-items:center;gap:var(--space-2);margin-bottom:var(--space-2)">
                  <span class="priority-dot high"></span>
                  <span class="tag tag-blue" style="font-size:10px">PRJ-001</span>
                </div>
                <div class="kanban-card-title">TSK-018 安全评审文档准备 SR-001</div>
                <div style="font-size:var(--text-xs);color:var(--color-text-tertiary);margin-top:var(--space-2)">准备高压拓扑安全评审材料</div>
                <div class="progress-bar" style="margin-top:var(--space-2);height:4px"><div class="progress-fill yellow" style="width:40%"></div></div>
                <div class="kanban-card-meta">
                  <span>张工</span>
                  <span>明天</span>
                </div>
              </div>
              <div class="kanban-card">
                <div style="display:flex;align-items:center;gap:var(--space-2);margin-bottom:var(--space-2)">
                  <span class="priority-dot medium"></span>
                  <span class="tag tag-orange" style="font-size:10px">专利</span>
                </div>
                <div class="kanban-card-title">TSK-022 专利交底书撰写</div>
                <div style="font-size:var(--text-xs);color:var(--color-text-tertiary);margin-top:var(--space-2)">完成热管理优化专利文档</div>
                <div class="progress-bar" style="margin-top:var(--space-2);height:4px"><div class="progress-fill purple" style="width:55%"></div></div>
                <div class="kanban-card-meta">
                  <span>张工</span>
                  <span>07/28</span>
                </div>
              </div>
            </div>

            <div class="kanban-column">
              <div class="kanban-column-header">
                <span class="kanban-column-title">待审核</span>
                <span class="kanban-column-count">2</span>
              </div>
              <div class="kanban-card">
                <div style="display:flex;align-items:center;gap:var(--space-2);margin-bottom:var(--space-2)">
                  <span class="priority-dot low"></span>
                  <span class="tag tag-purple" style="font-size:10px">PRJ-003</span>
                </div>
                <div class="kanban-card-title">TSK-021 电芯测试数据分析</div>
                <div style="font-size:var(--text-xs);color:var(--color-text-tertiary);margin-top:var(--space-2)">分析100组电芯测试数据</div>
                <div class="progress-bar" style="margin-top:var(--space-2);height:4px"><div class="progress-fill green" style="width:100%"></div></div>
                <div class="kanban-card-meta">
                  <span>张工</span>
                  <span>07/20</span>
                </div>
              </div>
              <div class="kanban-card">
                <div style="display:flex;align-items:center;gap:var(--space-2);margin-bottom:var(--space-2)">
                  <span class="priority-dot medium"></span>
                  <span class="tag tag-green" style="font-size:10px">PRJ-002</span>
                </div>
                <div class="kanban-card-title">TSK-017 热管理系统设计优化</div>
                <div style="font-size:var(--text-xs);color:var(--color-text-tertiary);margin-top:var(--space-2)">优化液冷系统设计方案</div>
                <div class="progress-bar" style="margin-top:var(--space-2);height:4px"><div class="progress-fill green" style="width:100%"></div></div>
                <div class="kanban-card-meta">
                  <span>张工</span>
                  <span>07/18</span>
                </div>
              </div>
            </div>

            <div class="kanban-column">
              <div class="kanban-column-header">
                <span class="kanban-column-title">已完成</span>
                <span class="kanban-column-count">45</span>
              </div>
              <div class="kanban-card">
                <div style="display:flex;align-items:center;gap:var(--space-2);margin-bottom:var(--space-2)">
                  <span class="tag tag-green" style="font-size:10px">已完成</span>
                </div>
                <div class="kanban-card-title">TSK-016 电池包结构设计</div>
                <div style="font-size:var(--text-xs);color:var(--color-text-tertiary);margin-top:var(--space-2)">完成800V电池包结构设计</div>
                <div class="kanban-card-meta">
                  <span>张工</span>
                  <span>07/15</span>
                </div>
              </div>
              <div style="text-align:center;padding:var(--space-4);color:var(--color-text-quaternary);font-size:var(--text-xs)">
                查看全部 45 个已完成任务 →
              </div>
            </div>
          </div>
        </div>

        <!-- Gantt View -->
        <div id="taskGanttView" class="view-panel">
          <div class="card">
            <div class="card-body">
              <div style="overflow-x:auto">
                <div style="min-width:1200px">
                  <!-- Gantt Header -->
                  <div style="display:grid;grid-template-columns:300px repeat(14,1fr);gap:1px;background:var(--color-border);border:1px solid var(--color-border);border-radius:var(--radius-md) var(--radius-md) 0 0">
                    <div style="background:var(--color-bg-subtle);padding:var(--space-3);font-size:var(--text-xs);font-weight:600;color:var(--color-text-secondary)">任务</div>
                    <div style="background:var(--color-bg-subtle);padding:var(--space-3);font-size:var(--text-xs);text-align:center;color:var(--color-text-quaternary)">7/15</div>
                    <div style="background:var(--color-bg-subtle);padding:var(--space-3);font-size:var(--text-xs);text-align:center;color:var(--color-text-quaternary)">7/16</div>
                    <div style="background:var(--color-bg-subtle);padding:var(--space-3);font-size:var(--text-xs);text-align:center;color:var(--color-text-quaternary)">7/17</div>
                    <div style="background:var(--color-bg-subtle);padding:var(--space-3);font-size:var(--text-xs);text-align:center;color:var(--color-text-quaternary)">7/18</div>
                    <div style="background:var(--color-bg-subtle);padding:var(--space-3);font-size:var(--text-xs);text-align:center;color:var(--color-text-quaternary)">7/19</div>
                    <div style="background:var(--color-bg-subtle);padding:var(--space-3);font-size:var(--text-xs);text-align:center;color:var(--color-text-quaternary)">7/20</div>
                    <div style="background:var(--color-bg-subtle);padding:var(--space-3);font-size:var(--text-xs);text-align:center;color:var(--color-accent)">7/21</div>
                    <div style="background:var(--color-bg-subtle);padding:var(--space-3);font-size:var(--text-xs);text-align:center;color:var(--color-text-quaternary)">7/22</div>
                    <div style="background:var(--color-bg-subtle);padding:var(--space-3);font-size:var(--text-xs);text-align:center;color:var(--color-text-quaternary)">7/23</div>
                    <div style="background:var(--color-bg-subtle);padding:var(--space-3);font-size:var(--text-xs);text-align:center;color:var(--color-text-quaternary)">7/24</div>
                    <div style="background:var(--color-bg-subtle);padding:var(--space-3);font-size:var(--text-xs);text-align:center;color:var(--color-text-quaternary)">7/25</div>
                    <div style="background:var(--color-bg-subtle);padding:var(--space-3);font-size:var(--text-xs);text-align:center;color:var(--color-text-quaternary)">7/26</div>
                    <div style="background:var(--color-bg-subtle);padding:var(--space-3);font-size:var(--text-xs);text-align:center;color:var(--color-text-quaternary)">7/27</div>
                    <div style="background:var(--color-bg-subtle);padding:var(--space-3);font-size:var(--text-xs);text-align:center;color:var(--color-text-quaternary)">7/28</div>
                  </div>
                  
                  <!-- Gantt Rows -->
                  <div style="display:grid;grid-template-columns:300px repeat(14,1fr);gap:1px;background:var(--color-border);border:1px solid var(--color-border);border-top:none">
                    <div style="background:var(--color-surface);padding:var(--space-3)">
                      <div style="font-size:var(--text-sm);font-weight:500;color:var(--color-text-primary)">TSK-019 热失控仿真验证</div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:2px">张工 · 紧急</div>
                    </div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3);position:relative">
                      <div style="position:absolute;top:50%;left:0;right:0;transform:translateY(-50%);height:20px;background:linear-gradient(90deg,var(--color-blue),var(--color-accent));border-radius:4px;display:flex;align-items:center;justify-content:center;font-size:10px;color:white;font-weight:600">65%</div>
                    </div>
                    <div style="background:var(--color-surface);padding:var(--space-3);position:relative">
                      <div style="position:absolute;top:50%;left:0;right:0;transform:translateY(-50%);height:20px;background:linear-gradient(90deg,var(--color-blue),var(--color-accent));border-radius:4px"></div>
                    </div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div></div>

                  <div style="display:grid;grid-template-columns:300px repeat(14,1fr);gap:1px;background:var(--color-border);border:1px solid var(--color-border);border-top:none">
                    <div style="background:var(--color-surface);padding:var(--space-3)">
                      <div style="font-size:var(--text-sm);font-weight:500;color:var(--color-text-primary)">TSK-018 安全评审文档准备</div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:2px">张工 · 高</div>
                    </div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3);position:relative">
                      <div style="position:absolute;top:50%;left:0;right:0;transform:translateY(-50%);height:20px;background:linear-gradient(90deg,var(--color-yellow),#FCD34D);border-radius:4px;display:flex;align-items:center;justify-content:center;font-size:10px;color:white;font-weight:600">40%</div>
                    </div>
                    <div style="background:var(--color-surface);padding:var(--space-3);position:relative">
                      <div style="position:absolute;top:50%;left:0;right:0;transform:translateY(-50%);height:20px;background:linear-gradient(90deg,var(--color-yellow),#FCD34D);border-radius:4px"></div>
                    </div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div></div>

                  <div style="display:grid;grid-template-columns:300px repeat(14,1fr);gap:1px;background:var(--color-border);border:1px solid var(--color-border);border-top:none">
                    <div style="background:var(--color-surface);padding:var(--space-3)">
                      <div style="font-size:var(--text-sm);font-weight:500;color:var(--color-text-primary)">TSK-020 BMS算法优化测试</div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:2px">张工 · 中</div>
                    </div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3);position:relative">
                      <div style="position:absolute;top:50%;left:0;right:0;transform:translateY(-50%);height:20px;background:linear-gradient(90deg,var(--color-green),#34D399);border-radius:4px;display:flex;align-items:center;justify-content:center;font-size:10px;color:white;font-weight:600">30%</div>
                    </div>
                    <div style="background:var(--color-surface);padding:var(--space-3);position:relative">
                      <div style="position:absolute;top:50%;left:0;right:0;transform:translateY(-50%);height:20px;background:linear-gradient(90deg,var(--color-green),#34D399);border-radius:4px"></div>
                    </div>
                    <div style="background:var(--color-surface);padding:var(--space-3);position:relative">
                      <div style="position:absolute;top:50%;left:0;right:0;transform:translateY(-50%);height:20px;background:linear-gradient(90deg,var(--color-green),#34D399);border-radius:4px"></div>
                    </div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                  </div>

                  <div style="display:grid;grid-template-columns:300px repeat(14,1fr);gap:1px;background:var(--color-border);border:1px solid var(--color-border);border-top:none;border-radius:0 0 var(--radius-md) var(--radius-md)">
                    <div style="background:var(--color-surface);padding:var(--space-3)">
                      <div style="font-size:var(--text-sm);font-weight:500;color:var(--color-text-primary)">TSK-022 专利交底书撰写</div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:2px">张工 · 中</div>
                    </div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3);position:relative">
                      <div style="position:absolute;top:50%;left:0;right:0;transform:translateY(-50%);height:20px;background:linear-gradient(90deg,var(--color-purple),#C084FC);border-radius:4px;display:flex;align-items:center;justify-content:center;font-size:10px;color:white;font-weight:600">55%</div>
                    </div>
                    <div style="background:var(--color-surface);padding:var(--space-3);position:relative">
                      <div style="position:absolute;top:50%;left:0;right:0;transform:translateY(-50%);height:20px;background:linear-gradient(90deg,var(--color-purple),#C084FC);border-radius:4px"></div>
                    </div>
                    <div style="background:var(--color-surface);padding:var(--space-3);position:relative">
                      <div style="position:absolute;top:50%;left:0;right:0;transform:translateY(-50%);height:20px;background:linear-gradient(90deg,var(--color-purple),#C084FC);border-radius:4px"></div>
                    </div>
                    <div style="background:var(--color-surface);padding:var(--space-3);position:relative">
                      <div style="position:absolute;top:50%;left:0;right:0;transform:translateY(-50%);height:20px;background:linear-gradient(90deg,var(--color-purple),#C084FC);border-radius:4px"></div>
                    </div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div>
                    <div style="background:var(--color-surface);padding:var(--space-3)"></div></div>
                </div>
            </div>
          </div>
        </div>
    </div>
  </div>

<!-- ============================================================PAGE 3: PROJECTS (项目管理)
     ============================================================ -->
<div class="page-section" id="page-projects">
  <div class="app-shell">
    <div class="content-area">
      <div class="page-header">
        <div class="page-header-top">
          <div>
            <div class="page-title">项目管理</div>
            <div class="page-subtitle">4个进行中 · 12个已完成</div>
          </div>
          <div class="btn-group">
            <div class="view-switcher">
              <button class="view-switcher-btn active" onclick="switchProjectView('overview', this)"><svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>
                概览
              </button>
              <button class="view-switcher-btn" onclick="switchProjectView('wbs', this)">
                <svg viewBox="0 0 24 24"><polyline points="22 12 18 12 15 21 9 3 6 12 2 12"/></svg>
                WBS
              </button>
              <button class="view-switcher-btn" onclick="switchProjectView('stats', this)">
                <svg viewBox="0 0 24 24"><line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/></svg>
                数据统计
              </button></div>
            <button class="btn btn-primary">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
              新建项目
            </button>
          </div>
        </div>
      </div>

      <div class="content-body">
        <!-- Overview View -->
        <div id="projectOverviewView" class="view-panel active">
          <div class="grid-2">
            <div class="card">
              <div class="card-header">
                <div style="display:flex;align-items:center;gap:var(--space-3)">
                  <div style="width:40px;height:40px;border-radius:var(--radius-md);background:linear-gradient(135deg,var(--color-blue),var(--color-accent));display:flex;align-items:center;justify-content:center">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"><path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"/></svg>
                  </div>
                  <div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);font-family:var(--font-mono)">PRJ-001</div>
                    <div style="font-size:var(--text-base);font-weight:600">新型高压拓扑研究</div>
                  </div>
                </div><span class="tag tag-blue">进行中</span>
              </div>
              <div class="card-body">
                <div style="display:flex;flex-direction:column;gap:var(--space-4)">
                  <div>
                    <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                      <span style="font-size:var(--text-sm);color:var(--color-text-secondary)">整体进度</span>
                      <span style="font-size:var(--text-sm);font-weight:600;font-family:var(--font-mono);color:var(--color-accent)">78%</span>
                    </div>
                    <div class="progress-bar" style="height:8px"><div class="progress-fill blue" style="width:78%"></div></div>
                  </div>
                  <div style="display:grid;grid-template-columns:repeat(3,1fr);gap:var(--space-3)">
                    <div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">任务数</div>
                      <div style="font-size:var(--text-xl);font-weight:700;font-family:var(--font-mono);color:var(--color-text-primary)">12</div>
                    </div>
                    <div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">已完成</div>
                      <div style="font-size:var(--text-xl);font-weight:700;font-family:var(--font-mono);color:var(--color-green)">8</div>
                    </div>
                    <div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">进行中</div>
                      <div style="font-size:var(--text-xl);font-weight:700;font-family:var(--font-mono);color:var(--color-yellow)">4</div>
                    </div>
                  <div style="padding:var(--space-3);background:var(--color-bg-subtle);border-radius:var(--radius-md)">
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-bottom:var(--space-2)">项目信息</div>
                    <div style="display:flex;flex-direction:column;gap:var(--space-2);font-size:var(--text-sm)">
                      <div style="display:flex;justify-content:space-between">
                        <span style="color:var(--color-text-tertiary)">负责人</span>
                        <span style="color:var(--color-text-primary)">张工</span>
                      </div>
                      <div style="display:flex;justify-content:space-between">
                        <span style="color:var(--color-text-tertiary)">开始日期</span>
                        <span style="color:var(--color-text-primary)">2025-06-01</span>
                      </div>
                      <div style="display:flex;justify-content:space-between">
                        <span style="color:var(--color-text-tertiary)">截止日期</span>
                        <span style="color:var(--color-text-primary)">2025-09-30</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="card">
              <div class="card-header">
                <div style="display:flex;align-items:center;gap:var(--space-3)">
                  <div style="width:40px;height:40px;border-radius:var(--radius-md);background:linear-gradient(135deg,var(--color-green),var(--color-teal));display:flex;align-items:center;justify-content:center">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
                  </div>
                  <div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);font-family:var(--font-mono)">PRJ-002</div>
                    <div style="font-size:var(--text-base);font-weight:600">BMS热管理优化</div>
                  </div>
                </div>
                <span class="tag tag-yellow">延期</span>
              </div>
              <div class="card-body">
                <div style="display:flex;flex-direction:column;gap:var(--space-4)">
                  <div>
                    <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                      <span style="font-size:var(--text-sm);color:var(--color-text-secondary)">整体进度</span>
                      <span style="font-size:var(--text-sm);font-weight:600;font-family:var(--font-mono);color:var(--color-yellow)">45%</span>
                    </div>
                    <div class="progress-bar" style="height:8px"><div class="progress-fill yellow" style="width:45%"></div></div>
                  </div>
                  <div style="display:grid;grid-template-columns:repeat(3,1fr);gap:var(--space-3)">
                    <div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">任务数</div>
                      <div style="font-size:var(--text-xl);font-weight:700;font-family:var(--font-mono);color:var(--color-text-primary)">15</div>
                    </div>
                    <div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">已完成</div>
                      <div style="font-size:var(--text-xl);font-weight:700;font-family:var(--font-mono);color:var(--color-green)">5</div>
                    </div>
                    <div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">进行中</div>
                      <div style="font-size:var(--text-xl);font-weight:700;font-family:var(--font-mono);color:var(--color-yellow)">10</div>
                    </div>
                  </div>
                  <div style="padding:var(--space-3);background:var(--color-bg-subtle);border-radius:var(--radius-md)">
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-bottom:var(--space-2)">项目信息</div>
                    <div style="display:flex;flex-direction:column;gap:var(--space-2);font-size:var(--text-sm)">
                      <div style="display:flex;justify-content:space-between">
                        <span style="color:var(--color-text-tertiary)">负责人</span>
                        <span style="color:var(--color-text-primary)">李工</span>
                      </div>
                      <div style="display:flex;justify-content:space-between">
                        <span style="color:var(--color-text-tertiary)">开始日期</span>
                        <span style="color:var(--color-text-primary)">2025-05-15</span>
                      </div>
                      <div style="display:flex;justify-content:space-between">
                        <span style="color:var(--color-text-tertiary)">截止日期</span>
                        <span style="color:var(--color-red)">2025-10-31</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="card">
              <div class="card-header">
                <div style="display:flex;align-items:center;gap:var(--space-3)">
                  <div style="width:40px;height:40px;border-radius:var(--radius-md);background:linear-gradient(135deg,var(--color-purple),var(--color-pink));display:flex;align-items:center;justify-content:center">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"><line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/></svg>
                  </div>
                  <div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);font-family:var(--font-mono)">PRJ-003</div>
                    <div style="font-size:var(--text-base);font-weight:600">电芯一致性分析</div>
                  </div>
                </div>
                <span class="tag tag-green">接近完成</span>
              </div>
              <div class="card-body">
                <div style="display:flex;flex-direction:column;gap:var(--space-4)">
                  <div>
                    <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                      <span style="font-size:var(--text-sm);color:var(--color-text-secondary)">整体进度</span>
                      <span style="font-size:var(--text-sm);font-weight:600;font-family:var(--font-mono);color:var(--color-green)">92%</span>
                    </div>
                    <div class="progress-bar" style="height:8px"><div class="progress-fill green" style="width:92%"></div></div>
                  </div>
                  <div style="display:grid;grid-template-columns:repeat(3,1fr);gap:var(--space-3)">
                    <div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">任务数</div>
                      <div style="font-size:var(--text-xl);font-weight:700;font-family:var(--font-mono);color:var(--color-text-primary)">8</div>
                    </div>
                    <div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">已完成</div>
                      <div style="font-size:var(--text-xl);font-weight:700;font-family:var(--font-mono);color:var(--color-green)">7</div>
                    </div>
                    <div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">进行中</div>
                      <div style="font-size:var(--text-xl);font-weight:700;font-family:var(--font-mono);color:var(--color-yellow)">1</div>
                    </div>
                  </div>
                  <div style="padding:var(--space-3);background:var(--color-bg-subtle);border-radius:var(--radius-md)">
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-bottom:var(--space-2)">项目信息</div>
                    <div style="display:flex;flex-direction:column;gap:var(--space-2);font-size:var(--text-sm)">
                      <div style="display:flex;justify-content:space-between">
                        <span style="color:var(--color-text-tertiary)">负责人</span>
                        <span style="color:var(--color-text-primary)">王工</span>
                      </div>
                      <div style="display:flex;justify-content:space-between">
                        <span style="color:var(--color-text-tertiary)">开始日期</span>
                        <span style="color:var(--color-text-primary)">2025-06-10</span>
                      </div>
                      <div style="display:flex;justify-content:space-between">
                        <span style="color:var(--color-text-tertiary)">截止日期</span>
                        <span style="color:var(--color-text-primary)">2025-07-25</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="card">
              <div class="card-header">
                <div style="display:flex;align-items:center;gap:var(--space-3)">
                  <div style="width:40px;height:40px;border-radius:var(--radius-md);background:linear-gradient(135deg,var(--color-orange),var(--color-yellow));display:flex;align-items:center;justify-content:center">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
                  </div>
                  <div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);font-family:var(--font-mono)">PRJ-004</div>
                    <div style="font-size:var(--text-base);font-weight:600">快充技术研发</div>
                  </div>
                </div>
                <span class="tag tag-blue">进行中</span>
              </div>
              <div class="card-body">
                <div style="display:flex;flex-direction:column;gap:var(--space-4)">
                  <div>
                    <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                      <span style="font-size:var(--text-sm);color:var(--color-text-secondary)">整体进度</span>
                      <span style="font-size:var(--text-sm);font-weight:600;font-family:var(--font-mono);color:var(--color-accent)">35%</span>
                    </div>
                    <div class="progress-bar" style="height:8px"><div class="progress-fill blue" style="width:35%"></div></div>
                  </div>
                  <div style="display:grid;grid-template-columns:repeat(3,1fr);gap:var(--space-3)">
                    <div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">任务数</div>
                      <div style="font-size:var(--text-xl);font-weight:700;font-family:var(--font-mono);color:var(--color-text-primary)">20</div>
                    </div>
                    <div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">已完成</div>
                      <div style="font-size:var(--text-xl);font-weight:700;font-family:var(--font-mono);color:var(--color-green)">6</div>
                    </div>
                    <div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">进行中</div>
                      <div style="font-size:var(--text-xl);font-weight:700;font-family:var(--font-mono);color:var(--color-yellow)">14</div>
                    </div>
                  </div>
                  <div style="padding:var(--space-3);background:var(--color-bg-subtle);border-radius:var(--radius-md)">
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-bottom:var(--space-2)">项目信息</div>
                    <div style="display:flex;flex-direction:column;gap:var(--space-2);font-size:var(--text-sm)">
                      <div style="display:flex;justify-content:space-between">
                        <span style="color:var(--color-text-tertiary)">负责人</span>
                        <span style="color:var(--color-text-primary)">赵工</span>
                      </div>
                      <div style="display:flex;justify-content:space-between">
                        <span style="color:var(--color-text-tertiary)">开始日期</span>
                        <span style="color:var(--color-text-primary)">2025-07-01</span>
                      </div>
                      <div style="display:flex;justify-content:space-between">
                        <span style="color:var(--color-text-tertiary)">截止日期</span>
                        <span style="color:var(--color-text-primary)">2025-12-31</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- WBS View -->
        <div id="projectWbsView" class="view-panel">
          <div class="card">
            <div class="card-header">
              <span class="card-title">PRJ-001 新型高压拓扑研究 - 工作分解结构</span>
              <button class="btn btn-ghost btn-sm">展开全部</button>
            </div>
            <div class="card-body">
              <div style="font-family:var(--font-mono);font-size:var(--text-sm)">
                <!-- Level 1 -->
                <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-3);background:var(--color-accent-subtle);border:1px solid var(--color-accent-border);border-radius:var(--radius-md);margin-bottom:var(--space-2)">
                  <span style="color:var(--color-accent);font-weight:700">1.0</span>
                  <span style="flex:1;font-weight:600;color:var(--color-text-primary)">新型高压拓扑研究</span>
                  <span class="tag tag-blue">78%</span>
                </div>
                
                <!-- Level 2 -->
                <div style="margin-left:var(--space-8)">
                  <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-3);background:var(--color-surface);border:1px solid var(--color-border);border-radius:var(--radius-md);margin-bottom:var(--space-2)">
                    <span style="color:var(--color-text-quaternary);font-weight:600">1.1</span>
                    <span style="flex:1;color:var(--color-text-primary)">需求分析与方案设计</span>
                    <span class="tag tag-green">100%</span>
                  </div>
                  
                  <!-- Level 3 -->
                  <div style="margin-left:var(--space-8)">
                    <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-2);border-left:2px solid var(--color-border);margin-bottom:var(--space-1)">
                      <span style="color:var(--color-text-quaternary);font-size:var(--text-xs)">1.1.1</span>
                      <span style="flex:1;color:var(--color-text-secondary);font-size:var(--text-sm)">市场需求调研</span>
                      <span class="tag tag-green" style="font-size:10px">完成</span>
                    </div>
                    <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-2);border-left:2px solid var(--color-border);margin-bottom:var(--space-1)">
                      <span style="color:var(--color-text-quaternary);font-size:var(--text-xs)">1.1.2</span>
                      <span style="flex:1;color:var(--color-text-secondary);font-size:var(--text-sm)">技术方案设计</span>
                      <span class="tag tag-green" style="font-size:10px">完成</span>
                    </div>
                    <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-2);border-left:2px solid var(--color-border);margin-bottom:var(--space-3)">
                      <span style="color:var(--color-text-quaternary);font-size:var(--text-xs)">1.1.3</span>
                      <span style="flex:1;color:var(--color-text-secondary);font-size:var(--text-sm)">方案评审</span>
                      <span class="tag tag-green" style="font-size:10px">完成</span>
                    </div>
                  </div>

                  <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-3);background:var(--color-surface);border:1px solid var(--color-border);border-radius:var(--radius-md);margin-bottom:var(--space-2)">
                    <span style="color:var(--color-text-quaternary);font-weight:600">1.2</span>
                    <span style="flex:1;color:var(--color-text-primary)">仿真建模与验证</span>
                    <span class="tag tag-yellow">65%</span>
                  </div>
                  <div style="margin-left:var(--space-8)">
                    <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-2);border-left:2px solid var(--color-border);margin-bottom:var(--space-1)">
                      <span style="color:var(--color-text-quaternary);font-size:var(--text-xs)">1.2.1</span>
                      <span style="flex:1;color:var(--color-text-secondary);font-size:var(--text-sm)">ANSYS仿真建模</span>
                      <span class="tag tag-green" style="font-size:10px">完成</span>
                    </div>
                    <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-2);border-left:2px solid var(--color-border);margin-bottom:var(--space-1)">
                      <span style="color:var(--color-text-quaternary);font-size:var(--text-xs)">1.2.2</span>
                      <span style="flex:1;color:var(--color-text-secondary);font-size:var(--text-sm)">热失控仿真验证</span>
                      <span class="tag tag-yellow" style="font-size:10px">进行中 65%</span>
                      </div>
                    <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-2);border-left:2px solid var(--color-border);margin-bottom:var(--space-3)">
                      <span style="color:var(--color-text-quaternary);font-size:var(--text-xs)">1.2.3</span>
                      <span style="flex:1;color:var(--color-text-secondary);font-size:var(--text-sm)">结果分析报告</span>
                      <span class="tag tag-neutral" style="font-size:10px">待开始</span>
                    </div>
                  </div>

                  <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-3);background:var(--color-surface);border:1px solid var(--color-border);border-radius:var(--radius-md);margin-bottom:var(--space-2)">
                    <span style="color:var(--color-text-quaternary);font-weight:600">1.3</span>
                    <span style="flex:1;color:var(--color-text-primary)">原型开发与测试</span>
                    <span class="tag tag-neutral">0%</span>
                  </div>

                  <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-3);background:var(--color-surface);border:1px solid var(--color-border);border-radius:var(--radius-md)">
                    <span style="color:var(--color-text-quaternary);font-weight:600">1.4</span>
                    <span style="flex:1;color:var(--color-text-primary)">安全评审与文档</span>
                    <span class="tag tag-yellow">40%</span>
                  </div>
                </div>
            </div>
          </div>
        </div>

        <!-- Stats View -->
        <div id="projectStatsView" class="view-panel">
          <div style="display:flex;flex-direction:column;gap:var(--space-6)">
            <div class="stats-grid">
              <div class="stat-card">
                <div class="stat-label">总项目数</div>
                <div class="stat-value">16</div>
                <div class="stat-change"><span style="color:var(--color-text-quaternary)">4个进行中</span></div>
              </div>
              <div class="stat-card">
                <div class="stat-label">平均完成率</div>
                <div class="stat-value">62%</div>
                <div class="stat-change up">
                  <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="18 15 12 9 6 15"/></svg>
                  <span>+8% 较上月</span>
                </div>
              </div>
              <div class="stat-card">
                <div class="stat-label">按时交付率</div>
                <div class="stat-value">75%</div>
                <div class="stat-change down">
                  <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="6 9 12 15 18 9"/></svg>
                  <span>-5% 较上月</span>
                </div>
              <div class="stat-card">
                <div class="stat-label">延期项目</div>
                <div class="stat-value">1</div>
                <div class="stat-change"><span style="color:var(--color-warning)">需关注</span></div>
              </div>
            </div>

            <div class="grid-2">
              <div class="card">
                <div class="card-header">
                  <span class="card-title">项目状态分布</span>
                </div>
                <div class="card-body">
                  <div style="display:flex;flex-direction:column;gap:var(--space-4)">
                    <div>
                      <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                        <span style="font-size:var(--text-sm);color:var(--color-text-secondary)">进行中</span>
                        <span style="font-size:var(--text-sm);font-weight:600;font-family:var(--font-mono)">4 (25%)</span>
                      </div>
                      <div class="progress-bar"><div class="progress-fill blue" style="width:25%"></div></div>
                    </div>
                    <div>
                      <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                        <span style="font-size:var(--text-sm);color:var(--color-text-secondary)">已完成</span>
                        <span style="font-size:var(--text-sm);font-weight:600;font-family:var(--font-mono)">12 (75%)</span>
                      </div>
                      <div class="progress-bar"><div class="progress-fill green" style="width:75%"></div></div>
                    </div>
                    <div>
                      <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                        <span style="font-size:var(--text-sm);color:var(--color-text-secondary)">延期</span>
                        <span style="font-size:var(--text-sm);font-weight:600;font-family:var(--font-mono)">1 (6%)</span>
                      </div>
                      <div class="progress-bar"><div class="progress-fill yellow" style="width:6%"></div></div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="card">
                <div class="card-header">
                  <span class="card-title">任务统计</span>
                </div>
                <div class="card-body">
                  <div style="display:flex;flex-direction:column;gap:var(--space-4)">
                    <div>
                      <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                        <span style="font-size:var(--text-sm);color:var(--color-text-secondary)">总任务数</span>
                        <span style="font-size:var(--text-xl);font-weight:700;font-family:var(--font-mono);color:var(--color-text-primary)">55</span>
                      </div>
                    </div>
                    <div>
                      <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                        <span style="font-size:var(--text-sm);color:var(--color-text-secondary)">已完成</span>
                        <span style="font-size:var(--text-xl);font-weight:700;font-family:var(--font-mono);color:var(--color-green)">26</span>
                      </div>
                    </div>
                    <div>
                      <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                        <span style="font-size:var(--text-sm);color:var(--color-text-secondary)">进行中</span>
                        <span style="font-size:var(--text-xl);font-weight:700;font-family:var(--font-mono);color:var(--color-yellow)">29</span>
                      </div>
                    </div></div>
                </div>
              </div>
            </div>

            <div class="card">
              <div class="card-header">
                <span class="card-title">项目时间线</span>
              </div>
              <div class="card-body">
                <div style="overflow-x:auto">
                  <table class="data-table">
                    <thead>
                      <tr>
                        <th>项目</th>
                        <th>开始日期</th>
                        <th>截止日期</th>
                        <th>进度</th>
                        <th>状态</th>
                        <th>负责人</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><strong>PRJ-001</strong> 新型高压拓扑研究</td>
                        <td>2025-06-01</td>
                        <td>2025-09-30</td>
                        <td>
                          <div style="display:flex;align-items:center;gap:var(--space-2)">
                            <div class="progress-bar" style="width:100px;height:6px"><div class="progress-fill blue" style="width:78%"></div></div>
                            <span style="font-size:var(--text-xs);font-family:var(--font-mono)">78%</span>
                          </div>
                        </td>
                        <td><span class="tag tag-blue">进行中</span></td>
                        <td>张工</td>
                      </tr>
                      <tr>
                        <td><strong>PRJ-002</strong> BMS热管理优化</td>
                        <td>2025-05-15</td>
                        <td>2025-10-31</td>
                        <td>
                          <div style="display:flex;align-items:center;gap:var(--space-2)">
                            <div class="progress-bar" style="width:100px;height:6px"><div class="progress-fill yellow" style="width:45%"></div></div>
                            <span style="font-size:var(--text-xs);font-family:var(--font-mono)">45%</span>
                          </div>
                        </td>
                        <td><span class="tag tag-yellow">延期</span></td>
                        <td>李工</td>
                      </tr>
                      <tr>
                        <td><strong>PRJ-003</strong> 电芯一致性分析</td>
                        <td>2025-06-10</td>
                        <td>2025-07-25</td>
                        <td>
                          <div style="display:flex;align-items:center;gap:var(--space-2)">
                            <div class="progress-bar" style="width:100px;height:6px"><div class="progress-fill green" style="width:92%"></div></div>
                            <span style="font-size:var(--text-xs);font-family:var(--font-mono)">92%</span>
                          </div>
                        </td>
                        <td><span class="tag tag-green">接近完成</span></td>
                        <td>王工</td>
                      </tr>
                      <tr>
                        <td><strong>PRJ-004</strong> 快充技术研发</td>
                        <td>2025-07-01</td>
                        <td>2025-12-31</td>
                        <td>
                          <div style="display:flex;align-items:center;gap:var(--space-2)">
                            <div class="progress-bar" style="width:100px;height:6px"><div class="progress-fill blue" style="width:35%"></div></div>
                            <span style="font-size:var(--text-xs);font-family:var(--font-mono)">35%</span>
                          </div>
                        </td>
                        <td><span class="tag tag-blue">进行中</span></td>
                        <td>赵工</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- ============================================================PAGE 4: SAFETY REVIEW (安全评审)
     ============================================================ -->
<div class="page-section" id="page-safety">
  <div class="app-shell">
    <div class="content-area">
      <div class="page-header">
        <div class="page-header-top">
          <div>
            <div class="page-title">安全评审</div>
            <div class="page-subtitle">2个待审核 · 8个进行中 · 23个已完成</div>
          </div>
          <div class="btn-group">
            <button class="btn btn-secondary">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/></svg>
              搜索评审
            </button>
            <button class="btn btn-primary">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
              发起评审
            </button>
          </div>
        </div>
      </div>

      <div class="content-body">
        <!-- Stats -->
        <div class="stats-grid">
          <div class="stat-card">
            <div class="stat-label">待审核</div>
            <div class="stat-value">2</div>
            <div class="stat-change"><span style="color:var(--color-warning)">需处理</span></div>
          </div>
          <div class="stat-card">
            <div class="stat-label">进行中</div>
            <div class="stat-value">8</div>
            <div class="stat-change"><span style="color:var(--color-text-quaternary)">平均进度 45%</span></div>
          </div>
          <div class="stat-card">
            <div class="stat-label">已完成</div>
            <div class="stat-value">23</div>
            <div class="stat-change up">
              <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="18 15 12 9 6 15"/></svg>
              <span>+3 本月</span>
            </div>
          </div>
          <div class="stat-card">
            <div class="stat-label">通过率</div>
            <div class="stat-value">91%</div>
            <div class="stat-change up">
              <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="18 15 12 9 6 15"/></svg>
              <span>+2% 较上月</span>
            </div>
          </div></div>

        <!-- Review List -->
        <div class="card">
          <div class="card-header">
            <span class="card-title">评审列表</span>
            <div class="btn-group">
              <button class="btn btn-ghost btn-sm">全部</button>
              <button class="btn btn-ghost btn-sm">待审核</button>
              <button class="btn btn-ghost btn-sm">进行中</button>
              <button class="btn btn-ghost btn-sm">已完成</button>
            </div>
          </div>
          <div style="overflow-x:auto">
            <table class="data-table">
              <thead>
                <tr>
                  <th>评审编号</th>
                  <th>评审主题</th>
                  <th>类型</th>
                  <th>发起人</th>
                  <th>状态</th>
                  <th>风险等级</th>
                  <th>计划日期</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><span style="font-family:var(--font-mono);font-weight:600">SR-001</span></td>
                  <td>
                    <div style="font-weight:500;color:var(--color-text-primary)">高压拓扑安全评审</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:2px">PRJ-001 新型高压拓扑研究</div>
                  </td>
                  <td><span class="tag tag-purple">设计评审</span></td>
                  <td>张工</td>
                  <td><span class="tag tag-yellow">待审核</span></td>
                  <td><span class="tag tag-red">高风险</span></td>
                  <td>2025-07-22</td>
                  <td><button class="btn btn-ghost btn-sm">查看详情</button></td>
                </tr>
                <tr>
                  <td><span style="font-family:var(--font-mono);font-weight:600">SR-002</span></td>
                  <td>
                    <div style="font-weight:500;color:var(--color-text-primary)">热管理系统安全评审</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:2px">PRJ-002 BMS热管理优化</div>
                  </td>
                  <td><span class="tag tag-blue">系统评审</span></td>
                  <td>李工</td>
                  <td><span class="tag tag-blue">进行中</span></td>
                  <td><span class="tag tag-yellow">中风险</span></td>
                  <td>2025-07-25</td>
                  <td><button class="btn btn-ghost btn-sm">查看详情</button></td>
                </tr>
                <tr>
                  <td><span style="font-family:var(--font-mono);font-weight:600">SR-003</span></td>
                  <td>
                    <div style="font-weight:500;color:var(--color-text-primary)">电芯测试方案评审</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:2px">PRJ-003 电芯一致性分析</div>
                  </td>
                  <td><span class="tag tag-green">测试评审</span></td>
                  <td>王工</td>
                  <td><span class="tag tag-green">已完成</span></td>
                  <td><span class="tag tag-green">低风险</span></td>
                  <td>2025-07-18</td>
                  <td><button class="btn btn-ghost btn-sm">查看详情</button></td>
                </tr>
                <tr>
                  <td><span style="font-family:var(--font-mono);font-weight:600">SR-004</span></td>
                  <td>
                    <div style="font-weight:500;color:var(--color-text-primary)">快充协议安全评审</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:2px">PRJ-004 快充技术研发</div>
                  </td>
                  <td><span class="tag tag-purple">设计评审</span></td>
                  <td>赵工</td>
                  <td><span class="tag tag-yellow">待审核</span></td>
                  <td><span class="tag tag-yellow">中风险</span></td>
                  <td>2025-07-28</td>
                  <td><button class="btn btn-ghost btn-sm">查看详情</button></td>
                </tr>
                <tr>
                  <td><span style="font-family:var(--font-mono);font-weight:600">SR-005</span></td>
                  <td>
                    <div style="font-weight:500;color:var(--color-text-primary)">BMS算法安全评审</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:2px">PRJ-002 BMS热管理优化</div>
                  </td>
                  <td><span class="tag tag-orange">代码评审</span></td>
                  <td>李工</td>
                  <td><span class="tag tag-blue">进行中</span></td>
                  <td><span class="tag tag-red">高风险</span></td>
                  <td>2025-07-30</td>
                  <td><button class="btn btn-ghost btn-sm">查看详情</button></td>
                </tr></tbody>
            </table>
          </div>
        </div>

        <!-- Review Details Example -->
        <div class="grid-2">
          <div class="card">
            <div class="card-header">
              <span class="card-title">SR-001 评审详情</span>
              <span class="tag tag-yellow">待审核</span>
            </div>
            <div class="card-body">
              <div style="display:flex;flex-direction:column;gap:var(--space-4)">
                <div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-bottom:var(--space-2)">基本信息</div>
                  <div style="display:flex;flex-direction:column;gap:var(--space-2);font-size:var(--text-sm)">
                    <div style="display:flex;justify-content:space-between">
                      <span style="color:var(--color-text-tertiary)">评审主题</span>
                      <span style="color:var(--color-text-primary)">高压拓扑安全评审</span>
                    </div>
                    <div style="display:flex;justify-content:space-between">
                      <span style="color:var(--color-text-tertiary)">发起人</span>
                      <span style="color:var(--color-text-primary)">张工</span>
                    </div>
                    <div style="display:flex;justify-content:space-between">
                      <span style="color:var(--color-text-tertiary)">计划日期</span>
                      <span style="color:var(--color-text-primary)">2025-07-22 14:00</span>
                    </div>
                    <div style="display:flex;justify-content:space-between">
                      <span style="color:var(--color-text-tertiary)">风险等级</span>
                      <span class="tag tag-red">高风险</span>
                    </div>
                  </div>
                </div>
                <div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-bottom:var(--space-2)">评审人员</div>
                  <div style="display:flex;flex-wrap:wrap;gap:var(--space-2)">
                    <span class="tag tag-blue">张工 (主持)</span>
                    <span class="tag tag-neutral">李工</span>
                    <span class="tag tag-neutral">王工</span>
                    <span class="tag tag-neutral">赵工</span></div>
                </div>
                <div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-bottom:var(--space-2)">评审要点</div>
                  <ul style="font-size:var(--text-sm);color:var(--color-text-secondary);padding-left:var(--space-5);line-height:1.8">
                    <li>高压拓扑设计合理性</li>
                    <li>绝缘设计与防护措施</li>
                    <li>故障模式分析(FMEA)</li>
                    <li>热失控防护机制</li>
                    <li>EMC设计评估</li>
                  </ul>
                </div>
              </div>
            </div>
          </div>

          <div class="card">
            <div class="card-header">
              <span class="card-title">评审统计</span>
            </div>
            <div class="card-body">
              <div style="display:flex;flex-direction:column;gap:var(--space-4)">
                <div>
                  <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                    <span style="font-size:var(--text-sm);color:var(--color-text-secondary)">设计评审</span>
                    <span style="font-size:var(--text-sm);font-weight:600;font-family:var(--font-mono)">12</span>
                  </div>
                  <div class="progress-bar"><div class="progress-fill purple" style="width:40%"></div></div>
                </div>
                <div>
                  <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                    <span style="font-size:var(--text-sm);color:var(--color-text-secondary)">系统评审</span>
                    <span style="font-size:var(--text-sm);font-weight:600;font-family:var(--font-mono)">8</span>
                  </div>
                  <div class="progress-bar"><div class="progress-fill blue" style="width:27%"></div></div>
                </div>
                <div>
                  <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                    <span style="font-size:var(--text-sm);color:var(--color-text-secondary)">测试评审</span>
                    <span style="font-size:var(--text-sm);font-weight:600;font-family:var(--font-mono)">7</span>
                  </div>
                  <div class="progress-bar"><div class="progress-fill green" style="width:23%"></div></div>
                </div>
                <div>
                  <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                    <span style="font-size:var(--text-sm);color:var(--color-text-secondary)">代码评审</span>
                    <span style="font-size:var(--text-sm);font-weight:600;font-family:var(--font-mono)">6</span>
                  </div>
                  <div class="progress-bar"><div class="progress-fill orange" style="width:20%"></div></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- ============================================================PAGE 5: PERFORMANCE (月度绩效)
     ============================================================ -->
<div class="page-section" id="page-performance">
  <div class="app-shell">
    <div class="content-area">
      <div class="page-header">
        <div class="page-header-top">
          <div>
            <div class="page-title">月度绩效</div>
            <div class="page-subtitle">2025年7月 · 综合得分 87分</div>
          </div>
          <div class="btn-group">
            <div class="view-switcher">
              <button class="view-switcher-btn active" onclick="switchPerfView('summary', this)">汇总</button>
              <button class="view-switcher-btn" onclick="switchPerfView('monthly', this)">月度</button>
              <button class="view-switcher-btn" onclick="switchPerfView('kpi', this)">KPI追踪</button>
              <button class="view-switcher-btn" onclick="switchPerfView('history', this)">历史记录</button>
              <button class="view-switcher-btn" onclick="switchPerfView('team', this)">团队分析</button>
            </div>
            <button class="btn btn-primary">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
              导出报告
            </button>
          </div>
        </div>
      </div>

      <div class="content-body">
        <!-- Summary View -->
        <div id="perfSummaryView" class="view-panel active">
          <div class="card" style="background:linear-gradient(135deg,var(--color-accent-subtle),var(--color-purple-subtle));border:1px solid var(--color-accent-border)">
            <div class="card-body">
              <div style="text-align:center">
                <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-bottom:var(--space-2)">本月综合得分</div>
                <div style="font-size:4rem;font-weight:800;color:var(--color-accent);font-family:var(--font-mono);line-height:1">87</div>
                <div style="font-size:var(--text-sm);color:var(--color-green);margin-top:var(--space-2)">
                  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="display:inline-block;vertical-align:middle"><polyline points="18 15 12 9 6 15"/></svg>
                  较上月 +5分
                </div>
                <div style="margin-top:var(--space-4);display:flex;gap:var(--space-2)">
                  <span class="tag tag-green">优秀</span>
                  <span class="tag tag-blue">排名前15%</span>
                </div>
              </div>
            </div>
          </div>

          <div class="grid-4" style="margin-top:var(--space-6)">
            <div class="stat-card">
              <div class="stat-label">任务完成率</div>
              <div class="stat-value">92</div>
              <div class="stat-change up">↑ +3</div>
            </div>
            <div class="stat-card">
              <div class="stat-label">安全评审质量</div>
              <div class="stat-value">85</div>
              <div class="stat-change up">↑ +5</div>
            </div>
            <div class="stat-card">
              <div class="stat-label">专利输出</div>
              <div class="stat-value">60</div>
              <div class="stat-change down">↓ -10</div>
            </div>
            <div class="stat-card">
              <div class="stat-label">技术分享</div>
              <div class="stat-value">100</div>
              <div class="stat-change">持平</div>
            </div>
          </div>

          <div class="grid-2" style="margin-top:var(--space-6)">
            <div class="card">
              <div class="card-header"><span class="card-title">各维度得分</span></div>
              <div class="card-body">
                <div style="display:flex;flex-direction:column;gap:var(--space-3)">
                  <div>
                    <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-1)">
                      <span style="font-size:var(--text-sm);color:var(--color-text-secondary)">任务完成率</span>
                      <span style="font-size:var(--text-sm);font-weight:600;font-family:var(--font-mono);color:var(--color-green)">92</span>
                    </div>
                    <div class="progress-bar"><div class="progress-fill green" style="width:92%"></div></div>
                  </div>
                  <div>
                    <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-1)">
                      <span style="font-size:var(--text-sm);color:var(--color-text-secondary)">安全评审质量</span>
                      <span style="font-size:var(--text-sm);font-weight:600;font-family:var(--font-mono);color:var(--color-blue)">85</span>
                    </div>
                    <div class="progress-bar"><div class="progress-fill blue" style="width:85%"></div></div>
                  </div>
                  <div>
                    <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-1)">
                      <span style="font-size:var(--text-sm);color:var(--color-text-secondary)">专利输出</span>
                      <span style="font-size:var(--text-sm);font-weight:600;font-family:var(--font-mono);color:var(--color-yellow)">60</span>
                    </div>
                    <div class="progress-bar"><div class="progress-fill yellow" style="width:60%"></div></div>
                  </div>
                  <div>
                    <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-1)">
                      <span style="font-size:var(--text-sm);color:var(--color-text-secondary)">技术分享</span>
                      <span style="font-size:var(--text-sm);font-weight:600;font-family:var(--font-mono);color:var(--color-green)">100</span>
                    </div>
                    <div class="progress-bar"><div class="progress-fill green" style="width:100%"></div></div>
                  </div>
                </div>
              </div>
            </div>

            <div class="card">
              <div class="card-header"><span class="card-title">改进建议</span></div>
              <div class="card-body">
                <div style="display:flex;flex-direction:column;gap:var(--space-3)">
                  <div style="padding:var(--space-3);background:var(--color-green-subtle);border:1px solid var(--color-green-border);border-radius:var(--radius-md)">
                    <div style="font-size:var(--text-sm);font-weight:600;color:var(--color-text-primary);margin-bottom:var(--space-1)">✓ 优势保持</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-secondary)">任务完成率和技术分享表现优秀，继续保持</div>
                  </div>
                  <div style="padding:var(--space-3);background:var(--color-yellow-subtle);border:1px solid var(--color-yellow-border);border-radius:var(--radius-md)">
                    <div style="font-size:var(--text-sm);font-weight:600;color:var(--color-text-primary);margin-bottom:var(--space-1)">⚠ 需要改进</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-secondary)">专利输出较弱，建议本月完成2篇专利交底书</div>
                  </div>
                  <div style="padding:var(--space-3);background:var(--color-blue-subtle);border:1px solid var(--color-blue-border);border-radius:var(--radius-md)">
                    <div style="font-size:var(--text-sm);font-weight:600;color:var(--color-text-primary);margin-bottom:var(--space-1)">💡 提升建议</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-secondary)">增加安全评审主导次数，可提升综合得分</div>
                  </div>
                </div>
              </div>
            </div>
          </div></div>

        <!-- Other Performance Views (Simplified) -->
        <div id="perfMonthlyView" class="view-panel"><div class="card"><div class="card-body" style="text-align:center;padding:var(--space-12);color:var(--color-text-tertiary)">月度详细视图</div></div></div>
        <div id="perfKpiView" class="view-panel"><div class="card"><div class="card-body" style="text-align:center;padding:var(--space-12);color:var(--color-text-tertiary)">KPI追踪视图</div></div></div>
        <div id="perfHistoryView" class="view-panel"><div class="card"><div class="card-body" style="text-align:center;padding:var(--space-12);color:var(--color-text-tertiary)">历史记录视图</div></div></div>
        <div id="perfTeamView" class="view-panel"><div class="card"><div class="card-body" style="text-align:center;padding:var(--space-12);color:var(--color-text-tertiary)">团队分析视图</div></div></div>
      </div>
    </div>
  </div>

<!-- Page Navigation -->
<div class="page-nav">
  <button class="page-nav-btn active" onclick="switchPage('dashboard', this)">
    <svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>
    <span>工作台</span>
  </button>
  <button class="page-nav-btn" onclick="switchPage('tasks', this)">
    <svg viewBox="0 0 24 24"><path d="M9 11l3 3L22 4"/><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/></svg>
    <span>任务</span>
  </button>
  <button class="page-nav-btn" onclick="switchPage('projects', this)">
    <svg viewBox="0 0 24 24"><path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"/></svg>
    <span>项目</span>
  </button>
  <button class="page-nav-btn" onclick="switchPage('safety', this)">
    <svg viewBox="0 0 24 24"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
    <span>安全评审</span>
  </button>
  <button class="page-nav-btn" onclick="switchPage('performance', this)">
    <svg viewBox="0 0 24 24"><line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/></svg>
    <span>绩效</span>
  </button>
</div>

<script>
// Theme Toggle
function toggleTheme() {
  const html = document.documentElement;
  const currentTheme = html.getAttribute('data-theme');
  const newTheme = currentTheme === 'light' ? 'dark' : 'light';
  html.setAttribute('data-theme', newTheme);
  document.getElementById('themeIcon').textContent = newTheme === 'light' ? '🌙' : '☀️';
  document.getElementById('themeLabel').textContent = newTheme === 'light' ? '切换白天' : '切换夜晚';
}

// Page Navigation
function switchPage(pageId, btn) {
  document.querySelectorAll('.page-section').forEach(p => p.classList.remove('active'));
  document.querySelectorAll('.page-nav-btn').forEach(b => b.classList.remove('active'));
  document.getElementById('page-' + pageId).classList.add('active');
  btn.classList.add('active');
}

// AI Mode Toggle
function toggleAIMode() {
  const normalHeader = document.getElementById('normalHeader');
  const normalBody = document.getElementById('normalHomeBody');
  const aiBody = document.getElementById('aiHomeBody');
  const btn = document.getElementById('aiModeBtn');
  
  if (aiBody.classList.contains('active')) {
    aiBody.classList.remove('active');
    normalBody.style.display = 'flex';
    btn.innerHTML = '<span>✦</span><span>AI 智能模式</span><span style="background:linear-gradient(135deg,#6366F1,#A855F7);color:white;padding:2px 6px;border-radius:4px;font-size:10px;margin-left:4px">BETA</span>';
  } else {
    aiBody.classList.add('active');
    normalBody.style.display = 'none';
    btn.innerHTML = '<span>←</span><span>返回普通模式</span>';
  }
}

// Task View Switcher
function switchTaskView(viewId, btn) {
  document.querySelectorAll('#taskViewSwitcher .view-switcher-btn').forEach(b => b.classList.remove('active'));
  document.querySelectorAll('[id^="task"][id$="View"]').forEach(v => v.classList.remove('active'));
  document.getElementById('task' + viewId.charAt(0).toUpperCase() + viewId.slice(1) + 'View').classList.add('active');
  btn.classList.add('active');
}

// Project View Switcher
function switchProjectView(viewId, btn) {
  document.querySelectorAll('[id^="project"][id$="View"]').forEach(v => v.classList.remove('active'));
  document.getElementById('project' + viewId.charAt(0).toUpperCase() + viewId.slice(1) + 'View').classList.add('active');
  const btns = btn.parentElement.querySelectorAll('.view-switcher-btn');
  btns.forEach(b => b.classList.remove('active'));
  btn.classList.add('active');
}

// Performance View Switcher
function switchPerfView(viewId, btn) {
  document.querySelectorAll('[id^="perf"][id$="View"]').forEach(v => v.classList.remove('active'));
  document.getElementById('perf' + viewId.charAt(0).toUpperCase() + viewId.slice(1) + 'View').classList.add('active');
  const btns = btn.parentElement.querySelectorAll('.view-switcher-btn');
  btns.forEach(b => b.classList.remove('active'));
  btn.classList.add('active');
}

// Initialize
document.addEventListener('DOMContentLoaded', function() {
  console.log('BST Platform V2.0 Loaded');
});
</script>

</body>
</html>
