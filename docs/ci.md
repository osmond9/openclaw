<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>BST Platform V2.0 系统架构文档</title>
  <style>
    :root {
      --primary: #2563eb;
      --primary-dark: #1e40af;
      --secondary: #7c3aed;
      --accent: #0891b2;
      --success: #059669;
      --warning: #d97706;
      --danger: #dc2626;
      --bg: #f8fafc;
      --card-bg: #ffffff;
      --text: #1e293b;
      --text-muted: #64748b;
      --border: #e2e8f0;
      --code-bg: #1e293b;
    }

    * { box-sizing: border-box; margin: 0; padding: 0; }

    body {
      font-family: 'Segoe UI', 'PingFang SC', 'Microsoft YaHei', sans-serif;
      background: var(--bg);
      color: var(--text);
      line-height: 1.7;
    }

    /* ===== HEADER ===== */
    .site-header {
      background: linear-gradient(135deg, #1e3a8a 0%, #2563eb 50%, #7c3aed 100%);
      color: #fff;
      padding: 48px 40px 36px;
      position: relative;
      overflow: hidden;
    }
    .site-header::before {
      content: '';
      position: absolute;
      top: -60px; right: -60px;
      width: 300px; height: 300px;
      background: rgba(255,255,255,0.05);
      border-radius: 50%;
    }
    .site-header .badge {
      display: inline-block;
      background: rgba(255,255,255,0.15);
      border: 1px solid rgba(255,255,255,0.3);
      border-radius: 20px;
      padding: 4px 14px;
      font-size: 12px;
      letter-spacing: 1px;
      margin-bottom: 14px;
    }
    .site-header h1 {
      font-size: 2.4rem;
      font-weight: 700;
      margin-bottom: 10px;
    }
    .site-header p {
      font-size: 1rem;
      opacity: 0.85;
      max-width: 680px;
    }
    .header-stats {
      display: flex;
      gap: 32px;
      margin-top: 28px;
      flex-wrap: wrap;
    }
    .header-stats .stat {
      text-align: center;
    }
    .header-stats .stat-num {
      font-size: 1.8rem;
      font-weight: 700;
      display: block;
    }
    .header-stats .stat-label {
      font-size: 0.78rem;
      opacity: 0.75;
    }

    /* ===== LAYOUT ===== */
    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 36px 24px;
    }

    /* ===== TOC ===== */
    .toc-card {
      background: var(--card-bg);
      border-radius: 12px;
      border: 1px solid var(--border);
      padding: 28px 32px;
      margin-bottom: 36px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.04);
    }
    .toc-card h2 {
      font-size: 1.1rem;
      color: var(--primary);
      margin-bottom: 16px;
      display: flex;
      align-items: center;
      gap: 8px;
    }
    .toc-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
      gap: 8px;
    }
    .toc-item {
      display: flex;
      align-items: center;
      gap: 8px;
      padding: 8px 12px;
      border-radius: 8px;
      background: #f1f5f9;
      font-size: 0.88rem;
      color: var(--text);
      text-decoration: none;
      transition: background 0.2s;
    }
    .toc-item:hover { background: #dbeafe; color: var(--primary); }
    .toc-item .toc-num {
      font-size: 0.75rem;
      color: var(--primary);
      font-weight: 700;
      min-width: 22px;
    }

    /* ===== SECTIONS ===== */
    .section {
      background: var(--card-bg);
      border-radius: 14px;
      border: 1px solid var(--border);
      margin-bottom: 32px;
      overflow: hidden;
      box-shadow: 0 2px 10px rgba(0,0,0,0.04);
    }
    .section-header {
      padding: 20px 28px;
      border-bottom: 1px solid var(--border);
      display: flex;
      align-items: center;
      gap: 12px;
    }
    .section-icon {
      width: 40px; height: 40px;
      border-radius: 10px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.2rem;
      flex-shrink: 0;
    }
    .section-header h2 {
      font-size: 1.2rem;
      font-weight: 700;
      color: var(--text);
    }
    .section-header .sub {
      font-size: 0.82rem;
      color: var(--text-muted);
      margin-top: 2px;
    }
    .section-body { padding: 24px 28px; }

    /* ===== SUBSECTION ===== */
    .subsection { margin-bottom: 28px; }
    .subsection:last-child { margin-bottom: 0; }
    .subsection h3 {
      font-size: 1rem;
      font-weight: 600;
      color: var(--primary-dark);
      margin-bottom: 12px;
      padding-left: 10px;
      border-left: 3px solid var(--primary);
    }
    .subsection h4 {
      font-size: 0.92rem;
      font-weight: 600;
      color: var(--text);
      margin: 12px 0 8px;
    }

    /* ===== VERSION TABLE ===== */
    .version-table {
      width: 100%;
      border-collapse: collapse;
      font-size: 0.88rem;
    }
    .version-table th {
      background: #f1f5f9;
      padding: 10px 14px;
      text-align: left;
      font-weight: 600;
      color: var(--text-muted);
      border-bottom: 2px solid var(--border);
    }
    .version-table td {
      padding: 10px 14px;
      border-bottom: 1px solid var(--border);
      vertical-align: top;
    }
    .version-table tr:last-child td { border-bottom: none; }
    .version-table tr:hover td { background: #f8fafc; }

    /* ===== ROLE CARDS ===== */
    .role-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
      gap: 14px;
    }
    .role-card {
      border-radius: 10px;
      padding: 16px;
      border: 1px solid var(--border);
      transition: transform 0.2s, box-shadow 0.2s;
    }
    .role-card:hover {
      transform: translateY(-2px);
      box-shadow: 0 6px 20px rgba(0,0,0,0.08);
    }
    .role-card .role-icon { font-size: 1.6rem; margin-bottom: 8px; }
    .role-card .role-name { font-weight: 700; font-size: 0.9rem; margin-bottom: 4px; }
    .role-card .role-desc { font-size: 0.78rem; color: var(--text-muted); }

    /* ===== PERM TABLE ===== */
    .perm-table {
      width: 100%;
      border-collapse: collapse;
      font-size: 0.8rem;
      overflow-x: auto;
    }
    .perm-table th {
      background: #1e293b;
      color: #fff;
      padding: 8px 10px;
      text-align: center;
      font-weight: 500;
      white-space: nowrap;
    }
    .perm-table td {
      padding: 8px 10px;
      border-bottom: 1px solid var(--border);
      text-align: center;
    }
    .perm-table td:first-child { text-align: left; font-weight: 500; background: #f8fafc; }
    .perm-table tr:hover td { background: #f1f5f9; }
    .perm-table tr:hover td:first-child { background: #e2e8f0; }
    .check { color: var(--success); font-size: 1rem; }
    .cross { color: #cbd5e1; font-size: 1rem; }

    /* ===== NAV TREE ===== */
    .nav-tree {
      font-size: 0.87rem;
      border: 1px solid var(--border);
      border-radius: 10px;
      overflow: hidden;
    }
    .nav-tree .tree-root {
      background: #1e293b;
      color: #fff;
      padding: 10px 16px;
      font-weight: 600;
      font-size: 0.9rem;
    }
    .tree-group { border-bottom: 1px solid var(--border); }
    .tree-group:last-child { border-bottom: none; }
    .tree-group-header {
      background: #f1f5f9;
      padding: 8px 16px;
      font-weight: 600;
      color: var(--primary-dark);
      border-bottom: 1px solid var(--border);
      font-size: 0.85rem;
    }
    .tree-items { padding: 8px 0; }
    .tree-item {
      padding: 5px 16px 5px 32px;
      color: var(--text);
      font-size: 0.82rem;
      position: relative;
    }
    .tree-item::before {
      content: '├─';
      position: absolute;
      left: 16px;
      color: #94a3b8;
      font-size: 0.75rem;
    }
    .tree-item:last-child::before { content: '└─'; }
    .tree-sub {
      padding: 4px 16px 4px 52px;
      color: var(--text-muted);
      font-size: 0.78rem;
      position: relative;
    }
    .tree-sub::before {
      content: '◦';
      position: absolute;
      left: 40px;
      color: #94a3b8;
    }

    /* ===== FEATURE GRID ===== */
    .feature-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
      gap: 16px;
    }
    .feature-block {
      border-radius: 10px;
      border: 1px solid var(--border);
      overflow: hidden;
    }
    .feature-block-header {
      padding: 12px 16px;
      font-weight: 600;
      font-size: 0.88rem;
      display: flex;
      align-items: center;
      gap: 8px;
    }
    .feature-block-body {
      padding: 12px 16px;
      font-size: 0.82rem;
    }
    .feature-list { list-style: none; }
    .feature-list li {
      padding: 4px 0;
      border-bottom: 1px dashed var(--border);
      display: flex;
      align-items: flex-start;
      gap: 6px;
    }
    .feature-list li:last-child { border-bottom: none; }
    .feature-list li::before { content: '▸'; color: var(--primary); flex-shrink: 0; }

    /* ===== PHASE CARDS ===== */
    .phase-list { display: flex; flex-direction: column; gap: 16px; }
    .phase-card {
      border-radius: 10px;
      border: 1px solid var(--border);
      overflow: hidden;
    }
    .phase-header {
      padding: 12px 20px;
      display: flex;
      align-items: center;
      gap: 12px;
      flex-wrap: wrap;
    }
    .phase-num {
      font-size: 0.75rem;
      font-weight: 700;
      padding: 3px 10px;
      border-radius: 20px;
      background: rgba(255,255,255,0.25);
      color: #fff;
      letter-spacing: 0.5px;
    }
    .phase-title { font-weight: 700; font-size: 0.95rem; color: #fff; }
    .phase-duration { font-size: 0.78rem; color: rgba(255,255,255,0.8); margin-left: auto; }
    .phase-body { padding: 16px 20px; font-size: 0.85rem; }
    .phase-body ul { list-style: none; columns: 2; gap: 8px; }
    .phase-body ul li {
      padding: 3px 0;
      display: flex;
      align-items: center;
      gap: 6px;
      break-inside: avoid;
    }
    .phase-body ul li::before { content: '✓'; color: var(--success); font-weight: 700; }

    /* ===== TECH STACK ===== */
    .tech-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
      gap: 12px;
    }
    .tech-item {
      background: #f8fafc;
      border: 1px solid var(--border);
      border-radius: 8px;
      padding: 12px 14px;
      font-size: 0.83rem;
    }
    .tech-item .tech-category {
      font-size: 0.72rem;
      text-transform: uppercase;
      letter-spacing: 0.8px;
      color: var(--text-muted);
      margin-bottom: 6px;
      font-weight: 600;
    }
    .tech-item .tech-name {
      font-weight: 700;
      color: var(--text);
      margin-bottom: 2px;
    }
    .tech-item .tech-detail { color: var(--text-muted); font-size: 0.75rem; }

    /* ===== AI LEVELS ===== */
    .ai-levels { display: flex; flex-direction: column; gap: 12px; }
    .ai-level {
      border-radius: 10px;
      border: 1px solid var(--border);
      overflow: hidden;
      display: flex;
    }
    .ai-level-badge {
      padding: 16px 20px;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      min-width: 80px;
      font-weight: 700;
    }
    .ai-level-badge .lv { font-size: 1.1rem; }
    .ai-level-badge .lv-label { font-size: 0.7rem; opacity: 0.85; margin-top: 2px; }
    .ai-level-body { padding: 14px 18px; font-size: 0.85rem; flex: 1; }
    .ai-level-body h4 { font-weight: 600; margin-bottom: 6px; }
    .ai-level-body ul { list-style: none; }
    .ai-level-body ul li {
      padding: 3px 0;
      font-size: 0.82rem;
      color: var(--text-muted);
      display: flex;
      align-items: center;
      gap: 6px;
    }
    .ai-level-body ul li::before { content: '▸'; color: var(--primary); }

    /* ===== FLOW CHART ===== */
    .flow-wrap {
      background: #f8fafc;
      border-radius: 10px;
      border: 1px solid var(--border);
      padding: 20px;
      overflow-x: auto;
    }
    .flow-row {
      display: flex;
      align-items: center;
      gap: 0;
      flex-wrap: wrap;
      justify-content: center;
      margin-bottom: 12px;
    }
    .flow-node {
      padding: 10px 18px;
      border-radius: 8px;
      font-size: 0.82rem;
      font-weight: 600;
      text-align: center;
      white-space: nowrap;
    }
    .flow-arrow {
      font-size: 1.2rem;
      color: #94a3b8;
      padding: 0 4px;
    }
    .flow-diamond {
      padding: 10px 18px;
      background: #fef3c7;
      border: 2px solid #f59e0b;
      border-radius: 50%;
      font-size: 0.78rem;
      font-weight: 600;
      text-align: center;
    }

    /* ===== SECURITY TABLE ===== */
    .sec-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
      gap: 16px;
    }
    .sec-block {
      border-radius: 10px;
      border: 1px solid var(--border);
      overflow: hidden;
    }
    .sec-block-header {
      padding: 10px 16px;
      font-weight: 700;
      font-size: 0.88rem;
      display: flex;
      align-items: center;
      gap: 8px;
    }
    .sec-block-body { padding: 12px 16px; }
    .sec-item {
      display: flex;
      align-items: flex-start;
      gap: 8px;
      padding: 6px 0;
      border-bottom: 1px dashed var(--border);
      font-size: 0.82rem;
    }
    .sec-item:last-child { border-bottom: none; }
    .sec-item .si-label {
      font-weight: 600;
      min-width: 80px;
      color: var(--text-muted);
    }

    /* ===== PERF TABLE ===== */
    .perf-table {
      width: 100%;
      border-collapse: collapse;
      font-size: 0.85rem;
    }
    .perf-table th {
      background: #f1f5f9;
      padding: 10px 14px;
      text-align: left;
      font-weight: 600;
      color: var(--text-muted);
      border-bottom: 2px solid var(--border);
    }
    .perf-table td {
      padding: 10px 14px;
      border-bottom: 1px solid var(--border);
    }
    .perf-table tr:last-child td { border-bottom: none; }
    .perf-table tr:hover td { background: #f8fafc; }
    .target-badge {
      display: inline-block;
      padding: 2px 10px;
      border-radius: 20px;
      font-size: 0.75rem;
      font-weight: 600;
    }

    /* ===== SCREEN MOCKUP ===== */
    .mockup-wrap {
      background: #1e293b;
      border-radius: 12px;
      overflow: hidden;
      margin-bottom: 20px;
    }
    .mockup-bar {
      background: #0f172a;
      padding: 10px 16px;
      display: flex;
      align-items: center;
      gap: 8px;
    }
    .mockup-dot {
      width: 10px; height: 10px;
      border-radius: 50%;
    }
    .mockup-title {
      color: #94a3b8;
      font-size: 0.78rem;
      margin-left: 8px;
    }
    .mockup-body {
      padding: 20px;
      font-family: 'Courier New', monospace;
      font-size: 0.78rem;
      color: #94a3b8;
      line-height: 1.6;
      overflow-x: auto;
      white-space: pre;
    }

    /* ===== TAG / BADGE ===== */
    .tag {
      display: inline-block;
      padding: 2px 8px;
      border-radius: 4px;
      font-size: 0.72rem;
      font-weight: 600;
      margin: 2px;
    }
    .tag-blue   { background: #dbeafe; color: #1d4ed8; }
    .tag-green  { background: #dcfce7; color: #15803d; }
    .tag-orange { background: #ffedd5; color: #c2410c; }
    .tag-purple { background: #ede9fe; color: #6d28d9; }
    .tag-red    { background: #fee2e2; color: #b91c1c; }
    .tag-gray   { background: #f1f5f9; color: #475569; }
    .tag-cyan   { background: #cffafe; color: #0e7490; }

    /* ===== PROGRESS BAR ===== */
    .progress-bar-wrap { background: #e2e8f0; border-radius: 20px; height: 8px; width: 100%; overflow: hidden; }
    .progress-bar-fill { height: 100%; border-radius: 20px; }

    /* ===== RISK TABLE ===== */
    .risk-table { width: 100%; border-collapse: collapse; font-size: 0.83rem; }
    .risk-table th {
      background: #1e293b; color: #fff;
      padding: 10px 12px; text-align: left; font-weight: 500;
    }
    .risk-table td { padding: 10px 12px; border-bottom: 1px solid var(--border); }
    .risk-table tr:last-child td { border-bottom: none; }
    .risk-high   { color: var(--danger); font-weight: 700; }
    .risk-med    { color: var(--warning); font-weight: 700; }
    .risk-low    { color: var(--success); font-weight: 700; }

    /* ===== FOOTER ===== */
    .site-footer {
      background: #1e293b;
      color: #94a3b8;
      padding: 32px 40px;
      font-size: 0.82rem;
      text-align: center;
    }
    .site-footer strong { color: #fff; }

    /* ===== RESPONSIVE ===== */
    @media (max-width: 768px) {
      .site-header h1 { font-size: 1.6rem; }
      .header-stats { gap: 20px; }
      .section-body { padding: 16px 16px; }
      .phase-body ul { columns: 1; }
      .perm-table { font-size: 0.72rem; }
    }
  </style>
</head>
<body>

<!-- ============================================================
     HEADER
     ============================================================ -->
<header class="site-header">
  <div class="badge">📋 系统架构文档 · V2.0</div>
  <h1>🚀 BST Platform V2.0<br>系统整体框架说明</h1>
  <p>Battery Safety Test 综合管理平台 — 涵盖用户体系、功能模块、AI 智能助手、安全机制、绩效管理及技术选型的完整架构说明。</p>
  <div class="header-stats">
    <div class="stat">
      <span class="stat-num">6</span>
      <span class="stat-label">用户角色</span>
    </div>
    <div class="stat">
      <span class="stat-num">8</span>
      <span class="stat-label">核心模块</span>
    </div>
    <div class="stat">
      <span class="stat-num">3</span>
      <span class="stat-label">AI 智能层级</span>
    </div>
    <div class="stat">
      <span class="stat-num">5</span>
      <span class="stat-label">实施阶段</span>
    </div>
  </div>
</header>

<div class="container">

  <!-- ===== TOC ===== -->
  <div class="toc-card">
    <h2>📑 目录导航</h2>
    <div class="toc-grid">
      <a href="#s1" class="toc-item"><span class="toc-num">01</span>文档概述与版本记录</a>
      <a href="#s2" class="toc-item"><span class="toc-num">02</span>用户角色与权限体系</a>
      <a href="#s3" class="toc-item"><span class="toc-num">03</span>核心功能模块导航</a>
      <a href="#s4" class="toc-item"><span class="toc-num">04</span>安全评审管理</a>
      <a href="#s5" class="toc-item"><span class="toc-num">05</span>项目与任务管理</a>
      <a href="#s6" class="toc-item"><span class="toc-num">06</span>AI 智能助手体系</a>
      <a href="#s7" class="toc-item"><span class="toc-num">07</span>绩效与报告中心</a>
      <a href="#s8" class="toc-item"><span class="toc-num">08</span>技术架构与安全机制</a>
      <a href="#s9" class="toc-item"><span class="toc-num">09</span>实施路线图</a>
      <a href="#s10" class="toc-item"><span class="toc-num">10</span>风险评估与缓解措施</a>
    </div>
  </div>

  <!-- ============================================================
       SECTION 1 · 文档概述
       ============================================================ -->
  <div class="section" id="s1">
    <div class="section-header">
      <div class="section-icon" style="background:#dbeafe;">📄</div>
      <div>
        <h2>1. 文档概述与版本记录</h2>
        <div class="sub">Document Overview & Version History</div>
      </div>
    </div>
    <div class="section-body">
      <div class="subsection">
        <h3>1.1 文档基本信息</h3>
        <table class="version-table">
          <tr><th>项目</th><th>内容</th></tr>
          <tr><td>文档名称</td><td>BST Platform V2.0 系统整体框架说明</td></tr>
          <tr><td>文档编号</td><td>BST-SYS-ARCH-2024-001</td></tr>
          <tr><td>版本</td><td>V2.0</td></tr>
          <tr><td>创建日期</td><td>2024-01-15</td></tr>
          <tr><td>最后更新</td><td>2024-01-20</td></tr>
          <tr><td>文档状态</td><td><span class="tag tag-green">✅ 已审核</span></td></tr>
          <tr><td>适用范围</td><td>电池安全测试综合管理平台全体用户及开发团队</td></tr>
        </table>
      </div>
      <div class="subsection">
        <h3>1.2 版本历史</h3>
        <table class="version-table">
          <thead><tr><th>版本</th><th>日期</th><th>修改人</th><th>变更内容摘要</th></tr></thead>
          <tbody>
            <tr><td>V1.0</td><td>2023-06-01</td><td>架构组</td><td>初始版本，基础功能定义</td></tr>
            <tr><td>V1.5</td><td>2023-10-15</td><td>产品组</td><td>增加 AI 助手模块、细化权限体系</td></tr>
            <tr><td>V2.0</td><td>2024-01-15</td><td>架构组</td><td>全面重构：新增安全评审工作流、绩效管理、报告中心；优化 UI 交互规范</td></tr>
          </tbody>
        </table>
      </div>
      <div class="subsection">
        <h3>1.3 术语缩写</h3>
        <div style="display:grid;grid-template-columns:repeat(auto-fill,minmax(200px,1fr));gap:8px;">
          <div style="background:#f8fafc;border:1px solid var(--border);border-radius:8px;padding:10px 14px;font-size:0.83rem;">
            <strong>BST</strong> — Battery Safety Test
          </div>
          <div style="background:#f8fafc;border:1px solid var(--border);border-radius:8px;padding:10px 14px;font-size:0.83rem;">
            <strong>SR</strong> — Safety Review（安全评审）
          </div>
          <div style="background:#f8fafc;border:1px solid var(--border);border-radius:8px;padding:10px 14px;font-size:0.83rem;">
            <strong>RBAC</strong> — Role-Based Access Control
          </div>
          <div style="background:#f8fafc;border:1px solid var(--border);border-radius:8px;padding:10px 14px;font-size:0.83rem;">
            <strong>KPI</strong> — Key Performance Indicator
          </div>
          <div style="background:#f8fafc;border:1px solid var(--border);border-radius:8px;padding:10px 14px;font-size:0.83rem;">
            <strong>API</strong> — Application Programming Interface
          </div>
          <div style="background:#f8fafc;border:1px solid var(--border);border-radius:8px;padding:10px 14px;font-size:0.83rem;">
            <strong>SLA</strong> — Service Level Agreement
          </div>
          <div style="background:#f8fafc;border:1px solid var(--border);border-radius:8px;padding:10px 14px;font-size:0.83rem;">
            <strong>CI/CD</strong> — Continuous Integration/Delivery
          </div>
          <div style="background:#f8fafc;border:1px solid var(--border);border-radius:8px;padding:10px 14px;font-size:0.83rem;">
            <strong>OKR</strong> — Objectives & Key Results
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- ============================================================
       SECTION 2 · 用户角色与权限
       ============================================================ -->
  <div class="section" id="s2">
    <div class="section-header">
      <div class="section-icon" style="background:#ede9fe;">👥</div>
      <div>
        <h2>2. 用户角色与权限体系</h2>
        <div class="sub">User Roles & Permission Matrix (RBAC)</div>
      </div>
    </div>
    <div class="section-body">

      <div class="subsection">
        <h3>2.1 角色概览</h3>
        <div class="role-grid">
          <div class="role-card" style="background:#eff6ff;border-color:#bfdbfe;">
            <div class="role-icon">🔴</div>
            <div class="role-name">超级管理员</div>
            <div class="role-desc">平台最高权限，负责系统配置、组织管理、审计日志</div>
          </div>
          <div class="role-card" style="background:#faf5ff;border-color:#ddd6fe;">
            <div class="role-icon">🟣</div>
            <div class="role-name">部门管理员</div>
            <div class="role-desc">负责本部门用户管理、权限分配、部门级报表</div>
          </div>
          <div class="role-card" style="background:#f0fdf4;border-color:#bbf7d0;">
            <div class="role-icon">🟢</div>
            <div class="role-name">安全评审专家</div>
            <div class="role-desc">负责安全评审发起、主持、结论输出及问题跟踪</div>
          </div>
          <div class="role-card" style="background:#fff7ed;border-color:#fed7aa;">
            <div class="role-icon">🟠</div>
            <div class="role-name">项目工程师</div>
            <div class="role-desc">执行项目任务、上传测试报告、参与评审</div>
          </div>
          <div class="role-card" style="background:#fffbeb;border-color:#fde68a;">
            <div class="role-icon">🟡</div>
            <div class="role-name">测试工程师</div>
            <div class="role-desc">负责测试计划执行、测试数据录入、问题反馈</div>
          </div>
          <div class="role-card" style="background:#f1f5f9;border-color:#e2e8f0;">
            <div class="role-icon">⚪</div>
            <div class="role-name">只读访客</div>
            <div class="role-desc">仅查看已授权的报告与数据，无编辑权限</div>
          </div>
        </div>
      </div>

      <div class="subsection">
        <h3>2.2 权限矩阵</h3>
        <div style="overflow-x:auto;">
          <table class="perm-table">
            <thead>
              <tr>
                <th>功能模块</th>
                <th>超级管理员</th>
                <th>部门管理员</th>
                <th>安全评审专家</th>
                <th>项目工程师</th>
                <th>测试工程师</th>
                <th>只读访客</th>
              </tr>
            </thead>
            <tbody>
              <tr><td>系统配置</td><td><span class="check">✔</span></td><td><span class="cross">✘</span></td><td><span class="cross">✘</span></td><td><span class="cross">✘</span></td><td><span class="cross">✘</span></td><td><span class="cross">✘</span></td></tr>
              <tr><td>用户管理</td><td><span class="check">✔</span></td><td><span class="check">✔</span></td><td><span class="cross">✘</span></td><td><span class="cross">✘</span></td><td><span class="cross">✘</span></td><td><span class="cross">✘</span></td></tr>
              <tr><td>安全评审 — 发起</td><td><span class="check">✔</span></td><td><span class="check">✔</span></td><td><span class="check">✔</span></td><td><span class="cross">✘</span></td><td><span class="cross">✘</span></td><td><span class="cross">✘</span></td></tr>
              <tr><td>安全评审 — 参与</td><td><span class="check">✔</span></td><td><span class="check">✔</span></td><td><span class="check">✔</span></td><td><span class="check">✔</span></td><td><span class="check">✔</span></td><td><span class="cross">✘</span></td></tr>
              <tr><td>项目创建</td><td><span class="check">✔</span></td><td><span class="check">✔</span></td><td><span class="cross">✘</span></td><td><span class="check">✔</span></td><td><span class="cross">✘</span></td><td><span class="cross">✘</span></td></tr>
              <tr><td>任务分配</td><td><span class="check">✔</span></td><td><span class="check">✔</span></td><td><span class="cross">✘</span></td><td><span class="check">✔</span></td><td><span class="cross">✘</span></td><td><span class="cross">✘</span></td></tr>
              <tr><td>测试数据录入</td><td><span class="check">✔</span></td><td><span class="check">✔</span></td><td><span class="check">✔</span></td><td><span class="check">✔</span></td><td><span class="check">✔</span></td><td><span class="cross">✘</span></td></tr>
              <tr><td>报告生成</td><td><span class="check">✔</span></td><td><span class="check">✔</span></td><td><span class="check">✔</span></td><td><span class="check">✔</span></td><td><span class="cross">✘</span></td><td><span class="cross">✘</span></td></tr>
              <tr><td>绩效查看（全员）</td><td><span class="check">✔</span></td><td><span class="check">✔</span></td><td><span class="cross">✘</span></td><td><span class="cross">✘</span></td><td><span class="cross">✘</span></td><td><span class="cross">✘</span></td></tr>
              <tr><td>AI 助手</td><td><span class="check">✔</span></td><td><span class="check">✔</span></td><td><span class="check">✔</span></td><td><span class="check">✔</span></td><td><span class="check">✔</span></td><td><span class="cross">✘</span></td></tr>
              <tr><td>审计日志</td><td><span class="check">✔</span></td><td><span class="cross">✘</span></td><td><span class="cross">✘</span></td><td><span class="cross">✘</span></td><td><span class="cross">✘</span></td><td><span class="cross">✘</span></td></tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

  <!-- ============================================================
       SECTION 3 · 核心功能模块导航
       ============================================================ -->
  <div class="section" id="s3">
    <div class="section-header">
      <div class="section-icon" style="background:#dcfce7;">🗂️</div>
      <div>
        <h2>3. 核心功能模块导航</h2>
        <div class="sub">Core Module Navigation Tree</div>
      </div>
    </div>
    <div class="section-body">
      <div class="nav-tree">
        <div class="tree-root">🏠 BST Platform V2.0 — 主导航</div>

        <div class="tree-group">
          <div class="tree-group-header">📊 工作台 Dashboard</div>
          <div class="tree-items">
            <div class="tree-item">个人任务看板</div>
            <div class="tree-sub">今日待办 / 逾期提醒 / 优先级排序</div>
            <div class="tree-item">项目进度总览</div>
            <div class="tree-sub">Gantt 视图 / 燃尽图 / 里程碑</div>
            <div class="tree-item">待处理事项</div>
            <div class="tree-sub">评审待审批 / 问题待确认 / 报告待签发</div>
            <div class="tree-item">AI 快速入口</div>
          </div>
        </div>

        <div class="tree-group">
          <div class="tree-group-header">🛡️ 安全评审管理 Safety Review</div>
          <div class="tree-items">
            <div class="tree-item">评审列表 & 看板</div>
            <div class="tree-sub">按状态 / 按项目 / 按时间筛选</div>
            <div class="tree-item">评审发起向导</div>
            <div class="tree-sub">模板选择 → 参会人配置 → 议程设置</div>
            <div class="tree-item">评审详情页</div>
            <div class="tree-sub">会前准备 / 会中记录 / 会后跟踪</div>
            <div class="tree-item">问题追踪 & 闭环</div>
            <div class="tree-sub">问题分类 / 责任人 / 截止日期 / 验证</div>
            <div class="tree-item">评审结论输出</div>
            <div class="tree-sub">通过 / 有条件通过 / 驳回 / PDF 导出</div>
          </div>
        </div>

        <div class="tree-group">
          <div class="tree-group-header">📁 项目与任务管理 Project Management</div>
          <div class="tree-items">
            <div class="tree-item">项目列表 & 创建</div>
            <div class="tree-item">任务分解 WBS</div>
            <div class="tree-sub">树形结构 / 拖拽排序</div>
            <div class="tree-item">里程碑管理</div>
            <div class="tree-item">资源分配</div>
            <div class="tree-sub">人员 / 工时 / 设备</div>
            <div class="tree-item">风险登记册</div>
          </div>
        </div>

        <div class="tree-group">
          <div class="tree-group-header">🧪 测试管理 Test Management</div>
          <div class="tree-items">
            <div class="tree-item">测试计划</div>
            <div class="tree-item">测试用例库</div>
            <div class="tree-sub">分类管理 / 版本控制</div>
            <div class="tree-item">测试执行 & 结果录入</div>
            <div class="tree-item">测试报告</div>
            <div class="tree-sub">自动生成 / 人工批注</div>
          </div>
        </div>

        <div class="tree-group">
          <div class="tree-group-header">📈 绩效管理 Performance</div>
          <div class="tree-items">
            <div class="tree-item">个人 KPI 看板</div>
            <div class="tree-item">部门绩效分析</div>
            <div class="tree-item">专利 & 成果管理</div>
            <div class="tree-item">绩效考核周期</div>
          </div>
        </div>

        <div class="tree-group">
          <div class="tree-group-header">📋 报告中心 Report Center</div>
          <div class="tree-items">
            <div class="tree-item">个人月度报告</div>
            <div class="tree-item">部门月报</div>
            <div class="tree-item">安全评审摘要报告</div>
            <div class="tree-item">自定义报告模板</div>
          </div>
        </div>

        <div class="tree-group">
          <div class="tree-group-header">🤖 AI 智能助手 AI Assistant</div>
          <div class="tree-items">
            <div class="tree-item">自然语言查询</div>
            <div class="tree-item">智能摘要生成</div>
            <div class="tree-item">风险预测与预警</div>
            <div class="tree-item">自动化报告起草</div>
          </div>
        </div>

        <div class="tree-group">
          <div class="tree-group-header">⚙️ 系统管理 Admin</div>
          <div class="tree-items">
            <div class="tree-item">用户 & 组织管理</div>
            <div class="tree-item">角色 & 权限配置</div>
            <div class="tree-item">审计日志</div>
            <div class="tree-item">系统参数配置</div>
            <div class="tree-item">通知 & 消息中心</div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- ============================================================
       SECTION 4 · 安全评审管理
       ============================================================ -->
  <div class="section" id="s4">
    <div class="section-header">
      <div class="section-icon" style="background:#fee2e2;">🛡️</div>
      <div>
        <h2>4. 安全评审管理模块</h2>
        <div class="sub">Safety Review Management</div>
      </div>
    </div>
    <div class="section-body">

      <div class="subsection">
        <h3>4.1 评审生命周期</h3>
        <div class="flow-wrap">
          <div class="flow-row">
            <div class="flow-node" style="background:#dbeafe;color:#1d4ed8;">📝 发起申请</div>
            <div class="flow-arrow">→</div>
            <div class="flow-node" style="background:#ede9fe;color:#6d28d9;">👥 配置参会人</div>
            <div class="flow-arrow">→</div>
            <div class="flow-node" style="background:#dcfce7;color:#15803d;">📅 会前准备</div>
            <div class="flow-arrow">→</div>
            <div class="flow-node" style="background:#fff7ed;color:#c2410c;">🎯 评审会议</div>
            <div class="flow-arrow">→</div>
            <div class="flow-node" style="background:#fef3c7;color:#92400e;">⚠️ 问题登记</div>
            <div class="flow-arrow">→</div>
            <div class="flow-node" style="background:#f0fdf4;color:#15803d;">✅ 闭环确认</div>
            <div class="flow-arrow">→</div>
            <div class="flow-node" style="background:#f1f5f9;color:#475569;">📄 结论输出</div>
          </div>
        </div>
      </div>

      <div class="subsection">
        <h3>4.2 评审状态说明</h3>
        <div style="display:grid;grid-template-columns:repeat(auto-fill,minmax(200px,1fr));gap:12px;">
          <div style="border-radius:8px;border:1px solid #bfdbfe;background:#eff6ff;padding:14px;">
            <span class="tag tag-blue">草稿</span>
            <p style="font-size:0.82rem;margin-top:8px;color:var(--text-muted);">评审已创建，尚未提交，仅发起人可见。</p>
          </div>
          <div style="border-radius:8px;border:1px solid #fed7aa;background:#fff7ed;padding:14px;">
            <span class="tag tag-orange">待审批</span>
            <p style="font-size:0.82rem;margin-top:8px;color:var(--text-muted);">已提交，等待上级批准立项。</p>
          </div>
          <div style="border-radius:8px;border:1px solid #a5f3fc;background:#ecfeff;padding:14px;">
            <span class="tag tag-cyan">进行中</span>
            <p style="font-size:0.82rem;margin-top:8px;color:var(--text-muted);">评审已批准，正在执行评审流程。</p>
          </div>
          <div style="border-radius:8px;border:1px solid #fde68a;background:#fffbeb;padding:14px;">
            <span class="tag tag-orange">问题跟踪</span>
            <p style="font-size:0.82rem;margin-top:8px;color:var(--text-muted);">评审完成，存在待闭环问题。</p>
          </div>
          <div style="border-radius:8px;border:1px solid #bbf7d0;background:#f0fdf4;padding:14px;">
            <span class="tag tag-green">已通过</span>
            <p style="font-size:0.82rem;margin-top:8px;color:var(--text-muted);">所有问题已闭环，结论为通过。</p>
          </div>
          <div style="border-radius:8px;border:1px solid #fecaca;background:#fff5f5;padding:14px;">
            <span class="tag tag-red">已驳回</span>
            <p style="font-size:0.82rem;margin-top:8px;color:var(--text-muted);">评审结论为驳回，需重新立项。</p>
          </div>
        </div>
      </div>

      <div class="subsection">
        <h3>4.3 评审看板界面说明</h3>
        <div class="mockup-wrap">
          <div class="mockup-bar">
            <div class="mockup-dot" style="background:#ff5f57;"></div>
            <div class="mockup-dot" style="background:#febc2e;"></div>
            <div class="mockup-dot" style="background:#28c840;"></div>
            <span class="mockup-title">安全评审管理 — 看板视图</span>
          </div>
          <div class="mockup-body">┌─ 安全评审看板 ────────────────────────────────────────────────┐
│  [列表视图] [看板视图★] [甘特图]      🔍搜索  ⚙️筛选  [+新建]  │
├────────────┬──────────────┬─────────────┬────────────────────┤
│  草稿 (2)  │  进行中 (3)  │  问题跟踪(1) │    已完成 (12)     │
├────────────┼──────────────┼─────────────┼────────────────────┤
│ ┌────────┐ │ ┌──────────┐ │ ┌─────────┐ │  SR-2024-001 ✅    │
│ │SR-DRAFT│ │ │SR-2024-02│ │ │SR-2024  │ │  SR-2024-002 ✅    │
│ │电芯安全│ │ │热管理评审│ │ │-03 充电 │ │  SR-2024-003 ✅    │
│ │评审    │ │ │进行中 65%│ │ │安全问题 │ │  ...               │
│ └────────┘ │ │截止06/30 │ │ │待处理⚠️ │ │                    │
│            │ └──────────┘ │ └─────────┘ │                    │
└────────────┴──────────────┴─────────────┴────────────────────┘</div>
        </div>
      </div>

      <div class="subsection">
        <h3>4.4 问题分类与闭环流程</h3>
        <div class="feature-grid">
          <div class="feature-block">
            <div class="feature-block-header" style="background:#fee2e2;color:#b91c1c;">🔴 严重问题（Critical）</div>
            <div class="feature-block-body">
              <ul class="feature-list">
                <li>必须在评审通过前完成整改</li>
                <li>需要专家组书面确认</li>
                <li>自动升级通知部门负责人</li>
                <li>整改期限：≤ 5 个工作日</li>
              </ul>
            </div>
          </div>
          <div class="feature-block">
            <div class="feature-block-header" style="background:#ffedd5;color:#c2410c;">🟠 重要问题（Major）</div>
            <div class="feature-block-body">
              <ul class="feature-list">
                <li>评审有条件通过，需限期整改</li>
                <li>负责人自评 + 评审专家复核</li>
                <li>整改期限：≤ 15 个工作日</li>
                <li>超期自动提醒升级</li>
              </ul>
            </div>
          </div>
          <div class="feature-block">
            <div class="feature-block-header" style="background:#fffbeb;color:#92400e;">🟡 一般问题（Minor）</div>
            <div class="feature-block-body">
              <ul class="feature-list">
                <li>建议整改，不影响评审结论</li>
                <li>可在下次评审前完成</li>
                <li>整改期限：≤ 30 个工作日</li>
                <li>定期状态更新即可</li>
              </ul>
            </div>
          </div>
          <div class="feature-block">
            <div class="feature-block-header" style="background:#f0fdf4;color:#15803d;">💡 建议项（Suggestion）</div>
            <div class="feature-block-body">
              <ul class="feature-list">
                <li>优化建议，自愿采纳</li>
                <li>纳入持续改进清单</li>
                <li>无强制整改期限</li>
                <li>纳入下一版本规划参考</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- ============================================================
       SECTION 5 · 项目与任务管理
       ============================================================ -->
  <div class="section" id="s5">
    <div class="section-header">
      <div class="section-icon" style="background:#dbeafe;">📁</div>
      <div>
        <h2>5. 项目与任务管理</h2>
        <div class="sub">Project & Task Management</div>
      </div>
    </div>
    <div class="section-body">
      <div class="subsection">
        <h3>5.1 项目视图模式</h3>
        <div style="display:grid;grid-template-columns:repeat(auto-fill,minmax(180px,1fr));gap:12px;">
          <div style="border-radius:10px;border:1px solid var(--border);padding:16px;text-align:center;">
            <div style="font-size:1.8rem;margin-bottom:8px;">📋</div>
            <div style="font-weight:700;font-size:0.9rem;">列表视图</div>
            <div style="font-size:0.78rem;color:var(--text-muted);margin-top:4px;">表格形式展示所有任务，支持排序与批量操作</div>
          </div>
          <div style="border-radius:10px;border:1px solid var(--border);padding:16px;text-align:center;">
            <div style="font-size:1.8rem;margin-bottom:8px;">🗂️</div>
            <div style="font-weight:700;font-size:0.9rem;">看板视图</div>
            <div style="font-size:0.78rem;color:var(--text-muted);margin-top:4px;">Kanban 拖拽式状态流转，直观管理任务进度</div>
          </div>
          <div style="border-radius:10px;border:1px solid var(--border);padding:16px;text-align:center;">
            <div style="font-size:1.8rem;margin-bottom:8px;">📅</div>
            <div style="font-weight:700;font-size:0.9rem;">甘特图</div>
            <div style="font-size:0.78rem;color:var(--text-muted);margin-top:4px;">时间轴视图，展示任务依赖与关键路径</div>
          </div>
          <div style="border-radius:10px;border:1px solid var(--border);padding:16px;text-align:center;">
            <div style="font-size:1.8rem;margin-bottom:8px;">🌳</div>
            <div style="font-weight:700;font-size:0.9rem;">WBS 树形</div>
            <div style="font-size:0.78rem;color:var(--text-muted);margin-top:4px;">工作分解结构，层级化管理子任务</div>
          </div>
          <div style="border-radius:10px;border:1px solid var(--border);padding:16px;text-align:center;">
            <div style="font-size:1.8rem;margin-bottom:8px;">📊</div>
            <div style="font-weight:700;font-size:0.9rem;">数据统计</div>
            <div style="font-size:0.78rem;color:var(--text-muted);margin-top:4px;">完成率、逾期率、工时统计等多维度分析</div>
          </div>
        </div>
      </div>

      <div class="subsection">
        <h3>5.2 任务状态流转</h3>
        <div class="flow-wrap">
          <div class="flow-row">
            <div class="flow-node" style="background:#f1f5f9;color:#475569;">⬜ 待开始</div>
            <div class="flow-arrow">→</div>
            <div class="flow-node" style="background:#dbeafe;color:#1d4ed8;">🔵 进行中</div>
            <div class="flow-arrow">→</div>
            <div class="flow-node" style="background:#fef3c7;color:#92400e;">🟡 待评审</div>
            <div class="flow-arrow">→</div>
            <div class="flow-node" style="background:#dcfce7;color:#15803d;">✅ 已完成</div>
          </div>
          <div class="flow-row" style="margin-top:8px;">
            <div style="font-size:0.78rem;color:var(--text-muted);text-align:center;width:100%;">
              任意状态 → <span class="tag tag-red">🔴 已阻塞</span> （阻塞解除后可回到进行中）&nbsp;|&nbsp;
              任意状态 → <span class="tag tag-gray">⛔ 已取消</span>
            </div>
          </div>
        </div>
      </div>

      <div class="subsection">
        <h3>5.3 核心字段说明</h3>
        <table class="version-table">
          <thead><tr><th>字段</th><th>说明</th><th>必填</th></tr></thead>
          <tbody>
            <tr><td>任务标题</td><td>简洁描述任务目标</td><td><span class="tag tag-red">必填</span></td></tr>
            <tr><td>所属项目</td><td>关联项目，支持跨项目任务</td><td><span class="tag tag-red">必填</span></td></tr>
            <tr><td>负责人</td><td>主要执行人，支持多人协作</td><td><span class="tag tag-red">必填</span></td></tr>
            <tr><td>截止日期</td><td>任务完成期限，超期自动提醒</td><td><span class="tag tag-red">必填</span></td></tr>
            <tr><td>优先级</td><td>紧急 / 高 / 中 / 低</td><td><span class="tag tag-gray">选填</span></td></tr>
            <tr><td>关联评审</td><td>绑定安全评审节点，自动同步状态</td><td><span class="tag tag-gray">选填</span></td></tr>
            <tr><td>附件</td><td>支持上传测试报告、设计文档等</td><td><span class="tag tag-gray">选填</span></td></tr>
            <tr><td>工时估算</td><td>预估 & 实际工时，用于绩效统计</td><td><span class="tag tag-gray">选填</span></td></tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <!-- ============================================================
       SECTION 6 · AI 智能助手
       ============================================================ -->
  <div class="section" id="s6">
    <div class="section-header">
      <div class="section-icon" style="background:#ede9fe;">🤖</div>
      <div>
        <h2>6. AI 智能助手体系</h2>
        <div class="sub">AI Assistant Architecture</div>
      </div>
    </div>
    <div class="section-body">

      <div class="subsection">
        <h3>6.1 三层智能架构</h3>
        <div class="ai-levels">
          <div class="ai-level">
            <div class="ai-level-badge" style="background:linear-gradient(135deg,#2563eb,#7c3aed);color:#fff;">
              <span class="lv">L3</span>
              <span class="lv-label">预测层</span>
            </div>
            <div class="ai-level-body">
              <h4>🔮 智能预测与主动预警</h4>
              <ul>
                <li>项目延期风险预测（基于历史数据 + 当前进度）</li>
                <li>安全隐患自动识别与风险评分</li>
                <li>资源冲突预警与调度建议</li>
                <li>绩效趋势分析与异常检测</li>
              </ul>
            </div>
          </div>
          <div class="ai-level">
            <div class="ai-level-badge" style="background:linear-gradient(135deg,#0891b2,#2563eb);color:#fff;">
              <span class="lv">L2</span>
              <span class="lv-label">分析层</span>
            </div>
            <div class="ai-level-body">
              <h4>📊 智能分析与摘要生成</h4>
              <ul>
                <li>评审记录自动摘要（会议纪要生成）</li>
                <li>测试数据智能分析与异常标注</li>
                <li>跨项目数据对比与洞察报告</li>
                <li>问题根因分析辅助</li>
              </ul>
            </div>
          </div>
          <div class="ai-level">
            <div class="ai-level-badge" style="background:linear-gradient(135deg,#059669,#0891b2);color:#fff;">
              <span class="lv">L1</span>
              <span class="lv-label">对话层</span>
            </div>
            <div class="ai-level-body">
              <h4>💬 自然语言交互入口</h4>
              <ul>
                <li>自然语言查询：「我本月有哪些逾期任务？」</li>
                <li>快捷指令：「生成本周项目报告」</li>
                <li>上下文感知对话，多轮追问</li>
                <li>快速导航：「跳转到 SR-2024-002 评审详情」</li>
              </ul>
            </div>
          </div>
        </div>
      </div>

      <div class="subsection">
        <h3>6.2 AI 快捷指令示例</h3>
        <div class="mockup-wrap">
          <div class="mockup-bar">
            <div class="mockup-dot" style="background:#ff5f57;"></div>
            <div class="mockup-dot" style="background:#febc2e;"></div>
            <div class="mockup-dot" style="background:#28c840;"></div>
            <span class="mockup-title">AI 智能助手 — 对话界面</span>
          </div>
          <div class="mockup-body">  🤖 AI助手                                          [今日任务][项目状态]
  ─────────────────────────────────────────         [安全评审][绩效摘要]

  ┌─ 用户 ─────────────────────────────────┐
  │ 帮我看看本周有哪些安全评审待处理？      │
  └────────────────────────────────────────┘

  ┌─ AI ───────────────────────────────────┐
  │ 📋 本周安全评审待处理（共3项）：        │
  │                                        │
  │  🔴 SR-2024-05 热管理评审              │
  │     截止：明天  负责人：您              │
  │     [立即处理 →]                       │
  │                                        │
  │  🟡 SR-2024-06 充电协议评审            │
  │     截止：周五  状态：待审批            │
  │                                        │
  │  🟢 SR-2024-07 BMS功能评审             │
  │     截止：下周一  待上传资料            │
  └────────────────────────────────────────┘

  ┌─────────────────────────────────────┐
  │ 输入指令...                      ➤ │
  └─────────────────────────────────────┘</div>
        </div>
      </div>

      <div class="subsection">
        <h3>6.3 数据接入范围</h3>
        <div style="display:grid;grid-template-columns:repeat(auto-fill,minmax(200px,1fr));gap:10px;">
          <div style="background:#f8fafc;border:1px solid var(--border);border-radius:8px;padding:12px;font-size:0.83rem;display:flex;gap:8px;align-items:flex-start;">
            <span>🛡️</span><div><strong>安全评审数据</strong><br><span style="color:var(--text-muted)">历史评审记录、问题库、结论汇总</span></div>
          </div>
          <div style="background:#f8fafc;border:1px solid var(--border);border-radius:8px;padding:12px;font-size:0.83rem;display:flex;gap:8px;align-items:flex-start;">
            <span>📁</span><div><strong>项目任务数据</strong><br><span style="color:var(--text-muted)">任务状态、工时、完成率</span></div>
          </div>
          <div style="background:#f8fafc;border:1px solid var(--border);border-radius:8px;padding:12px;font-size:0.83rem;display:flex;gap:8px;align-items:flex-start;">
            <span>🧪</span><div><strong>测试结果数据</strong><br><span style="color:var(--text-muted)">测试报告、异常记录、通过率</span></div>
          </div>
          <div style="background:#f8fafc;border:1px solid var(--border);border-radius:8px;padding:12px;font-size:0.83rem;display:flex;gap:8px;align-items:flex-start;">
            <span>📈</span><div><strong>绩效指标数据</strong><br><span style="color:var(--text-muted)">KPI、专利、月度评分</span></div>
          </div>
          <div style="background:#f8fafc;border:1px solid var(--border);border-radius:8px;padding:12px;font-size:0.83rem;display:flex;gap:8px;align-items:flex-start;">
            <span>📋</span><div><strong>报告文档数据</strong><br><span style="color:var(--text-muted)">已生成报告、摘要、附件</span></div>
          </div>
          <div style="background:#f8fafc;border:1px solid var(--border);border-radius:8px;padding:12px;font-size:0.83rem;display:flex;gap:8px;align-items:flex-start;">
            <span>🏢</span><div><strong>组织架构数据</strong><br><span style="color:var(--text-muted)">人员、部门、角色关系</span></div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- ============================================================
       SECTION 7 · 绩效与报告中心
       ============================================================ -->
  <div class="section" id="s7">
    <div class="section-header">
      <div class="section-icon" style="background:#dcfce7;">📈</div>
      <div>
        <h2>7. 绩效管理与报告中心</h2>
        <div class="sub">Performance Management & Report Center</div>
      </div>
    </div>
    <div class="section-body">

      <div class="subsection">
        <h3>7.1 绩效 KPI 指标体系</h3>
        <table class="perf-table">
          <thead>
            <tr>
              <th>KPI 指标</th>
              <th>计算方式</th>
              <th>考核周期</th>
              <th>目标值</th>
              <th>权重</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>任务按时完成率</td>
              <td>按时完成任务数 / 总任务数 × 100%</td>
              <td>月度</td>
              <td><span class="target-badge" style="background:#dcfce7;color:#15803d;">≥ 90%</span></td>
              <td>25%</td>
            </tr>
            <tr>
              <td>评审问题闭环率</td>
              <td>已闭环问题数 / 责任问题总数 × 100%</td>
              <td>月度</td>
              <td><span class="target-badge" style="background:#dcfce7;color:#15803d;">≥ 95%</span></td>
              <td>20%</td>
            </tr>
            <tr>
              <td>专利申请数</td>
              <td>当期提交专利申请总数</td>
              <td>季度</td>
              <td><span class="target-badge" style="background:#dbeafe;color:#1d4ed8;">≥ 2 项/季</span></td>
              <td>15%</td>
            </tr>
            <tr>
              <td>测试一次通过率</td>
              <td>首次测试通过数 / 总测试数 × 100%</td>
              <td>月度</td>
              <td><span class="target-badge" style="background:#dcfce7;color:#15803d;">≥ 85%</span></td>
              <td>20%</td>
            </tr>
            <tr>
              <td>安全评审参与率</td>
              <td>实际参与次数 / 应参与次数 × 100%</td>
              <td>月度</td>
              <td><span class="target-badge" style="background:#dcfce7;color:#15803d;">≥ 90%</span></td>
              <td>10%</td>
            </tr>
            <tr>
              <td>文档及时提交率</td>
              <td>按时提交文档数 / 应提交文档数 × 100%</td>
              <td>月度</td>
              <td><span class="target-badge" style="background:#dcfce7;color:#15803d;">≥ 95%</span></td>
              <td>10%</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="subsection">
        <h3>7.2 报告中心快捷生成</h3>
        <div style="display:grid;grid-template-columns:repeat(auto-fill,minmax(220px,1fr));gap:14px;">
          <div style="border-radius:10px;border:1px solid var(--border);overflow:hidden;">
            <div style="background:linear-gradient(135deg,#2563eb,#1d4ed8);padding:16px;color:#fff;">
              <div style="font-size:1.4rem;margin-bottom:6px;">👤</div>
              <div style="font-weight:700;font-size:0.95rem;">个人月度报告</div>
            </div>
            <div style="padding:14px;font-size:0.82rem;">
              <ul style="list-style:none;">
                <li style="padding:3px 0;display:flex;gap:6px;align-items:center;font-size:0.82rem;border-bottom:1px dashed var(--border);"><span style="color:var(--success);">✓</span>任务完成情况汇总</li>
                <li style="padding:3px 0;display:flex;gap:6px;align-items:center;font-size:0.82rem;border-bottom:1px dashed var(--border);"><span style="color:var(--success);">✓</span>KPI 达成率分析</li>
                <li style="padding:3px 0;display:flex;gap:6px;align-items:center;font-size:0.82rem;border-bottom:1px dashed var(--border);"><span style="color:var(--success);">✓</span>评审参与记录</li>
                <li style="padding:3px 0;display:flex;gap:6px;align-items:center;font-size:0.82rem;"><span style="color:var(--success);">✓</span>下月工作计划</li>
              </ul>
              <div style="margin-top:12px;">
                <span class="tag tag-blue">AI 自动起草</span>
                <span class="tag tag-green">一键导出 PDF</span>
              </div>
            </div>
          </div>

          <div style="border-radius:10px;border:1px solid var(--border);overflow:hidden;">
            <div style="background:linear-gradient(135deg,#7c3aed,#6d28d9);padding:16px;color:#fff;">
              <div style="font-size:1.4rem;margin-bottom:6px;">🏢</div>
              <div style="font-weight:700;font-size:0.95rem;">部门月度报告</div>
            </div>
            <div style="padding:14px;font-size:0.82rem;">
              <ul style="list-style:none;">
                <li style="padding:3px 0;display:flex;gap:6px;align-items:center;font-size:0.82rem;border-bottom:1px dashed var(--border);"><span style="color:var(--success);">✓</span>部门整体 KPI 看板</li>
                <li style="padding:3px 0;display:flex;gap:6px;align-items:center;font-size:0.82rem;border-bottom:1px dashed var(--border);"><span style="color:var(--success);">✓</span>成员绩效对比分析</li>
                <li style="padding:3px 0;display:flex;gap:6px;align-items:center;font-size:0.82rem;border-bottom:1px dashed var(--border);"><span style="color:var(--success);">✓</span>安全评审统计摘要</li>
                <li style="padding:3px 0;display:flex;gap:6px;align-items:center;font-size:0.82rem;"><span style="color:var(--success);">✓</span>风险与改进项</li>
              </ul>
              <div style="margin-top:12px;">
                <span class="tag tag-purple">管理员可见</span>
                <span class="tag tag-green">支持对比上期</span>
              </div>
            </div>
          </div>

          <div style="border-radius:10px;border:1px solid var(--border);overflow:hidden;">
            <div style="background:linear-gradient(135deg,#059669,#0891b2);padding:16px;color:#fff;">
              <div style="font-size:1.4rem;margin-bottom:6px;">🛡️</div>
              <div style="font-weight:700;font-size:0.95rem;">安全评审摘要报告</div>
            </div>
            <div style="padding:14px;font-size:0.82rem;">
              <ul style="list-style:none;">
                <li style="padding:3px 0;display:flex;gap:6px;align-items:center;font-size:0.82rem;border-bottom:1px dashed var(--border);"><span style="color:var(--success);">✓</span>评审会议纪要（AI生成）</li>
                <li style="padding:3px 0;display:flex;gap:6px;align-items:center;font-size:0.82rem;border-bottom:1px dashed var(--border);"><span style="color:var(--success);">✓</span>问题清单及整改措施</li>
                <li style="padding:3px 0;display:flex;gap:6px;align-items:center;font-size:0.82rem;border-bottom:1px dashed var(--border);"><span style="color:var(--success);">✓</span>评审结论与批准记录</li>
                <li style="padding:3px 0;display:flex;gap:6px;align-items:center;font-size:0.82rem;"><span style="color:var(--success);">✓</span>跨期问题趋势分析</li>
              </ul>
              <div style="margin-top:12px;">
                <span class="tag tag-cyan">自动生成</span>
                <span class="tag tag-orange">合规归档</span>
              </div>
            </div>
          </div>

          <div style="border-radius:10px;border:1px solid var(--border);overflow:hidden;">
            <div style="background:linear-gradient(135deg,#d97706,#f59e0b);padding:16px;color:#fff;">
              <div style="font-size:1.4rem;margin-bottom:6px;">🔧</div>
              <div style="font-weight:700;font-size:0.95rem;">自定义报告模板</div>
            </div>
            <div style="padding:14px;font-size:0.82rem;">
              <ul style="list-style:none;">
                <li style="padding:3px 0;display:flex;gap:6px;align-items:center;font-size:0.82rem;border-bottom:1px dashed var(--border);"><span style="color:var(--success);">✓</span>拖拽式报告模板编辑器</li>
                <li style="padding:3px 0;display:flex;gap:6px;align-items:center;font-size:0.82rem;border-bottom:1px dashed var(--border);"><span style="color:var(--success);">✓</span>自定义数据字段组合</li>
                <li style="padding:3px 0;display:flex;gap:6px;align-items:center;font-size:0.82rem;border-bottom:1px dashed var(--border);"><span style="color:var(--success);">✓</span>定时自动发送邮件</li>
                <li style="padding:3px 0;display:flex;gap:6px;align-items:center;font-size:0.82rem;"><span style="color:var(--success);">✓</span>多格式导出：PDF / Excel / Word</li>
              </ul>
              <div style="margin-top:12px;">
                <span class="tag tag-orange">高级功能</span>
                <span class="tag tag-gray">管理员配置</span>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="subsection">
        <h3>7.3 个人绩效看板界面示例</h3>
        <div class="mockup-wrap">
          <div class="mockup-bar">
            <div class="mockup-dot" style="background:#ff5f57;"></div>
            <div class="mockup-dot" style="background:#febc2e;"></div>
            <div class="mockup-dot" style="background:#28c840;"></div>
            <span class="mockup-title">个人绩效看板 — 张工 · 2024年1月</span>
          </div>
          <div class="mockup-body">┌─ 个人绩效看板 ─────────────────────────────────────────────────────┐
│  张工  | 安全评审专家  | 热管理部                  [导出报告] [打印] │
│  考核周期：2024年1月    综合评分：92分  ▲较上月 +3分               │
├──────────────────────┬──────────────────────┬────────────────────┤
│  任务完成率           │  评审问题闭环率        │  文档及时提交率     │
│  ████████░  93%      │  ██████████  98%      │  █████████░  95%   │
│  目标≥90%  ✅达标    │  目标≥95%   ✅达标    │  目标≥95%  ✅达标  │
├──────────────────────┴──────────────────────┴────────────────────┤
│                                                                   │
│  雷达图（多维绩效）           趋势折线图（近6月）                  │
│       创新性                  100                                 │
│        100                    90  ──────────────── 张工          │
│    及时性──┼──完成度           80          部门平均 ─────         │
│        │                     70                                 │
│       质量                    └─────────────────────→            │
│                                 Aug Sep Oct Nov Dec Jan          │
├───────────────────────────────────────────────────────────────────┤
│  本月项目贡献                                                     │
│  THERM-03  完成热扩散测试方案   权重40%  评分95分                  │
│  SR-2024-04  热管理安全评审    权重30%  评分90分                  │
│  日常工作                       权重10%  评分88分                  │
└───────────────────────────────────────────────────────────────────┘</div>
        </div>
      </div>
    </div>
  </div>

  <!-- ============================================================
       SECTION 8 · 技术架构与安全机制
       ============================================================ -->
  <div class="section" id="s8">
    <div class="section-header">
      <div class="section-icon" style="background:#fef3c7;">⚙️</div>
      <div>
        <h2>8. 技术架构与安全机制</h2>
        <div class="sub">Technical Architecture & Security</div>
      </div>
    </div>
    <div class="section-body">

      <div class="subsection">
        <h3>8.1 技术栈选型</h3>
        <div class="tech-grid">
          <div class="tech-item">
            <div class="tech-category">前端框架</div>
            <div class="tech-name">React 18 + TypeScript</div>
            <div class="tech-detail">组件化开发，强类型约束</div>
          </div>
          <div class="tech-item">
            <div class="tech-category">UI 组件库</div>
            <div class="tech-name">Ant Design 5.x</div>
            <div class="tech-detail">企业级 UI，丰富组件生态</div>
          </div>
          <div class="tech-item">
            <div class="tech-category">状态管理</div>
            <div class="tech-name">Zustand + React Query</div>
            <div class="tech-detail">轻量全局状态 + 服务端缓存</div>
          </div>
          <div class="tech-item">
            <div class="tech-category">后端框架</div>
            <div class="tech-name">Node.js + NestJS</div>
            <div class="tech-detail">模块化架构，TypeScript 全栈</div>
          </div>
          <div class="tech-item">
            <div class="tech-category">主数据库</div>
            <div class="tech-name">PostgreSQL 15</div>
            <div class="tech-detail">关系型数据，事务完整性保障</div>
          </div>
          <div class="tech-item">
            <div class="tech-category">缓存层</div>
            <div class="tech-name">Redis 7.x</div>
            <div class="tech-detail">会话管理、热点数据缓存</div>
          </div>
          <div class="tech-item">
            <div class="tech-category">搜索引擎</div>
            <div class="tech-name">Elasticsearch 8</div>
            <div class="tech-detail">全文检索、日志分析</div>
          </div>
          <div class="tech-item">
            <div class="tech-category">消息队列</div>
            <div class="tech-name">RabbitMQ</div>
            <div class="tech-detail">异步通知、任务调度</div>
          </div>
          <div class="tech-item">
            <div class="tech-category">文件存储</div>
            <div class="tech-name">MinIO / OSS</div>
            <div class="tech-detail">附件、报告文件对象存储</div>
          </div>
          <div class="tech-item">
            <div class="tech-category">AI 引擎</div>
            <div class="tech-name">LLM API + RAG</div>
            <div class="tech-detail">大语言模型 + 检索增强生成</div>
          </div>
          <div class="tech-item">
            <div class="tech-category">容器化</div>
            <div class="tech-name">Docker + Kubernetes</div>
            <div class="tech-detail">微服务部署，弹性伸缩</div>
          </div>
          <div class="tech-item">
            <div class="tech-category">CI/CD</div>
            <div class="tech-name">GitLab CI + ArgoCD</div>
            <div class="tech-detail">自动化构建、灰度发布</div>
          </div>
        </div>
      </div>

      <div class="subsection">
        <h3>8.2 系统架构分层</h3>
        <div style="border-radius:12px;overflow:hidden;border:1px solid var(--border);">
          <div style="background:#1e3a8a;color:#fff;padding:12px 20px;font-weight:700;font-size:0.9rem;text-align:center;letter-spacing:1px;">
            BST Platform V2.0 — 分层架构图
          </div>
          <div style="display:flex;flex-direction:column;gap:0;">
            <div style="background:#dbeafe;border-bottom:2px solid #93c5fd;padding:14px 20px;">
              <div style="font-weight:700;color:#1d4ed8;font-size:0.88rem;margin-bottom:6px;">🖥️ 展示层 Presentation Layer</div>
              <div style="display:flex;gap:8px;flex-wrap:wrap;">
                <span class="tag tag-blue">React SPA</span>
                <span class="tag tag-blue">Ant Design</span>
                <span class="tag tag-blue">ECharts 可视化</span>
                <span class="tag tag-blue">PWA 离线支持</span>
                <span class="tag tag-blue">响应式布局</span>
              </div>
            </div>
            <div style="background:#ede9fe;border-bottom:2px solid #c4b5fd;padding:14px 20px;">
              <div style="font-weight:700;color:#6d28d9;font-size:0.88rem;margin-bottom:6px;">🔌 接口层 API Gateway Layer</div>
              <div style="display:flex;gap:8px;flex-wrap:wrap;">
                <span class="tag tag-purple">RESTful API</span>
                <span class="tag tag-purple">GraphQL</span>
                <span class="tag tag-purple">WebSocket 实时推送</span>
                <span class="tag tag-purple">JWT 鉴权</span>
                <span class="tag tag-purple">限流熔断</span>
              </div>
            </div>
            <div style="background:#dcfce7;border-bottom:2px solid #86efac;padding:14px 20px;">
              <div style="font-weight:700;color:#15803d;font-size:0.88rem;margin-bottom:6px;">⚙️ 业务层 Business Logic Layer</div>
              <div style="display:flex;gap:8px;flex-wrap:wrap;">
                <span class="tag tag-green">评审服务</span>
                <span class="tag tag-green">项目服务</span>
                <span class="tag tag-green">绩效服务</span>
                <span class="tag tag-green">报告服务</span>
                <span class="tag tag-green">AI 服务</span>
                <span class="tag tag-green">通知服务</span>
              </div>
            </div>
            <div style="background:#fff7ed;border-bottom:2px solid #fdba74;padding:14px 20px;">
              <div style="font-weight:700;color:#c2410c;font-size:0.88rem;margin-bottom:6px;">🗄️ 数据层 Data Layer</div>
              <div style="display:flex;gap:8px;flex-wrap:wrap;">
                <span class="tag tag-orange">PostgreSQL 主库</span>
                <span class="tag tag-orange">Redis 缓存</span>
                <span class="tag tag-orange">Elasticsearch</span>
                <span class="tag tag-orange">MinIO 文件</span>
                <span class="tag tag-orange">向量数据库</span>
              </div>
            </div>
            <div style="background:#f1f5f9;padding:14px 20px;">
              <div style="font-weight:700;color:#475569;font-size:0.88rem;margin-bottom:6px;">🏗️ 基础设施层 Infrastructure Layer</div>
              <div style="display:flex;gap:8px;flex-wrap:wrap;">
                <span class="tag tag-gray">Kubernetes 集群</span>
                <span class="tag tag-gray">Prometheus 监控</span>
                <span class="tag tag-gray">ELK 日志</span>
                <span class="tag tag-gray">GitLab CI/CD</span>
                <span class="tag tag-gray">Nginx 反向代理</span>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="subsection">
        <h3>8.3 安全机制</h3>
        <div class="sec-grid">
          <div class="sec-block">
            <div class="sec-block-header" style="background:#fee2e2;color:#b91c1c;">🔐 认证与授权</div>
            <div class="sec-block-body">
              <div class="sec-item">
                <span class="si-label">认证方式</span>
                <span>JWT + Refresh Token，Token 有效期 2 小时</span>
              </div>
              <div class="sec-item">
                <span class="si-label">多因素认证</span>
                <span>支持 TOTP（Google Authenticator）</span>
              </div>
              <div class="sec-item">
                <span class="si-label">SSO 集成</span>
                <span>支持企业 LDAP / OAuth2.0 / SAML</span>
              </div>
              <div class="sec-item">
                <span class="si-label">权限模型</span>
                <span>RBAC + 数据行级权限（RLS）</span>
              </div>
            </div>
          </div>
          <div class="sec-block">
            <div class="sec-block-header" style="background:#fff7ed;color:#c2410c;">🛡️ 数据安全</div>
            <div class="sec-block-body">
              <div class="sec-item">
                <span class="si-label">传输加密</span>
                <span>全站 HTTPS / TLS 1.3</span>
              </div>
              <div class="sec-item">
                <span class="si-label">存储加密</span>
                <span>敏感字段 AES-256 加密存储</span>
              </div>
              <div class="sec-item">
                <span class="si-label">数据备份</span>
                <span>每日全量备份 + 实时增量，保留 90 天</span>
              </div>
              <div class="sec-item">
                <span class="si-label">数据脱敏</span>
                <span>测试环境自动脱敏处理</span>
              </div>
            </div>
          </div>
          <div class="sec-block">
            <div class="sec-block-header" style="background:#fffbeb;color:#92400e;">📋 审计与合规</div>
            <div class="sec-block-body">
              <div class="sec-item">
                <span class="si-label">操作日志</span>
                <span>全量记录用户操作，不可篡改</span>
              </div>
              <div class="sec-item">
                <span class="si-label">日志留存</span>
                <span>审计日志保留 ≥ 3 年</span>
              </div>
              <div class="sec-item">
                <span class="si-label">异常检测</span>
                <span>异常登录、批量操作实时告警</span>
              </div>
              <div class="sec-item">
                <span class="si-label">合规标准</span>
                <span>符合 ISO 27001 / GB/T 22239</span>
              </div>
            </div>
          </div>
          <div class="sec-block">
            <div class="sec-block-header" style="background:#f0fdf4;color:#15803d;">📊 性能保障</div>
            <div class="sec-block-body">
              <div class="sec-item">
                <span class="si-label">页面响应</span>
                <span>P99 ≤ 2s，P50 ≤ 500ms</span>
              </div>
              <div class="sec-item">
                <span class="si-label">API 响应</span>
                <span>P99 ≤ 500ms</span>
              </div>
              <div class="sec-item">
                <span class="si-label">系统可用性</span>
                <span>SLA ≥ 99.9%（月度）</span>
              </div>
              <div class="sec-item">
                <span class="si-label">并发支持</span>
                <span>≥ 500 并发用户，峰值 2000</span>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="subsection">
        <h3>8.4 性能指标汇总</h3>
        <table class="perf-table">
          <thead>
            <tr><th>指标</th><th>普通场景目标</th><th>峰值场景目标</th><th>监控告警阈值</th></tr>
          </thead>
          <tbody>
            <tr>
              <td>首屏加载时间</td>
              <td><span class="target-badge" style="background:#dcfce7;color:#15803d;">≤ 2s</span></td>
              <td><span class="target-badge" style="background:#fffbeb;color:#92400e;">≤ 4s</span></td>
              <td>&gt; 5s 触发告警</td>
            </tr>
            <tr>
              <td>API 平均响应</td>
              <td><span class="target-badge" style="background:#dcfce7;color:#15803d;">≤ 200ms</span></td>
              <td><span class="target-badge" style="background:#fffbeb;color:#92400e;">≤ 500ms</span></td>
              <td>&gt; 1s 触发告警</td>
            </tr>
            <tr>
              <td>报告生成时间</td>
              <td><span class="target-badge" style="background:#dcfce7;color:#15803d;">≤ 5s</span></td>
              <td><span class="target-badge" style="background:#fffbeb;color:#92400e;">≤ 30s</span></td>
              <td>&gt; 60s 触发告警</td>
            </tr>
            <tr>
              <td>AI 响应时间</td>
              <td><span class="target-badge" style="background:#dcfce7;color:#15803d;">≤ 3s</span></td>
              <td><span class="target-badge" style="background:#fffbeb;color:#92400e;">≤ 10s</span></td>
              <td>&gt; 15s 触发告警</td>
            </tr>
            <tr>
              <td>数据库查询</td>
              <td><span class="target-badge" style="background:#dcfce7;color:#15803d;">≤ 100ms</span></td>
              <td><span class="target-badge" style="background:#fffbeb;color:#92400e;">≤ 300ms</span></td>
              <td>&gt; 500ms 触发慢查询告警</td>
            </tr>
            <tr>
              <td>系统可用性</td>
              <td><span class="target-badge" style="background:#dcfce7;color:#15803d;">≥ 99.9%</span></td>
              <td><span class="target-badge" style="background:#dcfce7;color:#15803d;">≥ 99.5%</span></td>
              <td>连续宕机 &gt; 5min 告警</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <!-- ============================================================
       SECTION 9 · 实施路线图
       ============================================================ -->
  <div class="section" id="s9">
    <div class="section-header">
      <div class="section-icon" style="background:#cffafe;">🗺️</div>
      <div>
        <h2>9. 实施路线图</h2>
        <div class="sub">Implementation Roadmap</div>
      </div>
    </div>
    <div class="section-body">
      <div class="phase-list">

        <div class="phase-card">
          <div class="phase-header" style="background:linear-gradient(135deg,#1d4ed8,#2563eb);">
            <span class="phase-num">PHASE 1</span>
            <span class="phase-title">🏗️ 基础建设期</span>
            <span class="phase-duration">2024 Q1 · 3个月</span>
          </div>
          <div class="phase-body">
            <ul>
              <li>搭建基础技术架构（K8s + CI/CD）</li>
              <li>用户 & 权限管理模块上线</li>
              <li>项目 & 任务管理基础功能</li>
              <li>安全评审流程基础版</li>
              <li>SSO 单点登录集成</li>
              <li>基础审计日志</li>
            </ul>
          </div>
        </div>

        <div class="phase-card">
          <div class="phase-header" style="background:linear-gradient(135deg,#6d28d9,#7c3aed);">
            <span class="phase-num">PHASE 2</span>
            <span class="phase-title">🔧 核心功能期</span>
            <span class="phase-duration">2024 Q2 · 3个月</span>
          </div>
          <div class="phase-body">
            <ul>
              <li>安全评审完整工作流（全状态流转）</li>
              <li>问题追踪与闭环管理</li>
              <li>测试管理模块</li>
              <li>绩效 KPI 基础看板</li>
              <li>报告自动生成（PDF 导出）</li>
              <li>邮件 & 站内消息通知</li>
            </ul>
          </div>
        </div>

        <div class="phase-card">
          <div class="phase-header" style="background:linear-gradient(135deg,#0891b2,#0e7490);">
            <span class="phase-num">PHASE 3</span>
            <span class="phase-title">🤖 AI 智能化期</span>
            <span class="phase-duration">2024 Q3 · 3个月</span>
          </div>
          <div class="phase-body">
            <ul>
              <li>AI 对话层（L1）上线</li>
              <li>评审摘要 AI 自动生成</li>
              <li>智能分析层（L2）上线</li>
              <li>测试数据异常智能标注</li>
              <li>个人月度报告 AI 起草</li>
              <li>AI 快速导航指令集</li>
            </ul>
          </div>
        </div>

        <div class="phase-card">
          <div class="phase-header" style="background:linear-gradient(135deg,#059669,#047857);">
            <span class="phase-num">PHASE 4</span>
            <span class="phase-title">📈 深度优化期</span>
            <span class="phase-duration">2024 Q4 · 3个月</span>
          </div>
          <div class="phase-body">
            <ul>
              <li>AI 预测层（L3）上线</li>
              <li>项目延期风险预测模型</li>
              <li>跨部门绩效对比分析</li>
              <li>自定义报告模板编辑器</li>
              <li>移动端 PWA 适配优化</li>
              <li>性能调优与压测验证</li>
            </ul>
          </div>
        </div>

        <div class="phase-card">
          <div class="phase-header" style="background:linear-gradient(135deg,#d97706,#b45309);">
            <span class="phase-num">PHASE 5</span>
            <span class="phase-title">🚀 全面推广期</span>
            <span class="phase-duration">2025 Q1 · 持续</span>
          </div>
          <div class="phase-body">
            <ul>
              <li>全集团用户推广上线</li>
              <li>外部系统 API 集成（ERP / PLM）</li>
              <li>用户培训与运营支撑</li>
              <li>V2.1 迭代需求收集</li>
              <li>SLA 监控与 SaaS 化探索</li>
              <li>国际化（i18n）支持</li>
            </ul>
          </div>
        </div>

      </div>
    </div>
  </div>

  <!-- ============================================================
       SECTION 10 · 风险评估
       ============================================================ -->
  <div class="section" id="s10">
    <div class="section-header">
      <div class="section-icon" style="background:#fee2e2;">⚠️</div>
      <div>
        <h2>10. 风险评估与缓解措施</h2>
        <div class="sub">Risk Assessment & Mitigation</div>
      </div>
    </div>
    <div class="section-body">
      <table class="risk-table">
        <thead>
          <tr>
            <th>风险编号</th>
            <th>风险描述</th>
            <th>可能性</th>
            <th>影响度</th>
            <th>风险等级</th>
            <th>缓解措施</th>
            <th>责任方</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>R-001</td>
            <td>核心开发人员流失导致进度延误</td>
            <td>中</td>
            <td>高</td>
            <td><span class="risk-high">🔴 高</span></td>
            <td>完善技术文档，交叉培训，关键岗位备份</td>
            <td>项目经理</td>
          </tr>
          <tr>
            <td>R-002</td>
            <td>AI 模型输出准确率不达预期</td>
            <td>中</td>
            <td>中</td>
            <td><span class="risk-med">🟡 中</span></td>
            <td>引入人工审核机制，持续微调训练数据</td>
            <td>AI 团队</td>
          </tr>
          <tr>
            <td>R-003</td>
            <td>历史数据迁移质量问题</td>
            <td>高</td>
            <td>高</td>
            <td><span class="risk-high">🔴 高</span></td>
            <td>提前制定迁移方案，分批次验证，保留回滚能力</td>
            <td>数据团队</td>
          </tr>
          <tr>
            <td>R-004</td>
            <td>用户接受度低，推广阻力大</td>
            <td>中</td>
            <td>中</td>
            <td><span class="risk-med">🟡 中</span></td>
            <td>早期引入种子用户，充分收集反馈，提供培训</td>
            <td>产品 & 运营</td>
          </tr>
          <tr>
            <td>R-005</td>
            <td>第三方依赖（LLM API）服务中断</td>
            <td>低</td>
            <td>中</td>
            <td><span class="risk-low">🟢 低</span></td>
            <td>配置多模型备选，本地化部署备用方案</td>
            <td>架构团队</td>
          </tr>
          <tr>
            <td>R-006</td>
            <td>数据安全合规风险</td>
            <td>低</td>
            <td>高</td>
            <td><span class="risk-med">🟡 中</span></td>
            <td>定期安全审计，渗透测试，ISO 27001 认证</td>
            <td>安全团队</td>
          </tr>
          <tr>
            <td>R-007</td>
            <td>高并发场景下系统性能瓶颈</td>
            <td>中</td>
            <td>高</td>
            <td><span class="risk-high">🔴 高</span></td>
            <td>压测提前暴露瓶颈，K8s 弹性伸缩，读写分离</td>
            <td>架构团队</td>
          </tr>
          <tr>
            <td>R-008</td>
            <td>需求频繁变更导致范围蔓延</td>
            <td>高</td>
            <td>中</td>
            <td><span class="risk-med">🟡 中</span></td>
            <td>严格需求变更流程，版本冻结机制，敏捷迭代</td>
            <td>产品经理</td>
          </tr>
        </tbody>
      </table>

      <div style="margin-top:24px;">
        <h3 style="font-size:1rem;font-weight:600;color:var(--primary-dark);margin-bottom:12px;padding-left:10px;border-left:3px solid var(--primary);">风险等级说明</h3>
        <div style="display:flex;gap:16px;flex-wrap:wrap;">
          <div style="display:flex;align-items:center;gap:8px;font-size:0.85rem;">
            <span class="risk-high">🔴 高风险</span>
            <span style="color:var(--text-muted)">需立即制定应对预案，定期跟踪</span>
          </div>
          <div style="display:flex;align-items:center;gap:8px;font-size:0.85rem;">
            <span class="risk-med">🟡 中风险</span>
            <span style="color:var(--text-muted)">需制定缓解措施，月度评审</span>
          </div>
          <div style="display:flex;align-items:center;gap:8px;font-size:0.85rem;">
            <span class="risk-low">🟢 低风险</span>
            <span style="color:var(--text-muted)">持续监控，季度评估</span>
          </div>
        </div>
      </div>
    </div>
  </div>

</div><!-- /container -->

<!-- ============================================================
     FOOTER
     ============================================================ -->
<footer class="site-footer">
  <div style="margin-bottom:12px;">
    <strong>BST Platform V2.0</strong> — 系统整体框架说明文档
  </div>
  <div style="margin-bottom:8px;">
    文档编号：BST-SYS-ARCH-2024-001 &nbsp;|&nbsp;
    版本：V2.0 &nbsp;|&nbsp;
    最后更新：2024-01-20 &nbsp;|&nbsp;
    状态：<span style="color:#4ade80;">✅ 已审核</span>
  </div>
  <div style="font-size:0.75rem;opacity:0.6;margin-top:8px;">
    本文档为内部使用，请勿对外传播。如有疑问请联系架构组。
  </div>
</footer>

</body>
</html>
