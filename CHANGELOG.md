<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BST Platform V2.0 — Full UI</title>
<style>
/* ============================================================
   CSS RESET + VARIABLES
   ============================================================ */
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0}
:root{
  --font-sans: -apple-system, BlinkMacSystemFont, 'SF Pro Display', 'PingFang SC', 'Segoe UI', sans-serif;
  --font-mono: 'SF Mono', 'Fira Code', 'JetBrains Mono', monospace;
  --text-xs: 11px; --text-sm: 13px; --text-md: 15px; --text-lg: 17px;
  --text-xl: 20px; --text-2xl: 24px; --text-3xl: 32px;
  --space-1: 4px; --space-2: 8px; --space-3: 12px; --space-4: 16px;
  --space-5: 20px; --space-6: 24px; --space-7: 32px; --space-8: 40px;
  --radius-sm: 6px; --radius-md: 8px; --radius-lg: 12px; --radius-xl: 16px; --radius-full: 9999px;
  --sidebar-width: 240px; --sidebar-collapsed: 48px; --header-height: 48px;
  --transition-fast: 0.15s ease; --transition-base: 0.2s cubic-bezier(0.4,0,0.2,1);
}

/* ============================================================
   DARK THEME (default)
   ============================================================ */
body {
  --color-bg: #09090B;
  --color-bg-elevated: #111113;
  --color-bg-subtle: #0C0C0E;
  --color-bg-hover: rgba(255,255,255,0.04);
  --color-bg-active: rgba(255,255,255,0.07);
  --color-surface: #161618;
  --color-surface-hover: #1C1C1F;
  --color-border: rgba(255,255,255,0.06);
  --color-border-hover: rgba(255,255,255,0.1);
  --color-border-active: rgba(255,255,255,0.15);
  --color-text-primary: #FAFAFA;
  --color-text-secondary: #A1A1AA;
  --color-text-tertiary: #71717A;
  --color-text-quaternary: #52525B;
  --color-accent: #8B5CF6;
  --color-accent-hover: #7C3AED;
  --color-accent-subtle: rgba(139,92,246,0.1);
  --color-accent-text: #A78BFA;
  --color-success: #22C55E;
  --color-success-subtle: rgba(34,197,94,0.1);
  --color-warning: #F59E0B;
  --color-warning-subtle: rgba(245,158,11,0.1);
  --color-danger: #EF4444;
  --color-danger-subtle: rgba(239,68,68,0.1);
  --color-info: #3B82F6;
  --color-info-subtle: rgba(59,130,246,0.1);
  --shadow-sm: 0 1px 2px rgba(0,0,0,0.3);
  --shadow-md: 0 4px 12px rgba(0,0,0,0.4);
  --shadow-lg: 0 8px 30px rgba(0,0,0,0.5);
  --shadow-glow: 0 0 20px rgba(139,92,246,0.15);
}

/* ============================================================
   LIGHT THEME
   ============================================================ */
body.light {
  --color-bg: #FFFFFF;
  --color-bg-elevated: #FFFFFF;
  --color-bg-subtle: #F9FAFB;
  --color-bg-hover: rgba(0,0,0,0.03);
  --color-bg-active: #E4E4E7;
  --color-surface: #FAFAFA;
  --color-surface-hover: #F4F4F5;
  --color-border: rgba(0,0,0,0.08);
  --color-border-hover: rgba(0,0,0,0.15);
  --color-border-active: rgba(0,0,0,0.2);
  --color-text-primary: #18181B;
  --color-text-secondary: #3F3F46;
  --color-text-tertiary: #71717A;
  --color-text-quaternary: #A1A1AA;
  --color-accent: #7C3AED;
  --color-accent-hover: #6D28D9;
  --color-accent-subtle: rgba(124,58,237,0.08);
  --color-accent-text: #6D28D9;
  --color-success-subtle: rgba(34,197,94,0.08);
  --color-warning-subtle: rgba(245,158,11,0.08);
  --color-danger-subtle: rgba(239,68,68,0.08);
  --color-info-subtle: rgba(59,130,246,0.08);
  --shadow-sm: 0 1px 2px rgba(0,0,0,0.06);
  --shadow-md: 0 4px 12px rgba(0,0,0,0.08);
  --shadow-lg: 0 8px 30px rgba(0,0,0,0.12);
  --shadow-glow: 0 0 20px rgba(124,58,237,0.1);
}
body.light .topbar { background: rgba(255,255,255,0.85); }
body.light .sidebar { background: #FAFAFA; }
body.light .heatmap-cell { background: #E4E4E7; }
body.light .heatmap-cell.level-1 { background: rgba(124,58,237,0.12); }
body.light .heatmap-cell.level-2 { background: rgba(124,58,237,0.25); }
body.light .heatmap-cell.level-3 { background: rgba(124,58,237,0.45); }
body.light .heatmap-cell.level-4 { background: rgba(124,58,237,0.7); }
body.light .modal-overlay { background: rgba(0,0,0,0.3); }

/* ============================================================
   BASE STYLES
   ============================================================ */
body{font-family:var(--font-sans);background:var(--color-bg);color:var(--color-text-primary);font-size:var(--text-md);line-height:1.5;overflow-x:hidden;-webkit-font-smoothing:antialiased}
::-webkit-scrollbar{width:6px;height:6px}
::-webkit-scrollbar-track{background:transparent}
::-webkit-scrollbar-thumb{background:rgba(255,255,255,0.08);border-radius:3px}
::-webkit-scrollbar-thumb:hover{background:rgba(255,255,255,0.15)}
body.light ::-webkit-scrollbar-thumb{background:rgba(0,0,0,0.15)}
body.light ::-webkit-scrollbar-thumb:hover{background:rgba(0,0,0,0.25)}
a{color:inherit;text-decoration:none}
input,select,textarea,button{font-family:inherit;font-size:inherit;border:none;outline:none;background:none;color:inherit}

/* ============================================================
   LAYOUT
   ============================================================ */
.page-section{display:none;min-height:100vh}
.page-section.active{display:block}
.app-shell{display:flex;min-height:100vh}
.sidebar{width:var(--sidebar-width);background:var(--color-bg-elevated);border-right:1px solid var(--color-border);display:flex;flex-direction:column;position:sticky;top:0;height:100vh;overflow-y:auto;z-index:20;flex-shrink:0}
.sidebar-header{padding:var(--space-4) var(--space-4);display:flex;align-items:center;gap:var(--space-3);border-bottom:1px solid var(--color-border)}
.sidebar-logo{width:28px;height:28px;border-radius:var(--radius-md);background:linear-gradient(135deg,var(--color-accent),#6366F1);display:flex;align-items:center;justify-content:center;font-weight:700;font-size:14px;color:white}
.sidebar-title{font-size:var(--text-md);font-weight:600}
.sidebar-version{font-size:9px;padding:1px 5px;background:var(--color-accent-subtle);color:var(--color-accent-text);border-radius:var(--radius-full);margin-left:auto}
.sidebar-nav{flex:1;padding:var(--space-3) var(--space-2);display:flex;flex-direction:column;gap:1px}
.nav-section-label{font-size:10px;font-weight:600;text-transform:uppercase;letter-spacing:0.8px;color:var(--color-text-quaternary);padding:var(--space-4) var(--space-3) var(--space-2)}
.nav-item{display:flex;align-items:center;gap:var(--space-3);padding:7px var(--space-3);border-radius:var(--radius-md);color:var(--color-text-tertiary);cursor:pointer;transition:all var(--transition-fast);font-size:var(--text-sm);position:relative}
.nav-item:hover{background:var(--color-bg-hover);color:var(--color-text-secondary)}
.nav-item.active{background:var(--color-bg-active);color:var(--color-text-primary);font-weight:500}
.nav-item.active::before{content:'';position:absolute;left:0;top:50%;transform:translateY(-50%);width:3px;height:16px;background:var(--color-accent);border-radius:0 2px 2px 0}
.nav-icon{width:18px;height:18px;display:flex;align-items:center;justify-content:center;flex-shrink:0}
.nav-icon svg{width:16px;height:16px;stroke:currentColor;fill:none;stroke-width:1.8;stroke-linecap:round;stroke-linejoin:round}
.nav-badge{margin-left:auto;min-width:18px;height:18px;background:var(--color-danger);color:white;font-size:10px;font-weight:600;display:flex;align-items:center;justify-content:center;border-radius:var(--radius-full);padding:0 5px}
.sidebar-footer{padding:var(--space-3);border-top:1px solid var(--color-border)}
.sidebar-user{display:flex;align-items:center;gap:var(--space-3);padding:var(--space-2);border-radius:var(--radius-md);cursor:pointer;transition:background var(--transition-fast)}
.sidebar-user:hover{background:var(--color-bg-hover)}
.user-avatar{width:32px;height:32px;border-radius:var(--radius-full);background:linear-gradient(135deg,#6366F1,var(--color-accent));display:flex;align-items:center;justify-content:center;font-size:12px;font-weight:600;color:white}
.user-info{display:flex;flex-direction:column}
.user-name{font-size:var(--text-sm);font-weight:500}
.user-role{font-size:var(--text-xs);color:var(--color-text-quaternary)}
.main-content{flex:1;display:flex;flex-direction:column;min-width:0}
.topbar{height:var(--header-height);border-bottom:1px solid var(--color-border);display:flex;align-items:center;justify-content:space-between;padding:0 var(--space-6);background:rgba(9,9,11,0.8);backdrop-filter:blur(20px);position:sticky;top:0;z-index:15}
body.light .topbar{background:rgba(255,255,255,0.85)}
.topbar-breadcrumb{font-size:var(--text-sm);color:var(--color-text-tertiary);display:flex;align-items:center;gap:var(--space-2)}
.topbar-breadcrumb span{color:var(--color-text-primary);font-weight:500}
.breadcrumb-sep{color:var(--color-text-quaternary)}
.topbar-actions{display:flex;align-items:center;gap:var(--space-3)}
.content-area{flex:1;padding:var(--space-6) var(--space-8);overflow-y:auto}
.content-area.no-padding{padding:0}

/* ============================================================
   THEME TOGGLE
   ============================================================ */
.theme-toggle{width:32px;height:32px;display:flex;align-items:center;justify-content:center;border-radius:var(--radius-md);color:var(--color-text-tertiary);cursor:pointer;transition:all var(--transition-fast)}
.theme-toggle:hover{background:var(--color-bg-hover);color:var(--color-text-primary)}
.theme-toggle svg{width:18px;height:18px;stroke:currentColor;fill:none;stroke-width:1.8;stroke-linecap:round;stroke-linejoin:round}
.theme-toggle .icon-moon{display:none}
body.light .theme-toggle .icon-sun{display:none}
body.light .theme-toggle .icon-moon{display:block}

/* ============================================================
   COMPONENTS
   ============================================================ */
.search-trigger{display:flex;align-items:center;gap:var(--space-2);padding:6px var(--space-3);background:var(--color-surface);border:1px solid var(--color-border);border-radius:var(--radius-md);font-size:var(--text-sm);color:var(--color-text-quaternary);cursor:pointer;min-width:220px;transition:border-color var(--transition-fast)}
.search-trigger:hover{border-color:var(--color-border-hover)}
.search-shortcut{margin-left:auto;display:flex;gap:2px}
.search-shortcut kbd,.search-trigger kbd{font-family:var(--font-sans);font-size:10px;padding:1px 5px;background:var(--color-bg-active);border:1px solid var(--color-border);border-radius:4px;color:var(--color-text-quaternary)}
.btn{display:inline-flex;align-items:center;gap:var(--space-2);padding:7px var(--space-4);border-radius:var(--radius-md);font-size:var(--text-sm);font-weight:500;cursor:pointer;transition:all var(--transition-fast);white-space:nowrap}
.btn:active{transform:scale(0.96)}
.btn svg{width:14px;height:14px;stroke:currentColor;fill:none;stroke-width:2;stroke-linecap:round;stroke-linejoin:round}
.btn-primary{background:var(--color-accent);color:white}
.btn-primary:hover{background:var(--color-accent-hover);box-shadow:var(--shadow-glow)}
.btn-secondary{background:var(--color-surface);border:1px solid var(--color-border);color:var(--color-text-secondary)}
.btn-secondary:hover{background:var(--color-surface-hover);border-color:var(--color-border-hover)}
.btn-ghost{color:var(--color-text-tertiary);padding:7px var(--space-3)}
.btn-ghost:hover{background:var(--color-bg-hover);color:var(--color-text-secondary)}
.btn-sm{padding:4px var(--space-3);font-size:var(--text-xs)}
.btn-group{display:flex;gap:var(--space-2)}
.tag{display:inline-flex;align-items:center;gap:4px;padding:2px 8px;border-radius:var(--radius-full);font-size:var(--text-xs);font-weight:500}
.tag-default{background:var(--color-bg-active);color:var(--color-text-tertiary)}
.tag-green{background:var(--color-success-subtle);color:var(--color-success)}
.tag-red{background:var(--color-danger-subtle);color:var(--color-danger)}
.tag-orange{background:var(--color-warning-subtle);color:var(--color-warning)}
.tag-blue{background:var(--color-info-subtle);color:var(--color-info)}
.tag-purple{background:var(--color-accent-subtle);color:var(--color-accent-text)}
.card{background:var(--color-bg-elevated);border:1px solid var(--color-border);border-radius:var(--radius-lg);overflow:hidden;transition:all var(--transition-base)}
.card:hover{border-color:var(--color-border-hover)}
.card-header{display:flex;align-items:center;justify-content:space-between;padding:var(--space-4) var(--space-5);border-bottom:1px solid var(--color-border)}
.card-title{font-size:var(--text-md);font-weight:600}
.card-subtitle{font-size:var(--text-xs);color:var(--color-text-quaternary)}
.card-body{padding:var(--space-5)}
.page-header{margin-bottom:var(--space-6)}
.page-header-top{display:flex;align-items:flex-start;justify-content:space-between;gap:var(--space-4)}
.page-title{font-size:var(--text-2xl);font-weight:700;letter-spacing:-0.5px}
.page-subtitle{font-size:var(--text-sm);color:var(--color-text-tertiary);margin-top:var(--space-1)}
.stat-grid{display:grid;grid-template-columns:repeat(4,1fr);gap:var(--space-4)}
.stat-card{background:var(--color-bg-elevated);border:1px solid var(--color-border);border-radius:var(--radius-lg);padding:var(--space-5);transition:all var(--transition-base)}
.stat-card:hover{border-color:var(--color-border-hover);box-shadow:var(--shadow-sm)}
.stat-label{font-size:var(--text-xs);color:var(--color-text-tertiary);margin-bottom:var(--space-2)}
.stat-value{font-size:var(--text-2xl);font-weight:700;font-family:var(--font-mono);letter-spacing:-1px}
.stat-change{font-size:var(--text-xs);display:flex;align-items:center;gap:var(--space-1);margin-top:var(--space-1)}
.stat-change.up{color:var(--color-success)}
.stat-change.down{color:var(--color-danger)}
.progress-bar{width:100%;height:4px;background:var(--color-bg-active);border-radius:var(--radius-full);overflow:hidden}
.progress-fill{height:100%;border-radius:var(--radius-full);transition:width 0.6s ease}
.progress-fill.purple,.progress-fill:not([class*=" "]){background:var(--color-accent)}
.progress-fill.green{background:var(--color-success)}
.progress-fill.blue{background:var(--color-info)}
.progress-fill.orange{background:var(--color-warning)}
.progress-fill.red{background:var(--color-danger)}
.tabs{display:flex;gap:0;border-bottom:1px solid var(--color-border);margin-bottom:var(--space-5)}
.tab-item{padding:var(--space-3) var(--space-4);font-size:var(--text-sm);color:var(--color-text-tertiary);cursor:pointer;border-bottom:2px solid transparent;transition:all var(--transition-fast);margin-bottom:-1px}
.tab-item:hover{color:var(--color-text-secondary)}
.tab-item.active{color:var(--color-text-primary);border-bottom-color:var(--color-accent);font-weight:500}
.two-col{display:grid;grid-template-columns:1fr 1fr;gap:var(--space-6)}
.three-col{display:grid;grid-template-columns:repeat(3,1fr);gap:var(--space-4)}
.dashboard-grid{display:grid;grid-template-columns:1fr 1fr;gap:var(--space-6)}
.avatar-group{display:flex}
.avatar-group .avatar{margin-left:-6px}
.avatar-group .avatar:first-child{margin-left:0}
.avatar{width:26px;height:26px;border-radius:var(--radius-full);background:linear-gradient(135deg,#6366F1,var(--color-accent));display:flex;align-items:center;justify-content:center;font-size:10px;font-weight:600;color:white;border:2px solid var(--color-bg-elevated)}
.avatar.blue{background:linear-gradient(135deg,#2563EB,#3B82F6)}
.avatar.green{background:linear-gradient(135deg,#059669,#22C55E)}
.avatar.orange{background:linear-gradient(135deg,#D97706,#F59E0B)}
.avatar.pink{background:linear-gradient(135deg,#DB2777,#EC4899)}
.avatar.more{background:var(--color-bg-active);color:var(--color-text-tertiary);font-size:9px}
.status-dot{width:6px;height:6px;border-radius:var(--radius-full);flex-shrink:0}
.status-dot.todo{background:var(--color-text-quaternary)}
.status-dot.in-progress{background:var(--color-info)}
.status-dot.review{background:var(--color-warning)}
.status-dot.done{background:var(--color-success)}
.status-dot.critical{background:var(--color-danger)}
.view-switcher{display:flex;background:var(--color-surface);border:1px solid var(--color-border);border-radius:var(--radius-md);padding:2px;gap:1px}
.view-switcher-btn{padding:5px 10px;border-radius:var(--radius-sm);font-size:var(--text-xs);color:var(--color-text-tertiary);cursor:pointer;transition:all var(--transition-fast);display:flex;align-items:center;gap:var(--space-1)}
.view-switcher-btn:hover{color:var(--color-text-secondary)}
.view-switcher-btn.active{background:var(--color-bg-active);color:var(--color-text-primary);font-weight:500}
.view-switcher-btn svg{width:13px;height:13px;stroke:currentColor;fill:none;stroke-width:2;stroke-linecap:round;stroke-linejoin:round}

/* Kanban */
.kanban-board{display:grid;grid-template-columns:repeat(4,1fr);gap:var(--space-4)}
.kanban-column{display:flex;flex-direction:column}
.kanban-column-header{display:flex;align-items:center;justify-content:space-between;padding-bottom:var(--space-3);margin-bottom:var(--space-3);border-bottom:2px solid var(--color-border)}
.kanban-column-title{font-size:var(--text-sm);font-weight:600;display:flex;align-items:center;gap:var(--space-2)}
.kanban-column-count{font-size:var(--text-xs);background:var(--color-bg-active);color:var(--color-text-quaternary);padding:1px 6px;border-radius:var(--radius-full);font-weight:500}
.kanban-cards{display:flex;flex-direction:column;gap:var(--space-2);flex:1}
.kanban-card{background:var(--color-surface);border:1px solid var(--color-border);border-radius:var(--radius-md);padding:var(--space-3);cursor:pointer;transition:all var(--transition-fast)}
.kanban-card:hover{border-color:var(--color-border-hover);transform:translateY(-1px);box-shadow:var(--shadow-sm)}
.kanban-card-id{font-size:10px;font-family:var(--font-mono);color:var(--color-text-quaternary);margin-bottom:var(--space-1)}
.kanban-card-title{font-size:var(--text-sm);font-weight:500;margin-bottom:var(--space-2);line-height:1.4}
.kanban-card-meta{display:flex;align-items:center;justify-content:space-between;margin-top:var(--space-2)}
.kanban-card-avatar{width:22px;height:22px;border-radius:var(--radius-full);background:linear-gradient(135deg,#6366F1,var(--color-accent));display:flex;align-items:center;justify-content:center;font-size:9px;font-weight:600;color:white}
.kanban-add-card{display:flex;align-items:center;justify-content:center;gap:var(--space-2);padding:var(--space-3);border:1px dashed var(--color-border);border-radius:var(--radius-md);color:var(--color-text-quaternary);font-size:var(--text-sm);cursor:pointer;transition:all var(--transition-fast)}
.kanban-add-card:hover{border-color:var(--color-border-hover);color:var(--color-text-tertiary)}
.kanban-add-card svg{width:14px;height:14px;stroke:currentColor;fill:none;stroke-width:2}

/* Data Table */
.data-table-container{border:1px solid var(--color-border);border-radius:var(--radius-lg);overflow:hidden}
.data-table{width:100%;border-collapse:collapse;font-size:var(--text-sm)}
.data-table th{text-align:left;padding:var(--space-3) var(--space-4);background:var(--color-surface);font-weight:500;font-size:var(--text-xs);color:var(--color-text-tertiary);text-transform:uppercase;letter-spacing:0.5px;border-bottom:1px solid var(--color-border)}
.data-table td{padding:var(--space-3) var(--space-4);border-bottom:1px solid var(--color-border)}
.data-table tr:last-child td{border-bottom:none}
.data-table tr:hover td{background:var(--color-bg-hover)}
.cell-id{font-family:var(--font-mono);font-size:var(--text-xs);color:var(--color-text-quaternary)}
.cell-primary{font-weight:500}

/* Filter Bar */
.filter-bar{display:flex;align-items:center;gap:var(--space-2);padding:var(--space-3) 0;flex-wrap:wrap}
.filter-chip{display:flex;align-items:center;gap:var(--space-2);padding:5px 12px;background:var(--color-surface);border:1px solid var(--color-border);border-radius:var(--radius-full);font-size:var(--text-xs);color:var(--color-text-tertiary);cursor:pointer;transition:all var(--transition-fast)}
.filter-chip:hover{border-color:var(--color-border-hover);color:var(--color-text-secondary)}
.filter-chip.active{background:var(--color-accent-subtle);border-color:var(--color-accent);color:var(--color-accent-text)}

/* Gantt */
.gantt-placeholder{border:1px solid var(--color-border);border-radius:var(--radius-lg);overflow:hidden}
.gantt-header-row{display:grid;grid-template-columns:200px repeat(12,1fr);background:var(--color-surface);border-bottom:1px solid var(--color-border)}
.gantt-header-cell{padding:var(--space-2) var(--space-3);font-size:10px;font-weight:600;color:var(--color-text-quaternary);text-transform:uppercase;border-right:1px solid var(--color-border)}
.gantt-header-cell:last-child{border-right:none}
.gantt-row{display:grid;grid-template-columns:200px 1fr;border-bottom:1px solid var(--color-border);min-height:36px;align-items:center}
.gantt-row:last-child{border-bottom:none}
.gantt-task-name{padding:var(--space-2) var(--space-3);font-size:var(--text-xs);font-weight:500;border-right:1px solid var(--color-border)}
.gantt-bar-container{position:relative;height:20px;padding:0 var(--space-2)}
.gantt-bar{position:absolute;height:10px;top:5px;border-radius:var(--radius-full);background:var(--color-accent);opacity:0.7}
.gantt-bar.blue{background:var(--color-info)}
.gantt-bar.green{background:var(--color-success)}
.gantt-bar.orange{background:var(--color-warning)}
.gantt-bar.red{background:var(--color-danger)}

/* Heatmap */
.heatmap-cell{width:12px;height:12px;border-radius:2px;background:var(--color-bg-active);display:inline-block}
.heatmap-cell.level-1{background:rgba(139,92,246,0.15)}
.heatmap-cell.level-2{background:rgba(139,92,246,0.3)}
.heatmap-cell.level-3{background:rgba(139,92,246,0.5)}
.heatmap-cell.level-4{background:rgba(139,92,246,0.75)}

/* Activity Timeline */
.timeline-item{display:flex;gap:var(--space-3);padding:var(--space-3) 0;position:relative}
.timeline-item::before{content:'';position:absolute;left:15px;top:32px;bottom:0;width:1px;background:var(--color-border)}
.timeline-item:last-child::before{display:none}
.timeline-icon{width:30px;height:30px;border-radius:var(--radius-full);display:flex;align-items:center;justify-content:center;flex-shrink:0;z-index:1}
.timeline-icon svg{width:14px;height:14px;stroke:currentColor;fill:none;stroke-width:2}
.timeline-text{font-size:var(--text-sm);padding-top:5px}
.timeline-time{font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:2px}

/* Form */
.form-group{display:flex;flex-direction:column;gap:var(--space-2)}
.form-label{font-size:var(--text-xs);font-weight:500;color:var(--color-text-tertiary)}
.form-input{padding:8px 12px;background:var(--color-surface);border:1px solid var(--color-border);border-radius:var(--radius-md);color:var(--color-text-primary);transition:border-color var(--transition-fast)}
.form-input:focus{border-color:var(--color-accent);box-shadow:0 0 0 3px var(--color-accent-subtle)}
.form-select{appearance:none;background-image:url("data:image/svg+xml,%3Csvg width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='%2371717A' stroke-width='2'%3E%3Cpolyline points='6 9 12 15 18 9'/%3E%3C/svg%3E");background-repeat:no-repeat;background-position:right 10px center;padding-right:32px}

/* Settings */
.settings-item{display:flex;align-items:center;justify-content:space-between;padding:var(--space-4) var(--space-5);border-bottom:1px solid var(--color-border)}
.settings-item-left{display:flex;flex-direction:column;gap:2px;flex:1}
.settings-item-title{font-size:var(--text-sm);font-weight:500}
.settings-item-desc{font-size:var(--text-xs);color:var(--color-text-quaternary)}
.toggle{width:40px;height:22px;background:var(--color-bg-active);border-radius:var(--radius-full);padding:2px;cursor:pointer;transition:background var(--transition-fast)}
.toggle.active{background:var(--color-accent)}
.toggle-knob{width:18px;height:18px;border-radius:var(--radius-full);background:white;transition:transform var(--transition-fast);box-shadow:var(--shadow-sm)}
.toggle.active .toggle-knob{transform:translateX(18px)}

/* AI Chat */
.ai-message{display:flex;gap:var(--space-3);margin-bottom:var(--space-4)}
.ai-message.user{flex-direction:row-reverse}
.ai-avatar{width:28px;height:28px;border-radius:var(--radius-md);display:flex;align-items:center;justify-content:center;font-size:10px;font-weight:600;flex-shrink:0}
.ai-avatar.human{background:linear-gradient(135deg,#6366F1,var(--color-accent));color:white}
.ai-avatar.assistant{background:linear-gradient(135deg,var(--color-accent),#6366F1);color:white}
.ai-avatar.assistant svg{width:14px;height:14px;stroke:white;fill:none;stroke-width:2}
.ai-bubble{max-width:85%;padding:var(--space-3) var(--space-4);border-radius:var(--radius-lg);font-size:var(--text-sm);line-height:1.6}
.ai-message.user .ai-bubble{background:var(--color-accent);color:white;border-bottom-right-radius:var(--radius-sm)}
.ai-message.assistant .ai-bubble{background:var(--color-surface);border:1px solid var(--color-border);border-bottom-left-radius:var(--radius-sm)}
.ai-quick-actions{display:flex;gap:var(--space-2);padding:var(--space-3) var(--space-6);overflow-x:auto;flex-wrap:wrap}
.ai-quick-btn{padding:6px 14px;background:var(--color-surface);border:1px solid var(--color-border);border-radius:var(--radius-full);font-size:var(--text-xs);color:var(--color-text-tertiary);cursor:pointer;white-space:nowrap;transition:all var(--transition-fast)}
.ai-quick-btn:hover{border-color:var(--color-accent);color:var(--color-accent-text);background:var(--color-accent-subtle)}
.ai-input-bar{display:flex;align-items:flex-end;gap:var(--space-3);padding:var(--space-4) var(--space-6);border-top:1px solid var(--color-border);background:var(--color-bg-elevated)}
.ai-input-field{flex:1;resize:none;padding:10px var(--space-4);background:var(--color-surface);border:1px solid var(--color-border);border-radius:var(--radius-lg);font-size:var(--text-sm);max-height:120px;line-height:1.5;color:var(--color-text-primary)}
.ai-input-field:focus{border-color:var(--color-accent);box-shadow:0 0 0 3px var(--color-accent-subtle)}
.ai-send-btn{width:36px;height:36px;background:var(--color-accent);border-radius:var(--radius-md);display:flex;align-items:center;justify-content:center;cursor:pointer;transition:all var(--transition-fast);flex-shrink:0}
.ai-send-btn:hover{background:var(--color-accent-hover);box-shadow:var(--shadow-glow)}
.ai-send-btn svg{width:16px;height:16px;stroke:white;fill:none;stroke-width:2}

/* Doc Card */
.doc-card{background:var(--color-bg-elevated);border:1px solid var(--color-border);border-radius:var(--radius-lg);padding:var(--space-5);transition:all var(--transition-base)}
.doc-card:hover{border-color:var(--color-border-hover)}
.doc-card-type{font-size:var(--text-xs);font-weight:500;display:flex;align-items:center;gap:var(--space-2);margin-bottom:var(--space-3)}
.doc-card-title{font-size:var(--text-md);font-weight:600;margin-bottom:var(--space-2);line-height:1.4}
.doc-card-desc{font-size:var(--text-sm);color:var(--color-text-tertiary);margin-bottom:var(--space-3);line-height:1.5}
.doc-card-footer{display:flex;align-items:center;justify-content:space-between;padding-top:var(--space-3);border-top:1px solid var(--color-border)}

/* Multi-view */
.project-view-content{display:none}
.project-view-content.active{display:block}
.safety-view-content{display:none}
.safety-view-content.active{display:block}

/* WBS */
.wbs-node{margin-bottom:var(--space-1)}
.wbs-node-inner{display:flex;align-items:center;gap:var(--space-3);padding:var(--space-2) var(--space-3);border-radius:var(--radius-md);font-size:var(--text-sm);cursor:pointer;transition:background var(--transition-fast);border:1px solid transparent}
.wbs-node-inner:hover{background:var(--color-bg-hover);border-color:var(--color-border)}
.wbs-node-inner.level-0{font-weight:600;font-size:var(--text-md);padding:var(--space-3) var(--space-4);background:var(--color-bg-elevated);border:1px solid var(--color-border);border-radius:var(--radius-lg);margin-bottom:var(--space-2)}
.wbs-children{padding-left:var(--space-8);border-left:1px solid var(--color-border);margin-left:var(--space-5)}
.wbs-expand-icon{width:16px;height:16px;display:flex;align-items:center;justify-content:center;color:var(--color-text-quaternary);flex-shrink:0}
.wbs-expand-icon svg{width:12px;height:12px;stroke:currentColor;fill:none;stroke-width:2}
.wbs-node-info{margin-left:auto;display:flex;align-items:center;gap:var(--space-3);font-size:var(--text-xs);color:var(--color-text-quaternary)}

/* AI Mode Home */
.mode-switcher{display:inline-flex;background:var(--color-surface);border:1px solid var(--color-border);border-radius:var(--radius-full);padding:3px;gap:2px}
.mode-switcher-btn{padding:6px 16px;border-radius:var(--radius-full);font-size:var(--text-sm);font-weight:500;color:var(--color-text-tertiary);transition:all var(--transition-fast);display:flex;align-items:center;gap:var(--space-2);cursor:pointer}
.mode-switcher-btn:hover{color:var(--color-text-secondary)}
.mode-switcher-btn.active{background:var(--color-accent);color:white;box-shadow:var(--shadow-glow)}
.mode-switcher-btn svg{width:14px;height:14px;stroke:currentColor;fill:none;stroke-width:2}
.ai-mode-home{display:none}
.ai-mode-home.visible{display:flex;height:calc(100vh - var(--header-height) - 120px);gap:0}
.default-mode-home{display:block}
.default-mode-home.hidden{display:none}
.ai-left-panel{flex:1;overflow-y:auto;border-right:1px solid var(--color-border);padding:var(--space-6);min-width:0}
.ai-right-panel{width:420px;flex-shrink:0;display:flex;flex-direction:column;background:var(--color-surface)}
.ai-gen-card{background:var(--color-bg-elevated);border:1px solid var(--color-border);border-radius:var(--radius-lg);padding:var(--space-4);margin-bottom:var(--space-3);animation:aiCardFadeIn 0.4s ease forwards;opacity:0;transform:translateY(8px)}
.ai-gen-card:nth-child(2){animation-delay:0.1s}
.ai-gen-card:nth-child(3){animation-delay:0.3s}
.ai-gen-card:nth-child(4){animation-delay:0.5s}
.ai-gen-card:nth-child(5){animation-delay:0.7s}
.ai-gen-card:nth-child(6){animation-delay:0.9s}
@keyframes aiCardFadeIn{to{opacity:1;transform:translateY(0)}}
.ai-gen-card-header{display:flex;align-items:center;gap:var(--space-2);margin-bottom:var(--space-3);font-size:var(--text-xs);font-weight:600;text-transform:uppercase;letter-spacing:0.5px;color:var(--color-text-quaternary)}
.ai-gen-card-header .gen-icon{width:18px;height:18px;border-radius:var(--radius-sm);display:flex;align-items:center;justify-content:center}
.ai-gen-card-header .gen-icon svg{width:12px;height:12px;stroke:currentColor;fill:none;stroke-width:2}
.ai-commands-grid{display:grid;grid-template-columns:1fr 1fr;gap:var(--space-2);padding:var(--space-3) var(--space-4)}
.ai-cmd-btn{display:flex;align-items:center;gap:var(--space-2);padding:8px 12px;background:var(--color-bg-elevated);border:1px solid var(--color-border);border-radius:var(--radius-md);font-size:var(--text-xs);color:var(--color-text-secondary);cursor:pointer;transition:all var(--transition-fast);text-align:left}
.ai-cmd-btn:hover{border-color:var(--color-accent);background:var(--color-accent-subtle);color:var(--color-accent-text)}
.ai-cmd-btn svg{width:14px;height:14px;stroke:currentColor;fill:none;stroke-width:2;flex-shrink:0}
.ai-mini-kanban{display:grid;grid-template-columns:repeat(3,1fr);gap:var(--space-3)}
.ai-mini-col-title{font-size:var(--text-xs);font-weight:600;color:var(--color-text-quaternary);margin-bottom:var(--space-2);display:flex;align-items:center;gap:var(--space-2)}
.ai-mini-task{padding:var(--space-2) var(--space-3);background:var(--color-surface);border:1px solid var(--color-border);border-radius:var(--radius-sm);font-size:var(--text-xs);margin-bottom:var(--space-2);color:var(--color-text-secondary)}

/* Performance Monthly */
.perf-goal-row{display:grid;grid-template-columns:2.5fr 70px 70px 120px 50px;align-items:center;padding:var(--space-3) var(--space-4);border-radius:var(--radius-md);background:var(--color-surface);border:1px solid var(--color-border);font-size:var(--text-sm);gap:var(--space-3);transition:all var(--transition-fast)}
.perf-goal-row:hover{border-color:var(--color-border-hover);background:var(--color-surface-hover)}
.perf-goal-row + .perf-goal-row{margin-top:var(--space-2)}
.perf-goal-project-tag{font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:2px}
.perf-approval-flow{display:flex;align-items:center;gap:var(--space-2)}
.perf-approval-step{display:flex;flex-direction:column;align-items:center;gap:4px;font-size:var(--text-xs)}
.perf-approval-icon{width:28px;height:28px;border-radius:var(--radius-full);display:flex;align-items:center;justify-content:center}
.perf-approval-icon.done{background:var(--color-success-subtle);color:var(--color-success)}
.perf-approval-icon.current{background:var(--color-accent-subtle);color:var(--color-accent);box-shadow:0 0 0 2px var(--color-accent)}
.perf-approval-icon.pending{background:var(--color-bg-active);color:var(--color-text-quaternary)}
.perf-approval-connector{width:24px;height:2px;background:var(--color-border);margin-bottom:16px}
.perf-approval-connector.done{background:var(--color-success)}
.perf-output-item{display:flex;align-items:center;gap:var(--space-2);padding:var(--space-2) var(--space-3);background:var(--color-surface);border:1px solid var(--color-border);border-radius:var(--radius-md);font-size:var(--text-xs);cursor:pointer;transition:all var(--transition-fast)}
.perf-output-item:hover{border-color:var(--color-accent);background:var(--color-accent-subtle)}
.perf-output-item svg{width:14px;height:14px;stroke:var(--color-text-quaternary);fill:none;stroke-width:2;flex-shrink:0}

/* Notification */
.notification-item{display:flex;gap:var(--space-3);padding:var(--space-3) var(--space-4);border-bottom:1px solid var(--color-border);transition:background var(--transition-fast)}
.notification-item:hover{background:var(--color-bg-hover)}
.notification-item.unread{background:var(--color-accent-subtle)}
.notification-icon-wrap{width:28px;height:28px;border-radius:var(--radius-full);display:flex;align-items:center;justify-content:center;flex-shrink:0}
.notification-icon-wrap svg{width:14px;height:14px;stroke:currentColor;fill:none;stroke-width:2}
.notification-icon-wrap.orange{background:var(--color-warning-subtle);color:var(--color-warning)}
.notification-icon-wrap.green{background:var(--color-success-subtle);color:var(--color-success)}
.notification-icon-wrap.purple{background:var(--color-accent-subtle);color:var(--color-accent)}
.notification-icon-wrap.blue{background:var(--color-info-subtle);color:var(--color-info)}
.notification-body{flex:1;min-width:0}
.notification-title-text{font-size:var(--text-sm);font-weight:500}
.notification-desc{font-size:var(--text-xs);color:var(--color-text-tertiary);margin-top:1px}
.notification-time{font-size:var(--text-xs);color:var(--color-text-quaternary);flex-shrink:0}

/* Modal */
.modal-overlay{position:fixed;inset:0;background:rgba(0,0,0,0.6);z-index:100;display:flex;align-items:center;justify-content:center}
.modal{background:var(--color-bg-elevated);border:1px solid var(--color-border);border-radius:var(--radius-xl);max-width:560px;width:90%;max-height:80vh;overflow:hidden;box-shadow:var(--shadow-lg)}
.modal-header{display:flex;align-items:center;justify-content:space-between;padding:var(--space-4) var(--space-5);border-bottom:1px solid var(--color-border)}
.modal-title{font-size:var(--text-md);font-weight:600}

/* Command Palette */
.command-palette{background:var(--color-bg-elevated);border:1px solid var(--color-border);border-radius:var(--radius-xl);width:90%;max-width:600px;box-shadow:var(--shadow-lg);overflow:hidden}
.command-input-wrapper{display:flex;align-items:center;gap:var(--space-3);padding:var(--space-3) var(--space-4);border-bottom:1px solid var(--color-border)}
.command-input-wrapper svg{width:16px;height:16px;stroke:var(--color-text-quaternary);fill:none;stroke-width:2;flex-shrink:0}
.command-input{flex:1;background:none;border:none;font-size:var(--text-md);color:var(--color-text-primary)}
.command-results{max-height:400px;overflow-y:auto;padding:var(--space-2)}
.command-group-label{font-size:10px;font-weight:600;text-transform:uppercase;letter-spacing:0.8px;color:var(--color-text-quaternary);padding:var(--space-2) var(--space-3)}
.command-item{display:flex;align-items:center;gap:var(--space-3);padding:8px var(--space-3);border-radius:var(--radius-md);cursor:pointer;transition:background var(--transition-fast)}
.command-item:hover{background:var(--color-bg-hover)}
.command-item-icon{width:28px;height:28px;border-radius:var(--radius-md);background:var(--color-bg-active);display:flex;align-items:center;justify-content:center;flex-shrink:0}
.command-item-icon svg{width:14px;height:14px;stroke:currentColor;fill:none;stroke-width:1.8}
.command-item-text{flex:1;min-width:0}
.command-item-label{font-size:var(--text-sm);font-weight:500}
.command-item-desc{font-size:var(--text-xs);color:var(--color-text-quaternary)}
.command-item-shortcut{display:flex;gap:3px}
.command-item-shortcut kbd{font-family:var(--font-sans);font-size:10px;padding:1px 5px;background:var(--color-bg-active);border:1px solid var(--color-border);border-radius:4px;color:var(--color-text-quaternary)}

/* Demo Nav */
.demo-nav{position:fixed;bottom:20px;left:50%;transform:translateX(-50%);display:flex;gap:var(--space-1);background:var(--color-bg-elevated);border:1px solid var(--color-border);border-radius:var(--radius-full);padding:4px;z-index:50;box-shadow:var(--shadow-lg)}
.demo-nav-btn{padding:6px 14px;border-radius:var(--radius-full);font-size:var(--text-xs);color:var(--color-text-tertiary);cursor:pointer;transition:all var(--transition-fast);white-space:nowrap}
.demo-nav-btn:hover{background:var(--color-bg-hover);color:var(--color-text-secondary)}
.demo-nav-btn.active{background:var(--color-accent);color:white}

/* Safety Kanban & Gantt */
.safety-kanban{display:grid;grid-template-columns:repeat(4,1fr);gap:var(--space-4)}
.safety-kanban-col-header{display:flex;align-items:center;gap:var(--space-2);padding-bottom:var(--space-3);margin-bottom:var(--space-3);border-bottom:2px solid var(--color-border);font-size:var(--text-sm);font-weight:600}
.safety-gantt-row{display:grid;grid-template-columns:220px 1fr;align-items:center;min-height:40px;padding:var(--space-2) 0;border-bottom:1px solid var(--color-border)}
.safety-gantt-task{display:flex;align-items:center;gap:var(--space-2);font-size:var(--text-sm);padding:0 var(--space-3)}
.safety-gantt-bar-area{position:relative;height:28px}
.safety-gantt-bar{position:absolute;height:10px;top:9px;border-radius:var(--radius-full);opacity:0.8}
</style>
</head>
<body>

<!-- ===== FLOATING DEMO NAV ===== -->
<div class="demo-nav">
  <button class="demo-nav-btn active" onclick="showPage('dashboard')">Dashboard</button>
  <button class="demo-nav-btn" onclick="showPage('tasks')">Tasks</button>
  <button class="demo-nav-btn" onclick="showPage('projects')">Projects</button>
  <button class="demo-nav-btn" onclick="showPage('safety')">Safety Review</button>
  <button class="demo-nav-btn" onclick="showPage('performance')">Performance</button>
  <button class="demo-nav-btn" onclick="showPage('patent')">Patent / IP</button>
  <button class="demo-nav-btn" onclick="showPage('reports')">Reports</button>
  <button class="demo-nav-btn" onclick="showPage('ai')">AI Assistant</button>
  <button class="demo-nav-btn" onclick="showPage('settings')">Settings</button>
</div>
<!-- ===== PAGE: DASHBOARD ===== -->
<div id="page-dashboard" class="page-section active">
  <div class="topbar">
    <div class="topbar-breadcrumb">
      <span>Home</span>
      <span class="breadcrumb-sep">/</span>
      <span>Dashboard</span>
    </div>
    <div class="topbar-actions">
      <div class="search-trigger"
        onclick="document.querySelector('.command-palette').classList.add('active'); document.querySelector('.command-input').focus();">
        <svg viewBox="0 0 24 24"><path d="M11 19a8 8 0 1 0 7.7-4.7l4.32 2.16a1 1 0 0 0 1.44-1.44l-2.16-4.32A8 8 0 1 0 5.28 3c0 .7-.15 1.4-.47 2.03-.66 1.31-1.23 2.6-1.72 3.92L.88 11.87C.73 12.31.7 12.75.7 13.2V15a1 1 0 0 0 .77.97L3.5 17h11.5a8 8 0 1 0 2.08-12.75z"/></svg>
        <span>Search (⌘+K)</span>
        <div class="search-shortcut">
          <kbd>⌘</kbd><kbd>K</kbd>
        </div>
      </div>

      <!-- Theme Toggle Button -->
      <button class="theme-toggle" onclick="toggleTheme()" title="Toggle theme">
        <svg class="icon-sun" viewBox="0 0 24 24"><circle cx="12" cy="12" r="5"/><line x1="12" y1="1" x2="12" y2="3"/><line x1="12" y1="21" x2="12" y2="23"/><line x1="4.22" y1="4.22" x2="5.64" y2="5.64"/><line x1="18.36" y1="18.36" x2="19.78" y2="19.78"/><line x1="1" y1="12" x2="3" y2="12"/><line x1="21" y1="12" x2="23" y2="12"/><line x1="4.22" y1="19.78" x2="5.64" y2="18.36"/><line x1="18.36" y1="5.64" x2="19.78" y2="4.22"/></svg>
        <svg class="icon-moon" viewBox="0 0 24 24"><path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"/></svg>
      </button>

      <div class="btn-group">
        <button class="btn btn-secondary btn-sm">
          <svg viewBox="0 0 24 24"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
          Export
        </button>
        <button class="btn btn-primary btn-sm">
          <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
          New Task
        </button>
      </div>
    </div>
  </div>

  <div class="content-area">
    <!-- Page Header with Mode Switcher -->
    <div class="page-header">
      <div class="page-header-top">
        <div>
          <h1 class="page-title">Good morning, Zhang Gong</h1>
          <p class="page-subtitle">Here is your workspace overview for today. 3 tasks require your attention.</p>
        </div>
        <div style="display:flex;align-items:center;gap:var(--space-4)">
          <!-- MODE SWITCHER -->
          <div class="mode-switcher">
            <button class="mode-switcher-btn active" id="btnDefaultMode" onclick="switchHomeMode('default')">
              <svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg>
              Default
            </button>
            <button class="mode-switcher-btn" id="btnAiMode" onclick="switchHomeMode('ai')">
              <svg viewBox="0 0 24 24"><path d="M12 2a10 10 0 1 0 10 10H12V2z"/></svg>
              ✦ AI Mode
            </button>
          </div>
          <div class="btn-group">
            <button class="btn btn-secondary btn-sm">
              <svg viewBox="0 0 24 24"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
              Export
            </button>
            <button class="btn btn-primary btn-sm">
              <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
              New Task
            </button>
          </div>
        </div>
      </div>
    </div>

    <!-- ===== DEFAULT MODE CONTENT ===== -->
    <div class="default-mode-home" id="defaultModeContent">
      <!-- Stat Grid -->
      <div class="stat-grid">
        <div class="stat-card">
          <div class="stat-label">Active Tasks</div>
          <div class="stat-value">16</div>
          <div class="stat-change up">+3 vs last week</div>
        </div>
        <div class="stat-card">
          <div class="stat-label">Safety Reviews</div>
          <div class="stat-value">4</div>
          <div class="stat-change down">-1 vs last week</div>
        </div>
        <div class="stat-card">
          <div class="stat-label">Projects</div>
          <div class="stat-value">4</div>
          <div class="stat-change up">+0</div>
        </div>
        <div class="stat-card">
          <div class="stat-label">Pending Approvals</div>
          <div class="stat-value">2</div>
          <div class="stat-change down">-2 vs last month</div>
        </div>
      </div>

      <!-- Recent Activity -->
      <div style="margin-top:var(--space-6)">
        <div class="card">
          <div class="card-header">
            <span class="card-title">Recent Activity</span>
            <button class="btn btn-ghost btn-sm">View All</button>
          </div>
          <div class="card-body">
            <div style="display:flex;flex-direction:column;gap:var(--space-4)">
              <div class="timeline-item">
                <div class="timeline-icon" style="background:var(--color-success-subtle);color:var(--color-success)">
                  <svg viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg>
                </div>
                <div class="timeline-text">
                  <div class="timeline-time">2 hours ago</div>
                  <div class="timeline-title">Submitted safety review SR-002</div>
                  <div class="timeline-desc">For BMS Safety Certification project</div>
                </div>
              </div>
              <div class="timeline-item">
                <div class="timeline-icon" style="background:var(--color-accent-subtle);color:var(--color-accent)">
                  <svg viewBox="0 0 24 24"><path d="M12 2a10 10 0 1 0 10 10H12V2z"/></svg>
                </div>
                <div class="timeline-text">
                  <div class="timeline-time">5 hours ago</div>
                  <div class="timeline-title">AI generated thermal simulation report draft</div>
                  <div class="timeline-desc">Based on test data from TEST-002</div>
                </div>
              </div>
              <div class="timeline-item">
                <div class="timeline-icon" style="background:var(--color-warning-subtle);color:var(--color-warning)">
                  <svg viewBox="0 0 24 24"><path d="M12 2a10 10 0 1 0 10 10H12V2z"/></svg>
                </div>
                <div class="timeline-text">
                  <div class="timeline-time">1 day ago</div>
                  <div class="timeline-title">Added task: Safety requirements document review</div>
                  <div class="timeline-desc">Due Jan 20 – Blocks SR-001 completion</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Quick Access Cards -->
      <div style="margin-top:var(--space-6)">
        <div class="two-col">
          <!-- Project Card 1 -->
          <div class="card" style="cursor:pointer">
            <div class="card-body" style="padding:var(--space-5)">
              <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-4)">
                <div style="display:flex;align-items:center;gap:var(--space-3)">
                  <div style="width:36px;height:36px;border-radius:var(--radius-md);background:linear-gradient(135deg,var(--color-accent),#6366F1);display:flex;align-items:center;justify-content:center">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
                  </div>
                  <div>
                    <div style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">PRJ-001</div>
                    <div style="font-size:var(--text-md);font-weight:600">BMS Safety Certification</div>
                  </div>
                </div>
                <span class="tag tag-green">Active</span>
              </div>
              <p style="font-size:var(--text-sm);color:var(--color-text-tertiary);margin-bottom:var(--space-4)">Complete functional safety certification per ISO 26262.</p>
              <div style="margin-bottom:var(--space-4)">
                <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)"><span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Progress</span><span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-tertiary)">72%</span></div>
                <div class="progress-bar"><div class="progress-fill purple" style="width:72%"></div></div>
              </div>
              <div style="display:flex;align-items:center;justify-content:space-between">
                <div class="avatar-group"><div class="avatar">ZG</div><div class="avatar blue">LG</div><div class="avatar green">WL</div><div class="avatar more">+3</div></div>
                <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Jun 30, 2024</span>
              </div>
            </div>
          </div>

          <!-- Project Card 2 -->
          <div class="card" style="cursor:pointer">
            <div class="card-body" style="padding:var(--space-5)">
              <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-4)">
                <div style="display:flex;align-items:center;gap:var(--space-3)">
                  <div style="width:36px;height:36px;border-radius:var(--radius-md);background:linear-gradient(135deg,#2563EB,#3B82F6);display:flex;align-items:center;justify-content:center">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"><path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z"/></svg>
                  </div>
                  <div>
                    <div style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">PRJ-002</div>
                    <div style="font-size:var(--text-md);font-weight:600">Thermal Management R&D</div>
                  </div>
                </div>
                <span class="tag tag-green">Active</span>
              </div>
              <p style="font-size:var(--text-sm);color:var(--color-text-tertiary);margin-bottom:var(--space-4)">Advanced thermal management solutions for high-energy-density battery packs.</p>
              <div style="margin-bottom:var(--space-4)">
                <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)"><span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Progress</span><span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-tertiary)">45%</span></div>
                <div class="progress-bar"><div class="progress-fill blue" style="width:45%"></div></div>
              </div>
              <div style="display:flex;align-items:center;justify-content:space-between">
                <div class="avatar-group"><div class="avatar orange">CK</div><div class="avatar pink">HL</div></div>
                <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Mar 15, 2024</span>
              </div>
            </div>
          </div>

          <!-- Project Card 3 -->
          <div class="card" style="cursor:pointer">
            <div class="card-body" style="padding:var(--space-5)">
              <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-4)">
                <div style="display:flex;align-items:center;gap:var(--space-3)">
                  <div style="width:36px;height:36px;border-radius:var(--radius-md);background:linear-gradient(135deg,#059669,#22C55E);display:flex;align-items:center;justify-content:center">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"><line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/></svg>
                  </div>
                  <div>
                    <div style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">PRJ-003</div>
                    <div style="font-size:var(--text-md);font-weight:600">Cell Consistency Analysis</div>
                  </div>
                </div>
                <span class="tag tag-blue">Near Complete</span>
              </div>
              <p style="font-size:var(--text-sm);color:var(--color-text-tertiary);margin-bottom:var(--space-4)">Statistical analysis of cell-to-cell variation impact on pack performance.</p>
              <div style="margin-bottom:var(--space-4)">
                <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)"><span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Progress</span><span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-tertiary)">88%</span></div>
                <div class="progress-bar"><div class="progress-fill green" style="width:88%"></div></div>
              </div>
              <div style="display:flex;align-items:center;justify-content:space-between">
                <div class="avatar-group"><div class="avatar">ZG</div><div class="avatar blue">LG</div></div>
                <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Feb 28, 2024</span>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Critical Alerts -->
      <div style="margin-top:var(--space-6)">
        <div class="card" style="border-left:4px solid var(--color-danger)">
          <div class="card-header">
            <span class="card-title">Critical Alert</span>
          </div>
          <div class="card-body" style="display:flex;align-items:center;gap:var(--space-4)">
            <div style="width:48px;height:48px;background:var(--color-danger-subtle);border-radius:var(--radius-lg);display:flex;align-items:center;justify-content:center">
              <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="var(--color-danger)" stroke-width="2">
                <polygon points="12 2 2 7 12 12 22 7 12 2"/>
                <polyline points="12 12 12 22"/>
                <polyline points="12 17 12 22"/>
                <polyline points="12 2 12 12"/>
              </svg>
            </div>
            <div>
              <div style="font-size:var(--text-md);font-weight:600;color:var(--color-danger)">Safety Review SR-001 Overdue</div>
              <div style="font-size:var(--text-sm);color:var(--color-text-tertiary)">Thermal runaway risk assessment document missing vendor test reports.</div>
              <div style="margin-top:var(--space-2)">
                <button class="btn btn-danger btn-sm">Assign to Owner</button>
                <button class="btn btn-secondary btn-sm" style="margin-left:var(--space-2)">View Details</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- ===== AI MODE CONTENT ===== -->
    <div class="ai-mode-home" id="aiModeContent">
      <!-- LEFT PANEL: Auto-generated summaries -->
      <div class="ai-left-panel">
        <!-- AI Greeting -->
        <div style="margin-bottom:var(--space-6)">
          <div style="display:flex;align-items:center;gap:var(--space-3);margin-bottom:var(--space-4)">
            <div style="width:40px;height:40px;border-radius:var(--radius-lg);background:linear-gradient(135deg,var(--color-accent),#6366F1);display:flex;align-items:center;justify-content:center">
              <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="1.8"><path d="M12 2a10 10 0 1 0 10 10H12V2z"/></svg>
            </div>
            <div>
              <div style="font-size:var(--text-lg);font-weight:600">AI is analyzing your workspace...</div>
              <div style="font-size:var(--text-xs);color:var(--color-text-tertiary)">Auto-generated based on your latest data · Updated just now</div>
            </div>
          </div>
        </div>

        <!-- AI Generated: Today's Summary -->
        <div class="ai-gen-card">
          <div class="ai-gen-card-header">
            <span class="gen-icon" style="background:var(--color-accent-subtle);color:var(--color-accent)">
              <svg viewBox="0 0 24 24"><path d="M12 2a10 10 0 1 0 10 10H12V2z"/></svg>
            </span>
            ✦ Today's AI Summary
          </div>
          <div style="font-size:var(--text-sm);color:var(--color-text-secondary);line-height:1.7">
            <p style="margin-bottom:var(--space-2)">📋 You have <strong style="color:var(--color-text-primary)">3 active tasks</strong> today. <strong style="color:var(--color-danger)">TSK-019</strong> (Thermal runaway simulation) is urgent at 65% — estimated 2 more days to complete.</p>
            <p style="margin-bottom:var(--space-2)">⚠️ Safety review <strong style="color:var(--color-danger)">SR-001</strong> is overdue by 3 days. Vendor thermal abuse test reports are blocking progress.</p>
            <p>📈 Your performance score is <strong style="color:var(--color-success)">92</strong> (+5 vs last month), ranking <strong>#2</strong> in the department.</p>
          </div>
        </div>

        <!-- AI Generated: Task Priority Matrix -->
        <div class="ai-gen-card">
          <div class="ai-gen-card-header">
            <span class="gen-icon" style="background:var(--color-danger-subtle);color:var(--color-danger)">
              <svg viewBox="0 0 24 24"><path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"/></svg>
            </span>
            ✦ AI Priority Recommendations
          </div>
          <div style="display:flex;flex-direction:column;gap:var(--space-2)">
            <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-2) var(--space-3);background:var(--color-danger-subtle);border-radius:var(--radius-sm);border-left:3px solid var(--color-danger)">
              <span style="font-size:var(--text-xs);font-weight:700;color:var(--color-danger)">P0</span>
              <span style="font-size:var(--text-sm);flex:1">Contact vendor for thermal abuse test report → Blocks SR-001</span>
              <span class="tag tag-red" style="font-size:9px">Urgent</span>
            </div>
            <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-2) var(--space-3);background:var(--color-warning-subtle);border-radius:var(--radius-sm);border-left:3px solid var(--color-warning)">
              <span style="font-size:var(--text-xs);font-weight:700;color:var(--color-warning)">P1</span>
              <span style="font-size:var(--text-sm);flex:1">Complete thermal model simulation report (due Jan 18)</span>
              <span class="tag tag-orange" style="font-size:9px">High</span>
            </div>
            <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-2) var(--space-3);background:var(--color-info-subtle);border-radius:var(--radius-sm);border-left:3px solid var(--color-info)">
              <span style="font-size:var(--text-xs);font-weight:700;color:var(--color-info)">P2</span>
              <span style="font-size:var(--text-sm);flex:1">Safety review document prep SR-001 (due Jan 20)</span>
              <span class="tag tag-blue" style="font-size:9px">Medium</span>
            </div>
          </div>
        </div>

        <!-- AI Generated: Mini Kanban -->
        <div class="ai-gen-card">
          <div class="ai-gen-card-header">
            <span class="gen-icon" style="background:var(--color-info-subtle);color:var(--color-info)">
              <svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg>
            </span>
            ✦ Your Task Board (Auto-sorted)
          </div>
          <div class="ai-mini-kanban">
            <div>
              <div class="ai-mini-col-title"><span class="status-dot in-progress"></span>In Progress</div>
              <div class="ai-mini-task" style="border-left:2px solid var(--color-danger)">TSK-019 Thermal runaway sim (65%)</div>
              <div class="ai-mini-task" style="border-left:2px solid var(--color-warning)">TSK-018 Safety review docs (40%)</div>
              <div class="ai-mini-task">TSK-017 Isolation test protocol (80%)</div>
            </div>
            <div>
              <div class="ai-mini-col-title"><span class="status-dot review"></span>In Review</div>
              <div class="ai-mini-task">TSK-015 BMS algorithm report</div>
              <div class="ai-mini-task">TSK-014 Cell aging model</div>
            </div>
            <div>
              <div class="ai-mini-col-title"><span class="status-dot todo"></span>Backlog</div>
              <div class="ai-mini-task">TSK-024 Update DFMEA docs</div>
              <div class="ai-mini-task">TSK-023 Test matrix prep</div>
              <div class="ai-mini-task">TSK-022 SOC lit review</div>
            </div>
          </div>
        </div>

        <!-- AI Generated: KPI Snapshot -->
        <div class="ai-gen-card">
          <div class="ai-gen-card-header">
            <span class="gen-icon" style="background:var(--color-success-subtle);color:var(--color-success)">
              <svg viewBox="0 0 24 24"><line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/></svg>
            </span>
            ✦ KPI Snapshot — January 2024
          </div>
          <div style="display:grid;grid-template-columns:repeat(4,1fr);gap:var(--space-3)">
            <div style="text-align:center;padding:var(--space-3);background:var(--color-surface);border-radius:var(--radius-md)">
              <div style="font-size:var(--text-2xl);font-weight:700;color:var(--color-success)">87%</div>
              <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Task Completion</div>
            </div>
            <div style="text-align:center;padding:var(--space-3);background:var(--color-surface);border-radius:var(--radius-md)">
              <div style="font-size:var(--text-2xl);font-weight:700;color:var(--color-accent)">92</div>
              <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Performance</div>
            </div>
            <div style="text-align:center;padding:var(--space-3);background:var(--color-surface);border-radius:var(--radius-md)">
              <div style="font-size:var(--text-2xl);font-weight:700;color:var(--color-info)">3</div>
              <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Patents (YTD)</div>
            </div>
            <div style="text-align:center;padding:var(--space-3);background:var(--color-surface);border-radius:var(--radius-md)">
              <div style="font-size:var(--text-2xl);font-weight:700;color:var(--color-warning)">72%</div>
              <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Project Progress</div>
            </div>
          </div>
        </div>

        <!-- AI Generated: Project Health -->
        <div class="ai-gen-card">
          <div class="ai-gen-card-header">
            <span class="gen-icon" style="background:var(--color-warning-subtle);color:var(--color-warning)">
              <svg viewBox="0 0 24 24"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg>
            </span>
            ✦ Project Health Analysis
          </div>
          <div style="display:flex;flex-direction:column;gap:var(--space-3)">
            <div style="display:flex;align-items:center;gap:var(--space-3)">
              <div style="width:8px;height:8px;border-radius:2px;background:var(--color-success)"></div>
              <span style="font-size:var(--text-sm);flex:1">Cell Consistency Analysis</span>
              <span style="font-size:var(--text-xs);color:var(--color-success)">88% ● Healthy</span>
            </div>
            <div style="display:flex;align-items:center;gap:var(--space-3)">
              <div style="width:8px;height:8px;border-radius:2px;background:var(--color-warning)"></div>
              <span style="font-size:var(--text-sm);flex:1">BMS Safety Certification</span>
              <span style="font-size:var(--text-xs);color:var(--color-warning)">72% ● At Risk (SR-001 overdue)</span>
            </div>
            <div style="display:flex;align-items:center;gap:var(--space-3)">
              <div style="width:8px;height:8px;border-radius:2px;background:var(--color-info)"></div>
              <span style="font-size:var(--text-sm);flex:1">Thermal Management R&D</span>
              <span style="font-size:var(--text-xs);color:var(--color-info)">45% ● On Track</span>
            </div>
            <div style="display:flex;align-items:center;gap:var(--space-3)">
              <div style="width:8px;height:8px;border-radius:2px;background:var(--color-danger)"></div>
              <span style="font-size:var(--text-sm);flex:1">FMEA Documentation</span>
              <span style="font-size:var(--text-xs);color:var(--color-danger)">31% ● Behind Schedule</span>
            </div>
          </div>
        </div>
      </div>

      <!-- RIGHT PANEL: AI Chat -->
      <div class="ai-right-panel">
        <div style="padding:var(--space-4) var(--space-5);border-bottom:1px solid var(--color-border);display:flex;align-items:center;justify-content:space-between">
          <div style="display:flex;align-items:center;gap:var(--space-2)">
            <div style="width:24px;height:24px;border-radius:var(--radius-sm);background:linear-gradient(135deg,var(--color-accent),#6366F1);display:flex;align-items:center;justify-content:center">
              <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"><path d="M12 2a10 10 0 1 0 10 10H12V2z"/></svg>
            </div>
            <span style="font-size:var(--text-sm);font-weight:600">BST AI</span>
            <span style="font-size:var(--text-xs);color:var(--color-success)">● Online</span>
          </div>
          <button class="btn btn-ghost btn-sm">New Chat</button>
        </div>

        <div class="ai-messages" style="flex:1;overflow-y:auto;padding:var(--space-4)">
          <!-- AI Welcome -->
          <div class="ai-message assistant">
            <div class="ai-avatar assistant" style="width:26px;height:26px;border-radius:var(--radius-sm)">
              <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"><path d="M12 2a10 10 0 1 0 10 10H12V2z"/></svg>
            </div>
            <div class="ai-bubble" style="font-size:var(--text-sm)">
              <div style="margin-bottom:var(--space-2)">👋 Hi Zhang Gong! I've analyzed your workspace data:</div>
              <div style="margin-bottom:var(--space-2)">• <strong>SR-001</strong> is overdue — I've drafted a priority action plan on the left panel</div>
              <div style="margin-bottom:var(--space-2)">• Your performance score is trending up <strong style="color:var(--color-success)">+5 pts</strong></div>
              <div>• I've sorted your tasks by AI-calculated priority</div>
            </div>
          </div>
        </div>

        <!-- Quick Commands -->
        <div class="ai-commands-grid">
          <button class="ai-cmd-btn">
            <svg viewBox="0 0 24 24"><path d="M9 11l3 3L22 4"/><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/><line x1="12" y1="1" x2="12" y2="3"/><line x1="12" y1="21" x2="12" y2="23"/></svg>
            Summarize my tasks
          </button>
          <button class="ai-cmd-btn">
            <svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
            Generate monthly report
          </button>
          <button class="ai-cmd-btn">
            <svg viewBox="0 0 24 24"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
            Analyze safety risks
          </button>
          <button class="ai-cmd-btn">
            <svg viewBox="0 0 24 24"><line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/></svg>
            Performance insights
          </button>
          <button class="ai-cmd-btn">
            <svg viewBox="0 0 24 24"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg>
            Project health check
          </button>
          <button class="ai-cmd-btn">
            <svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/></svg>
            Draft patent abstract
          </button>
        </div>

        <!-- AI Input -->
        <div class="ai-input-bar" style="padding:var(--space-3) var(--space-4)">
          <textarea class="ai-input-field" placeholder="Ask AI anything..." rows="1" style="font-size:var(--text-sm)"></textarea>
          <button class="ai-send-btn" style="width:32px;height:32px">
            <svg viewBox="0 0 24 24" style="width:14px;height:14px"><line x1="22" y1="2" x2="11" y2="13"/><polygon points="22 2 15 22 11 13 2 9 22 2"/></svg>
          </button>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- ===== PAGE: TASKS ===== -->
<div id="page-tasks" class="page-section">
  <div class="topbar">
    <div class="topbar-breadcrumb">
      <span>Home</span>
      <span class="breadcrumb-sep">/</span>
      <span>Tasks</span>
    </div>
    <div class="topbar-actions">
      <div class="search-trigger"
        onclick="document.querySelector('.command-palette').classList.add('active'); document.querySelector('.command-input').focus();">
        <svg viewBox="0 0 24 24"><path d="M11 19a8 8 0 1 0 7.7-4.7l4.32 2.16a1 1 0 0 0 1.44-1.44l-2.16-4.32A8 8 0 1 0 5.28 3c0 .7-.15 1.4-.47 2.03-.66 1.31-1.23 2.6-1.72 3.92L.88 11.87C.73 12.31.7 12.75.7 13.2V15a1 1 0 0 0 .77.97L3.5 17h11.5a8 8 0 1 0 2.08-12.75z"/></svg>
        <span>Search tasks (⌘+K)</span>
        <div class="search-shortcut">
          <kbd>⌘</kbd><kbd>K</kbd>
        </div>
      </div>

      <button class="theme-toggle" onclick="toggleTheme()" title="Toggle theme">
        <svg class="icon-sun" viewBox="0 0 24 24"><circle cx="12" cy="12" r="5"/><line x1="12" y1="1" x2="12" y2="3"/><line x1="12" y1="21" x2="12" y2="23"/><line x1="4.22" y1="4.22" x2="5.64" y2="5.64"/><line x1="18.36" y1="18.36" x2="19.78" y2="19.78"/><line x1="1" y1="12" x2="3" y2="12"/><line x1="21" y1="12" x2="23" y2="12"/><line x1="4.22" y1="19.78" x2="5.64" y2="18.36"/><line x1="18.36" y1="5.64" x2="19.78" y2="4.22"/></svg>
        <svg class="icon-moon" viewBox="0 0 24 24"><path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"/></svg>
      </button>

      <div class="btn-group">
        <button class="btn btn-secondary btn-sm">
          <svg viewBox="0 0 24 24"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
          Export
        </button>
        <button class="btn btn-primary btn-sm">
          <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
          New Task
        </button>
      </div>
    </div>
  </div>

  <div class="content-area">
    <!-- Page Header -->
    <div class="page-header">
      <div class="page-header-top">
        <div>
          <h1 class="page-title">My Tasks</h1>
          <p class="page-subtitle">All tasks assigned to you — filter by project, priority, or status.</p>
        </div>
        <div class="btn-group">
          <button class="btn btn-secondary btn-sm">
            <svg viewBox="0 0 24 24"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
            Filter
          </button>
          <button class="btn btn-primary btn-sm">
            <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
            Add Task
          </button>
        </div>
      </div>
    </div>

    <!-- Filter Bar -->
    <div class="filter-bar">
      <div class="filter-chip active" data-filter="status">Status</div>
      <div class="filter-chip" data-filter="project">Project</div>
      <div class="filter-chip" data-filter="priority">Priority</div>
      <div class="filter-chip" data-filter="due">Due Date</div>
      <div class="filter-chip" data-filter="type">Type</div>
      <div class="filter-chip" data-filter="owner">Owner</div>
    </div>

    <!-- Kanban Board -->
    <div class="kanban-board">
      <!-- Todo Column -->
      <div class="kanban-column">
        <div class="kanban-column-header">
          <div class="kanban-column-title">
            <span>待办</span>
            <span class="kanban-column-count">4</span>
          </div>
          <button class="kanban-add-card" onclick="console.log('Add task to Todo')">
            <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
            Add Card
          </button>
        </div>
        <div class="kanban-cards">
          <div class="kanban-card">
            <div class="kanban-card-id">TSK-020</div>
            <div class="kanban-card-title">Contact vendor for thermal abuse test reports</div>
            <div class="kanban-card-meta">
              <div><span class="status-dot critical"></span> P0</div>
              <div class="kanban-card-avatar">ZG</div>
            </div>
          </div>
          <div class="kanban-card">
            <div class="kanban-card-id">TSK-018</div>
            <div class="kanban-card-title">Safety review document preparation (SR-001)</div>
            <div class="kanban-card-meta">
              <div><span class="status-dot in-progress"></span> P1</div>
              <div class="kanban-card-avatar">ZG</div>
            </div>
          </div>
          <div class="kanban-card">
            <div class="kanban-card-id">TSK-024</div>
            <div class="kanban-card-title">Update DFMEA documentation (BMS-2024)</div>
            <div class="kanban-card-meta">
              <div><span class="status-dot todo"></span> P2</div>
              <div class="kanban-card-avatar">WL</div>
            </div>
          </div>
          <div class="kanban-card">
            <div class="kanban-card-id">TSK-022</div>
            <div class="kanban-card-title">SOC estimation literature review</div>
            <div class="kanban-card-meta">
              <div><span class="status-dot todo"></span> P2</div>
              <div class="kanban-card-avatar">CK</div>
            </div>
          </div>
        </div>
      </div>

      <!-- In Progress Column -->
      <div class="kanban-column">
        <div class="kanban-column-header">
          <div class="kanban-column-title">
            <span>进行中</span>
            <span class="kanban-column-count">3</span>
          </div>
          <button class="kanban-add-card" onclick="console.log('Add task to In Progress')">
            <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
            Add Card
          </button>
        </div>
        <div class="kanban-cards">
          <div class="kanban-card">
            <div class="kanban-card-id">TSK-019</div>
            <div class="kanban-card-title">Thermal runaway simulation report (BMS-2024)</div>
            <div class="kanban-card-meta">
              <div><span class="status-dot in-progress"></span> P0</div>
              <div style="display:flex;gap:4px"><div class="kanban-card-avatar">ZG</div><div class="kanban-card-avatar blue">LG</div></div>
            </div>
            <div style="margin-top:var(--space-2)">
              <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Progress: 65%</div>
              <div class="progress-bar" style="height:4px"><div class="progress-fill purple" style="width:65%"></div></div>
            </div>
          </div>
          <div class="kanban-card">
            <div class="kanban-card-id">TSK-017</div>
            <div class="kanban-card-title">Isolation test protocol finalization</div>
            <div class="kanban-card-meta">
              <div><span class="status-dot in-progress"></span> P2</div>
              <div class="kanban-card-avatar">HL</div>
            </div>
            <div style="margin-top:var(--space-2)">
              <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Progress: 80%</div>
              <div class="progress-bar" style="height:4px"><div class="progress-fill green" style="width:80%"></div></div>
            </div>
          </div>
          <div class="kanban-card">
            <div class="kanban-card-id">TSK-015</div>
            <div class="kanban-card-title">BMS algorithm stability report</div>
            <div class="kanban-card-meta">
              <div><span class="status-dot review"></span> P1</div>
              <div class="kanban-card-avatar">LG</div>
            </div>
            <div style="margin-top:var(--space-2)">
              <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">In Review</div>
              <div class="progress-bar" style="height:4px"><div class="progress-fill orange" style="width:90%"></div></div>
            </div>
          </div>
        </div>
      </div>

      <!-- Delayed Column -->
      <div class="kanban-column">
        <div class="kanban-column-header">
          <div class="kanban-column-title">
            <span>⚠️ 延期</span>
            <span class="kanban-column-count">1</span>
          </div>
          <button class="kanban-add-card" onclick="console.log('Add task to Delayed')">
            <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
            Add Card
          </button>
        </div>
        <div class="kanban-cards">
          <div class="kanban-card">
            <div class="kanban-card-id">TSK-016</div>
            <div class="kanban-card-title">Cell aging model validation</div>
            <div class="kanban-card-meta">
              <div><span class="status-dot critical"></span> P0</div>
              <div class="kanban-card-avatar">ZG</div>
            </div>
            <div style="margin-top:var(--space-2)">
              <div style="font-size:var(--text-xs);color:var(--color-danger)">Overdue by 3d</div>
              <div class="progress-bar" style="height:4px"><div class="progress-fill red" style="width:25%"></div></div>
            </div>
          </div>
        </div>
      </div>

      <!-- Done Column -->
      <div class="kanban-column">
        <div class="kanban-column-header">
          <div class="kanban-column-title">
            <span>✅ 完成</span>
            <span class="kanban-column-count">8</span>
          </div>
          <button class="kanban-add-card" onclick="console.log('Add task to Done')">
            <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
            Add Card
          </button>
        </div>
        <div class="kanban-cards">
          <div class="kanban-card" style="opacity:0.8;cursor:not-allowed">
            <div class="kanban-card-id">TSK-014</div>
            <div class="kanban-card-title">Cell aging model development</div>
            <div class="kanban-card-meta">
              <div><span class="status-dot done"></span> Complete</div>
              <div class="kanban-card-avatar">ZG</div>
            </div>
            <div style="margin-top:var(--space-2)">
              <div style="font-size:var(--text-xs);color:var(--color-success)">Jan 5</div>
              <div class="progress-bar" style="height:4px"><div class="progress-fill green" style="width:100%"></div></div>
            </div>
          </div>
          <div class="kanban-card" style="opacity:0.8;cursor:not-allowed">
            <div class="kanban-card-id">TSK-013</div>
            <div class="kanban-card-title">Hazard analysis data update</div>
            <div class="kanban-card-meta">
              <div><span class="status-dot done"></span> Complete</div>
              <div class="kanban-card-avatar">LG</div>
            </div>
            <div style="margin-top:var(--space-2)">
              <div style="font-size:var(--text-xs);color:var(--color-success)">Jan 3</div>
              <div class="progress-bar" style="height:4px"><div class="progress-fill green" style="width:100%"></div></div>
            </div>
          </div>
          <!-- More dummy completed tasks... -->
        </div>
      </div>
    </div>

    <!-- Task Table (for mobile/alternative view) -->
    <div style="margin-top:var(--space-6);display:none">
      <div class="data-table-container">
        <table class="data-table">
          <thead>
            <tr>
              <th>#</th>
              <th>Title</th>
              <th>Project</th>
              <th>Status</th>
              <th>Priority</th>
              <th>Due</th>
              <th>Owner</th>
              <th>Progress</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td class="cell-id">TSK-019</td>
              <td class="cell-primary">Thermal runaway simulation report</td>
              <td>BMS-2024</td>
              <td><span class="tag tag-blue">In Progress</span></td>
              <td><span style="color:var(--color-danger)">P0</span></td>
              <td>Jan 18</td>
              <td>Zhang Gong</td>
              <td><div class="progress-bar" style="height:6px;width:80px"><div class="progress-fill purple" style="width:65%"></div></div></td>
            </tr>
            <tr>
              <td class="cell-id">TSK-016</td>
              <td class="cell-primary">Cell aging model validation</td>
              <td>BMS-2024</td>
              <td><span class="tag tag-red">Delayed</span></td>
              <td><span style="color:var(--color-danger)">P0</span></td>
              <td>Jan 10</td>
              <td>Zhang Gong</td>
              <td><div class="progress-bar" style="height:6px;width:80px"><div class="progress-fill red" style="width:25%"></div></div></td>
            </tr>
            <tr>
              <td class="cell-id">TSK-017</td>
              <td class="cell-primary">Isolation test protocol finalization</td>
              <td>THERM-03</td>
              <td><span class="tag tag-green">Done</span></td>
              <td>P2</td>
              <td>Jan 12</td>
              <td>Huang Lei</td>
              <td><div class="progress-bar" style="height:6px;width:80px"><div class="progress-fill green" style="width:100%"></div></div></td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<!-- ===== PAGE: PROJECTS ===== -->
<div id="page-projects" class="page-section">
  <div class="topbar">
    <div class="topbar-breadcrumb">
      <span>Home</span>
      <span class="breadcrumb-sep">/</span>
      <span>Projects</span>
    </div>
    <div class="topbar-actions">
      <div class="search-trigger"
        onclick="document.querySelector('.command-palette').classList.add('active'); document.querySelector('.command-input').focus();">
        <svg viewBox="0 0 24 24"><path d="M11 19a8 8 0 1 0 7.7-4.7l4.32 2.16a1 1 0 0 0 1.44-1.44l-2.16-4.32A8 8 0 1 0 5.28 3c0 .7-.15 1.4-.47 2.03-.66 1.31-1.23 2.6-1.72 3.92L.88 11.87C.73 12.31.7 12.75.7 13.2V15a1 1 0 0 0 .77.97L3.5 17h11.5a8 8 0 1 0 2.08-12.75z"/></svg>
        <span>Search projects (⌘+K)</span>
        <div class="search-shortcut">
          <kbd>⌘</kbd><kbd>K</kbd>
        </div>
      </div>

      <button class="theme-toggle" onclick="toggleTheme()" title="Toggle theme">
        <svg class="icon-sun" viewBox="0 0 24 24"><circle cx="12" cy="12" r="5"/><line x1="12" y1="1" x2="12" y2="3"/><line x1="12" y1="21" x2="12" y2="23"/><line x1="4.22" y1="4.22" x2="5.64" y2="5.64"/><line x1="18.36" y1="18.36" x2="19.78" y2="19.78"/><line x1="1" y1="12" x2="3" y2="12"/><line x1="21" y1="12" x2="23" y2="12"/><line x1="4.22" y1="19.78" x2="5.64" y2="18.36"/><line x1="18.36" y1="5.64" x2="19.78" y2="4.22"/></svg>
        <svg class="icon-moon" viewBox="0 0 24 24"><path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"/></svg>
      </button>

      <div class="btn-group">
        <button class="btn btn-secondary btn-sm">
          <svg viewBox="0 0 24 24"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
          Export
        </button>
        <button class="btn btn-primary btn-sm">
          <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
          New Project
        </button>
      </div>
    </div>
  </div>

  <div class="content-area">
    <!-- Page Header -->
    <div class="page-header">
      <div class="page-header-top">
        <div>
          <h1 class="page-title">Projects</h1>
          <p class="page-subtitle">Manage your engineering projects and track progress across all phases.</p>
        </div>
        <div class="view-switcher">
          <button class="view-switcher-btn active" onclick="switchProjectView('cards')">
            <svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg>
            Cards
          </button>
          <button class="view-switcher-btn" onclick="switchProjectView('list')">
            <svg viewBox="0 0 24 24"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
            List
          </button>
          <button class="view-switcher-btn" onclick="switchProjectView('gantt')">
            <svg viewBox="0 0 24 24"><line x1="2" y1="12" x2="22" y2="12"/><line x1="2" y1="6" x2="22" y2="6"/><line x1="2" y1="18" x2="22" y2="18"/></svg>
            Gantt
          </button>
          <button class="view-switcher-btn" onclick="switchProjectView('wbs')">
            <svg viewBox="0 0 24 24"><path d="M22 7v10a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V7a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2z"/><path d="M12 12a2 2 0 0 0-2-2H5a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-5"/></svg>
            WBS
          </button>
          <button class="view-switcher-btn" onclick="switchProjectView('stats')">
            <svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg>
            Stats
          </button>
        </div>
      </div>
    </div>

    <!-- Project View: Cards -->
    <div class="project-view-content active" id="projectViewCards">
      <div class="dashboard-grid">
        <!-- Project Card 1 -->
        <div class="card" style="cursor:pointer">
          <div class="card-body" style="padding:var(--space-5)">
            <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-4)">
              <div style="display:flex;align-items:center;gap:var(--space-3)">
                <div style="width:36px;height:36px;border-radius:var(--radius-md);background:linear-gradient(135deg,var(--color-accent),#6366F1);display:flex;align-items:center;justify-content:center">
                  <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
                </div>
                <div>
                  <div style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">PRJ-001</div>
                  <div style="font-size:var(--text-md);font-weight:600">BMS Safety Certification</div>
                </div>
              </div>
              <span class="tag tag-green">Active</span>
            </div>
            <p style="font-size:var(--text-sm);color:var(--color-text-tertiary);margin-bottom:var(--space-4)">Complete functional safety certification per ISO 26262. Includes FMEA, FTA, and requirements validation.</p>
            <div style="margin-bottom:var(--space-4)">
              <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)"><span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Progress</span><span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-tertiary)">72%</span></div>
              <div class="progress-bar"><div class="progress-fill purple" style="width:72%"></div></div>
            </div>
            <div style="display:flex;align-items:center;justify-content:space-between">
              <div class="avatar-group"><div class="avatar">ZG</div><div class="avatar blue">LG</div><div class="avatar green">WL</div><div class="avatar more">+3</div></div>
              <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Jun 30, 2024</span>
            </div>
          </div>
        </div>

        <!-- Project Card 2 -->
        <div class="card" style="cursor:pointer">
          <div class="card-body" style="padding:var(--space-5)">
            <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-4)">
              <div style="display:flex;align-items:center;gap:var(--space-3)">
                <div style="width:36px;height:36px;border-radius:var(--radius-md);background:linear-gradient(135deg,#2563EB,#3B82F6);display:flex;align-items:center;justify-content:center">
                  <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"><path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z"/></svg>
                </div>
                <div>
                  <div style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">PRJ-002</div>
                  <div style="font-size:var(--text-md);font-weight:600">Thermal Management R&D</div>
                </div>
              </div>
              <span class="tag tag-green">Active</span>
            </div>
            <p style="font-size:var(--text-sm);color:var(--color-text-tertiary);margin-bottom:var(--space-4)">Advanced thermal management solutions for high-energy-density battery packs. Targets 30% reduction in thermal gradient.</p>
            <div style="margin-bottom:var(--space-4)">
              <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)"><span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Progress</span><span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-tertiary)">45%</span></div>
              <div class="progress-bar"><div class="progress-fill blue" style="width:45%"></div></div>
            </div>
            <div style="display:flex;align-items:center;justify-content:space-between">
              <div class="avatar-group"><div class="avatar orange">CK</div><div class="avatar pink">HL</div></div>
              <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Mar 15, 2024</span>
            </div>
          </div>
        </div>

        <!-- Project Card 3 -->
        <div class="card" style="cursor:pointer">
          <div class="card-body" style="padding:var(--space-5)">
            <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-4)">
              <div style="display:flex;align-items:center;gap:var(--space-3)">
                <div style="width:36px;height:36px;border-radius:var(--radius-md);background:linear-gradient(135deg,#059669,#22C55E);display:flex;align-items:center;justify-content:center">
                  <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"><line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/></svg>
                </div>
                <div>
                  <div style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">PRJ-003</div>
                  <div style="font-size:var(--text-md);font-weight:600">Cell Consistency Analysis</div>
                </div>
              </div>
              <span class="tag tag-blue">Near Complete</span>
            </div>
            <p style="font-size:var(--text-sm);color:var(--color-text-tertiary);margin-bottom:var(--space-4)">Statistical analysis of cell-to-cell variation impact on pack performance. Output: variation tolerance map + risk matrix.</p>
            <div style="margin-bottom:var(--space-4)">
              <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)"><span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Progress</span><span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-tertiary)">88%</span></div>
              <div class="progress-bar"><div class="progress-fill green" style="width:88%"></div></div>
            </div>
            <div style="display:flex;align-items:center;justify-content:space-between">
              <div class="avatar-group"><div class="avatar">ZG</div><div class="avatar blue">LG</div></div>
              <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Feb 28, 2024</span>
            </div>
          </div>
        </div>

        <!-- Project Card 4 -->
        <div class="card" style="cursor:pointer">
          <div class="card-body" style="padding:var(--space-5)">
            <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-4)">
              <div style="display:flex;align-items:center;gap:var(--space-3)">
                <div style="width:36px;height:36px;border-radius:var(--radius-md);background:var(--color-bg-active);display:flex;align-items:center;justify-content:center">
                  <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="var(--color-text-tertiary)" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
                </div>
                <div>
                  <div style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">PRJ-004</div>
                  <div style="font-size:var(--text-md);font-weight:600">FMEA Documentation</div>
                </div>
              </div>
              <span class="tag tag-orange">At Risk</span>
            </div>
            <p style="font-size:var(--text-sm);color:var(--color-text-tertiary);margin-bottom:var(--space-4)">Comprehensive FMEA for BMS hardware/software subsystems. Current phase: Failure mode clustering.</p>
            <div style="margin-bottom:var(--space-4)">
              <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)"><span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Progress</span><span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-tertiary)">31%</span></div>
              <div class="progress-bar"><div class="progress-fill orange" style="width:31%"></div></div>
            </div>
            <div style="display:flex;align-items:center;justify-content:space-between">
              <div class="avatar-group"><div class="avatar green">WL</div></div>
              <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Apr 20, 2024</span>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Project View: List Table -->
    <div class="project-view-content" id="projectViewList">
      <div class="data-table-container">
        <table class="data-table">
          <thead>
            <tr>
              <th>Project ID</th>
              <th>Project Name</th>
              <th>Status</th>
              <th>Progress</th>
              <th>Owner</th>
              <th>Team</th>
              <th>Start Date</th>
              <th>Due Date</th>
              <th>Safety Reviews</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td class="cell-id">PRJ-001</td>
              <td class="cell-primary">BMS Safety Certification</td>
              <td><span class="tag tag-green">Active</span></td>
              <td>
                <div style="display:flex;align-items:center;gap:var(--space-2)">
                  <div class="progress-bar" style="width:80px"><div class="progress-fill purple" style="width:72%"></div></div>
                  <span style="font-size:var(--text-xs);font-family:var(--font-mono)">72%</span>
                </div>
              </td>
              <td>Zhang Gong</td>
              <td>
                <div class="avatar-group"><div class="avatar" style="width:20px;height:20px;font-size:8px">ZG</div><div class="avatar blue" style="width:20px;height:20px;font-size:8px">LG</div><div class="avatar green" style="width:20px;height:20px;font-size:8px">WL</div></div>
              </td>
              <td>Jan 01, 2024</td>
              <td>Jun 30, 2024</td>
              <td><span class="tag tag-red" style="font-size:10px">SR-001 Overdue</span></td>
            </tr>
            <tr>
              <td class="cell-id">PRJ-002</td>
              <td class="cell-primary">Thermal Management R&D</td>
              <td><span class="tag tag-green">Active</span></td>
              <td>
                <div style="display:flex;align-items:center;gap:var(--space-2)">
                  <div class="progress-bar" style="width:80px"><div class="progress-fill blue" style="width:45%"></div></div>
                  <span style="font-size:var(--text-xs);font-family:var(--font-mono)">45%</span>
                </div>
              </td>
              <td>Chen Ke</td>
              <td>
                <div class="avatar-group"><div class="avatar orange" style="width:20px;height:20px;font-size:8px">CK</div><div class="avatar pink" style="width:20px;height:20px;font-size:8px">HL</div></div>
              </td>
              <td>Feb 01, 2024</td>
              <td>Mar 15, 2024</td>
              <td><span class="tag tag-blue" style="font-size:10px">SR-002</span></td>
            </tr>
            <tr>
              <td class="cell-id">PRJ-003</td>
              <td class="cell-primary">Cell Consistency Analysis</td>
              <td><span class="tag tag-blue">Near Complete</span></td>
              <td>
                <div style="display:flex;align-items:center;gap:var(--space-2)">
                  <div class="progress-bar" style="width:80px"><div class="progress-fill green" style="width:88%"></div></div>
                  <span style="font-size:var(--text-xs);font-family:var(--font-mono)">88%</span>
                </div>
              </td>
              <td>Zhang Gong</td>
              <td>
                <div class="avatar-group"><div class="avatar" style="width:20px;height:20px;font-size:8px">ZG</div><div class="avatar blue" style="width:20px;height:20px;font-size:8px">LG</div></div>
              </td>
              <td>Nov 01, 2023</td>
              <td>Feb 28, 2024</td>
              <td>--</td>
            </tr>
            <tr>
              <td class="cell-id">PRJ-004</td>
              <td class="cell-primary">FMEA Documentation</td>
              <td><span class="tag tag-orange">At Risk</span></td>
              <td>
                <div style="display:flex;align-items:center;gap:var(--space-2)">
                  <div class="progress-bar" style="width:80px"><div class="progress-fill orange" style="width:31%"></div></div>
                  <span style="font-size:var(--text-xs);font-family:var(--font-mono)">31%</span>
                </div>
              </td>
              <td>Wang Lei</td>
              <td>
                <div class="avatar-group"><div class="avatar green" style="width:20px;height:20px;font-size:8px">WL</div></div>
              </td>
              <td>Dec 01, 2023</td>
              <td>Apr 20, 2024</td>
              <td><span class="tag tag-default" style="font-size:10px">SR-003</span></td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

    <!-- Project View: Gantt Chart -->
    <div class="project-view-content" id="projectViewGantt">
      <div class="gantt-placeholder">
        <div class="gantt-header-row">
          <div class="gantt-header-cell">Task / Milestone</div>
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
        <!-- PRJ-001 -->
        <div class="gantt-row" style="background:var(--color-accent-subtle)">
          <div class="gantt-task-name" style="font-weight:600">PRJ-001 BMS Safety Cert</div>
          <div class="gantt-bar-container"><div class="gantt-bar" style="left:0%;width:50%"></div></div>
        </div>
        <div class="gantt-row">
          <div class="gantt-task-name" style="padding-left:var(--space-5)">FMEA Analysis</div>
          <div class="gantt-bar-container"><div class="gantt-bar" style="left:0%;width:20%"></div></div>
        </div>
        <div class="gantt-row">
          <div class="gantt-task-name" style="padding-left:var(--space-5)">FTA Development</div>
          <div class="gantt-bar-container"><div class="gantt-bar blue" style="left:8%;width:18%"></div></div>
        </div>
        <div class="gantt-row">
          <div class="gantt-task-name" style="padding-left:var(--space-5)">Safety Requirements</div>
          <div class="gantt-bar-container"><div class="gantt-bar green" style="left:16%;width:20%"></div></div>
        </div>
        <div class="gantt-row">
          <div class="gantt-task-name" style="padding-left:var(--space-5)">Design Validation</div>
          <div class="gantt-bar-container"><div class="gantt-bar orange" style="left:28%;width:22%"></div></div>
        </div>
        <!-- PRJ-002 -->
        <div class="gantt-row" style="background:var(--color-info-subtle)">
          <div class="gantt-task-name" style="font-weight:600">PRJ-002 Thermal Mgmt</div>
          <div class="gantt-bar-container"><div class="gantt-bar blue" style="left:5%;width:18%"></div></div>
        </div>
        <div class="gantt-row">
          <div class="gantt-task-name" style="padding-left:var(--space-5)">Thermal Simulation</div>
          <div class="gantt-bar-container"><div class="gantt-bar blue" style="left:5%;width:10%"></div></div>
        </div>
        <div class="gantt-row">
          <div class="gantt-task-name" style="padding-left:var(--space-5)">Prototype Testing</div>
          <div class="gantt-bar-container"><div class="gantt-bar red" style="left:12%;width:10%"></div></div>
        </div>
        <!-- PRJ-003 -->
        <div class="gantt-row" style="background:var(--color-success-subtle)">
          <div class="gantt-task-name" style="font-weight:600">PRJ-003 Cell Consistency</div>
          <div class="gantt-bar-container"><div class="gantt-bar green" style="left:0%;width:16%"></div></div>
        </div>
        <!-- PRJ-004 -->
        <div class="gantt-row" style="background:var(--color-warning-subtle)">
          <div class="gantt-task-name" style="font-weight:600">PRJ-004 FMEA Docs</div>
          <div class="gantt-bar-container"><div class="gantt-bar orange" style="left:0%;width:30%"></div></div>
        </div>
      </div>
    </div>

    <!-- Project View: WBS -->
    <div class="project-view-content" id="projectViewWbs">
      <div class="wbs-tree">
        <!-- Root: PRJ-001 -->
        <div class="wbs-node">
          <div class="wbs-node-inner level-0">
            <div class="wbs-expand-icon"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"/></svg></div>
            <div style="width:28px;height:28px;border-radius:var(--radius-md);background:linear-gradient(135deg,var(--color-accent),#6366F1);display:flex;align-items:center;justify-content:center;flex-shrink:0">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
            </div>
            <span>PRJ-001 BMS Safety Certification</span>
            <div class="wbs-node-info">
              <span class="tag tag-green" style="font-size:9px">Active</span>
              <span>72%</span>
              <span>Jun 30</span>
            </div>
          </div>
          <div class="wbs-children">
            <!-- Level 1: Phases -->
            <div class="wbs-node">
              <div class="wbs-node-inner">
                <div class="wbs-expand-icon"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"/></svg></div>
                <span>1.0 FMEA Analysis</span>
                <div class="wbs-node-info">
                  <div class="progress-bar" style="width:60px;height:3px"><div class="progress-fill green" style="width:100%"></div></div>
                  <span>100%</span>
                </div>
              </div>
              <div class="wbs-children">
                <div class="wbs-node">
                  <div class="wbs-node-inner">
                    <span style="width:16px;flex-shrink:0"></span>
                    <span>1.1 System-level FMEA</span>
                    <div class="wbs-node-info"><span class="tag tag-green" style="font-size:9px">Done</span><span>ZG</span></div>
                  </div>
                </div>
                <div class="wbs-node">
                  <div class="wbs-node-inner">
                    <span style="width:16px;flex-shrink:0"></span>
                    <span>1.2 Component DFMEA</span>
                    <div class="wbs-node-info"><span class="tag tag-green" style="font-size:9px">Done</span><span>LG</span></div>
                  </div>
                </div>
                <div class="wbs-node">
                  <div class="wbs-node-inner">
                    <span style="width:16px;flex-shrink:0"></span>
                    <span>1.3 PFMEA Documentation</span>
                    <div class="wbs-node-info"><span class="tag tag-green" style="font-size:9px">Done</span><span>WL</span></div>
                  </div>
                </div>
              </div>
            </div>

            <div class="wbs-node">
              <div class="wbs-node-inner">
                <div class="wbs-expand-icon"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"/></svg></div>
                <span>2.0 FTA Development</span>
                <div class="wbs-node-info">
                  <div class="progress-bar" style="width:60px;height:3px"><div class="progress-fill green" style="width:90%"></div></div>
                  <span>90%</span>
                </div>
              </div>
              <div class="wbs-children">
                <div class="wbs-node">
                  <div class="wbs-node-inner">
                    <span style="width:16px;flex-shrink:0"></span>
                    <span>2.1 Top Event Definition</span>
                    <div class="wbs-node-info"><span class="tag tag-green" style="font-size:9px">Done</span></div>
                  </div>
                </div>
                <div class="wbs-node">
                  <div class="wbs-node-inner">
                    <span style="width:16px;flex-shrink:0"></span>
                    <span>2.2 Fault Tree Construction</span>
                    <div class="wbs-node-info"><span class="tag tag-blue" style="font-size:9px">In Review</span></div>
                  </div>
                </div>
              </div>
            </div>

            <div class="wbs-node">
              <div class="wbs-node-inner">
                <div class="wbs-expand-icon"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"/></svg></div>
                <span>3.0 Safety Requirements</span>
                <div class="wbs-node-info">
                  <div class="progress-bar" style="width:60px;height:3px"><div class="progress-fill purple" style="width:65%"></div></div>
                  <span style="color:var(--color-warning)">65%</span>
                </div>
              </div>
              <div class="wbs-children">
                <div class="wbs-node">
                  <div class="wbs-node-inner">
                    <span style="width:16px;flex-shrink:0"></span>
                    <span>3.1 Functional Safety Requirements</span>
                    <div class="wbs-node-info"><span class="tag tag-orange" style="font-size:9px">In Progress</span></div>
                  </div>
                </div>
                <div class="wbs-node">
                  <div class="wbs-node-inner">
                    <span style="width:16px;flex-shrink:0"></span>
                    <span>3.2 Technical Safety Requirements</span>
                    <div class="wbs-node-info"><span class="tag tag-default" style="font-size:9px">Backlog</span></div>
                  </div>
                </div>
              </div>
            </div>

            <div class="wbs-node">
              <div class="wbs-node-inner">
                <div class="wbs-expand-icon"><svg viewBox="0 0 24 24"><polyline points="9 18 15 12 9 6"/></svg></div>
                <span>4.0 Design Validation</span>
                <div class="wbs-node-info">
                  <div class="progress-bar" style="width:60px;height:3px"><div class="progress-fill orange" style="width:30%"></div></div>
                  <span>30%</span>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Root: PRJ-002 -->
        <div class="wbs-node" style="margin-top:var(--space-4)">
          <div class="wbs-node-inner level-0">
            <div class="wbs-expand-icon"><svg viewBox="0 0 24 24"><polyline points="9 18 15 12 9 6"/></svg></div>
            <div style="width:28px;height:28px;border-radius:var(--radius-md);background:linear-gradient(135deg,#2563EB,#3B82F6);display:flex;align-items:center;justify-content:center;flex-shrink:0">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"><path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z"/></svg>
            </div>
            <span>PRJ-002 Thermal Management R&D</span>
            <div class="wbs-node-info">
              <span class="tag tag-green" style="font-size:9px">Active</span>
              <span>45%</span>
              <span>Mar 15</span>
            </div>
          </div>
        </div>

        <!-- Root: PRJ-003 -->
        <div class="wbs-node" style="margin-top:var(--space-4)">
          <div class="wbs-node-inner level-0">
            <div class="wbs-expand-icon"><svg viewBox="0 0 24 24"><polyline points="9 18 15 12 9 6"/></svg></div>
            <div style="width:28px;height:28px;border-radius:var(--radius-md);background:linear-gradient(135deg,#059669,#22C55E);display:flex;align-items:center;justify-content:center;flex-shrink:0">
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"><line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/></svg>
            </div>
            <span>PRJ-003 Cell Consistency Analysis</span>
            <div class="wbs-node-info">
              <span class="tag tag-blue" style="font-size:9px">Near Complete</span>
              <span>88%</span>
              <span>Feb 28</span>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Project View: Data Statistics -->
    <div class="project-view-content" id="projectViewStats">
      <!-- Stats Overview -->
      <div class="stat-grid" style="margin-bottom:var(--space-6)">
        <div class="stat-card">
          <div class="stat-label">Total Projects</div>
          <div class="stat-value">4</div>
          <div style="display:flex;gap:var(--space-2);margin-top:var(--space-2)">
            <span class="tag tag-green" style="font-size:9px">3 Active</span>
            <span class="tag tag-default" style="font-size:9px">1 At Risk</span>
          </div>
        </div>
        <div class="stat-card">
          <div class="stat-label">Overall Completion</div>
          <div class="stat-value">59%</div>
          <div class="progress-bar" style="margin-top:var(--space-2)"><div class="progress-fill purple" style="width:59%"></div></div>
        </div>
        <div class="stat-card">
          <div class="stat-label">Open Tasks</div>
          <div class="stat-value">24</div>
          <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:var(--space-1)">Across all projects</div>
        </div>
        <div class="stat-card">
          <div class="stat-label">Safety Reviews</div>
          <div class="stat-value">4</div>
          <div style="display:flex;gap:var(--space-2);margin-top:var(--space-2)">
            <span class="tag tag-red" style="font-size:9px">1 Overdue</span>
            <span class="tag tag-blue" style="font-size:9px">2 Pending</span>
          </div>
        </div>
      </div>

      <div class="project-stats-grid">
        <!-- Project Completion Comparison -->
        <div class="card">
          <div class="card-header"><span class="card-title">Completion by Project</span></div>
          <div class="card-body">
            <div style="display:flex;flex-direction:column;gap:var(--space-4)">
              <div>
                <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-1)">
                  <span style="font-size:var(--text-sm)">Cell Consistency</span>
                  <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-success)">88%</span>
                </div>
                <div class="progress-bar" style="height:8px"><div class="progress-fill green" style="width:88%"></div></div>
              </div>
              <div>
                <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-1)">
                  <span style="font-size:var(--text-sm)">BMS Safety Cert</span>
                  <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-accent)">72%</span>
                </div>
                <div class="progress-bar" style="height:8px"><div class="progress-fill purple" style="width:72%"></div></div>
              </div>
              <div>
                <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-1)">
                  <span style="font-size:var(--text-sm)">Thermal Mgmt</span>
                  <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-info)">45%</span>
                </div>
                <div class="progress-bar" style="height:8px"><div class="progress-fill blue" style="width:45%"></div></div>
              </div>
              <div>
                <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-1)">
                  <span style="font-size:var(--text-sm)">FMEA Docs</span>
                  <span style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-warning)">31%</span>
                </div>
                <div class="progress-bar" style="height:8px"><div class="progress-fill orange" style="width:31%"></div></div>
              </div>
            </div>
          </div>
        </div>

        <!-- Task Distribution -->
        <div class="card">
          <div class="card-header"><span class="card-title">Task Status Distribution</span></div>
          <div class="card-body">
            <div style="display:flex;flex-direction:column;gap:var(--space-3)">
              <div style="display:flex;align-items:center;gap:var(--space-3)">
                <div style="width:12px;height:12px;border-radius:3px;background:var(--color-success)"></div>
                <span style="font-size:var(--text-sm);flex:1">Completed</span>
                <span style="font-size:var(--text-sm);font-weight:600;font-family:var(--font-mono)">8</span>
                <div class="progress-bar" style="width:100px;height:6px"><div class="progress-fill green" style="width:33%"></div></div>
              </div>
              <div style="display:flex;align-items:center;gap:var(--space-3)">
                <div style="width:12px;height:12px;border-radius:3px;background:var(--color-info)"></div>
                <span style="font-size:var(--text-sm);flex:1">In Progress</span>
                <span style="font-size:var(--text-sm);font-weight:600;font-family:var(--font-mono)">3</span>
                <div class="progress-bar" style="width:100px;height:6px"><div class="progress-fill blue" style="width:12.5%"></div></div>
              </div>
              <div style="display:flex;align-items:center;gap:var(--space-3)">
                <div style="width:12px;height:12px;border-radius:3px;background:var(--color-accent)"></div>
                <span style="font-size:var(--text-sm);flex:1">In Review</span>
                <span style="font-size:var(--text-sm);font-weight:600;font-family:var(--font-mono)">2</span>
                <div class="progress-bar" style="width:100px;height:6px"><div class="progress-fill purple" style="width:8%"></div></div>
              </div>
              <div style="display:flex;align-items:center;gap:var(--space-3)">
                <div style="width:12px;height:12px;border-radius:3px;background:var(--color-text-quaternary)"></div>
                <span style="font-size:var(--text-sm);flex:1">Backlog</span>
                <span style="font-size:var(--text-sm);font-weight:600;font-family:var(--font-mono)">4</span>
                <div class="progress-bar" style="width:100px;height:6px"><div class="progress-fill" style="width:17%;background:var(--color-text-quaternary)"></div></div>
              </div>
              <div style="display:flex;align-items:center;gap:var(--space-3)">
                <div style="width:12px;height:12px;border-radius:3px;background:var(--color-danger)"></div>
                <span style="font-size:var(--text-sm);flex:1">Overdue</span>
                <span style="font-size:var(--text-sm);font-weight:600;font-family:var(--font-mono)">1</span>
                <div class="progress-bar" style="width:100px;height:6px"><div class="progress-fill red" style="width:4%"></div></div>
              </div>
            </div>
          </div>
        </div>

        <!-- Team Workload -->
        <div class="card">
          <div class="card-header"><span class="card-title">Team Workload</span></div>
          <div class="card-body">
            <div style="display:flex;flex-direction:column;gap:var(--space-4)">
              <div style="display:flex;align-items:center;gap:var(--space-3)">
                <div class="avatar" style="width:28px;height:28px;font-size:10px">ZG</div>
                <div style="flex:1">
                  <div style="font-size:var(--text-sm);font-weight:500">Zhang Gong</div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">6 tasks · 2 projects</div>
                </div>
                <div class="progress-bar" style="width:80px;height:4px"><div class="progress-fill" style="width:85%;background:var(--color-danger)"></div></div>
                <span style="font-size:var(--text-xs);color:var(--color-danger)">Heavy</span>
              </div>
              <div style="display:flex;align-items:center;gap:var(--space-3)">
                <div class="avatar blue" style="width:28px;height:28px;font-size:10px">LG</div>
                <div style="flex:1">
                  <div style="font-size:var(--text-sm);font-weight:500">Li Gong</div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">4 tasks · 2 projects</div>
                </div>
                <div class="progress-bar" style="width:80px;height:4px"><div class="progress-fill blue" style="width:60%"></div></div>
                <span style="font-size:var(--text-xs);color:var(--color-info)">Normal</span>
              </div>
              <div style="display:flex;align-items:center;gap:var(--space-3)">
                <div class="avatar green" style="width:28px;height:28px;font-size:10px">WL</div>
                <div style="flex:1">
                  <div style="font-size:var(--text-sm);font-weight:500">Wang Lei</div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">3 tasks · 1 project</div>
                </div>
                <div class="progress-bar" style="width:80px;height:4px"><div class="progress-fill green" style="width:45%"></div></div>
                <span style="font-size:var(--text-xs);color:var(--color-success)">Light</span>
              </div>
              <div style="display:flex;align-items:center;gap:var(--space-3)">
                <div class="avatar orange" style="width:28px;height:28px;font-size:10px">CK</div>
                <div style="flex:1">
                  <div style="font-size:var(--text-sm);font-weight:500">Chen Ke</div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">3 tasks · 1 project</div>
                </div>
                <div class="progress-bar" style="width:80px;height:4px"><div class="progress-fill orange" style="width:55%"></div></div>
                <span style="font-size:var(--text-xs);color:var(--color-info)">Normal</span>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Risk Overview -->
      <div class="two-col" style="margin-top:var(--space-6)">
        <div class="card">
          <div class="card-header"><span class="card-title">Milestone Tracker</span></div>
          <div class="card-body">
            <div style="display:flex;flex-direction:column;gap:var(--space-3)">
              <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-2) var(--space-3);border-radius:var(--radius-md);background:var(--color-success-subtle)">
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="var(--color-success)" stroke-width="2"><circle cx="12" cy="12" r="10"/><polyline points="22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
                <span style="font-size:var(--text-sm);flex:1">FMEA Phase Complete</span>
                <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Dec 15</span>
              </div>
              <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-2) var(--space-3);border-radius:var(--radius-md);background:var(--color-warning-subtle)">
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="var(--color-warning)" stroke-width="2"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
                <span style="font-size:var(--text-sm);flex:1">FTA Review Gate</span>
                <span style="font-size:var(--text-xs);color:var(--color-warning)">Jan 20 (5d left)</span>
              </div>
              <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-2) var(--space-3);border-radius:var(--radius-md);border:1px solid var(--color-border)">
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="var(--color-text-quaternary)" stroke-width="2"><circle cx="12" cy="12" r="10"/></svg>
                <span style="font-size:var(--text-sm);flex:1">Safety Req Approval</span>
                <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Feb 28</span>
              </div>
              <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-2) var(--space-3);border-radius:var(--radius-md);border:1px solid var(--color-border)">
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="var(--color-text-quaternary)" stroke-width="2"><circle cx="12" cy="12" r="10"/></svg>
                <span style="font-size:var(--text-sm);flex:1">Final Certification</span>
                <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Jun 30</span>
              </div>
            </div>
          </div>
        </div>
        <div class="card">
          <div class="card-header"><span class="card-title">Resource Allocation</span></div>
          <div class="card-body">
            <div style="display:flex;flex-direction:column;gap:var(--space-4)">
              <div>
                <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-1)">
                  <span style="font-size:var(--text-sm)">PRJ-001 BMS Safety</span>
                  <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">5 members · 60%</span>
                </div>
                <div class="progress-bar" style="height:10px"><div class="progress-fill purple" style="width:60%"></div></div>
              </div>
              <div>
                <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-1)">
                  <span style="font-size:var(--text-sm)">PRJ-002 Thermal</span>
                  <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">2 members · 20%</span>
                </div>
                <div class="progress-bar" style="height:10px"><div class="progress-fill blue" style="width:20%"></div></div>
              </div>
              <div>
                <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-1)">
                  <span style="font-size:var(--text-sm)">PRJ-003 Cell</span>
                  <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">2 members · 10%</span>
                </div>
                <div class="progress-bar" style="height:10px"><div class="progress-fill green" style="width:10%"></div></div>
              </div>
              <div>
                <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-1)">
                  <span style="font-size:var(--text-sm)">PRJ-004 FMEA</span>
                  <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">1 member · 10%</span>
                </div>
                <div class="progress-bar" style="height:10px"><div class="progress-fill orange" style="width:10%"></div></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- ===== PAGE: SAFETY REVIEW ===== -->
<div id="page-safety" class="page-section">
  <div class="topbar">
    <div class="topbar-breadcrumb">
      <span>Home</span>
      <span class="breadcrumb-sep">/</span>
      <span>Safety Review</span>
    </div>
    <div class="topbar-actions">
      <div class="search-trigger"
        onclick="document.querySelector('.command-palette').classList.add('active'); document.querySelector('.command-input').focus();">
        <svg viewBox="0 0 24 24"><path d="M11 19a8 8 0 1 0 7.7-4.7l4.32 2.16a1 1 0 0 0 1.44-1.44l-2.16-4.32A8 8 0 1 0 5.28 3c0 .7-.15 1.4-.47 2.03-.66 1.31-1.23 2.6-1.72 3.92L.88 11.87C.73 12.31.7 12.75.7 13.2V15a1 1 0 0 0 .77.97L3.5 17h11.5a8 8 0 1 0 2.08-12.75z"/></svg>
        <span>Search reviews (⌘+K)</span>
        <div class="search-shortcut">
          <kbd>⌘</kbd><kbd>K</kbd>
        </div>
      </div>

      <button class="theme-toggle" onclick="toggleTheme()" title="Toggle theme">
        <svg class="icon-sun" viewBox="0 0 24 24"><circle cx="12" cy="12" r="5"/><line x1="12" y1="1" x2="12" y2="3"/><line x1="12" y1="21" x2="12" y2="23"/><line x1="4.22" y1="4.22" x2="5.64" y2="5.64"/><line x1="18.36" y1="18.36" x2="19.78" y2="19.78"/><line x1="1" y1="12" x2="3" y2="12"/><line x1="21" y1="12" x2="23" y2="12"/><line x1="4.22" y1="19.78" x2="5.64" y2="18.36"/><line x1="18.36" y1="5.64" x2="19.78" y2="4.22"/></svg>
        <svg class="icon-moon" viewBox="0 0 24 24"><path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"/></svg>
      </button>

      <div class="btn-group">
        <button class="btn btn-secondary btn-sm">
          <svg viewBox="0 0 24 24"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
          Export
        </button>
        <button class="btn btn-primary btn-sm">
          <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
          New Review
        </button>
      </div>
    </div>
  </div>

  <div class="content-area">
    <!-- Page Header -->
    <div class="page-header">
      <div class="page-header-top">
        <div>
          <h1 class="page-title">Safety Reviews</h1>
          <p class="page-subtitle">Track compliance with ISO 26262 and internal safety gates.</p>
        </div>
        <div class="view-switcher">
          <button class="view-switcher-btn active" onclick="switchSafetyView('kanban')">
            <svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg>
            Kanban
          </button>
          <button class="view-switcher-btn" onclick="switchSafetyView('gantt')">
            <svg viewBox="0 0 24 24"><line x1="2" y1="12" x2="22" y2="12"/><line x1="2" y1="6" x2="22" y2="6"/><line x1="2" y1="18" x2="22" y2="18"/></svg>
            Gantt
          </button>
          <button class="view-switcher-btn" onclick="switchSafetyView('list')">
            <svg viewBox="0 0 24 24"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
            List
          </button>
        </div>
      </div>
    </div>

    <!-- Safety View: Kanban -->
    <div class="safety-view-content active" id="safetyViewKanban">
      <div class="safety-kanban">
        <!-- Column: Pending -->
        <div class="kanban-column">
          <div class="kanban-column-header">
            <div class="safety-kanban-col-header">
              <span class="status-dot todo"></span> Pending
            </div>
          </div>
          <div class="kanban-cards">
            <div class="kanban-card">
              <div class="kanban-card-id">SR-003</div>
              <div class="kanban-card-title">FMEA documentation sign-off</div>
              <div class="kanban-card-meta">
                <div>PRJ-004 · BMS-2024</div>
                <div class="kanban-card-avatar">WL</div>
              </div>
              <div style="margin-top:var(--space-2)">
                <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Due: Apr 20</div>
                <div class="progress-bar" style="height:4px"><div class="progress-fill" style="width:65%"></div></div>
              </div>
            </div>
          </div>
        </div>

        <!-- Column: In Review -->
        <div class="kanban-column">
          <div class="kanban-column-header">
            <div class="safety-kanban-col-header">
              <span class="status-dot review"></span> In Review
            </div>
          </div>
          <div class="kanban-cards">
            <div class="kanban-card">
              <div class="kanban-card-id">SR-002</div>
              <div class="kanban-card-title">Thermal abuse test plan approval</div>
              <div class="kanban-card-meta">
                <div>PRJ-002 · THERM-03</div>
                <div class="kanban-card-avatar">CK</div>
              </div>
              <div style="margin-top:var(--space-2)">
                <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Due: Jan 18</div>
                <div class="progress-bar" style="height:4px"><div class="progress-fill blue" style="width:80%"></div></div>
              </div>
            </div>
          </div>
        </div>

        <!-- Column: Overdue -->
        <div class="kanban-column">
          <div class="kanban-column-header">
            <div class="safety-kanban-col-header">
              <span class="status-dot critical"></span> ⚠️ Overdue
            </div>
          </div>
          <div class="kanban-cards">
            <div class="kanban-card">
              <div class="kanban-card-id">SR-001</div>
              <div class="kanban-card-title">Thermal runaway risk assessment</div>
              <div class="kanban-card-meta">
                <div>PRJ-001 · BMS-2024</div>
                <div class="kanban-card-avatar">ZG</div>
              </div>
              <div style="margin-top:var(--space-2)">
                <div style="font-size:var(--text-xs);color:var(--color-danger)">Overdue by 3d</div>
                <div class="progress-bar" style="height:4px"><div class="progress-fill red" style="width:22%"></div></div>
              </div>
            </div>
          </div>
        </div>

        <!-- Column: Completed -->
        <div class="kanban-column">
          <div class="kanban-column-header">
            <div class="safety-kanban-col-header">
              <span class="status-dot done"></span> ✅ Completed
            </div>
          </div>
          <div class="kanban-cards">
            <div class="kanban-card" style="opacity:0.8;cursor:not-allowed">
              <div class="kanban-card-id">SR-000</div>
              <div class="kanban-card-title">System-level hazard analysis</div>
              <div class="kanban-card-meta">
                <div>PRJ-001 · BMS-2024</div>
                <div class="kanban-card-avatar">ZG</div>
              </div>
              <div style="margin-top:var(--space-2)">
                <div style="font-size:var(--text-xs);color:var(--color-success)">Jan 5</div>
                <div class="progress-bar" style="height:4px"><div class="progress-fill green" style="width:100%"></div></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Safety View: Gantt -->
    <div class="safety-view-content" id="safetyViewGantt">
      <div class="gantt-placeholder">
        <div class="gantt-header-row">
          <div class="gantt-header-cell">Review</div>
          <div class="gantt-header-cell">Jan</div>
          <div class="gantt-header-cell">Feb</div>
          <div class="gantt-header-cell">Mar</div>
          <div class="gantt-header-cell">Apr</div>
          <div class="gantt-header-celebration" style="flex:1"></div>
        </div>
        <div class="safety-gantt-row">
          <div class="safety-gantt-task">
            <div>Safety Review SR-001</div>
            <div style="color:var(--color-danger)">❌ Overdue</div>
          </div>
          <div class="safety-gantt-bar-area">
            <div class="safety-gantt-bar" style="left:0%;width:8%;background:var(--color-danger)"></div>
            <div style="position:absolute;left:8%;top:50%;width:16px;height:1px;background:var(--color-danger);transform:translateY(-50%)"></div>
          </div>
        </div>
        <div class="safety-gantt-row">
          <div class="safety-gantt-task">
            <div>Safety Review SR-002</div>
            <div style="color:var(--color-info)">⏳ In Progress</div>
          </div>
          <div class="safety-gantt-bar-area">
            <div class="safety-gantt-bar" style="left:4%;width:10%;background:var(--color-info)"></div>
            <div style="position:absolute;left:14%;top:50%;width:16px;height:1px;background:var(--color-info);transform:translateY(-50%)"></div>
          </div>
        </div>
        <div class="safety-gantt-row">
          <div class="safety-gantt-task">
            <div>Safety Review SR-003</div>
            <div style="color:var(--color-warning)">📅 Scheduled</div>
          </div>
          <div class="safety-gantt-bar-area">
            <div class="safety-gantt-bar" style="left:14%;width:15%;background:var(--color-warning)"></div>
          </div>
        </div>
      </div>
    </div>

    <!-- Safety View: List -->
    <div class="safety-view-content" id="safetyViewList">
      <div class="data-table-container">
        <table class="data-table">
          <thead>
            <tr>
              <th>Review ID</th>
              <th>Title</th>
              <th>Project</th>
              <th>Status</th>
              <th>Owner</th>
              <th>Due Date</th>
              <th>Progress</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td class="cell-id">SR-001</td>
              <td class="cell-primary">Thermal runaway risk assessment</td>
              <td>BMS-2024</td>
              <td><span class="tag tag-red">Overdue</span></td>
              <td>Zhang Gong</td>
              <td>Jan 15</td>
              <td>
                <div class="progress-bar" style="height:4px"><div class="progress-fill red" style="width:22%"></div></div>
              </td>
              <td>
                <div class="btn-group">
                  <button class="btn btn-sm btn-ghost">Edit</button>
                  <button class="btn btn-sm btn-primary">Submit</button>
                </div>
              </td>
            </tr>
            <tr>
              <td class="cell-id">SR-002</td>
              <td class="cell-primary">Thermal abuse test plan approval</td>
              <td>THERM-03</td>
              <td><span class="tag tag-blue">In Review</span></td>
              <td>Chen Ke</td>
              <td>Jan 18</td>
              <td>
                <div class="progress-bar" style="height:4px"><div class="progress-fill blue" style="width:80%"></div></div>
              </td>
              <td>
                <div class="btn-group">
                  <button class="btn btn-sm btn-ghost">Edit</button>
                  <button class="btn btn-sm btn-ghost">View Report</button>
                </div>
              </td>
            </tr>
            <tr>
              <td class="cell-id">SR-003</td>
              <td class="cell-primary">FMEA documentation sign-off</td>
              <td>BMS-2024</td>
              <td><span class="tag tag-default">Pending</span></td>
              <td>Wang Lei</td>
              <td>Apr 20</td>
              <td>
                <div class="progress-bar" style="height:4px"><div class="progress-fill" style="width:65%"></div></div>
              </td>
              <td>
                <div class="btn-group">
                  <button class="btn btn-sm btn-ghost">Edit</button>
                  <button class="btn btn-sm btn-ghost">Schedule</button>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<!-- ===== PAGE: PERFORMANCE ===== -->
<div id="page-performance" class="page-section">
  <div class="topbar">
    <div class="topbar-breadcrumb">
      <span>Home</span>
      <span class="breadcrumb-sep">/</span>
      <span>Performance</span>
    </div>
    <div class="topbar-actions">
      <div class="search-trigger"
        onclick="document.querySelector('.command-palette').classList.add('active'); document.querySelector('.command-input').focus();">
        <svg viewBox="0 0 24 24"><path d="M11 19a8 8 0 1 0 7.7-4.7l4.32 2.16a1 1 0 0 0 1.44-1.44l-2.16-4.32A8 8 0 1 0 5.28 3c0 .7-.15 1.4-.47 2.03-.66 1.31-1.23 2.6-1.72 3.92L.88 11.87C.73 12.31.7 12.75.7 13.2V15a1 1 0 0 0 .77.97L3.5 17h11.5a8 8 0 1 0 2.08-12.75z"/></svg>
        <span>Search (⌘+K)</span>
        <div class="search-shortcut">
          <kbd>⌘</kbd><kbd>K</kbd>
        </div>
      </div>

      <button class="theme-toggle" onclick="toggleTheme()" title="Toggle theme">
        <svg class="icon-sun" viewBox="0 0 24 24"><circle cx="12" cy="12" r="5"/><line x1="12" y1="1" x2="12" y2="3"/><line x1="12" y1="21" x2="12" y2="23"/><line x1="4.22" y1="4.22" x2="5.64" y2="5.64"/><line x1="18.36" y1="18.36" x2="19.78" y2="19.78"/><line x1="1" y1="12" x2="3" y2="12"/><line x1="21" y1="12" x2="23" y2="12"/><line x1="4.22" y1="19.78" x2="5.64" y2="18.36"/><line x1="18.36" y1="5.64" x2="19.78" y2="4.22"/></svg>
        <svg class="icon-moon" viewBox="0 0 24 24"><path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"/></svg>
      </button>

      <div class="btn-group">
        <button class="btn btn-secondary btn-sm">
          <svg viewBox="0 0 24 24"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
          Export
        </button>
        <button class="btn btn-primary btn-sm">
          <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
          New Goal
        </button>
      </div>
    </div>
  </div>

  <div class="content-area">
    <!-- Page Header -->
    <div class="page-header">
      <div class="page-header-top">
        <div>
          <h1 class="page-title">Performance & Goals</h1>
          <p class="page-subtitle">Monthly objective setting, execution tracking, and KPI scoring.</p>
        </div>
        <div class="tabs">
          <div class="tab-item active" onclick="switchPerfTab('overview')">Overview</div>
          <div class="tab-item" onclick="switchPerfTab('monthly')">Monthly Goals</div>
          <div class="tab-item" onclick="switchPerfTab('kpi')">KPI Tracking</div>
          <div class="tab-item" onclick="switchPerfTab('history')">Review History</div>
        </div>
      </div>
    </div>

    <!-- Performance Tab: Overview -->
    <div class="project-view-content active" id="perfTabOverview">
      <div class="stat-grid">
        <div class="stat-card">
          <div class="stat-label">Total Weighted Score</div>
          <div class="stat-value" style="color:var(--color-accent)">89.4</div>
          <div class="stat-change up">▲ +4.2 vs Dec</div>
        </div>
        <div class="stat-card">
          <div class="stat-label">Goal Progress</div>
          <div class="stat-value">72%</div>
          <div class="stat-change up">▲ +3% this week</div>
        </div>
        <div class="stat-card">
          <div class="stat-label">Self-Evaluation Completed</div>
          <div class="stat-value">No</div>
          <div class="stat-change down">— Due Jan 31</div>
        </div>
        <div class="stat-card">
          <div class="stat-label">Leader Review Status</div>
          <div class="stat-value">Not Started</div>
          <div class="stat-change down">— Pending self-eval</div>
        </div>
      </div>

      <div style="margin-top:var(--space-6)">
        <div class="two-col">
          <!-- Left: Upcoming Goals -->
          <div>
            <div class="card" style="margin-bottom:var(--space-4)">
              <div class="card-header">
                <span class="card-title">Upcoming Goals — January</span>
              </div>
              <div class="card-body">
                <div style="display:flex;flex-direction:column;gap:var(--space-3)">
                  <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-2) var(--space-3);border-radius:var(--radius-md);background:var(--color-surface)">
                    <div style="width:20px;height:20px;border-radius:var(--radius-sm);background:linear-gradient(135deg,var(--color-accent),#6366F1);display:flex;align-items:center;justify-content:center">
                      <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
                    </div>
                    <div style="flex:1">
                      <div style="font-weight:500">Thermal runaway simulation report</div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">BMS-2024 · 30% weight</div>
                    </div>
                    <span style="font-size:var(--text-xs);color:var(--color-danger)">Jan 18</span>
                  </div>
                  <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-2) var(--space-3);border-radius:var(--radius-md);background:var(--color-surface)">
                    <div style="width:20px;height:20px;border-radius:var(--radius-sm);background:linear-gradient(135deg,#2563EB,#3B82F6);display:flex;align-items:center;justify-content:center">
                      <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"><path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z"/></svg>
                    </div>
                    <div style="flex:1">
                      <div style="font-weight:500">Safety review document prep</div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">BMS-2024 · 20% weight</div>
                    </div>
                    <span style="font-size:var(--text-xs);color:var(--color-warning)">Jan 20</span>
                  </div>
                  <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-2) var(--space-3);border-radius:var(--radius-md);background:var(--color-surface)">
                    <div style="width:20px;height:20px;border-radius:var(--radius-sm);background:var(--color-bg-active);display:flex;align-items:center;justify-content:center">
                      <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="var(--color-text-tertiary)" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/></svg>
                    </div>
                    <div style="flex:1">
                      <div style="font-weight:500">Department meetings & tech sharing</div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Routine work · 10% weight</div>
                    </div>
                    <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Ongoing</span>
                  </div>
                </div>
              </div>
            </div>

            <!-- Quick Actions -->
            <div class="card">
              <div class="card-header">
                <span class="card-title">Quick Actions</span>
              </div>
              <div class="card-body">
                <div style="display:grid;grid-template-columns:1fr 1fr;gap:var(--space-2)">
                  <button class="btn btn-primary btn-sm" style="font-size:var(--text-sm)">
                    <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
                    Set Monthly Goals
                  </button>
                  <button class="btn btn-secondary btn-sm" style="font-size:var(--text-sm)">
                    <svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
                    Upload Deliverables
                  </button>
                  <button class="btn btn-secondary btn-sm" style="font-size:var(--text-sm)">
                    <svg viewBox="0 0 24 24"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
                    View History
                  </button>
                  <button class="btn btn-ghost btn-sm" style="font-size:var(--text-sm)">
                    <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
                    Request Feedback
                  </button>
                </div>
              </div>
            </div>
          </div>

          <!-- Right: KPI Snapshot -->
          <div>
            <div class="card">
              <div class="card-header">
                <span class="card-title">KPI Score Breakdown — Jan 2024</span>
              </div>
              <div class="card-body" style="display:flex;flex-direction:column;gap:var(--space-4)">
                <div>
                  <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                    <span style="font-size:var(--text-sm);font-weight:500">Task Completion Rate</span>
                    <span style="font-size:var(--text-sm);font-weight:600;color:var(--color-success)">95/100</span>
                  </div>
                  <div class="progress-bar" style="height:8px"><div class="progress-fill green" style="width:95%"></div></div>
                </div>
                <div>
                  <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                    <span style="font-size:var(--text-sm);font-weight:500">Work Quality</span>
                    <span style="font-size:var(--text-sm);font-weight:600;color:var(--color-info)">88/100</span>
                  </div>
                  <div class="progress-bar" style="height:8px"><div class="progress-fill blue" style="width:88%"></div></div>
                </div>
                <div>
                  <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                    <span style="font-size:var(--text-sm);font-weight:500">Timeliness</span>
                    <span style="font-size:var(--text-sm);font-weight:600;color:var(--color-accent)">90/100</span>
                  </div>
                  <div class="progress-bar" style="height:8px"><div class="progress-fill purple" style="width:90%"></div></div>
                </div>
                <div>
                  <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                    <span style="font-size:var(--text-sm);font-weight:500">Innovation (Patents + Proposals)</span>
                    <span style="font-size:var(--text-sm);font-weight:600;color:var(--color-warning)">78/100</span>
                  </div>
                  <div class="progress-bar" style="height:8px"><div class="progress-fill orange" style="width:78%"></div></div>
                </div>
                <div>
                  <div style="display:flex;justify-content:space-between;margin-bottom:var(--space-2)">
                    <span style="font-size:var(--text-sm);font-weight:500">Collaboration & Communication</span>
                    <span style="font-size:var(--text-sm);font-weight:600;color:var(--color-success)">92/100</span>
                  </div>
                  <div class="progress-bar" style="height:8px"><div class="progress-fill green" style="width:92%"></div></div>
                </div>
              </div>
            </div>

            <!-- Department Rank -->
            <div class="card" style="margin-top:var(--space-4)">
              <div class="card-header">
                <span class="card-title">Department Ranking</span>
                <span class="tag tag-default" style="font-size:10px">6 engineers</span>
              </div>
              <div class="card-body">
                <div style="display:flex;flex-direction:column;gap:var(--space-2)">
                  <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-2);border-radius:var(--radius-sm)">
                    <span style="font-size:var(--text-sm);font-weight:700;color:var(--color-warning);width:20px">🥇</span>
                    <div class="avatar blue" style="width:24px;height:24px;font-size:9px">LG</div>
                    <span style="font-size:var(--text-sm);flex:1">Li Gong</span>
                    <span style="font-size:var(--text-sm);font-weight:600;font-family:var(--font-mono)">91.2</span>
                  </div>
                  <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-2);border-radius:var(--radius-sm);background:var(--color-accent-subtle);border:1px solid rgba(139,92,246,0.15)">
                    <span style="font-size:var(--text-sm);font-weight:700;color:var(--color-text-quaternary);width:20px">🥈</span>
                    <div class="avatar" style="width:24px;height:24px;font-size:10px">ZG</div>
                    <span style="font-size:var(--text-sm);flex:1;font-weight:600;color:var(--color-accent-text)">Zhang Gong (You)</span>
                    <span style="font-size:var(--text-sm);font-weight:700;font-family:var(--font-mono);color:var(--color-accent)">89.4</span>
                  </div>
                  <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-2);border-radius:var(--radius-sm)">
                    <span style="font-size:var(--text-sm);font-weight:700;color:var(--color-text-quaternary);width:20px">🥉</span>
                    <div class="avatar orange" style="width:24px;height:24px;font-size:9px">CK</div>
                    <span style="font-size:var(--text-sm);flex:1">Chen Ke</span>
                    <span style="font-size:var(--text-sm);font-weight:600;font-family:var(--font-mono)">87.8</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Performance Tab: Monthly Goals Detail -->
    <div class="project-view-content" id="perfTabMonthly">
      <!-- Monthly Selector -->
      <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-6)">
        <div style="display:flex;align-items:center;gap:var(--space-3)">
          <button class="btn btn-ghost btn-sm">
            <svg viewBox="0 0 24 24" style="width:14px;height:14px"><polyline points="15 18 9 12 15 6"/></svg>
          </button>
          <span style="font-size:var(--text-xl);font-weight:700">January 2024</span>
          <button class="btn btn-ghost btn-sm">
            <svg viewBox="0 0 24 24" style="width:14px;height:14px"><polyline points="9 18 15 12 9 6"/></svg>
          </button>
          <span class="tag tag-blue">Current Month</span>
        </div>
        <div class="btn-group">
          <button class="btn btn-secondary btn-sm">Copy from Last Month</button>
          <button class="btn btn-primary btn-sm">Submit for Approval</button>
        </div>
      </div>

      <!-- Approval Flow -->
      <div class="card" style="margin-bottom:var(--space-6)">
        <div class="card-body" style="padding:var(--space-4) var(--space-6)">
          <div class="perf-approval-flow" style="justify-content:center">
            <div class="perf-approval-step">
              <div class="perf-approval-icon done">
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"/></svg>
              </div>
              <span style="color:var(--color-success)">Self Draft</span>
            </div>
            <div class="perf-approval-connector done"></div>
            <div class="perf-approval-step">
              <div class="perf-approval-icon done">
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"/></svg>
              </div>
              <span style="color:var(--color-success)">Leader Review</span>
            </div>
            <div class="perf-approval-connector done"></div>
            <div class="perf-approval-step">
              <div class="perf-approval-icon current">
                <span style="font-size:10px;font-weight:700">3</span>
              </div>
              <span style="color:var(--color-accent);font-weight:600">Execution</span>
            </div>
            <div class="perf-approval-connector"></div>
            <div class="perf-approval-step">
              <div class="perf-approval-icon pending">
                <span style="font-size:10px;font-weight:700">4</span>
              </div>
              <span style="color:var(--color-text-quaternary)">Self Evaluation</span>
            </div>
            <div class="perf-approval-connector"></div>
            <div class="perf-approval-step">
              <div class="perf-approval-icon pending">
                <span style="font-size:10px;font-weight:700">5</span>
              </div>
              <span style="color:var(--color-text-quaternary)">Leader Score</span>
            </div>
            <div class="perf-approval-connector"></div>
            <div class="perf-approval-step">
              <div class="perf-approval-icon pending">
                <span style="font-size:10px;font-weight:700">6</span>
              </div>
              <span style="color:var(--color-text-quaternary)">Final Archive</span>
            </div>
          </div>
        </div>
      </div>

      <div class="two-col">
        <!-- Left: Goal Details -->
        <div>
          <!-- Project Group 1 -->
          <div style="margin-bottom:var(--space-5)">
            <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-3)">
              <div style="display:flex;align-items:center;gap:var(--space-2)">
                <div style="width:20px;height:20px;border-radius:var(--radius-sm);background:linear-gradient(135deg,var(--color-accent),#6366F1);display:flex;align-items:center;justify-content:center">
                  <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
                </div>
                <span style="font-size:var(--text-sm);font-weight:600">BMS-2024 Project Tasks</span>
              </div>
              <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Subtotal Weight: 50%</span>
            </div>

            <div class="perf-goal-row">
              <div>
                <div style="font-weight:500">Thermal runaway simulation report</div>
                <div class="perf-goal-project-tag">Output: Simulation report document + test data</div>
              </div>
              <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">30%</div>
              <div style="font-size:var(--text-xs);color:var(--color-danger)">Jan 18</div>
              <div class="progress-bar" style="height:4px"><div class="progress-fill purple" style="width:65%"></div></div>
              <span style="font-size:var(--text-xs);font-family:var(--font-mono);text-align:right">65%</span>
            </div>

            <div class="perf-goal-row">
              <div>
                <div style="font-weight:500">Safety review document preparation</div>
                <div class="perf-goal-project-tag">Output: FMEA checklist + safety req document</div>
              </div>
              <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">20%</div>
              <div style="font-size:var(--text-xs);color:var(--color-warning)">Jan 20</div>
              <div class="progress-bar" style="height:4px"><div class="progress-fill blue" style="width:40%"></div></div>
              <span style="font-size:var(--text-xs);font-family:var(--font-mono);text-align:right">40%</span>
            </div>
          </div>

          <!-- Project Group 2 -->
          <div style="margin-bottom:var(--space-5)">
            <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-3)">
              <div style="display:flex;align-items:center;gap:var(--space-2)">
                <div style="width:20px;height:20px;border-radius:var(--radius-sm);background:linear-gradient(135deg,#2563EB,#3B82F6);display:flex;align-items:center;justify-content:center">
                  <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"><path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z"/></svg>
                </div>
                <span style="font-size:var(--text-sm);font-weight:600">THERM-03 Project Tasks</span>
              </div>
              <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Subtotal Weight: 40%</span>
            </div>

            <div class="perf-goal-row">
              <div>
                <div style="font-weight:500">Thermal diffusion test plan</div>
                <div class="perf-goal-project-tag">Output: Test plan document</div>
              </div>
              <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">40%</div>
              <div style="font-size:var(--text-xs)">Jan 28</div>
              <div class="progress-bar" style="height:4px"><div class="progress-fill orange" style="width:20%"></div></div>
              <span style="font-size:var(--text-xs);font-family:var(--font-mono);text-align:right">20%</span>
            </div>
          </div>

          <!-- Non-project Work -->
          <div style="margin-bottom:var(--space-5)">
            <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-3)">
              <div style="display:flex;align-items:center;gap:var(--space-2)">
                <div style="width:20px;height:20px;border-radius:var(--radius-sm);background:var(--color-bg-active);display:flex;align-items:center;justify-content:center">
                  <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="var(--color-text-tertiary)" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/></svg>
                </div>
                <span style="font-size:var(--text-sm);font-weight:600">Routine Work (Non-project)</span>
              </div>
              <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Subtotal Weight: 10%</span>
            </div>

            <div class="perf-goal-row">
              <div>
                <div style="font-weight:500">Department meetings & tech sharing</div>
                <div class="perf-goal-project-tag">No specific deliverable required</div>
              </div>
              <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">10%</div>
              <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Ongoing</div>
              <div class="progress-bar" style="height:4px"><div class="progress-fill green" style="width:100%"></div></div>
              <span style="font-size:var(--text-xs);font-family:var(--font-mono);text-align:right;color:var(--color-success)">100%</span>
            </div>
          </div>

          <!-- Total Weight Check -->
          <div style="display:flex;align-items:center;justify-content:space-between;padding:var(--space-3) var(--space-4);background:var(--color-surface);border:1px solid var(--color-border);border-radius:var(--radius-md)">
            <span style="font-size:var(--text-sm);font-weight:600">Total Weight</span>
            <div style="display:flex;align-items:center;gap:var(--space-2)">
              <span style="font-size:var(--text-lg);font-weight:700;font-family:var(--font-mono)">100%</span>
              <span class="tag tag-green" style="font-size:9px">✓ Valid</span>
            </div>
          </div>

          <!-- System Suggestion -->
          <div style="margin-top:var(--space-3);padding:var(--space-3) var(--space-4);background:var(--color-accent-subtle);border:1px solid rgba(139,92,246,0.15);border-radius:var(--radius-md);display:flex;align-items:center;gap:var(--space-3)">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="var(--color-accent)" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
            <span style="font-size:var(--text-xs);color:var(--color-accent-text)"><strong>AI Suggestion:</strong> Based on project phase, consider adding "Safety Requirements Document Review" task (recommended weight: 15%, adjust from THERM-03).</span>
          </div>
        </div>

        <!-- Right: Output Deliverables & Scoring -->
        <div>
          <!-- Output Deliverables -->
          <div class="card" style="margin-bottom:var(--space-4)">
            <div class="card-header">
              <span class="card-title">Output Deliverables</span>
              <button class="btn btn-ghost btn-sm">Upload</button>
            </div>
            <div class="card-body">
              <div style="display:flex;flex-direction:column;gap:var(--space-2)">
                <div class="perf-output-item">
                  <svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
                  <div style="flex:1">
                    <div style="font-weight:500">Thermal_Simulation_Report_v0.3.pdf</div>
                    <div style="color:var(--color-text-quaternary);margin-top:1px">Uploaded Jan 12 · 2.4 MB · Draft</div>
                  </div>
                  <span class="tag tag-orange" style="font-size:9px">Draft</span>
                </div>
                <div class="perf-output-item">
                  <svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
                  <div style="flex:1">
                    <div style="font-weight:500">FMEA_Checklist_BMS2024.xlsx</div>
                    <div style="color:var(--color-text-quaternary);margin-top:1px">Uploaded Jan 10 · 856 KB · Under Review</div>
                  </div>
                  <span class="tag tag-blue" style="font-size:9px">Review</span>
                </div>
                <div class="perf-output-item" style="border-style:dashed;justify-content:center;color:var(--color-text-quaternary)">
                  <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
                  Upload deliverable
                </div>
              </div>
            </div>
          </div>

          <!-- Self Evaluation -->
          <div class="card" style="margin-bottom:var(--space-4)">
            <div class="card-header">
              <span class="card-title">Self Evaluation</span>
              <span class="tag tag-default" style="font-size:10px">Not Yet</span>
            </div>
            <div class="card-body">
              <div style="display:flex;flex-direction:column;gap:var(--space-3)">
                <div style="display:grid;grid-template-columns:1fr 60px 60px;gap:var(--space-2);font-size:var(--text-xs);color:var(--color-text-quaternary);font-weight:600;padding:0 var(--space-2)">
                  <span>Goal Item</span>
                  <span style="text-align:center">Self</span>
                  <span style="text-align:center">Leader</span>
                </div>
                <div style="display:grid;grid-template-columns:1fr 60px 60px;gap:var(--space-2);align-items:center;padding:var(--space-2);background:var(--color-surface);border-radius:var(--radius-sm);font-size:var(--text-sm)">
                  <span>Thermal runaway sim report</span>
                  <input type="number" class="form-input" style="padding:4px 6px;text-align:center;font-size:var(--text-xs);height:28px" placeholder="--" disabled>
                  <input type="number" class="form-input" style="padding:4px 6px;text-align:center;font-size:var(--text-xs);height:28px;opacity:0.4" placeholder="--" disabled>
                </div>
                <div style="display:grid;grid-template-columns:1fr 60px 60px;gap:var(--space-2);align-items:center;padding:var(--space-2);background:var(--color-surface);border-radius:var(--radius-sm);font-size:var(--text-sm)">
                  <span>Safety review docs</span>
                  <input type="number" class="form-input" style="padding:4px 6px;text-align:center;font-size:var(--text-xs);height:28px" placeholder="--" disabled>
                  <input type="number" class="form-input" style="padding:4px 6px;text-align:center;font-size:var(--text-xs);height:28px;opacity:0.4" placeholder="--" disabled>
                </div>
                <div style="display:grid;grid-template-columns:1fr 60px 60px;gap:var(--space-2);align-items:center;padding:var(--space-2);background:var(--color-surface);border-radius:var(--radius-sm);font-size:var(--text-sm)">
                  <span>Thermal diffusion test plan</span>
                  <input type="number" class="form-input" style="padding:4px 6px;text-align:center;font-size:var(--text-xs);height:28px" placeholder="--" disabled>
                  <input type="number" class="form-input" style="padding:4px 6px;text-align:center;font-size:var(--text-xs);height:28px;opacity:0.4" placeholder="--" disabled>
                </div>
                <div style="display:grid;grid-template-columns:1fr 60px 60px;gap:var(--space-2);align-items:center;padding:var(--space-2);background:var(--color-surface);border-radius:var(--radius-sm);font-size:var(--text-sm)">
                  <span>Routine work</span>
                  <input type="number" class="form-input" style="padding:4px 6px;text-align:center;font-size:var(--text-xs);height:28px" placeholder="--" disabled>
                  <input type="number" class="form-input" style="padding:4px 6px;text-align:center;font-size:var(--text-xs);height:28px;opacity:0.4" placeholder="--" disabled>
                </div>
              </div>
              <div style="margin-top:var(--space-4);padding-top:var(--space-3);border-top:1px solid var(--color-border)">
                <label class="form-label" style="font-size:var(--text-xs)">Self Evaluation Comments</label>
                <textarea class="form-input" rows="3" style="resize:vertical;font-size:var(--text-sm)" placeholder="Write your self evaluation here... (available after month-end)" disabled></textarea>
              </div>
            </div>
          </div>

          <!-- Leader Feedback -->
          <div class="card">
            <div class="card-header">
              <span class="card-title">Leader Feedback</span>
              <span class="tag tag-default" style="font-size:10px">Pending</span>
            </div>
            <div class="card-body">
              <div style="text-align:center;padding:var(--space-6);color:var(--color-text-quaternary)">
                <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" style="margin:0 auto var(--space-3)"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
                <div style="font-size:var(--text-sm)">Leader evaluation will be available after self-evaluation is submitted.</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Performance Tab: KPI Tracking -->
    <div class="project-view-content" id="perfTabKpi">
      <div class="two-col">
        <!-- Left: KPI Dimensions -->
        <div class="card">
          <div class="card-header">
            <span class="card-title">KPI Dimensions — January 2024</span>
          </div>
          <div class="card-body">
            <div style="display:flex;flex-direction:column;gap:var(--space-5)">
              <div>
                <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-2)">
                  <span style="font-size:var(--text-sm);font-weight:500">Task Completion Rate</span>
                  <span style="font-size:var(--text-sm);font-weight:600;color:var(--color-success)">95/100</span>
                </div>
                <div class="progress-bar" style="height:8px"><div class="progress-fill green" style="width:95%"></div></div>
                <div style="display:flex;justify-content:space-between;margin-top:var(--space-1)">
                  <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Weight: 30% → Weighted: 28.5</span>
                  <span style="font-size:var(--text-xs);color:var(--color-success)">▲ +3 vs last month</span>
                </div>
              </div>
              <div>
                <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-2)">
                  <span style="font-size:var(--text-sm);font-weight:500">Work Quality</span>
                  <span style="font-size:var(--text-sm);font-weight:600;color:var(--color-info)">88/100</span>
                </div>
                <div class="progress-bar" style="height:8px"><div class="progress-fill blue" style="width:88%"></div></div>
                <div style="display:flex;justify-content:space-between;margin-top:var(--space-1)">
                  <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Weight: 25% → Weighted: 22.0</span>
                  <span style="font-size:var(--text-xs);color:var(--color-success)">▲ +2 vs last month</span>
                </div>
              </div>
              <div>
                <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-2)">
                  <span style="font-size:var(--text-sm);font-weight:500">Timeliness</span>
                  <span style="font-size:var(--text-sm);font-weight:600;color:var(--color-accent)">90/100</span>
                </div>
                <div class="progress-bar" style="height:8px"><div class="progress-fill purple" style="width:90%"></div></div>
                <div style="display:flex;justify-content:space-between;margin-top:var(--space-1)">
                  <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Weight: 20% → Weighted: 18.0</span>
                  <span style="font-size:var(--text-xs)">— same</span>
                </div>
              </div>
              <div>
                <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-2)">
                  <span style="font-size:var(--text-sm);font-weight:500">Innovation (Patents + Proposals)</span>
                  <span style="font-size:var(--text-sm);font-weight:600;color:var(--color-warning)">78/100</span>
                </div>
                <div class="progress-bar" style="height:8px"><div class="progress-fill orange" style="width:78%"></div></div>
                <div style="display:flex;justify-content:space-between;margin-top:var(--space-1)">
                  <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Weight: 15% → Weighted: 11.7</span>
                  <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Weight: 15% → Weighted: 11.7</span>
                <span style="font-size:var(--text-xs);color:var(--color-warning)">▼ -3 vs last month</span>
              </div>
              <div>
                <div style="display:flex;align-items:center;justify-content:space-between;margin-bottom:var(--space-2)">
                  <span style="font-size:var(--text-sm);font-weight:500">Collaboration & Communication</span>
                  <span style="font-size:var(--text-sm);font-weight:600;color:var(--color-success)">92/100</span>
                </div>
                <div class="progress-bar" style="height:8px"><div class="progress-fill green" style="width:92%"></div></div>
                <div style="display:flex;justify-content:space-between;margin-top:var(--space-1)">
                  <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Weight: 10% → Weighted: 9.2</span>
                  <span style="font-size:var(--text-xs);color:var(--color-success)">▲ +1 vs last month</span>
                </div>
              </div>
            </div>
          </div>

          <!-- Progress Heatmap -->
          <div class="card" style="margin-top:var(--space-4)">
            <div class="card-header">
              <span class="card-title">Weekly Progress Heatmap — Jan 2024</span>
            </div>
            <div class="card-body" style="padding:0">
              <div style="display:grid;grid-template-columns:repeat(7,1fr);gap:1px;background:var(--color-border);padding:var(--space-3)">
                <div class="heatmap-cell level-3"></div><div class="heatmap-cell level-2"></div><div class="heatmap-cell level-1"></div>
                <div class="heatmap-cell level-3"></div><div class="heatmap-cell level-4"></div><div class="heatmap-cell level-4"></div>
                <div class="heatmap-cell level-3"></div><div class="heatmap-cell level-2"></div>
                <div class="heatmap-cell level-2"></div><div class="heatmap-cell level-2"></div><div class="heatmap-cell level-1"></div>
                <div class="heatmap-cell level-3"></div><div class="heatmap-cell level-4"></div><div class="heatmap-cell level-4"></div>
                <div class="heatmap-cell level-3"></div><div class="heatmap-cell level-2"></div>
                <div class="heatmap-cell level-1"></div><div class="heatmap-cell level-2"></div><div class="heatmap-cell level-3"></div>
                <div class="heatmap-cell level-4"></div><div class="heatmap-cell level-4"></div><div class="heatmap-cell level-3"></div>
                <div class="heatmap-cell level-2"></div><div class="heatmap-cell level-2"></div>
              </div>
              <div style="display:flex;gap:var(--space-2);margin-top:var(--space-2);font-size:var(--text-xs);color:var(--color-text-quaternary)">
                <span>Mon</span><span>Tue</span><span>Wed</span><span>Thu</span><span>Fri</span><span>Sat</span><span>Sun</span>
              </div>
            </div>
          </div>
        </div>

        <!-- Right: Trend Chart -->
        <div class="card">
          <div class="card-header">
            <span class="card-title">KPI Trend (Last 6 Months)</span>
          </div>
          <div class="card-body">
            <div style="height:200px;display:flex;flex-direction:column;justify-content:space-between;position:relative">
              <!-- Y-axis labels -->
              <div style="display:flex;flex-direction:column;gap:var(--space-4);">
                <span style="font-size:var(--text-xs);width:24px;text-align:right;color:var(--color-text-quaternary)">95</span>
                <span style="font-size:var(--text-xs);width:24px;text-align:right;color:var(--color-text-quaternary)">90</span>
                <span style="font-size:var(--text-xs);width:24px;text-align:right;color:var(--color-text-quaternary)">85</span>
                <span style="font-size:var(--text-xs);width:24px;text-align:right;color:var(--color-text-quaternary)">80</span>
                <span style="font-size:var(--text-xs);width:24px;text-align:right;color:var(--color-text-quaternary)">75</span>
              </div>
              <div style="flex:1;position:relative">
                <!-- Grid lines -->
                <div style="position:absolute;width:100%;top:0;height:100%;border-left:1px solid var(--color-border);opacity:0.5"></div>
                <!-- Data line -->
                <svg width="100%" height="100%" viewBox="0 0 100 100" preserveAspectRatio="none">
                  <polyline fill="none" stroke="var(--color-accent)" stroke-width="2" points="0,15 14,18 28,22 42,28 56,25 70,19 84,17 100,20"/>
                  <!-- Data points -->
                  <circle cx="0" cy="15" r="3" fill="var(--color-accent)"/>
                  <circle cx="14" cy="18" r="3" fill="var(--color-accent)"/>
                  <circle cx="28" cy="22" r="3" fill="var(--color-accent)"/>
                  <circle cx="42" cy="28" r="3" fill="var(--color-danger)"/>
                  <circle cx="56" cy="25" r="3" fill="var(--color-orange)"/>
                  <circle cx="70" cy="19" r="3" fill="var(--color-blue)"/>
                  <circle cx="84" cy="17" r="3" fill="var(--color-green)"/>
                  <circle cx="100" cy="20" r="3" fill="var(--color-accent)"/>
                </svg>
                <!-- X-axis labels -->
                <div style="position:absolute;left:0;bottom:-24px;width:100%;display:flex;justify-content:space-between;font-size:var(--text-xs);color:var(--color-text-quaternary)">
                  <span>Jul</span><span>Aug</span><span>Sep</span><span>Oct</span><span>Nov</span><span>Dec</span><span>Jan</span>
                </div>
              </div>
            </div>
            <div style="margin-top:var(--space-4);display:flex;justify-content:space-between">
              <div style="display:flex;align-items:center;gap:var(--space-2)">
                <div style="width:12px;height:12px;border-radius:2px;background:var(--color-accent)"></div>
                <span style="font-size:var(--text-xs)">Score</span>
              </div>
              <div style="display:flex;align-items:center;gap:var(--space-2)">
                <div style="width:12px;height:12px;border-radius:2px;background:var(--color-success)"></div>
                <span style="font-size:var(--text-xs)">Goal: 90+</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Performance Tab: History -->
    <div class="project-view-content" id="perfTabHistory">
      <div class="data-table-container">
        <table class="data-table">
          <thead>
            <tr>
              <th>Period</th>
              <th>Final Score</th>
              <th>Self Eval</th>
              <th>Leader Eval</th>
              <th>Key Achievements</th>
              <th>Status</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Dec 2023</td>
              <td style="font-weight:600;font-family:var(--font-mono)">85.2</td>
              <td>84</td>
              <td>87</td>
              <td>✅ BMS FMEA final sign-off<br>✅ Thermal test plan approved</td>
              <td><span class="tag tag-green">Closed</span></td>
            </tr>
            <tr>
              <td>Nov 2023</td>
              <td style="font-weight:600;font-family:var(--font-mono)">82.6</td>
              <td>81</td>
              <td>84</td>
              <td>✅ Hazard analysis v2.1 released<br>⚠️ Delivered late (1d)</td>
              <td><span class="tag tag-green">Closed</span></td>
            </tr>
            <tr>
              <td>Oct 2023</td>
              <td style="font-weight:600;font-family:var(--font-mono)">79.4</td>
              <td>78</td>
              <td>81</td>
              <td>✅ Cell aging study complete<br>⚠️ Test rig delay impacted timeline</td>
              <td><span class="tag tag-green">Closed</span></td>
            </tr>
            <tr>
              <td>Sep 2023</td>
              <td style="font-weight:600;font-family:var(--font-mono)">86.1</td>
              <td>85</td>
              <td>88</td>
              <td>✅ Patent application filed (CN202310XXX)<br>✅ ISO 26262 internal training</td>
              <td><span class="tag tag-green">Closed</span></td>
            </tr>
            <tr>
              <td>Aug 2023</td>
              <td style="font-weight:600;font-family:var(--font-mono)">88.3</td>
              <td>88</td>
              <td>89</td>
              <td>✅ BMS hardware prototype validated<br>✅ 100% on-time delivery</td>
              <td><span class="tag tag-green">Closed</span></td>
            </tr>
          </tbody>
        </table>
      </div>

      <div style="margin-top:var(--space-6)">
        <div class="card">
          <div class="card-header">
            <span class="card-title">Yearly Summary — 2023</span>
          </div>
          <div class="card-body">
            <div style="display:grid;grid-template-columns:1fr 1fr;gap:var(--space-4)">
              <div>
                <h3 style="font-size:var(--text-md);font-weight:600;margin-bottom:var(--space-2)">Achievements</h3>
                <ul style="list-style:none;padding-left:0;font-size:var(--text-sm);color:var(--color-text-tertiary);line-height:1.6">
                  <li>• Filed 3 patents (BMS architecture, thermal modeling, cell balancing)</li>
                  <li>• Led FMEA for BMS-2024 (completed ahead of schedule)</li>
                  <li>• Trained 8 junior engineers on safety analysis methods</li>
                  <li>• Reduced simulation turnaround time by 35%</li>
                </ul>
              </div>
              <div>
                <h3 style="font-size:var(--text-md);font-weight:600;margin-bottom:var(--space-2)">Areas for Improvement</h3>
                <ul style="list-style:none;padding-left:0;font-size:var(--text-sm);color:var(--color-text-tertiary);line-height:1.6">
                  <li>• Improve cross-team coordination for hardware-software integration</li>
                  <li>• Increase innovation output (target: 2+ patents/qtr)</li>
                  <li>• Reduce technical debt in legacy simulation scripts</li>
                </ul>
              </2>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- ===== PAGE: PATENT ===== -->
<div id="page-patent" class="page-section">
  <div class="topbar">
    <div class="topbar-breadcrumb">
      <span>Home</span>
      <span class="breadcrumb-sep">/</span>
      <span>Patents & IP</span>
    </div>
    <div class="topbar-actions">
      <div class="search-trigger"
        onclick="document.querySelector('.command-palette').classList.add('active'); document.querySelector('.command-input').focus();">
        <svg viewBox="0 0 24 24"><path d="M11 19a8 8 0 1 0 7.7-4.7l4.32 2.16a1 1 0 0 0 1.44-1.44l-2.16-4.32A8 8 0 1 0 5.28 3c0 .7-.15 1.4-.47 2.03-.66 1.31-1.23 2.6-1.72 3.92L.88 11.87C.73 12.31.7 12.75.7 13.2V15a1 1 0 0 0 .77.97L3.5 17h11.5a8 8 0 1 0 2.08-12.75z"/></svg>
        <span>Search patents (⌘+K)</span>
        <div class="search-shortcut">
          <kbd>⌘</kbd><kbd>K</kbd>
        </div>
      </div>

      <button class="theme-toggle" onclick="toggleTheme()" title="Toggle theme">
        <svg class="icon-sun" viewBox="0 0 24 24"><circle cx="12" cy="12" r="5"/><line x1="12" y1="1" x2="12" y2="3"/><line x1="12" y1="21" x2="12" y2="23"/><line x1="4.22" y1="4.22" x2="5.64" y2="5.64"/><line x1="18.36" y1="18.36" x2="19.78" y2="19.78"/><line x1="1" y1="12" x2="3" y2="12"/><line x1="21" y1="12" x2="23" y2="12"/><line x1="4.22" y1="19.78" x2="5.64" y2="18.36"/><line x1="18.36" y1="5.64" x2="19.78" y2="4.22"/></svg>
        <svg class="icon-moon" viewBox="0 0 24 24"><path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"/></svg>
      </button>

      <div class="btn-group">
        <button class="btn btn-secondary btn-sm">
          <svg viewBox="0 0 24 24"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
          Export
        </button>
        <button class="btn btn-primary btn-sm">
          <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
          New Invention
        </button>
      </div>
    </div>
  </div>

  <div class="content-area">
    <div class="page-header">
      <div class="page-header-top">
        <div>
          <h1 class="page-title">Patents & IP Management</h1>
          <p class="page-subtitle">Track invention disclosures, filings, and approvals across jurisdictions.</p>
        </div>
        <div class="view-switcher">
          <button class="view-switcher-btn active" onclick="switchPatentView('cards')">
            <svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg>
            Cards
          </button>
          <button class="view-switcher-btn" onclick="switchPatentView('timeline')">
            <svg viewBox="0 0 24 24"><path d="M22 12C22 6.48 17.52 2 12 2S2 6.48 2 12s4.52 10 10 10 10-4.52 10-10z"/><path d="M12 4v8l3 3V9"/></svg>
            Timeline
          </button>
          <button class="view-switcher-btn" onclick="switchPatentView('table')">
            <svg viewBox="0 0 24 24"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
            Table
          </button>
        </div>
      </div>
    </div>

    <!-- Patent View: Cards -->
    <div class="project-view-content active" id="patentViewCards">
      <div class="three-col">
        <!-- Patent Card 1 -->
        <div class="card" style="cursor:pointer">
          <div class="card-body" style="padding:var(--space-4)">
            <div style="display:flex;align-items:center;gap:var(--space-2);margin-bottom:var(--space-3)">
              <div style="width:28px;height:28px;border-radius:var(--radius-md);background:linear-gradient(135deg,#059669,#22C55E);display:flex;align-items:center;justify-content:center">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
              </div>
              <div>
                <div style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">CN202310XXXXX</div>
                <div style="font-size:var(--text-md);font-weight:600">BMS Thermal Runaway Prediction System</div>
              </div>
            </div>
            <p style="font-size:var(--text-sm);color:var(--color-text-tertiary);margin-bottom:var(--space-3)">Method and system for real-time thermal runaway risk prediction using multi-physics simulation and ML.</p>
            <div style="display:flex;align-items:center;gap:var(--space-2);margin-bottom:var(--space-2)">
              <span class="tag tag-green">Filed</span>
              <span class="tag tag-blue">CN</span>
              <span class="tag tag-default">2023-07-15</span>
            </div>
            <div style="display:flex;align-items:center;gap:var(--space-2)">
              <div class="avatar-group"><div class="avatar">ZG</div><div class="avatar blue">LG</div><div class="avatar orange">CK</div></div>
              <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Inventors: 3</span>
            </div>
          </div>
        </div>

        <!-- Patent Card 2 -->
        <div class="card" style="cursor:pointer">
          <div class="card-body" style="padding:var(--space-4)">
            <div style="display:flex;align-items:center;gap:var(--space-2);margin-bottom:var(--space-3)">
              <div style="width:28px;height:28px;border-radius:var(--radius-md);background:linear-gradient(135deg,#7C3AED,#6366F1);display:flex;align-items:center;justify-content:center">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
              </div>
              <div>
                <div style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">US20241234567</div>
                <div style="font-size:var(--text-md);font-weight:600">Cell Balancing Circuit with Adaptive Threshold</div>
              </div>
            </div>
            <p style="font-size:var(--text-sm);color:var(--color-text-tertiary);margin-bottom:var(--space-3)">Adaptive current-threshold control for passive cell balancing to extend pack life.</p>
            <div style="display:flex;align-items:center;gap:var(--space-2);margin-bottom:var(--space-2)">
              <span class="tag tag-purple">Published</span>
              <span class="tag tag-default">US</span>
              <span class="tag tag-default">2024-01-05</span>
            </div>
            <div style="display:flex;align-items:center;gap:var(--space-2)">
              <div class="avatar-group"><div class="avatar">WL</div><div class="avatar green">ZG</div></div>
              <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Inventors: 2</span>
            </div>
          </div>
        </div>

        <!-- Patent Card 3 -->
        <div class="card" style="cursor:pointer">
          <div class="card-body" style="padding:var(--space-4)">
            <div style="display:flex;align-items:center;gap:var(--space-2);margin-bottom:var(--space-3)">
              <div style="width:28px;height:28px;border-radius:var(--radius-md);background:linear-gradient(135deg,#2563EB,#3B82F6);display:flex;align-items:center;justify-content:center">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
              </div>
              <div>
                <div style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">EP202387654</div>
                <div style="font-size:var(--text-md);font-weight:600">Safety Monitoring Architecture for EV Battery Packs</div>
              </div>
            </div>
            <p style="font-size:var(--text-sm);color:var(--color-text-tertiary);margin-bottom:var(--space-3)">Modular safety monitoring architecture integrating hardware redundancy and software diagnostics.</p>
            <div style="display:flex;align-items:center;gap:var(--space-2);margin-bottom:var(--space-2)">
              <span class="tag tag-orange">Pending Review</span>
              <span class="tag tag-default">EP</span>
              <span class="tag tag-default">2024-02-10</span>
            </div>
            <div style="display:flex;align-items:center;gap:var(--space-2)">
              <div class="avatar-group"><div class="avatar">ZG</div><div class="avatar pink">HL</div></div>
              <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Inventors: 2</span>
            </div>
          </div>
        </div>

        <!-- Patent Card 4 -->
        <div class="card" style="cursor:pointer">
          <div class="card-body" style="padding:var(--space-4)">
            <div style="display:flex;align-items:center;gap:var(--space-2);margin-bottom:var(--space-3)">
              <div style="width:28px;height:28px;border-radius:var(--radius-md);background:var(--color-bg-active);display:flex;align-items:center;justify-content:center">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="var(--color-text-tertiary)" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
              </div>
              <div>
                <div style="font-size:var(--text-xs);font-family:var(--font-mono);color:var(--color-text-quaternary)">CN202410XXXXX</div>
                <div style="font-size:var(--text-md);font-weight:600">Thermal Diffusion Simulation Method</div>
              </div>
            </div>
            <p style="font-size:var(--text-sm);color:var(--color-text-tertiary);margin-bottom:var(--space-3)">High-fidelity thermal diffusion simulation method using adaptive mesh refinement.</p>
            <div style="display:flex;align-items:center;gap:var(--space-2);margin-bottom:var(--space-2)">
              <span class="tag tag-blue">Disclosure</span>
              <span class="tag tag-default">CN</span>
              <span class="tag tag-default">2024-01-12</span>
            </div>
            <div style="display:flex;align-items:center;gap:var(--space-2)">
              <div class="avatar-group"><div class="avatar">CK</div></div>
              <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Inventor: 1</span>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Patent View: Timeline -->
    <div class="project-view-content" id="patentViewTimeline">
      <div class="card">
        <div class="card-header">
          <span class="card-title">Patent Timeline — 2023–2024</span>
        </div>
        <div class="card-body">
          <div style="position:relative;padding-left:80px">
            <!-- Vertical timeline line -->
            <div style="position:absolute;left:40px;top:0;bottom:0;width:2px;background:var(--color-border);z-index:0"></div>

            <!-- Entry 1 -->
            <div style="margin-bottom:var(--space-5);position:relative">
              <div style="position:absolute;left:-80px;width:60px;text-align:right;color:var(--color-text-quaternary);font-size:var(--text-xs)">2023-07</div>
              <div style="position:absolute;left:24px;width:12px;height:12px;border-radius:50%;background:var(--color-success);border:3px solid var(--color-bg-elevated);z-index:1"></div>
              <div style="margin-left:60px">
                <h4 style="font-size:var(--text-sm);font-weight:600">CN202310XXXXX Filed</h4>
                <p style="font-size:var(--text-xs);color:var(--color-text-tertiary);margin:4px 0">BMS Thermal Runaway Prediction System</p>
                <div style="display:flex;gap:var(--space-2)">
                  <span class="tag tag-green">Filed</span>
                  <span class="tag tag-blue">CN</span>
                </div>
              </div>
            </div>

            <!-- Entry 2 -->
            <div style="margin-bottom:var(--space-5);position:relative">
              <div style="position:absolute;left:-80px;width:60px;text-align:right;color:var(--color-text-quaternary);font-size:var(--text-xs)">2023-10</div>
              <div style="position:absolute;left:24px;width:12px;height:12px;border-radius:50%;background:var(--color-info);border:3px solid var(--color-bg-elevated);z-index:1"></div>
              <div style="margin-left:60px">
                <h4 style="font-size:var(--text-sm);font-weight:600">US20231234567 Disclosed</h4>
                <p style="font-size:var(--text-xs);color:var(--color-text-tertiary);margin:4px 0">Cell Balancing Circuit</p>
                <div style="display:flex;gap:var(--space-2)">
                  <span class="tag tag-purple">Disclosed</span>
                  <span class="tag tag-default">US</span>
                </div>
              </div>
            </div>

            <!-- Entry 3 -->
            <div style="margin-bottom:var(--space-5);position:relative">
              <div style="position:absolute;left:-80px;width:60px;text-align:right;color:var(--color-text-quaternary);font-size:var(--text-xs)">2023-12</div>
              <div style="position:absolute;left:24px;width:12px;height:12px;border-radius:50%;background:var(--color-accent);border:3px solid var(--color-bg-elevated);z-index:1"></div>
              <div style="margin-left:60px">
                <h4 style="font-size:var(--text-sm);font-weight:600">EP202387654 Filed</h4>
                <p style="font-size:var(--text-xs);color:var(--color-text-tertiary);margin:4px 0">Safety Monitoring Architecture</p>
                <div style="display:flex;gap:var(--space-2)">
                  <span class="tag tag-orange">Filed</span>
                  <span class="tag tag-default">EP</span>
                </div>
              </div>
            </div>

            <!-- Entry 4 -->
            <div style="margin-bottom:var(--space-5);position:relative">
              <div style="position:absolute;left:-80px;width:60px;text-align:right;color:var(--color-text-quaternary);font-size:var(--text-xs)">2024-01</div>
              <div style="position:absolute;left:24px;width:12px;height:12px;border-radius:50%;background:var(--color-warning);border:3px solid var(--color-bg-elevated);z-index:1"></div>
              <div style="margin-left:60px">
                <h4 style="font-size:var(--text-sm);font-weight:600">CN202410XXXXX Submitted</h4>
                <p style="font-size:var(--text-xs);color:var(--color-text-tertiary);margin:4px 0">Thermal Diffusion Simulation Method</p>
                <div style="display:flex;gap:var(--space-2)">
                  <span class="tag tag-blue">Disclosure</span>
                  <span class="tag tag-default">CN</span>
                </div>
              </div>
            </div>

            <!-- Future Entry -->
            <div style="margin-bottom:var(--space-5);position:relative">
              <div style="position:absolute;left:-80px;width:60px;text-align:right;color:var(--color-text-quaternary);font-size:var(--text-xs)">2024-03</div>
              <div style="position:absolute;left:24px;width:12px;height:12px;border-radius:50%;background:var(--color-bg-active);border:3px solid var(--color-border);z-index:1"></div>
              <div style="margin-left:60px">
                <h4 style="font-size:var(--text-sm);font-weight:600">PCT Application Planned</h4>
                <p style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin:4px 0">Multi-jurisdiction filing for BMS thermal prediction</p>
                <div style="display:flex;gap:var(--space-2)">
                  <span class="tag tag-default">Planned</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Patent View: Table -->
    <div class="project-view-content" id="patentViewTable">
      <div class="data-table-container">
        <table class="data-table">
          <thead>
            <tr>
              <th>ID</th>
              <th>Title</th>
              <th>Status</th>
              <th>Jurisdiction</th>
              <th>Filed</th>
              <th>Inventors</th>
              <th>IPC Class</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td class="cell-id">CN202310XXXXX</td>
              <td class="cell-primary">BMS Thermal Runaway Prediction System</td>
              <td><span class="tag tag-green">Filed</span></td>
              <td>CN</td>
              <td>2023-07-15</td>
              <td>Zhang G., Li G., Chen K.</td>
              <td>H01M10/42</td>
              <td>
                <div class="btn-group">
                  <button class="btn btn-sm btn-ghost">View</button>
                  <button class="btn btn-sm btn-ghost">Edit</button>
                </div>
              </td>
            </tr>
            <tr>
              <td class="cell-id">US20241234567</td>
              <td class="cell-primary">Cell Balancing Circuit with Adaptive Threshold</td>
              <td><span class="tag tag-purple">Published</span></td>
              <td>US</td>
              <td>2024-01-05</td>
              <td>Wang L., Zhang G.</td>
              <td>H02J7/00, G06N3/08</td>
              <td>
                <div class="btn-group">
                  <button class="btn btn-sm btn-ghost">View</button>
                  <button class="btn btn-sm btn-ghost">Download PDF</button>
                </div>
              </td>
            </tr>
            <tr>
              <td class="cell-id">EP202387654</td>
              <td class="cell-primary">Safety Monitoring Architecture for EV Battery Packs</td>
              <td><span class="tag tag-orange">Pending Review</span></td>
              <td>EP</td>
              <td>2024-02-10</td>
              <td>Zhang G., Huang L.</td>
              <td>H01M10/48</td>
              <td>
                <div class="btn-group">
                  <button class="btn btn-sm btn-ghost">View</button>
                  <button class="btn btn-sm btn-ghost">Assign Reviewer</button>
                </div>
              </td>
            </tr>
            <tr>
              <td class="cell-id">CN202410XXXXX</td>
              <td class="cell-primary">Thermal Diffusion Simulation Method</td>
              <td><span class="tag tag-blue">Disclosure</span></td>
              <td>CN</td>
              <td>2024-01-12</td>
              <td>Chen K.</td>
              <td>G06F17/50, H01M10/42</td>
              <td>
                <div class="btn-group">
                  <button class="btn btn-sm btn-ghost">View</button>
                  <button class="btn btn-sm btn-primary">Submit Filing</button>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<!-- ===== PAGE: REPORTS ===== -->
<div id="page-reports" class="page-section">
  <div class="topbar">
    <div class="topbar-breadcrumb">
      <span>Home</span>
      <span class="breadcrumb-sep">/</span>
      <span>Reports</span>
    </div>
    <div class="topbar-actions">
      <div class="search-trigger"
        onclick="document.querySelector('.command-palette').classList.add('active'); document.querySelector('.command-input').focus();">
        <svg viewBox="0 0 24 24"><path d="M11 19a8 8 0 1 0 7.7-4.7l4.32 2.16a1 1 0 0 0 1.44-1.44l-2.16-4.32A8 8 0 1 0 5.28 3c0 .7-.15 1.4-.47 2.03-.66 1.31-1.23 2.6-1.72 3.92L.88 11.87C.73 12.31.7 12.75.7 13.2V15a1 1 0 0 0 .77.97L3.5 17h11.5a8 8 0 1 0 2.08-12.75z"/></svg>
        <span>Search reports (⌘+K)</span>
        <div class="search-shortcut">
          <kbd>⌘</kbd><kbd>K</kbd>
        </div>
      </div>

      <button class="theme-toggle" onclick="toggleTheme()" title="Toggle theme">
        <svg class="icon-sun" viewBox="0 0 24 24"><circle cx="12" cy="12" r="5"/><line x1="12" y1="1" x2="12" y2="3"/><line x1="12" y1="21" x2="12" y2="23"/><line x1="4.22" y1="4.22" x2="5.64" y2="5.64"/><line x1="18.36" y1="18.36" x2="19.78" y2="19.78"/><line x1="1" y1="12" x2="3" y2="12"/><line x1="21" y1="12" x2="23" y2="12"/><line x1="4.22" y1="19.78" x2="5.64" y2="18.36"/><line x1="18.36" y1="5.64" x2="19.78" y2="4.22"/></svg>
        <svg class="icon-moon" viewBox="0 0 24 24"><path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"/></svg>
      </button>

      <div class="btn-group">
        <button class="btn btn-secondary btn-sm">
          <svg viewBox="0 0 24 24"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
          Download All
        </button>
        <button class="btn btn-primary btn-sm">
          <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
          Generate Report
        </button>
      </div>
    </div>
  </div>

  <div class="content-area">
    <div class="page-header">
      <div class="page-header-top">
        <div>
          <h1 class="page-title">Report Center</h1>
          <p class="page-subtitle">Generate, view, and manage engineering reports — from daily logs to quarterly reviews.</p>
        </div>
        <div class="view-switcher">
          <button class="view-switcher-btn active" onclick="switchReportView('dashboard')">
            <svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg>
            Dashboard
          </button>
          <button class="view-switcher-btn" onclick="switchReportView('list')">
            <svg viewBox="0 0 24 24"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
            Reports List
          </button>
          <button class="view-switcher-btn" onclick="switchReportView('templates')">
            <svg viewBox="0 0 24 24"><path d="M22 12C22 6.48 17.52 2 12 2S2 6.48 2 12s4.52 10 10 10 10-4.52 10-10z"/><path d="M12 4v8l3 3V9"/></svg>
            Templates
          </button>
        </div>
      </div>
    </div>

    <!-- Report View: Dashboard -->
    <div class="project-view-content active" id="reportViewDashboard">
      <div class="stat-grid">
        <div class="stat-card">
          <div class="stat-label">Total Reports</div>
          <div class="stat-value">24</div>
          <div class="stat-change up">+3 this week</div>
        </div>
        <div class="stat-card">
          <div class="stat-label">Quarterly Reviews</div>
          <div class="stat-value">3</div>
          <div class="stat-change up">✓ Completed Q4 2023</div>
        </div>
        <div class="stat-card">
          <div class="stat-label">Pending Approvals</div>
          <div class="stat-value">2</div>
          <div class="stat-change down">-1 vs last week</div>
        </div>
        <div class="stat-card">
          <div class="stat-label">Auto-generated</div>
          <div class="stat-value">18</div>
          <div class="stat-change up">▲ 75% of total</div>
        </div>
      </div>

      <div style="margin-top:var(--space-6)">
        <div class="two-col">
          <!-- Recent Reports -->
          <div class="card">
            <div class="card-header">
              <span class="card-title">Recent Reports</span>
            </div>
            <div class="card-body">
              <div style="display:flex;flex-direction:column;gap:var(--space-3)">
                <div class="doc-card" style="cursor:pointer">
                  <div class="doc-card-type">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="var(--color-accent)" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
                    <span style="margin-left:var(--space-2)">Monthly Report — Jan 2024</span>
                  </div>
                  <div class="doc-card-title">BMS Safety Certification Project Monthly Summary</div>
                  <div class="doc-card-desc">Generated automatically from task & milestone data. Includes completion rate, risks, and next steps. [PDF · 4.2 MB]</div>
                  <div class="doc-card-footer">
                    <div style="display:flex;align-items:center;gap:var(--space-2)">
                      <span class="tag tag-purple">Auto</span>
                      <span class="tag tag-green">Approved</span>
                    </div>
                    <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Jan 15, 2024</span>
                  </div>
                </div>
                <div class="doc-card" style="cursor:pointer">
                  <div class="doc-card-type">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="var(--color-info)" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
                    <span style="margin-left:var(--space-2)">Safety Review Report</span>
                  </div>
                  <div class="doc-card-title">SR-002 Thermal Abuse Test Plan Review</div>
                  <div class="doc-card-desc">Review meeting minutes, action items, and status updates. Signed off by QA lead. [PDF · 2.1 MB]</div>
                  <div class="doc-card-footer">
                    <div style="display:flex;align-items:center;gap:var(--space-2)">
                      <span class="tag tag-blue">Manual</span>
                      <span class="tag tag-green">Released</span>
                    </div>
                    <span style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Jan 10, 2024</span>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Report Categories -->
          <div class="card">
            <div class="card-header">
              <span class="card-title">Report Categories</span>
            </div>
            <div class="card-body">
              <div style="display:grid;grid-template-columns:1fr 1fr;gap:var(--space-3)">
                <div style="display:flex;align-items:center;gap:var(--space-2);padding:var(--space-2);border-radius:var(--radius-sm);cursor:pointer;background:var(--color-surface-hover)">
                  <div style="width:24px;height:24px;border-radius:var(--radius-sm);background:var(--color-accent-subtle);display:flex;align-items:center;justify-content:center">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="var(--color-accent)" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
                  </div>
                  <span style="font-size:var(--text-sm);font-weight:500">Monthly Summaries</span>
                  <span style="margin-left:auto;font-size:var(--text-sm);font-weight:600">8</span>
                </div>
                <div style="display:flex;align-items:center;gap:var(--space-2);padding:var(--space-2);border-radius:var(--radius-sm);cursor:pointer;background:var(--color-surface-hover)">
                  <div style="width:24px;height:24px;border-radius:var(--radius-sm);background:var(--color-info-subtle);display:flex;align-items:center;justify-content:center">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="var(--color-info)" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
                  </div>
                  <span style="font-size:var(--text-sm);font-weight:500">Safety Reviews</span>
                  <span style="margin-left:auto;font-size:var(--text-sm);font-weight:600">5</span>
                </div>
                <div style="display:flex;align-items:center;gap:var(--space-2);padding:var(--space-2);border-radius:var(--radius-sm);cursor:pointer;background:var(--color-surface-hover)">
                  <div style="width:24px;height:24px;border-radius:var(--radius-sm);background:var(--color-success-subtle);display:flex;align-items:center;justify-content:center">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="var(--color-success)" stroke-width="2"><path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z"/></svg>
                  </div>
                  <span style="font-size:var(--text-sm);font-weight:500">Test & Validation</span>
                  <span style="margin-left:auto;font-size:var(--text-sm);font-weight:600">6</span>
                </div>
                <div style="display:flex;align-items:center;gap:var(--space-2);padding:var(--space-2);border-radius:var(--radius-sm);cursor:pointer;background:var(--color-surface-hover)">
                  <div style="width:24px;height:24px;border-radius:var(--radius-sm);background:var(--color-warning-subtle);display:flex;align-items:center;justify-content:center">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="var(--color-warning)" stroke-width="2"><path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v14z"/><path d="M12 10h.01"/><path d="M12 14h.01"/><path d="M12 16h.01"/><path d="M12 8h.01"/></svg>
                  </div>
                  <span style="font-size:var(--text-sm);font-weight:500">Incident & RCA</span>
                  <span style="margin-left:auto;font-size:var(--text-sm);font-weight:600">5</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Quick Actions -->
      <div style="margin-top:var(--space-6)">
        <div class="card">
          <div class="card-header">
            <span class="card-title">Quick Report Actions</span>
          </div>
          <div class="card-body">
            <div style="display:grid;grid-template-columns:repeat(3,1fr);gap:var(--space-3)">
              <button class="btn btn-primary full-width" style="padding:12px 0;font-size:var(--text-sm);flex-direction:column;align-items:center">
                <svg viewBox="0 0 24 24" width="20"><path d="M12 2a10 10 0 1 0 10 10H12V2z"/></svg>
                Generate Monthly Report
              </button>
              <button class="btn btn-secondary full-width" style="padding:12px 0;font-size:var(--text-sm);flex-direction:column;align-items:center">
                <svg viewBox="0 0 24 24" width="20"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
                Compile Safety Review Package
              </button>
              <button class="btn btn-secondary full-width" style="padding:12px 0;font-size:var(--text-sm);flex-direction:column;align-items:center">
                <svg viewBox="0 0 24 24" width="20"><path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z"/></svg>
                Build Test Summary (Auto)
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Report View: List -->
    <div class="project-view-content" id="reportViewList">
      <div class="data-table-container">
        <table class="data-table">
          <thead>
            <tr>
              <th>Type</th>
              <th>Title</th>
              <th>Project</th>
              <th>Status</th>
              <th>Created</th>
              <th>Last Modified</th>
              <th>Owner</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><span class="tag tag-purple" style="font-size:9px">Auto</span></td>
              <td class="cell-primary">BMS Cert — Jan 2024 Monthly Report</td>
              <td>BMS-2024</td>
              <td><span class="tag tag-green">Approved</span></td>
              <td>2024-01-15</td>
              <td>2024-01-15</td>
              <td>Zhang Gong</td>
              <td>
                <div class="btn-group">
                  <button class="btn btn-sm btn-ghost">View</button>
                  <button class="btn btn-sm btn-ghost">Download</button>
                  <button class="btn btn-sm btn-ghost">Share</button>
                </div>
              </td>
            </tr>
            <tr>
              <td><span class="tag tag-blue" style="font-size:9px">Manual</span></td>
              <td class="cell-primary">SR-002 Review Meeting Minutes</td>
              <td>BMS-2024</td>
              <td><span class="tag tag-green">Released</span></td>
              <td>2024-01-10</td>
              <td>2024-01-11</td>
              <td>Li Gong</td>
              <td>
                <div class="btn-group">
                  <button class="btn btn-sm btn-ghost">View</button>
                  <button class="btn btn-sm btn-ghost">Edit</button>
                </div>
              </td>
            </tr>
            <tr>
              <td><span class="tag tag-orange" style="font-size:9px">Draft</span></td>
              <td class="cell-primary">THERM-03 Thermal Test Summary Q1</td>
              <td>THERM-03</td>
              <td><span class="tag tag-default">In Progress</span></td>
              <td>2024-01-12</td>
              <td>2024-01-13</td>
              <td>Chen Ke</td>
              <td>
                <div class="btn-group">
                  <button class="btn btn-sm btn-ghost">View</button>
                  <button class="btn btn-sm btn-primary">Submit for Review</button>
                </div>
              </td>
            </tr>
            <tr>
              <td><span class="tag tag-red" style="font-size:9px">RCA</span></td>
              <td class="cell-primary">Incident #INC-20240105 — BMS Sensor Drift</td>
              <td>BMS-2024</td>
              <td><span class="tag tag-orange">Under Review</span></td>
              <td>2024-01-05</td>
              <td>2024-01-14</td>
              <td>Wang Lei</td>
              <td>
                <div class="btn-group">
                  <button class="btn btn-sm btn-ghost">View</button>
                  <button class="btn btn-sm btn-ghost">Approve</button>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

    <!-- Report View: Templates -->
    <div class="project-view-content" id="reportViewTemplates">
      <div class="card" style="margin-bottom:var(--space-4)">
        <div class="card-header">
          <span class="card-title">Report Templates</span>
          <button class="btn btn-primary btn-sm">+ New Template</button>
        </div>
        <div class="card-body">
          <div style="display:grid;grid-template-columns:1fr 1fr;gap:var(--space-4)">
            <div class="doc-card" style="cursor:pointer">
              <div class="doc-card-type">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="var(--color-accent)" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
                <span style="margin-left:var(--space-2)">Monthly Project Summary</span>
              </div>
              <div class="doc-card-title">Template v2.3 — Last updated Dec 2023</div>
              <div class="doc-card-desc">Standard monthly template for project managers. Includes KPIs, task summary, risks, next steps.</div>
              <div class="doc-card-footer">
                <span class="tag tag-default">System</span>
                <span style="margin-left:auto;font-size:var(--text-xs);color:var(--color-text-quaternary)">Used in 12 reports</span>
              </div>
            </div>
            <div class="doc-card" style="cursor:pointer">
              <div class="doc-card-type">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="var(--color-info)" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
                <span style="margin-left:var(--space-2)">Safety Review Report</span>
              </div>
              <div class="doc-card-title">Template v1.7 — Last updated Nov 2023</div>
              <div class="doc-card-desc">ISO 26262-compliant safety review report. Includes hazard list, FMEA excerpt, approval workflow.</div>
              <div class="doc-card-footer">
                <span class="tag tag-default">System</span>
                <span style="margin-left:auto;font-size:var(--text-xs);color:var(--color-text-quaternary)">Used in 8 reports</span>
              </div>
            </div>
            <div class="doc-card" style="cursor:pointer">
              <div class="doc-card-type">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="var(--color-success)" stroke-width="2"><path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z"/></svg>
                <span style="margin-left:var(--space-2)">Test Validation Report</span>
              </div>
              <div class="doc-card-title">Template v3.1 — Last updated Jan 2024</div>
              <div class="doc-card-desc">Automatically populated from test platform. Includes pass/fail criteria, graphs, anomalies.</div>
              <div class="doc-card-footer">
                <span class="tag tag-default">System</span>
                <span style="margin-left:auto;font-size:var(--text-xs);color:var(--color-text-quaternary)">Used in 15 reports</span>
              </div>
            </div>
            <div class="doc-card" style="cursor:pointer">
              <div class="doc-card-type">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="var(--color-warning)" stroke-width="2"><path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v14z"/><path d="M12 10h.01"/><path d="M12 14h.01"/><path d="M12 16h.01"/><path d="M12 8h.01"/></svg>
                <span style="margin-left:var(--space-2)">Incident RCA Report</span>
              </div>
              <div class="doc-card-title">Template v1.2 — Last updated Oct 2023</div>
              <div class="doc-card-desc">Root cause analysis based on 5-Why, fishbone, and corrective actions. Requires QA sign-off.</div>
              <div class="doc-card-footer">
                <span class="tag tag-default">System</span>
                <span style="margin-left:auto;font-size:var(--text-xs);color:var(--color-text-quaternary)">Used in 4 reports</span>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="card">
        <div class="card-header">
          <span class="card-title">Custom Templates</span>
          <button class="btn btn-secondary btn-sm">+ Create</button>
        </div>
        <div class="card-body" style="display:flex;flex-direction:column;gap:var(--space-3)">
          <div style="display:flex;align-items:center;gap:var(--space-2);padding:var(--space-2);border-radius:var(--radius-sm);background:var(--color-surface)">
            <div style="width:28px;height:28px;border-radius:var(--radius-md);background:var(--color-bg-active);display:flex;align-items:center;justify-content:center">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="var(--color-text-tertiary)" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
            </div>
            <div>
              <div style="font-weight:600;font-size:var(--text-sm)">BMS Hardware Debug Log</div>
              <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Created by Zhang Gong · Used in 3 reports</div>
            </div>
            <div style="margin-left:auto;display:flex;gap:var(--space-2)">
              <button class="btn btn-sm btn-ghost">Edit</button>
              <button class="btn btn-sm btn-ghost">Duplicate</button>
            </div>
          </div>
          <div style="display:flex;align-items:center;gap:var(--space-2);padding:var(--space-2);border-radius:var(--radius-sm);background:var(--color-surface)">
            <div style="width:28px;height:28px;border-radius:var(--radius-md);background:var(--color-bg-active);display:flex;align-items:center;justify-content:center">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="var(--color-text-tertiary)" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
            </div>
            <div>
              <div style="font-weight:600;font-size:var(--text-sm)">Thermal Simulation Benchmark</div>
              <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Created by Chen Ke · Draft</div>
            </div>
            <div style="margin-left:auto;display:flex;gap:var(--space-2)">
              <button class="btn btn-sm btn-ghost">Edit</button>
              <button class="btn btn-sm btn-ghost">Delete</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- ===== PAGE: AI ASSISTANT ===== -->
<div id="page-ai" class="page-section">
  <div class="topbar">
    <div class="topbar-breadcrumb">
      <span>Home</span>
      <span class="breadcrumb-sep">/</span>
      <span>AI Assistant</span>
    </div>
    <div class="topbar-actions">
      <div class="search-trigger"
        onclick="document.querySelector('.command-palette').classList.add('active'); document.querySelector('.command-input').focus();">
        <svg viewBox="0 0 24 24"><path d="M11 19a8 8 0 1 0 7.7-4.7l4.32 2.16a1 1 0 0 0 1.44-1.44l-2.16-4.32A8 8 0 1 0 5.28 3c0 .7-.15 1.4-.47 2.03-.66 1.31-1.23 2.6-1.72 3.92L.88 11.87C.73 12.31.7 12.75.7 13.2V15a1 1 0 0 0 .77.97L3.5 17h11.5a8 8 0 1 0 2.08-12.75z"/></svg>
        <span>Ask anything (⌘+K)</span>
        <div class="search-shortcut">
          <kbd>⌘</kbd><kbd>K</kbd>
        </div>
      </div>

      <button class="theme-toggle" onclick="toggleTheme()" title="Toggle theme">
        <svg class="icon-sun" viewBox="0 0 24 24"><circle cx="12" cy="12" r="5"/><line x1="12" y1="1" x2="12" y2="3"/><line x1="12" y1="21" x2="12" y2="23"/><line x1="4.22" y1="4.22" x2="5.64" y2="5.64"/><line x1="18.36" y1="18.36" x2="19.78" y2="19.78"/><line x1="1" y1="12" x2="3" y2="12"/><line x1="21" y1="12" x2="23" y2="12"/><line x1="4.22" y1="19.78" x2="5.64" y2="18.36"/><line x1="18.36" y1="5.64" x2="19.78" y2="4.22"/></svg>
        <svg class="icon-moon" viewBox="0 0 24 24"><path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"/></svg>
      </button>

      <div class="btn-group">
        <button class="btn btn-secondary btn-sm">
          <svg viewBox="0 0 24 24"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
          Clear History
        </button>
        <button class="btn btn-primary btn-sm">
          <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
          New Chat
        </button>
      </div>
    </div>
  </div>

  <div class="content-area">
    <div class="page-header">
      <div class="page-header-top">
        <div>
          <h1 class="page-title">BST AI Assistant</h1>
          <p class="page-subtitle">Your intelligent engineering co-pilot — generate reports, analyze data, draft documents.</p>
        </div>
        <div class="tags">
          <span class="tag tag-default" style="font-size:10px">Active</span>
          <span class="tag tag-purple" style="font-size:10px">v2.1</span>
        </div>
      </div>
    </div>

    <!-- AI Chat Interface -->
    <div class="ai-message assistant" style="margin-bottom:var(--space-4)">
      <div class="ai-avatar assistant">
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2">
          <circle cx="12" cy="12" r="10"/>
          <path d="M8 12h8"/>
          <path d="M12 8v8"/>
        </svg>
      </div>
      <div class="ai-bubble" style="max-width:85%;font-size:var(--text-sm)">
        <div>Hello! I'm BST AI, your engineering knowledge assistant.</div>
        <div style="margin-top:var(--space-2)">
          I can help you with:
        </div>
        <ul style="margin:var(--space-2) 0 0 20px;padding:0;list-style:disc;font-size:var(--text-sm);line-height:1.5">
          <li>Summarize your tasks or projects</li>
          <li>Generate monthly/quarterly reports</li>
          <li>Draft safety review documents</li>
          <li>Analyze performance metrics</li>
          <li>Extract insights from test data</li>
          <li>Create patent abstracts</li>
        </ul>
        <div style="margin-top:var(--space-2)">Just ask! Try: “Summarize my overdue tasks” or “Generate a safety review outline for SR-001”.</div>
      </div>
    </div>

    <!-- Quick Prompts -->
    <div class="ai-quick-actions">
      <button class="ai-quick-btn">
        <svg viewBox="0 0 24 24"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
        Summarize today’s tasks
      </button>
      <button class="ai-quick-btn">
        <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
        Draft SR-001 report
      </button>
      <button class="ai-quick-btn">
        <svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
        Generate Jan monthly report
      </button>
      <button class="ai-quick-btn">
        <svg viewBox="0 0 24 24"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
        Analyze thermal simulation data
      </button>
      <button class="ai-quick-btn">
        <svg viewBox="0 0 24 24"><path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z"/></svg>
        Suggest improvements for FMEA
      </button>
      <button class="ai-quick-btn">
        <svg viewBox="0 0 24 24"><path d="M22 12C22 6.48 17.52 2 12 2S2 6.48 2 12s4.52 10 10 10 10-4.52 10-10z"/><path d="M12 4v8l3 3V9"/></svg>
        Show my KPI trend
      </button>
    </div>

    <!-- Chat History Area -->
    <div class="ai-messages" style="flex:1;overflow-y:auto;padding:var(--space-4);border:1px solid var(--color-border);border-radius:var(--radius-lg); margin-bottom:var(--space-4)">
      <!-- Example chat history -->
      <div class="ai-message user">
        <div class="ai-avatar human">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8zm-1-12h-2v4H7v2h2v4h2v-4h2V7h-2z"/>
          </svg>
        </div>
        <div class="ai-bubble">
          Generate a safety review report for SR-001
        </div>
      </2>
      <div class="ai-message assistant">
        <div class="ai-avatar assistant">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2">
            <circle cx="12" cy="12" r="10"/>
            <path d="M8 12h8"/>
            <path d="M12 8v8"/>
          </svg>
        </div>
        <div class="ai-bubble">
          Here's a draft structure for SR-001:<br/><br/>
          <strong>1. Executive Summary</strong><br/>
          - Objective: Thermal runaway risk assessment for BMS-2024<br/>
          - Status: Overdue (3 days)<br/>
          <strong>2. Required Inputs Missing</strong><br/>
          - Vendor thermal abuse test reports (TEST-002)<br/>
          <strong>3. Recommended Actions</strong><br/>
          - Contact vendor by EOD today<br/>
          - Flag as critical in project tracker
        </div>
      </div>

      <div class="ai-message user">
        <div class="ai-avatar human">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-3.58 10-8-3.58-8-8-8zm0 18c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8zm-1-12h-2v4H7v2h2v4h2v-4h2V7h-2z"/>
          </svg>
        </div>
        <div class="ai-bubble">
          What's my current performance score?
        </div>
      </div>
      <div class="ai-message assistant">
        <div class="ai-avatar assistant">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2">
            <circle cx="12" cy="12" r="10"/>
            <path d="M8 12h8"/>
            <path d="M12 8v8"/>
          </svg>
        </div>
        <div class="ai-bubble">
          Your current weighted performance score for January 2024 is <strong style="color:var(--color-accent)">89.4/100</strong>.<br/><br/>
          Breakdown:
          • Task Completion: 95/100<br/>
          • Work Quality: 88/100<br/>
          • Timeliness: 90/100<br/>
          • Innovation: 78/100<br/>
          • Collaboration: 92/100<br/><br/>
          You are ranked #2 in the department (out of 6 engineers).
        </div>
      </div>
    </div>

    <!-- Input Bar -->
    <div class="ai-input-bar">
      <textarea class="ai-input-field" placeholder="Ask BST AI anything..." rows="1" style="font-size:var(--text-sm);resize:none"></textarea>
      <button class="ai-send-btn" onclick="sendAIQuery()">
        <svg viewBox="0 0 24 24" style="width:14px;height:14px"><line x1="22" y1="2" x2="11" y2="13"/><polygon points="22 2 15 22 11 13 2 9 22 2"/></svg>
      </button>
    </div>
  </div>
</div>

<!-- ===== PAGE: SETTINGS ===== -->
<div id="page-settings" class="page-section">
  <div class="topbar">
    <div class="topbar-breadcrumb">
      <span>Home</span>
      <span class="breadcrumb-sep">/</span>
      <span>Settings</span>
    </div>
    <div class="topbar-actions">
      <div class="search-trigger"
        onclick="document.querySelector('.command-palette').classList.add('active'); document.querySelector('.command-input').focus();">
        <svg viewBox="0 0 24 24"><path d="M11 19a8 8 0 1 0 7.7-4.7l4.32 2.16a1 1 0 0 0 1.44-1.44l-2.16-4.32A8 8 0 1 0 5.28 3c0 .7-.15 1.4-.47 2.03-.66 1.31-1.23 2.6-1.72 3.92L.88 11.87C.73 12.31.7 12.75.7 13.2V15a1 1 0 0 0 .77.97L3.5 17h11.5a8 8 0 1 0 2.08-12.75z"/></svg>
        <span>Search settings (⌘+K)</span>
        <div class="search-shortcut">
          <kbd>⌘</kbd><kbd>K</kbd>
        </div>
      </div>

      <button class="theme-toggle" onclick="toggleTheme()" title="Toggle theme">
        <svg class="icon-sun" viewBox="0 0 24 24"><circle cx="12" cy="12" r="5"/><line x1="12" y1="1" x2="12" y2="3"/><line x1="12" y1="21" x2="12" y2="23"/><line x1="4.22" y1="4.22" x2="5.64" y2="5.64"/><line x1="18.36" y1="18.36" x2="19.78" y2="19.78"/><line x1="1" y1="12" x2="3" y2="12"/><line x1="21" y1="12" x2="23" y2="12"/><line x1="4.22" y1="19.78" x2="5.64" y2="18.36"/><line x1="18.36" y1="5.64" x2="19.78" y2="4.22"/></svg>
        <svg class="icon-moon" viewBox="0 0 24 24"><path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"/></svg>
      </button>

      <div class="btn-group">
        <button class="btn btn-secondary btn-sm">
          <svg viewBox="0 0 24 24"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
          Export Config
        </button>
        <button class="btn btn-primary btn-sm">
          <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
          Save Changes
        </button>
      </div>
    </div>
  </div>

  <div class="content-area">
    <div class="page-header">
      <div class="page-header-top">
        <div>
          <h1 class="page-title">Settings</h1>
          <p class="page-subtitle">Manage your profile, notifications, preferences, and integrations.</p>
        </div>
      </div>
    </div>

    <div class="two-col">
      <!-- Left: Nav -->
      <div style="border-right:1px solid var(--color-border);padding-right:var(--space-6)">
        <div style="display:flex;flex-direction:column;gap:var(--space-2)">
          <button class="settings-item active" onclick="showSettingSection('profile')">
            <div class="settings-item-left">
              <div class="settings-item-title">Profile & Identity</div>
              <div class="settings-item-desc">Name, role, contact info</div>
            </div>
            <div class="settings-item-right">
              <div class="user-avatar" style="width:30px;height:30px">ZG</div>
            </div>
          </button>
          <button class="settings-item" onclick="showSettingSection('notifications')">
            <div class="settings-item-left">
              <div class="settings-item-title">Notifications</div>
              <div class="settings-item-desc">Email, in-app, push settings</div>
            </div>
            <div class="settings-item-right">
              <span class="tag tag-green" style="font-size:10px">All On</span>
            </div>
          </button>
          <button class="settings-item" onclick="showSettingSection('preferences')">
            <div class="settings-item-left">
              <div class="settings-item-title">Preferences</div>
              <div class="settings-item-desc">Theme, language, date format</div>
            </div>
            <div class="settings-item-right">
              <span class="tag tag-default" style="font-size:10px">Dark</span>
            </div>
          </button>
          <button class="settings-item" onclick="showSettingSection('integrations')">
            <div class="settings-item-left">
              <div class="settings-item-title">Integrations</div>
              <div class="settings-item-desc">PLM, ERP, HR, GitLab, etc.</div>
            </div>
            <div class="settings-item-right">
              <span class="tag tag-blue" style="font-size:10px">6 connected</span>
            </div>
          </button>
          <button class="settings-item" onclick="showSettingSection('security')">
            <div class="settings-item-left">
              <div class="settings-item-title">Security</div>
              <div class="settings-item-desc">Password, 2FA, audit log</div>
            </div>
            <div class="settings-item-right">
              <span class="tag tag-success" style="font-size:10px">✅ Enabled</span>
            </div>
          </button>
          <button class="settings-item" onclick="showSettingSection('advanced')">
            <div class="settings-item-left">
              <div class="settings-item-title">Advanced</div>
              <div class="settings-item-desc">API keys, custom fields, automation</div>
            </div>
            <div class="settings-item-right">
              <span class="tag tag-default" style="font-size:10px">Admin Only</span>
            </div>
          </button>
        </div>
      </div>

      <!-- Right: Content -->
      <div class="settings-content">
        <!-- Profile Section -->
        <div class="settings-section active" id="section-profile">
          <h2 style="font-size:var(--text-lg);font-weight:600;margin-bottom:var(--space-4)">Profile & Identity</h2>
          <div class="form-group">
            <label class="form-label">Full Name</label>
            <input type="text" class="form-input" value="Zhang Gong" />
          </div>
          <div class="form-group">
            <label class="form-label">Job Title</label>
            <input type="text" class="form-input" value="Senior Battery Systems Engineer" />
          </div>
          <div class="form-group">
            <label class="form-label">Department</label>
            <input type="text" class="form-input" value="Battery Systems R&D" />
          </div>
          <div class="form-group">
            <label class="form-label">Email</label>
            <input type="email" class="form-input" value="zhang.gong@bst-tech.com" />
          </div>
          <div class="form-group">
            <label class="form-label">Phone</label>
            <input type="tel" class="form-input" value="+86 138-XXXX-XXXX" />
          </div>
          <div class="form-group">
            <label class="form-label">Avatar</label>
            <div style="display:flex;align-items:center;gap:var(--space-3)">
              <div class="user-avatar" style="width:60px;height:60px">ZG</div>
              <div>
                <button class="btn btn-secondary btn-sm">Upload Photo</button>
                <button class="btn btn-ghost btn-sm" style="margin-left:var(--space-2)">Reset</button>
              </div>
            </div>
          </div>
          <div style="margin-top:var(--space-6)">
            <button class="btn btn-primary">Save Profile</button>
            <button class="btn btn-secondary" style="margin-left:var(--space-2)">Cancel</button>
          </div>
        </div>

        <!-- Notifications Section -->
        <div class="settings-section" id="section-notifications">
          <h2 style="font-size:var(--text-lg);font-weight:600;margin-bottom:var(--space-4)">Notifications</h2>
          <div class="settings-item">
            <div class="settings-item-left">
              <div class="settings-item-title">Task Assignments</div>
              <div class="settings-item-desc">When you are assigned a new task</div>
            </div>
            <div class="settings-item-right">
              <div class="toggle active">
                <div class="toggle-knob"></div>
              </div>
            </div>
          </div>
          <div class="settings-item">
            <div class="settings-item-left">
              <div class="settings-item-title">Safety Review Due</div>
              <div class="settings-item-desc">When a safety review is due in < 3 days</div>
            </div>
            <div class="settings-item-right">
              <div class="toggle active">
                <div class="toggle-knob"></div>
              </div>
            </div>
          </div>
          <div class="settings-item">
            <div class="settings-item-left">
              <div class="settings-item-title">Performance Reminders</div>
              <div class="settings-item-desc">Monthly self-evaluation deadline reminders</div>
            </div>
            <div class="settings-item-right">
              <div class="toggle active">
                <div class="toggle-knob"></div>
              </div>
            </div>
          </div>
          <div class="settings-item">
            <div class="settings-item-left">
              <div class="settings-item-title">AI Assistant Alerts</div>
              <div class="settings-item-desc">New suggestions or auto-drafts</div>
            </div>
            <div class="settings-item-right">
              <div class="toggle">
                <div class="toggle-knob"></div>
              </div>
            </div>
          </div>
          <div class="settings-item">
            <div class="settings-item-left">
              <div class="settings-item-title">Email Digest</div>
              <div class="settings-item-desc">Daily/weekly summary email</div>
            </div>
            <div class="settings-item-right">
              <div class="toggle active">
                <div class="toggle-knob"></div>
              </div>
            </div>
          </div>
          <div style="margin-top:var(--space-6)">
            <button class="btn btn-primary">Save Notifications</button>
          </div>
        </div>

        <!-- Preferences Section -->
        <div class="settings-section" id="section-preferences">
          <h2 style="font-size:var(--text-lg);font-weight:600;margin-bottom:var(--space-4)">Preferences</h2>
          <div class="form-group">
            <label class="form-label">Theme</label>
            <div class="view-switcher">
              <button class="view-switcher-btn active" onclick="setTheme('dark')">Dark</button>
              <button class="view-switcher-btn" onclick="setTheme('light')">Light</button>
            </div>
          </div>
          <div class="form-group">
            <label class="form-label">Language</label>
            <select class="form-select">
              <option>中文</option>
              <option>English</option>
            </select>
          </div>
          <div class="form-group">
            <label class="form-label">Date Format</label>
            <select class="form-select">
              <option>YYYY-MM-DD</option>
              <option>MM/DD/YYYY</option>
              <option>DD/MM/YYYY</option>
            </select>
          </div>
          <div class="form-group">
            <label class="form-label">Time Zone</label>
            <select class="form-select">
              <option>Asia/Shanghai (UTC+8)</option>
              <option>Europe/Berlin (UTC+1)</option>
              <option>America/Los_Angeles (UTC-8)</option>
            </select>
          </div>
          <div class="form-group">
            <label class="form-label">Default View</label>
            <select class="form-select">
              <option>Dashboard (AI Mode)</option>
              <option>Projects — Cards</option>
              <option>Tasks — Kanban</option>
              <option>Safety — Kanban</option>
            </select>
          </div>
          <div style="margin-top:var(--space-6)">
            <button class="btn btn-primary">Save Preferences</button>
          </div>
        </div>

        <!-- Integrations Section -->
        <div class="settings-section" id="section-integrations">
          <h2 style="font-size:var(--text-lg);font-weight:600;margin-bottom:var(--space-4)">Integrations</h2>
          <div class="card" style="margin-bottom:var(--space-4)">
            <div class="card-header">
              <span class="card-title">PLM System</span>
              <span class="tag tag-green" style="font-size:10px">Connected</span>
            </div>
            <div class="card-body">
              <div style="display:flex;align-items:center;gap:var(--space-3)">
                <div style="width:48px;height:48px;border-radius:var(--radius-lg);background:linear-gradient(135deg,#059669,#22C55E);display:flex;align-items:center;justify-content:center">
                  <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
                </div>
                <div>
                  <div style="font-size:var(--text-sm);font-weight:600">Siemens Teamcenter</div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Sync projects, BOM, ECNs</div>
                </div>
              </div>
              <div style="margin-top:var(--space-3)">
                <button class="btn btn-secondary btn-sm">Reconnect</button>
                <button class="btn btn-ghost btn-sm" style="margin-left:var(--space-2)">Test Connection</button>
                <button class="btn btn-ghost btn-sm" style="margin-left:var(--space-2)">Remove</button>
              </div>
            </div>
          </div>
          <div class="card" style="margin-bottom:var(--space-4)">
            <div class="card-header">
              <span class="card-title">HR System</span>
              <span class="tag tag-green" style="font-size:10px">Connected</span>
            </div>
            <div class="card-body">
              <div style="display:flex;align-items:center;gap:var(--space-3)">
                <div style="width:48px;height:48px;border-radius:var(--radius-lg);background:linear-gradient(135deg,#2563EB,#3B82F6);display:flex;align-items:center;justify-content:center">
                  <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"><path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z"/></svg>
                </div>
                <div>
                  <div style="font-size:var(--text-sm);font-weight:600">GitLab CI/CD</div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Sync pipelines, test results, code quality</div>
                </div>
              </div>
              <div style="margin-top:var(--space-3)">
                <button class="btn btn-secondary btn-sm">Reconnect</button>
                <button class="btn btn-ghost btn-sm" style="margin-left:var(--space-2)">Test Connection</button>
                <button class="btn btn-ghost btn-sm" style="margin-left:var(--space-2)">Remove</button>
              </div>
            </div>
          </div>
          <div class="card" style="margin-bottom:var(--space-4)">
            <div class="card-header">
              <span class="card-title">HR & Identity</span>
              <span class="tag tag-green" style="font-size:10px">Connected</span>
            </div>
            <div class="card-body">
              <div style="display:flex;align-items:center;gap:var(--space-3)">
                <div style="width:48px;height:48px;border-radius:var(--radius-lg);background:linear-gradient(135deg,#7C3AED,#6366F1);display:flex;align-items:center;justify-content:center">
                  <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 12a2 2 0 0 0-2-2 2 2 0 0 0-2 2"/></svg>
                </div>
                <div>
                  <div style="font-size:var(--text-sm);font-weight:600">Workday HCM</div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Sync org chart, leave, performance cycles</div>
                </div>
              </div>
              <div style="margin-top:var(--space-3)">
                <button class="btn btn-secondary btn-sm">Reconnect</button>
                <button class="btn btn-ghost btn-sm" style="margin-left:var(--space-2)">Refresh Org Data</button>
                <button class="btn btn-ghost btn-sm" style="margin-left:var(--space-2)">Remove</button>
              </div>
            </div>
          </div>
          <div class="card">
            <div class="card-header">
              <span class="card-title">Add New Integration</span>
            </div>
            <div class="card-body">
              <div style="display:flex;gap:var(--space-2)">
                <select class="form-select" style="flex:1">
                  <option>Choose system...</option>
                  <option>SAP ERP</option>
                  <option>DingTalk</option>
                  <option>WeCom</option>
                  <option>Jira</option>
                  <option>Confluence</option>
                  <option>MathWorks MATLAB</option>
                  <option>Ansys Twin Builder</option>
                </select>
                <button class="btn btn-primary">Connect</button>
              </div>
              <div style="margin-top:var(--space-2);font-size:var(--text-xs);color:var(--color-text-quaternary)">
                🔐 All integrations use OAuth 2.0 and SSO. No credentials stored.
              </div>
            </div>
          </div>
        </div>

        <!-- Security Section -->
        <div class="settings-section" id="section-security">
          <h2 style="font-size:var(--text-lg);font-weight:600;margin-bottom:var(--space-4)">Security</h2>
          <div class="form-group">
            <label class="form-label">Password</label>
            <div style="display:flex;gap:var(--space-2)">
              <input type="password" class="form-input" placeholder="••••••••" />
              <button class="btn btn-secondary">Change</button>
            </div>
          </div>
          <div class="form-group">
            <label class="form-label">Two-Factor Authentication</label>
            <div style="display:flex;align-items:center;gap:var(--space-3)">
              <div class="toggle active">
                <div class="toggle-knob"></div>
              </div>
              <span>Enabled via Authenticator App</span>
              <button class="btn btn-ghost btn-sm">Setup</button>
            </div>
          </div>
          <div class="form-group">
            <label class="form-label">Trusted Devices</label>
            <div style="display:flex;flex-direction:column;gap:var(--space-2)">
              <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-2);background:var(--color-surface);border-radius:var(--radius-sm)">
                <div style="width:32px;height:32px;border-radius:var(--radius-md);background:var(--color-accent-subtle);display:flex;align-items:center;justify-content:center">
                  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="var(--color-accent)" stroke-width="2"><rect x="2" y="3" width="20" height="14" rx="2" ry="2"/><line x1="8" y1="21" x2="16" y2="21"/><line x1="12" y1="17" x2="12" y2="21"/></svg>
                </div>
                <div>
                  <div style="font-weight:600">MacBook Pro (Zhang G.)</div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Last seen: Jan 15, 2024 · IP: 192.168.x.x</div>
                </div>
                <div style="margin-left:auto">
                  <button class="btn btn-ghost btn-sm">Revoke</button>
                </div>
              </div>
              <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-2);background:var(--color-surface);border-radius:var(--radius-sm)">
                <div style="width:32px;height:32px;border-radius:var(--radius-md);background:var(--color-info-subtle);display:flex;align-items:center;justify-content:center">
                  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="var(--color-info)" stroke-width="2"><rect x="2" y="3" width="20" height="14" rx="2" ry="2"/><line x1="8" y1="21" x2="16" y2="21"/><line x1="12" y1="17" x2="12" y2="21"/></svg>
                </div>
                <div>
                  <div style="font-weight:600">iPhone 14 (Personal)</div>
                  <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Last seen: Jan 14, 2024 · IP: 10.0.x.x</div>
                </div>
                <div style="margin-left:auto">
                  <button class="btn btn-ghost btn-sm">Revoke</button>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label class="form-label">Audit Log Access</label>
            <div style="display:flex;align-items:center;gap:var(--space-3)">
              <div class="toggle">
                <div class="toggle-knob"></div>
              </div>
              <span>Allow access to last 90 days of audit trail</span>
            </div>
          </div>
          <div style="margin-top:var(--space-6)">
            <button class="btn btn-primary">Save Security Settings</button>
          </div>
        </div>

        <!-- Advanced Section -->
        <div class="settings-section" id="section-advanced">
          <h2 style="font-size:var(--text-lg);font-weight:600;margin-bottom:var(--space-4)">Advanced</h2>
          <div class="card" style="margin-bottom:var(--space-4)">
            <div class="card-header">
              <span class="card-title">API Keys</span>
            </div>
            <div class="card-body">
              <div style="display:flex;flex-direction:column;gap:var(--space-3)">
                <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-2);background:var(--color-surface);border-radius:var(--radius-sm)">
                  <div style="width:28px;height:28px;border-radius:var(--radius-md);background:var(--color-success-subtle);display:flex;align-items:center;justify-content:center">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="var(--color-success)" stroke-width="2"><key></key></svg>
                  </div>
                  <div style="flex:1">
                    <div style="font-weight:600;font-size:var(--text-sm)">CI Automation Key</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Scope: read:reports, write:tasks, manage:integrations</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:1px">Created: Jan 10, 2024</div>
                  </div>
                  <div style="display:flex;gap:var(--space-2)">
                    <button class="btn btn-sm btn-ghost">View</button>
                    <button class="btn btn-sm btn-ghost">Rotate</button>
                  </div>
                </div>
                <div style="display:flex;align-items:center;gap:var(--space-3);padding:var(--space-2);background:var(--color-surface);border-radius:var(--radius-sm)">
                  <div style="width:28px;height:28px;border-radius:var(--radius-md);background:var(--color-warning-subtle);display:flex;align-items:center;justify-content:center">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="var(--color-warning)" stroke-width="2"><key></key></svg>
                  </div>
                  <div style="flex:1">
                    <div style="font-weight:600;font-size:var(--text-sm)">External Bot Key</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">Scope: read:projects, execute:ai</div>
                    <div style="font-size:var(--text-xs);color:var(--color-text-quaternary);margin-top:1px">Created: Dec 5, 2023</div>
                  </div>
                  <div style="display:flex;gap:var(--space-2)">
                    <button class="btn btn-sm btn-ghost">View</button>
                    <button class="btn btn-sm btn-ghost">Revoke</button>
                  </div>
                </div>
              </div>
              <div style="margin-top:var(--space-3)">
                <button class="btn btn-secondary btn-sm">+ Create New API Key</button>
              </div>
            </div>
          </div>

          <div class="card" style="margin-bottom:var(--space-4)">
            <div class="card-header">
              <span class="card-title">Custom Fields</span>
            </div>
            <div class="card-body">
              <div style="display:grid;grid-template-columns:1fr 1fr 1fr;gap:var(--space-2) var(--space-4)">
                <div>
                  <label class="form-label" style="font-size:var(--text-xs)">Field Name</label>
                  <input type="text" class="form-input" value="Thermal Grade" />
                </div>
                <div>
                  <label class="form-label" style="font-size:var(--text-xs)">Type</label>
                  <select class="form-select">
                    <option>Select...</option>
                    <option>Text</option>
                    <option>Number</option>
                    <option>Enum</option>
                    <option>Date</option>
                    <option>Boolean</option>
                  </select>
                </div>
                <div>
                  <label class="form-label" style="font-size:var(--text-xs)">Project Scope</label>
                  <select class="form-select">
                    <option>All Projects</option>
                    <option>BMS-2024</option>
                    <option>THERM-03</option>
                  </select>
                </div>
              </div>
              <div style="margin-top:var(--space-3);">
                <button class="btn btn-primary btn-sm">Add Field</button>
                <button class="btn btn-secondary btn-sm" style="margin-left:var(--space-2)">Cancel</button>
              </div>
              <div style="margin-top:var(--space-4);font-size:var(--text-xs);color:var(--color-text-quaternary)">
                Custom fields appear in task/project edit forms and can be used in filters, reports, and AI analysis.
              </div>
            </div>
          </div>

          <div class="card">
            <div class="card-header">
              <span class="card-title">Automation Rules</span>
            </div>
            <div class="card-body">
              <div style="display:flex;flex-direction:column;gap:var(--space-3)">
                <div class="automation-rule">
                  <div style="display:flex;align-items:center;gap:var(--space-3)">
                    <div style="width:24px;height:24px;border-radius:var(--radius-sm);background:var(--color-success-subtle);display:flex;align-items:center;justify-content:center">
                      <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="var(--color-success)" stroke-width="2"><polyline points="20 6 9 17 4 12"/></svg>
                    </div>
                    <div style="flex:1">
                      <div style="font-weight:600">Auto-close completed tasks</div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">When status = Done → move to archive after 7 days</div>
                    </div>
                    <div style="display:flex;gap:var(--space-2)">
                      <button class="btn btn-sm btn-ghost">Edit</button>
                      <button class="btn btn-sm btn-ghost">Disable</button>
                    </div>
                  </div>
                </div>
                <div class="automation-rule">
                  <div style="display:flex;align-items:center;gap:var(--space-3)">
                    <div style="width:24px;height:24px;border-radius:var(--radius-sm);background:var(--color-accent-subtle);display:flex;align-items:center;justify-content:center">
                      <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="var(--color-accent)" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
                    </div>
                    <div style="flex:1">
                      <div style="font-weight:600">AI draft on overdue safety reviews</div>
                      <div style="font-size:var(--text-xs);color:var(--color-text-quaternary)">If SR due date passed & no progress >80% → generate draft email + report outline</div>
                    </div>
                    <div style="display:flex;gap:var(--space-2)">
                      <button class="btn btn-sm btn-ghost">Edit</button>
                      <button class="btn btn-sm btn-ghost">Enable</button>
                    </div>
                  </div>
                </div>
              </div>
              <div style="margin-top:var(--space-3)">
                <button class="btn btn-secondary btn-sm">+ Create Rule</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- ===== FOOTER & SCRIPTS ===== -->
<div class="footer">
  <div style="display:flex;justify-content:space-between;align-items:center;width:100%">
    <div style="display:flex;gap:var(--space-3)">
      <span>© 2024 BST Technology Co., Ltd.</span>
      <span>•</span>
      <a href="#" style="color:var(--color-text-tertiary);text-decoration:none">Privacy Policy</a>
      <span>•</span>
      <a href="#" style="color:var(--color-text-tertiary);text-decoration:none">Terms of Use</a>
    </div>
    <div style="display:flex;gap:var(--space-3)">
      <span style="color:var(--color-text-quaternary)">v2.1.4</span>
      <span style="color:var(--color-text-quaternary)">•</span>
      <span style="color:var(--color-success)">Online</span>
    </div>
  </div>
</div>

<script>
// ===== CORE UI CONTROLLERS =====
const pages = document.querySelectorAll('.page-section');
const sidebarItems = document.querySelectorAll('.sidebar-item');

// Navigation
sidebarItems.forEach(item => {
  item.addEventListener('click', () => {
    // Remove active from all
    sidebarItems.forEach(i => i.classList.remove('active'));
    pages.forEach(p => p.classList.remove('active'));

    // Set active on clicked
    item.classList.add('active');
    const targetId = item.getAttribute('data-page');
    document.getElementById(targetId).classList.add('active');
  });
});

// Theme Toggle
function toggleTheme() {
  document.body.classList.toggle('dark-theme');
  const themeToggle = document.querySelector('.theme-toggle');
  const sunIcon = themeToggle.querySelector('.icon-sun');
  const moonIcon = themeToggle.querySelector('.icon-moon');
  sunIcon.style.display = document.body.classList.contains('dark-theme') ? 'none' : 'inline';
  moonIcon.style.display = document.body.classList.contains('dark-theme') ? 'inline' : 'none';
}

// Command Palette (basic)
document.addEventListener('keydown', (e) => {
  if ((e.metaKey || e.ctrlKey) && e.key === 'k') {
    e.preventDefault();
    document.querySelector('.command-palette').classList.add('active');
    setTimeout(() => document.querySelector('.command-input').focus(), 100);
  }
});

// Dashboard Mode Switcher
function switchHomeMode(mode) {
  document.querySelectorAll('.mode-switcher-btn').forEach(btn => btn.classList.remove('active'));
  document.getElementById(`btn${mode.charAt(0).toUpperCase() + mode.slice(1)}Mode`).classList.add('active');
  document.getElementById('defaultModeContent').style.display = mode === 'default' ? 'block' : 'none';
  document.getElementById('aiModeContent').style.display = mode === 'ai' ? 'block' : 'none';
}

// Project View Switcher
function switchProjectView(view) {
  document.querySelectorAll('.project-view-content').forEach(el => el.classList.remove('active'));
  document.getElementById(`projectView${view.charAt(0).toUpperCase() + view.slice(1)}`).classList.add('active');
  document.querySelectorAll('.view-switcher-btn').forEach(btn => btn.classList.remove('active'));
  event.target.classList.add('active');
}

// Safety View Switcher
function switchSafetyView(view) {
  document.querySelectorAll('.safety-view-content').forEach(el => el.classList.remove('active'));
  document.getElementById(`safetyView${view.charAt(0).toUpperCase() + view.slice(1)}`).classList.add('active');
  document.querySelectorAll('.view-switcher-btn').forEach(btn => btn.classList.remove('active'));
  event.target.classList.add('active');
}

// Performance Tab Switcher
function switchPerfTab(tab) {
  document.querySelectorAll('.project-view-content').forEach(el => el.classList.remove('active'));
  document.getElementById(`perfTab${tab.charAt(0).toUpperCase() + tab.slice(1)}`).classList.add('active');
  document.querySelectorAll('.tab-item').forEach(btn => btn.classList.remove('active'));
  event.target.classList.add('active');
}

// Patent View Switcher
function switchPatentView(view) {
  document.querySelectorAll('.project-view-content').forEach(el => el.classList.remove('active'));
  document.getElementById(`patentView${view.charAt(0).toUpperCase() + view.slice(1)}`).classList.add('active');
  document.querySelectorAll('.view-switcher-btn').forEach(btn => btn.classList.remove('active'));
  event.target.classList.add('active');
}

// Report View Switcher
function switchReportView(view) {
  document.querySelectorAll('.project-view-content').forEach(el => el.classList.remove('active'));
  document.getElementById(`reportView${view.charAt(0).toUpperCase() + view.slice(1)}`).classList.add('active');
  document.querySelectorAll('.view-switcher-btn').forEach(btn => btn.classList.remove('active'));
  event.target.classList.add('active');
}

// Settings Section Switcher
function showSettingSection(section) {
  document.querySelectorAll('.settings-section').forEach(el => el.classList.remove('active'));
  document.getElementById(`section-${section}`).classList.add('active');
  document.querySelectorAll('.settings-item').forEach(el => el.classList.remove('active'));
  event.target.closest('.settings-item').classList.add('active');
}

// AI Send
function sendAIQuery() {
  const input = document.querySelector('.ai-input-field');
  const val = input.value.trim();
  if (!val) return;

  // Add user message
  const messages = document.querySelector('.ai-messages');
  const userMsg = document.createElement('div');
  userMsg.className = 'ai-message user';
  userMsg.innerHTML = `
    <div class="ai-avatar human">
      <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8zm-1-12h-2v4H7v2h2v4h2v-4h2V7h-2z"/>
      </svg>
    </div>
    <div class="ai-bubble">${val}</div>
  `;
  messages.appendChild(userMsg);
  messages.scrollTop = messages.scrollHeight;

  // Simulate AI response after delay
  setTimeout(() => {
    const aiMsg = document.createElement('div');
    aiMsg.className = 'ai-message assistant';
    aiMsg.innerHTML = `
      <div class="ai-avatar assistant">
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2">
          <circle cx="12" cy="12" r="10"/>
          <path d="M8 12h8"/>
          <path d="M12 8v8"/>
        </svg>
      </div>
      <div class="ai-bubble">I'm processing your request: "<strong>${val}</strong>".<br/><br/>This is a simulation. In the real system, BST AI would analyze your project data and reply with actionable insights.</div>
    `;
    messages.appendChild(aiMsg);
    messages.scrollTop = messages.scrollHeight;
    input.value = '';
  }, 800);
}

// Initialize
document.addEventListener('DOMContentLoaded', () => {
  // Default active page
  document.getElementById('page-dashboard').classList.add('active');
  document.querySelector('[data-page="page-dashboard"]').classList.add('active');

  // Set initial theme
  if (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches) {
    document.body.classList.add('dark-theme');
  }
});
</script>

</body>
</html>
