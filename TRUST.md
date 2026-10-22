<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TRUST 平台指标·任务管理系统 — 可运行版</title>
<style>
  :root{
    --bg:#f2f4f3;
    --surface:#fbfcfa;
    --surface-2:#eef2f0;
    --ink:#182221;
    --ink-2:#46524f;
    --ink-3:#7b8885;
    --line:#dbe2df;
    --line-2:#c6d2ce;
    --brand:#0f7b74;
    --brand-2:#1ba79d;
    --brand-dark:#0a4a47;
    --brand-soft:#ddf0ec;
    --amber:#c98a2d;
    --amber-soft:#f8ecd8;
    --red:#c2403c;
    --red-soft:#f7e3e1;
    --green:#2f8f63;
    --green-soft:#e1f2e9;
    --navy:#1e3a5f;
    --navy-soft:#e3ebf4;
    --sidebar-w:228px;
    --topbar-h:58px;
    --radius:12px;
    --shadow-1:0 1px 2px rgba(20,40,40,.05),0 4px 14px rgba(20,40,40,.04);
    --shadow-2:0 6px 24px rgba(20,40,40,.12);
    --font:"PingFang SC","Microsoft YaHei","Noto Sans CJK SC",system-ui,-apple-system,sans-serif;
  }
  *{margin:0;padding:0;box-sizing:border-box;}
  body{font-family:var(--font);background:var(--bg);color:var(--ink);font-size:14px;line-height:1.6;overflow:hidden;height:100vh;}
  ::-webkit-scrollbar{width:8px;height:8px;}
  ::-webkit-scrollbar-thumb{background:var(--line-2);border-radius:8px;}
  button{font-family:var(--font);cursor:pointer;}
  input,select,textarea{font-family:var(--font);}
  .app{display:grid;grid-template-columns:var(--sidebar-w) 1fr;height:100vh;}
  .main{display:flex;flex-direction:column;min-width:0;}
  /* ===== Sidebar ===== */
  .sidebar{background:linear-gradient(180deg,#0d2b2c 0%,#0f383a 100%);color:#cfe0dc;display:flex;flex-direction:column;padding:16px 12px;overflow-y:auto;}
  .logo{display:flex;align-items:center;gap:10px;padding:4px 10px 18px;border-bottom:1px solid rgba(255,255,255,.08);margin-bottom:12px;}
  .logo-mark{width:34px;height:34px;border-radius:9px;background:linear-gradient(135deg,#26c3b7,#0f7b74);display:flex;align-items:center;justify-content:center;font-weight:800;color:#fff;font-size:16px;box-shadow:0 3px 10px rgba(38,195,183,.35);}
  .logo-txt .t{color:#fff;font-weight:700;font-size:14px;}
  .logo-txt .s{font-size:11px;color:#7fb5af;}
  .nav-group{margin:12px 4px 6px;font-size:11px;letter-spacing:.12em;color:#5f9c96;font-weight:600;}
  .nav-item{display:flex;align-items:center;gap:11px;padding:10px 12px;border-radius:9px;margin:2px 0;font-size:13.5px;color:#b8d2cd;cursor:pointer;transition:background .15s,color .15s;border:none;background:transparent;text-align:left;width:100%;}
  .nav-item:hover{background:rgba(255,255,255,.06);color:#fff;}
  .nav-item.active{background:rgba(38,195,183,.16);color:#5fe0d4;font-weight:600;}
  .nav-item .ic{width:20px;height:20px;display:flex;align-items:center;justify-content:center;font-size:15px;}
  .nav-item .badge{margin-left:auto;background:var(--red);color:#fff;font-size:11px;border-radius:999px;padding:0 7px;font-weight:700;}
  /* ===== Topbar ===== */
  .topbar{height:var(--topbar-h);background:var(--surface);border-bottom:1px solid var(--line);display:flex;align-items:center;justify-content:space-between;padding:0 22px;flex-shrink:0;}
  .topbar h1{font-size:16px;font-weight:700;}
  .topbar .sub{font-size:12px;color:var(--ink-3);}
  .top-actions{display:flex;gap:8px;align-items:center;}
  .role-chip{display:inline-flex;align-items:center;gap:6px;background:var(--brand-soft);color:var(--brand-dark);font-size:12px;padding:5px 12px;border-radius:999px;font-weight:600;}
  /* ===== Content ===== */
  .content{flex:1;overflow-y:auto;padding:20px 22px 40px;}
  /* ===== Buttons ===== */
  .btn{display:inline-flex;align-items:center;gap:6px;border:1px solid var(--line-2);background:#fff;color:var(--ink);border-radius:8px;padding:7px 14px;font-size:13px;transition:all .15s;font-weight:500;}
  .btn:hover{border-color:var(--brand-2);color:var(--brand);}
  .btn.primary{background:var(--brand);border-color:var(--brand);color:#fff;}
  .btn.primary:hover{background:var(--brand-dark);}
  .btn.danger{color:var(--red);border-color:rgba(194,64,60,.4);}
  .btn.danger:hover{background:var(--red-soft);border-color:var(--red);}
  .btn.sm{padding:4px 9px;font-size:12px;border-radius:6px;}
  .btn.ghost{border-color:transparent;background:transparent;color:var(--ink-2);}
  .btn.ghost:hover{background:var(--surface-2);color:var(--brand);}
  /* ===== Cards ===== */
  .card{background:var(--surface);border:1px solid var(--line);border-radius:var(--radius);box-shadow:var(--shadow-1);}
  .card-pad{padding:18px 20px;}
  .card-title{font-size:14px;font-weight:700;display:flex;align-items:center;gap:8px;margin-bottom:12px;}
  .card-title .hint{font-weight:400;color:var(--ink-3);font-size:12px;}
  /* ===== Stats ===== */
  .stat-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(170px,1fr));gap:14px;margin-bottom:18px;}
  .stat{padding:16px 18px;border-radius:var(--radius);border:1px solid var(--line);background:var(--surface);box-shadow:var(--shadow-1);}
  .stat .label{font-size:12px;color:var(--ink-3);}
  .stat .num{font-size:30px;font-weight:800;line-height:1.2;margin-top:2px;}
  .stat .meta{font-size:12px;color:var(--ink-3);margin-top:4px;}
  .stat.green .num{color:var(--green);} .stat.amber .num{color:var(--amber);} .stat.red .num{color:var(--red);} .stat.brand .num{color:var(--brand);}
  /* ===== Table ===== */
  .table-wrap{overflow:auto;border:1px solid var(--line);border-radius:var(--radius);background:var(--surface);}
  table{width:100%;border-collapse:collapse;font-size:13px;min-width:760px;}
  th{background:var(--surface-2);text-align:left;font-weight:600;color:var(--ink-2);padding:10px 12px;white-space:nowrap;border-bottom:1px solid var(--line);font-size:12px;}
  td{padding:9px 12px;border-bottom:1px solid var(--line);vertical-align:middle;}
  tr:last-child td{border-bottom:none;}
  tr:hover td{background:var(--brand-softer);}
  .row-actions{display:flex;gap:4px;white-space:nowrap;}
  /* ===== Badges ===== */
  .badge{display:inline-flex;align-items:center;gap:4px;font-size:12px;padding:2px 9px;border-radius:999px;font-weight:600;white-space:nowrap;}
  .b-green{background:var(--green-soft);color:var(--green);}
  .b-amber{background:var(--amber-soft);color:var(--amber);}
  .b-red{background:var(--red-soft);color:var(--red);}
  .b-gray{background:var(--surface-2);color:var(--ink-3);}
  .b-brand{background:var(--brand-soft);color:var(--brand);}
  .b-navy{background:var(--navy-soft);color:var(--navy);}
  /* ===== Toolbar ===== */
  .toolbar{display:flex;flex-wrap:wrap;gap:10px;align-items:center;margin-bottom:14px;}
  .toolbar .search{flex:1;min-width:220px;position:relative;}
  .toolbar input[type=text],.toolbar select,.toolbar input[type=search]{border:1px solid var(--line-2);border-radius:8px;padding:7px 12px;font-size:13px;background:#fff;color:var(--ink);width:100%;}
  .toolbar input:focus,.toolbar select:focus{outline:none;border-color:var(--brand-2);box-shadow:0 0 0 3px rgba(27,167,157,.15);}
  .toolbar select{width:auto;}
  .toolbar .grow{flex:1;}
  .toolbar input[type=text]{width:auto;}
  /* ===== Progress ===== */
  .progress{height:7px;background:var(--surface-2);border-radius:99px;overflow:hidden;min-width:90px;}
  .progress i{display:block;height:100%;border-radius:99px;background:linear-gradient(90deg,var(--brand-2),var(--brand));}
  .progress.amber i{background:linear-gradient(90deg,#e0a83e,var(--amber));}
  .progress.red i{background:linear-gradient(90deg,#d96a66,var(--red));}
  .progress.green i{background:linear-gradient(90deg,#4cb386,var(--green));}
  /* ===== Feed ===== */
  .feed{display:flex;flex-direction:column;gap:10px;}
  .feed-item{border:1px solid var(--line);background:var(--surface);border-radius:10px;padding:12px 14px;}
  .feed-item .head{display:flex;justify-content:space-between;align-items:center;gap:10px;flex-wrap:wrap;}
  .feed-item .meta{font-size:12px;color:var(--ink-3);}
  .feed-item .content{margin-top:6px;font-size:13px;color:var(--ink-2);}
  /* ===== Modal ===== */
  .modal-mask{position:fixed;inset:0;background:rgba(13,32,32,.45);display:none;align-items:flex-start;justify-content:center;z-index:100;padding:60px 20px;overflow-y:auto;}
  .modal-mask.show{display:flex;}
  .modal{background:var(--surface);border-radius:14px;box-shadow:var(--shadow-2);width:100%;max-width:560px;padding:0;animation:pop .18s ease;}
  @keyframes pop{from{transform:translateY(14px);opacity:0;}to{transform:none;opacity:1;}}
  .modal-head{padding:16px 20px;border-bottom:1px solid var(--line);display:flex;justify-content:space-between;align-items:center;}
  .modal-head h3{font-size:15px;}
  .modal-close{border:none;background:transparent;font-size:18px;color:var(--ink-3);line-height:1;}
  .modal-body{padding:18px 20px;display:grid;grid-template-columns:1fr 1fr;gap:12px 14px;}
  .modal-body .full{grid-column:1/-1;}
  .field label{display:block;font-size:12px;color:var(--ink-2);margin-bottom:4px;font-weight:600;}
  .field input,.field select,.field textarea{width:100%;border:1px solid var(--line-2);border-radius:8px;padding:7px 11px;font-size:13px;background:#fff;color:var(--ink);}
  .field textarea{resize:vertical;min-height:64px;}
  .field input:focus,.field select:focus,.field textarea:focus{outline:none;border-color:var(--brand-2);box-shadow:0 0 0 3px rgba(27,167,157,.15);}
  .modal-foot{padding:14px 20px;border-top:1px solid var(--line);display:flex;justify-content:flex-end;gap:10px;}
  /* ===== Toast ===== */
  .toast{position:fixed;top:70px;left:50%;transform:translateX(-50%);background:#16312f;color:#fff;padding:10px 20px;border-radius:10px;font-size:13px;box-shadow:var(--shadow-2);z-index:200;opacity:0;transition:opacity .25s;pointer-events:none;}
  .toast.show{opacity:1;}
  /* ===== Dashboard special ===== */
  .dash-grid{display:grid;grid-template-columns:1fr 1fr;gap:16px;margin-bottom:16px;}
  .dash-grid .wide{grid-column:1/-1;}
  .mini-list{display:flex;flex-direction:column;gap:8px;}
  .mini-row{display:flex;align-items:center;gap:10px;font-size:13px;padding:8px 10px;border:1px solid var(--line);border-radius:9px;background:var(--surface);}
  .mini-row .name{flex:1;color:var(--ink-2);}
  .mini-row .name b{color:var(--ink);}
  .mini-row .val{font-weight:700;font-size:13px;}
  .empty{padding:40px;text-align:center;color:var(--ink-3);font-size:13px;}
  /* ===== Org/Value cards ===== */
  .quad-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(270px,1fr));gap:14px;margin-bottom:16px;}
  .quad{background:var(--surface);border:1px solid var(--line);border-radius:var(--radius);padding:18px;box-shadow:var(--shadow-1);}
  .quad .q-num{font-size:12px;font-weight:800;color:var(--brand-2);letter-spacing:.08em;}
  .quad h3{font-size:15px;margin:4px 0 6px;}
  .quad .desc{font-size:12.5px;color:var(--ink-3);margin-bottom:10px;}
  .chip-row{display:flex;flex-wrap:wrap;gap:6px;}
  .chip{font-size:12px;background:var(--surface-2);border:1px solid var(--line);color:var(--ink-2);padding:3px 9px;border-radius:999px;}
  .module-card{background:var(--surface);border:1px solid var(--line);border-radius:var(--radius);padding:18px 20px;box-shadow:var(--shadow-1);margin-bottom:14px;}
  .module-card h3{font-size:15px;margin-bottom:4px;}
  .module-card .desc{font-size:12.5px;color:var(--ink-3);margin-bottom:12px;}
  .kv-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:12px;}
  .kv{background:var(--surface-2);border:1px solid var(--line);border-radius:9px;padding:10px 12px;}
  .kv .k{font-size:11.5px;color:var(--ink-3);}
  .kv .v{font-size:13.5px;font-weight:600;margin-top:2px;}
  /* ===== 用户区 ===== */
  .user-box{margin-top:8px;padding:10px 10px;border:1px solid rgba(255,255,255,.10);border-radius:10px;background:rgba(255,255,255,.04);}
  .user-box .ub-title{font-size:11px;color:#5f9c96;margin-bottom:6px;letter-spacing:.06em;}
  .user-btn{display:flex;align-items:center;gap:8px;width:100%;background:rgba(255,255,255,.05);border:1px solid rgba(255,255,255,.08);color:#cfe0dc;border-radius:9px;padding:7px 9px;font-size:12.5px;cursor:pointer;transition:background .15s;}
  .user-btn:hover{background:rgba(255,255,255,.10);}
  .user-btn .avatar{width:24px;height:24px;border-radius:50%;background:linear-gradient(135deg,#26c3b7,#0f7b74);color:#fff;display:flex;align-items:center;justify-content:center;font-size:12px;font-weight:700;flex-shrink:0;}
  .user-btn .uinfo{flex:1;text-align:left;line-height:1.35;}
  .user-btn .uname{color:#fff;font-weight:600;font-size:12.5px;}
  .user-btn .urole{color:#7fb5af;font-size:11px;}
  /* ===== 里程碑 ===== */
  .ms-card{background:var(--surface);border:1px solid var(--line);border-radius:var(--radius);padding:16px 18px;box-shadow:var(--shadow-1);margin-bottom:14px;}
  .ms-head{display:flex;align-items:center;gap:10px;flex-wrap:wrap;margin-bottom:14px;}
  .ms-head h3{font-size:14.5px;flex:1;}
  .ms-head .ms-meta{font-size:12px;color:var(--ink-3);}
  .ms-steps{display:flex;gap:6px;flex-wrap:wrap;}
  .ms-step{flex:1;min-width:120px;position:relative;border:1px solid var(--line);border-radius:10px;padding:10px 12px;background:var(--surface);}
  .ms-step.done{border-color:var(--green);background:var(--green-soft);}
  .ms-step.plan{border-color:var(--line-2);background:var(--surface-2);}
  .ms-step.overdue{border-color:var(--red);background:var(--red-soft);}
  .ms-step .ms-name{font-size:12.5px;font-weight:700;}
  .ms-step .ms-date{font-size:11px;color:var(--ink-3);margin-top:2px;}
  .ms-step .ms-state{font-size:11px;font-weight:600;margin-top:4px;}
  .ms-step.done .ms-state{color:var(--green);}
  .ms-step.plan .ms-state{color:var(--ink-3);}
  .ms-step.overdue .ms-state{color:var(--red);}
  .ms-warn{margin-top:10px;font-size:12px;color:var(--red);background:var(--red-soft);border-radius:8px;padding:7px 10px;}
  /* ===== 季度考核 ===== */
  .q-card{background:var(--surface);border:1px solid var(--line);border-radius:var(--radius);padding:18px 20px;box-shadow:var(--shadow-1);margin-bottom:14px;}
  .q-head{display:flex;align-items:center;gap:10px;flex-wrap:wrap;margin-bottom:12px;}
  .q-head h3{font-size:15px;}
  .q-score{display:flex;align-items:center;gap:8px;}
  .q-score .score-big{font-size:24px;font-weight:800;color:var(--brand);}
  .q-items{display:flex;flex-direction:column;gap:8px;}
  .q-item{display:flex;align-items:center;gap:10px;border:1px solid var(--line);border-radius:9px;padding:9px 12px;font-size:13px;}
  .q-item .qi-name{flex:1;font-weight:600;}
  .q-item .qi-target{color:var(--ink-3);font-size:12px;}
  .q-item .qi-grade{font-weight:800;}
  .gA{color:var(--green);} .gB{color:var(--brand);} .gC{color:var(--amber);}
  /* ===== 成果 ===== */
  .res-card{display:flex;gap:14px;align-items:flex-start;background:var(--surface);border:1px solid var(--line);border-radius:var(--radius);padding:16px 18px;box-shadow:var(--shadow-1);margin-bottom:12px;}
  .res-body{flex:1;}
  .res-body h3{font-size:14.5px;}
  .res-body .res-meta{font-size:12px;color:var(--ink-3);margin-top:4px;}
  .res-stage{display:flex;gap:6px;align-items:center;margin-top:10px;flex-wrap:wrap;}
  .pipe{font-size:12px;color:var(--ink-3);}
  .pipe-dot{width:8px;height:8px;border-radius:50%;background:var(--line-2);}
  .pipe-dot.active{background:var(--brand);}
  /* ===== 权限说明 ===== */
  .perm-note{font-size:12.5px;color:var(--ink-3);line-height:1.9;background:var(--surface-2);border:1px solid var(--line);border-radius:10px;padding:12px 14px;}
  @media (max-width:900px){
    .app{grid-template-columns:1fr;}
    .sidebar{display:none;}
    .dash-grid{grid-template-columns:1fr;}
  }
</style>
</head>
<body>
<div class="app">
  <!-- ===== Sidebar ===== -->
  <aside class="sidebar">
    <div class="logo">
      <div class="logo-mark">T</div>
      <div class="logo-txt">
        <div class="t">TRUST 指标中枢</div>
        <div class="s">指标 · 任务 · 成果</div>
      </div>
    </div>
    <div class="nav-group">工作台</div>
    <button class="nav-item active" data-view="dashboard"><span class="ic">◈</span> 总览看板</button>
    <div class="nav-group">核心管理</div>
    <button class="nav-item" data-view="indicators"><span class="ic">▤</span> 指标库<span class="badge" id="badgeWarn">0</span></button>
    <button class="nav-item" data-view="tasks"><span class="ic">☰</span> 任务 / 课题</button>
    <button class="nav-item" data-view="logs"><span class="ic">✎</span> 进展填报</button>
    <div class="nav-group">过程管理</div>
    <button class="nav-item" data-view="milestones"><span class="ic">♟</span> 里程碑管理</button>
    <button class="nav-item" data-view="quarters"><span class="ic">◷</span> 季度考核</button>
    <button class="nav-item" data-view="results"><span class="ic">✚</span> 成果转化</button>
    <div class="nav-group">评价体系</div>
    <button class="nav-item" data-view="org"><span class="ic">♜</span> 组织竞争力</button>
    <button class="nav-item" data-view="value"><span class="ic">◎</span> 价值评价</button>
    <div style="flex:1"></div>
    <div class="user-box">
      <div class="ub-title">当前用户</div>
      <button class="user-btn" onclick="openUserSwitch()">
        <span class="avatar" id="curAvatar">王</span>
        <span class="uinfo"><span class="uname" id="curName">王工</span><br><span class="urole" id="curRole">管理层</span></span>
        <span style="font-size:11px;color:#5f9c96;">切换</span>
      </button>
    </div>
  </aside>
  <!-- ===== Main ===== -->
  <div class="main">
    <header class="topbar">
      <div>
        <h1 id="pageTitle">总览看板</h1>
        <div class="sub" id="pageSub">TRUST 平台指标 · 任务管理系统（可运行版）</div>
      </div>
      <div class="top-actions">
        <span class="role-chip" id="roleChip">管理层 · 王工</span>
        <button class="btn" onclick="exportJSON()">⬇ 导出数据</button>
        <button class="btn danger" onclick="resetData()">↺ 重置演示数据</button>
      </div>
    </header>
    <main class="content" id="content"></main>
  </div>
</div>
<!-- ===== Modal ===== -->
<div class="modal-mask" id="modalMask">
  <div class="modal" id="modalBox">
    <div class="modal-head">
      <h3 id="modalTitle">标题</h3>
      <button class="modal-close" onclick="closeModal()">✕</button>
    </div>
    <div class="modal-body" id="modalBody"></div>
    <div class="modal-foot">
      <button class="btn" onclick="closeModal()">取消</button>
      <button class="btn primary" id="modalOk" onclick="modalSubmit()">保存</button>
    </div>
  </div>
</div>
<div class="toast" id="toast"></div><script>
/* ============================================================
 * TRUST 平台指标·任务管理系统 —— 可运行版
 * 数据层：localStorage 持久化；界面层：原生 DOM 渲染
 * ============================================================ */
const LS_KEY = 'trust_sys_v2';
/* ---------- 初始化种子数据 ---------- */
function seed() {
  const indicators = [
    // 底线红线
    {id:'i1', name:'信息安全 / 物理安全 / 安环 / 消防 / 廉洁', cat:'底线红线', target:'0（扣分项）', owner:'平台', dept:'平台', src:'RDO', st:'green', note:'零容忍，全年不发生'},
    {id:'i2', name:'舆情', cat:'底线红线', target:'0（扣分项）', owner:'平台', dept:'平台', src:'RDO', st:'green', note:'零容忍'},
    {id:'i3', name:'商务 / 两大纪律', cat:'底线红线', target:'0（扣分项）', owner:'平台', dept:'平台', src:'RDO', st:'green', note:'零容忍'},
    {id:'i4', name:'品质', cat:'底线红线', target:'0（扣分项）', owner:'平台', dept:'平台', src:'RDO', st:'green', note:'零容忍'},
    // 开发中心 KPI
    {id:'i5', name:'产品 BOM 降本', cat:'开发中心KPI', target:'考核 1 亿；安全/可靠各 5000 万、测试 2000 万', owner:'平台', dept:'成本战略', src:'—', st:'amber', note:'攻坚口径按条线拆分'},
    {id:'i6', name:'26 年人效（I/H 级）', cat:'开发中心KPI', target:'三地测试 500 人；BST 17 / BRT 6', owner:'平台', dept:'成本战略', src:'—', st:'amber', note:'人员规模口径'},
    {id:'i7', name:'研发费用（万元）', cat:'开发中心KPI', target:'测试 1447.8 / 可靠 1373.2 / 安全 1544.6；整体 4365.6', owner:'测试/可靠/安全', dept:'成本战略', src:'—', st:'amber', note:'费用按条线分摊'},
    {id:'i8', name:'研发问题逃逸', cat:'开发中心KPI', target:'0', owner:'平台', dept:'品质战略', src:'—', st:'green', note:'零逃逸要求'},
    {id:'i9', name:'迭代规划研发项目成熟度 3/4 达成率', cat:'开发中心KPI', target:'安全/可靠：热扩散 3.0a + 高压液体安全技术 3.0', owner:'安全/可靠', dept:'技术战略', src:'—', st:'amber', note:'材料准备中（节点 6.30）'},
    {id:'i10', name:'核心专利按时达成率', cat:'开发中心KPI', target:'100%', owner:'平台', dept:'技术战略', src:'专利系统', st:'green', note:'专利节点按时完成'},
    // 开发中心 KCI
    {id:'i11', name:'专利竞争力', cat:'开发中心KCI', target:'应写尽写 · VP 占比 ≥ 20%', owner:'王若瑜', dept:'主KCI', src:'RDO', st:'amber', note:'Q3 达成 0.43；Q2 40%（截至 6.26）'},
    {id:'i12', name:'技术成果转化率', cat:'开发中心KCI', target:'实际 32.4% / 预期 69.4%', owner:'各项目负责人', dept:'主KCI', src:'—', st:'amber', note:'Q2 实际 100% / 预期 94.4%'},
    {id:'i13', name:'创新指数', cat:'开发中心KCI', target:'开发中心 TOP5', owner:'平台', dept:'主KCI', src:'—', st:'amber', note:'Q3 达成：第十名（0.38）'},
    {id:'i14', name:'技术转化周期', cat:'开发中心KCI', target:'与成本/技术战略联动', owner:'平台', dept:'共担指标', src:'—', st:'green', note:'共担'},
    {id:'i15', name:'设计降本', cat:'开发中心KCI', target:'与成本战略联动', owner:'平台', dept:'共担指标', src:'—', st:'green', note:'共担'},
    {id:'i16', name:'人效（IH 级）', cat:'开发中心KCI', target:'与人员规模联动', owner:'平台', dept:'共担指标', src:'—', st:'green', note:'共担'},
    {id:'i17', name:'市场产品本征安全失效率', cat:'开发中心KCI', target:'0.6 ppb（新生产电池）', owner:'安全', dept:'制衡KCI', src:'—', st:'green', note:'制衡'},
    {id:'i18', name:'本征失控后起火比例', cat:'开发中心KCI', target:'0', owner:'安全', dept:'制衡KCI', src:'—', st:'green', note:'制衡'},
    {id:'i19', name:'市场可靠性失效率', cat:'开发中心KCI', target:'可靠性迭代 2.0 后两年累计 ≤ 500 ppm', owner:'可靠', dept:'制衡KCI', src:'—', st:'green', note:'制衡'},
    // 事业群 KCI · 安全
    {id:'i20', name:'XA 安全', cat:'事业群KCI', target:'达标', owner:'安全条线', dept:'安全', src:'—', st:'green', note:''},
    {id:'i21', name:'热安全', cat:'事业群KCI', target:'达标', owner:'安全条线', dept:'安全', src:'—', st:'green', note:''},
    {id:'i22', name:'机械安全', cat:'事业群KCI', target:'达标', owner:'安全条线', dept:'安全', src:'—', st:'green', note:''},
    {id:'i23', name:'内短安全', cat:'事业群KCI', target:'达标', owner:'安全条线', dept:'安全', src:'—', st:'green', note:''},
    {id:'i24', name:'主动安全', cat:'事业群KCI', target:'达标', owner:'安全条线', dept:'安全', src:'—', st:'green', note:''},
    {id:'i25', name:'产品安全 0 失效', cat:'事业群KCI', target:'0 失效', owner:'安全条线', dept:'安全', src:'—', st:'green', note:''},
    {id:'i26', name:'上海产品安全开发', cat:'事业群KCI', target:'按计划', owner:'安全条线', dept:'安全', src:'—', st:'amber', note:''},
    {id:'i27', name:'重庆产品安全开发', cat:'事业群KCI', target:'按计划', owner:'安全条线', dept:'安全', src:'—', st:'amber', note:''},
    {id:'i28', name:'安全量化管理', cat:'事业群KCI', target:'按计划', owner:'安全条线', dept:'安全', src:'—', st:'amber', note:''},
    // 事业群 KCI · 可靠
    {id:'i29', name:'结构可靠性', cat:'事业群KCI', target:'按计划', owner:'可靠条线', dept:'可靠', src:'—', st:'green', note:''},
    {id:'i30', name:'高压系统可靠性', cat:'事业群KCI', target:'按计划', owner:'可靠条线', dept:'可靠', src:'—', st:'green', note:''},
    {id:'i31', name:'连接可靠性', cat:'事业群KCI', target:'按计划', owner:'可靠条线', dept:'可靠', src:'—', st:'green', note:''},
    {id:'i32', name:'低压系统可靠性', cat:'事业群KCI', target:'按计划', owner:'可靠条线', dept:'可靠', src:'—', st:'green', note:''},
    {id:'i33', name:'密封聚合物可靠性', cat:'事业群KCI', target:'按计划', owner:'可靠条线', dept:'可靠', src:'—', st:'green', note:''},
    {id:'i34', name:'CELL 结构可靠性', cat:'事业群KCI', target:'按计划', owner:'可靠条线', dept:'可靠', src:'—', st:'green', note:''},
    {id:'i35', name:'腐蚀可靠性', cat:'事业群KCI', target:'按计划', owner:'可靠条线', dept:'可靠', src:'—', st:'green', note:''},
    {id:'i36', name:'机械应力可靠性', cat:'事业群KCI', target:'按计划', owner:'可靠条线', dept:'可靠', src:'—', st:'green', note:''},
    {id:'i37', name:'系统量化可靠性', cat:'事业群KCI', target:'按计划', owner:'可靠条线', dept:'可靠', src:'—', st:'amber', note:''},
    {id:'i38', name:'极致架构可靠性实验室', cat:'事业群KCI', target:'按计划', owner:'可靠条线', dept:'可靠', src:'—', st:'amber', note:''},
    // 事业群 KCI · 测试
    {id:'i39', name:'多维工况地图 & 应力数据库（机械/环境）', cat:'事业群KCI', target:'按计划', owner:'测试条线', dept:'测试', src:'—', st:'amber', note:''},
    {id:'i40', name:'测试方法 & 评价方法模块（机械/环境）', cat:'事业群KCI', target:'按计划', owner:'测试条线', dept:'测试', src:'—', st:'amber', note:''},
    {id:'i41', name:'测试能力开发', cat:'事业群KCI', target:'按计划', owner:'测试条线', dept:'测试', src:'—', st:'green', note:''},
    {id:'i42', name:'运营管理规划', cat:'事业群KCI', target:'按计划', owner:'测试条线', dept:'测试', src:'—', st:'green', note:''},
    {id:'i43', name:'测试标准', cat:'事业群KCI', target:'按计划', owner:'测试条线', dept:'测试', src:'—', st:'green', note:''},
    {id:'i44', name:'测试准确度提升', cat:'事业群KCI', target:'按计划', owner:'测试条线', dept:'测试', src:'—', st:'green', note:''},
    {id:'i45', name:'测试质量防护机制', cat:'事业群KCI', target:'按计划', owner:'测试条线', dept:'测试', src:'—', st:'green', note:''},
    {id:'i46', name:'测试“0”逃逸', cat:'事业群KCI', target:'0', owner:'测试条线', dept:'测试', src:'—', st:'green', note:''},
    {id:'i47', name:'资源满足率', cat:'事业群KCI', target:'按计划', owner:'测试条线', dept:'测试', src:'—', st:'amber', note:''},
    {id:'i48', name:'战略创新博士每年人均高水平结论数量', cat:'事业群KCI', target:'按计划', owner:'测试条线', dept:'测试', src:'—', st:'amber', note:''},
    // TRUST 平台指标
    {id:'i49', name:'可靠性：VRS2 500→300', cat:'TRUST平台指标', target:'VRS2 由 500 降至 300', owner:'蔡建烟', dept:'战略质量', src:'—', st:'amber', note:'待讨论：孙总提出 2 年累计失效率口径存疑'},
    {id:'i50', name:'测试工况逃逸', cat:'TRUST平台指标', target:'0 起', owner:'历彪', dept:'战略质量', src:'TPT&TVD', st:'green', note:'Q1-Q3 达成 0 起'},
    {id:'i51', name:'BSIL 2.0', cat:'TRUST平台指标', target:'产品量化开发/安全风险量化监控/CTS-SPC 预警闭环/物料安全 CTQ-SPC', owner:'李燕子', dept:'战略管理', src:'—', st:'green', note:'功能均已实现'},
    {id:'i52', name:'可靠性量化管理体系 1.0', cat:'TRUST平台指标', target:'量化体系梳理 + 流程嵌入 + 线上业务系统', owner:'蔡建烟', dept:'可靠性工程', src:'—', st:'amber', note:'梳理已完成，线上系统推进中'},
    {id:'i53', name:'安全迭代 3.X / 4.0', cat:'TRUST平台指标', target:'迭代及时率 100%；课题成熟度及时过点率 100%', owner:'禹梅芳', dept:'技术战略', src:'—', st:'green', note:'Q2 正常（PIMD 暂不考核）'},
    {id:'i54', name:'可靠性迭代 2.0', cat:'TRUST平台指标', target:'迭代及时率 100%；课题成熟度及时过点率 100%', owner:'宁若澜', dept:'技术战略', src:'—', st:'green', note:'按计划推进'},
    {id:'i55', name:'标准路线图 2026', cat:'TRUST平台指标', target:'标准及时过点率 100%；及时应用率 100%；建立标准管理流程', owner:'王玉龙', dept:'技术战略', src:'—', st:'amber', note:'Q1 0.78 / Q2 0.27 / Q3 恢复 1'},
    {id:'i56', name:'测试及时交付', cat:'TRUST平台指标', target:'98.5%', owner:'钟锐', dept:'产品战略', src:'LIMS 系统', st:'amber', note:'Q3：产品 95.6% / 研发 92.9%'},
    {id:'i57', name:'XA 项目', cat:'TRUST平台指标', target:'相关研究项目 100% 及时达成预期目标', owner:'历彪、宋宁', dept:'产品战略', src:'—', st:'green', note:'按目标达成'},
    {id:'i58', name:'商用车项目', cat:'TRUST平台指标', target:'KK 项目安全 0 风险；PACK 热扩散达成 STP；产线 0 安全风险；测试能力 100% 交付', owner:'刘国雄、周兴锋', dept:'产品战略', src:'—', st:'amber', note:'Q3 安全设计风险 100% 关闭；T98/T97 满足 STP'},
    {id:'i59', name:'BC 2.0+', cat:'TRUST平台指标', target:'待开发中心明确后再讨论', owner:'—', dept:'产品战略', src:'—', st:'red', note:'未明确'},
    {id:'i60', name:'组织竞争力', cat:'TRUST平台指标', target:'组织竞争力提升 30%；创新成果覆盖率 80%；协同创新 Top5', owner:'钟锐、段旭健', dept:'组织战略', src:'—', st:'amber', note:'Q2 人均创新指数 3.64 / 博士人均产出 1.98'},
    {id:'i61', name:'创新成果覆盖率 / 超均值占比', cat:'TRUST平台指标', target:'覆盖率 80% / 超均值占比 20.7%', owner:'平台', dept:'组织战略', src:'—', st:'amber', note:'Q3 覆盖率 27.64%、超均值 6.77%'},
    {id:'i62', name:'协同创新（协同指数）', cat:'TRUST平台指标', target:'协同创新 Top5；接收/赋予', owner:'平台', dept:'组织战略', src:'—', st:'green', note:'Q3 接收 19%（第三名）、赋予 17%（第二名）'},
    {id:'i63', name:'人均点子数', cat:'TRUST平台指标', target:'参考开发中心数据', owner:'平台', dept:'组织战略', src:'—', st:'amber', note:'数据统计中'},
    // 价值评价
    {id:'i64', name:'市场产品割底平均失效里程', cat:'价值评价体系', target:'持续改善', owner:'安全模块', dept:'安全', src:'—', st:'green', note:''},
    {id:'i65', name:'市场产品本征安全失效率', cat:'价值评价体系', target:'0.6 ppb', owner:'安全模块', dept:'安全', src:'—', st:'green', note:''},
    {id:'i66', name:'本征失控后起火比例', cat:'价值评价体系', target:'0', owner:'安全模块', dept:'安全', src:'—', st:'green', note:''},
    {id:'i67', name:'市场可靠性失效率', cat:'价值评价体系', target:'两年累计 ≤ 500 ppm', owner:'可靠模块', dept:'可靠', src:'—', st:'green', note:'与可靠性迭代 2.0 联动'},
    {id:'i68', name:'测试准确度提升', cat:'价值评价体系', target:'持续提升', owner:'测试模块', dept:'测试', src:'—', st:'green', note:''},
    {id:'i69', name:'测试质量防护机制', cat:'价值评价体系', target:'机制落地', owner:'测试模块', dept:'测试', src:'—', st:'amber', note:''},
    {id:'i70', name:'测试“0”逃逸', cat:'价值评价体系', target:'0', owner:'测试模块', dept:'测试', src:'—', st:'green', note:''},
    {id:'i71', name:'资源满足率', cat:'价值评价体系', target:'按计划', owner:'测试模块', dept:'测试', src:'—', st:'amber', note:''}
  ];
  const tasks = [
    {id:'t1', name:'热扩散 3.0a 迭代课题', cat:'安全', rel:'迭代规划研发项目成熟度 3/4 达成率', milestone:'M3 材料准备（6.30 节点）', status:'进行中', progress:65, owner:'禹梅芳', due:'2026-06-30', note:'推进高压液体安全技术 3.0 材料编写', logs:[
      {date:'2026-05-20', author:'禹梅芳', content:'完成 M2 技术评审，启动 M3 材料编写'},
      {date:'2026-06-10', author:'禹梅芳', content:'材料框架已定稿，待实验数据补充'}
    ]},
    {id:'t2', name:'高压液体安全技术 3.0', cat:'安全', rel:'迭代规划研发项目成熟度 3/4 达成率', milestone:'M3 材料准备', status:'进行中', progress:55, owner:'禹梅芳', due:'2026-06-30', note:'与热扩散 3.0a 并行推进', logs:[
      {date:'2026-05-28', author:'禹梅芳', content:'完成液体安全关键实验一轮'}
    ]},
    {id:'t3', name:'标准路线图 2026 — 专项标准', cat:'测试', rel:'标准路线图 2026', milestone:'一期标准发布', status:'已逾期', progress:80, owner:'王玉龙', due:'2026-06-01', note:'一期标准完成 92%，待发布', logs:[
      {date:'2026-05-15', author:'王玉龙', content:'一期标准评审通过，进入发布流程'},
      {date:'2026-06-05', author:'王玉龙', content:'发布流程受阻，需协调标准管理流程 V2.0'}
    ]},
    {id:'t4', name:'可靠性量化管理体系线上业务系统', cat:'可靠', rel:'可靠性量化管理体系 1.0', milestone:'线上系统上线', status:'进行中', progress:70, owner:'蔡建烟', due:'2026-09-30', note:'管理抓手（CTR、标准等）归档完成', logs:[
      {date:'2026-05-22', author:'蔡建烟', content:'业务需求已确认，进入开发阶段'}
    ]},
    {id:'t5', name:'可靠性迭代 2.0 课题', cat:'可靠', rel:'可靠性迭代 2.0', milestone:'课题成熟度过点', status:'进行中', progress:60, owner:'宁若澜', due:'2026-08-31', note:'两处课题推进中', logs:[
      {date:'2026-05-18', author:'宁若澜', content:'完成课题一 M2 评审'}
    ]},
    {id:'t6', name:'商用车 KK 电芯项目', cat:'安全', rel:'商用车项目', milestone:'电芯项目 + 产线审核', status:'进行中', progress:90, owner:'刘国雄', due:'2026-06-30', note:'T98/T97 满足 STP；CTS 100% 落地', logs:[
      {date:'2026-06-12', author:'刘国雄', content:'完成 KK 电芯项目与 T98 产线审核，CTS 100% 落地'}
    ]},
    {id:'t7', name:'测试质量防护机制建设', cat:'测试', rel:'测试质量防护机制', milestone:'机制上线', status:'已完成', progress:100, owner:'历彪', due:'2026-05-30', note:'已建立测试“0”逃逸防护流程', logs:[
      {date:'2026-05-25', author:'历彪', content:'机制评审通过，正式上线'}
    ]},
    {id:'t8', name:'二地测试能力搭建（BST/BRT）', cat:'测试', rel:'26 年人效（I/H 级）', milestone:'能力搭建 100% 交付', status:'进行中', progress:45, owner:'周兴锋', due:'2026-12-31', note:'三地测试 500 人口径', logs:[
      {date:'2026-04-30', author:'周兴锋', content:'已完成二地场地规划'}
    ]},
    {id:'t9', name:'CTS-SPC 预警闭环管理系统', cat:'平台', rel:'BSIL 2.0', milestone:'功能实现', status:'已完成', progress:100, owner:'李燕子', due:'2026-05-15', note:'物料安全 CTQ-SPC 预警闭环管理', logs:[
      {date:'2026-05-10', author:'李燕子', content:'系统功能实现并验收'}
    ]},
    {id:'t10', name:'XA 安全项目', cat:'安全', rel:'XA 项目', milestone:'研究项目 100% 达成', status:'进行中', progress:75, owner:'历彪、宋宁', due:'2026-12-31', note:'XA 安全项目按时达成目标', logs:[
      {date:'2026-06-01', author:'宋宁', content:'Q2 目标节点达成'}
    ]}
  ];
  return {indicators, tasks, users: seedUsers(), quarters: seedQuarters(), milestones: seedMilestones(), results: seedResults()};
}
function seedUsers(){
  return [
    {id:'u1', name:'王工', role:'管理层', scope:'all',   label:'管理层', short:'王'},
    {id:'u2', name:'赵工', role:'经理层', scope:'测试',  label:'经理层', short:'赵'},
    {id:'u3', name:'历博', role:'经理层', scope:'测试',  label:'经理层', short:'历'},
    {id:'u4', name:'卢博', role:'经理层', scope:'测试',  label:'经理层', short:'卢'},
    {id:'u5', name:'林博', role:'经理层', scope:'安全',  label:'经理层', short:'林'},
    {id:'u6', name:'潘博', role:'经理层', scope:'可靠',  label:'经理层', short:'潘'}
  ];
}
function seedQuarters(){
  return [
    {id:'q1', year:'2026', quarter:'Q1', status:'已通过', score:68, grade:'C', items:[
      {ind:'专利竞争力', target:'VP 占比 ≥ 20%', achieve:'0.43', grade:'B'},
      {ind:'技术成果转化率', target:'预期 69.4%', achieve:'实际 32.4%', grade:'C'},
      {ind:'标准路线图 2026', target:'及时过点率 100%', achieve:'0.78', grade:'B'},
      {ind:'测试及时交付', target:'98.5%', achieve:'—', grade:'C'}
    ]},
    {id:'q2', year:'2026', quarter:'Q2', status:'待评审', score:73, grade:'B', items:[
      {ind:'专利竞争力', target:'VP 占比 ≥ 20%', achieve:'40%（截至 6.26）', grade:'A'},
      {ind:'技术成果转化率', target:'预期 94.4%', achieve:'实际 100%', grade:'A'},
      {ind:'标准路线图 2026', target:'及时过点率 100%', achieve:'0.27', grade:'C'},
      {ind:'测试及时交付', target:'98.5%', achieve:'产品 98.2% / 研发 86.9%', grade:'C'},
      {ind:'组织竞争力', target:'覆盖率 80%', achieve:'覆盖率 17.5%', grade:'C'}
    ]},
    {id:'q3', year:'2026', quarter:'Q3', status:'考核中', score:77, grade:'B', items:[
      {ind:'创新指数', target:'开发中心 TOP5', achieve:'第十名（0.38）', grade:'C'},
      {ind:'标准路线图 2026', target:'及时过点率 100%', achieve:'恢复至 1', grade:'A'},
      {ind:'测试及时交付', target:'98.5%', achieve:'产品 95.6% / 研发 92.9%', grade:'B'},
      {ind:'创新成果覆盖率', target:'80%', achieve:'27.64%', grade:'C'},
      {ind:'协同创新', target:'Top5', achieve:'接收 19%（第三名）', grade:'A'}
    ]}
  ];
}
function seedMilestones(){
  return [
    {id:'m1', task:'热扩散 3.0a 迭代课题', cat:'安全', steps:[
      {name:'M1 立项', plan:'2026-03-02', act:'2026-03-02', state:'done'},
      {name:'M2 技术评审', plan:'2026-05-20', act:'2026-05-20', state:'done'},
      {name:'M3 材料准备', plan:'2026-06-30', act:'', state:'plan'},
      {name:'M4 过点发布', plan:'2026-08-31', act:'', state:'plan'}
    ]},
    {id:'m2', task:'标准路线图 2026 — 专项标准', cat:'测试', steps:[
      {name:'M1 立项', plan:'2026-02-15', act:'2026-02-15', state:'done'},
      {name:'M2 标准草案', plan:'2026-04-25', act:'2026-04-25', state:'done'},
      {name:'M3 一期评审', plan:'2026-05-30', act:'', state:'overdue'},
      {name:'M4 发布', plan:'2026-06-30', act:'', state:'plan'}
    ]},
    {id:'m3', task:'可靠性迭代 2.0 课题', cat:'可靠', steps:[
      {name:'M1 立项', plan:'2026-03-20', act:'2026-03-20', state:'done'},
      {name:'M2 课题一评审', plan:'2026-05-18', act:'2026-05-18', state:'done'},
      {name:'M3 课题二过点', plan:'2026-08-31', act:'', state:'plan'},
      {name:'M4 迭代发布', plan:'2026-11-30', act:'', state:'plan'}
    ]},
    {id:'m4', task:'商用车 KK 电芯项目', cat:'安全', steps:[
      {name:'M1 立项', plan:'2026-01-12', act:'2026-01-12', state:'done'},
      {name:'M2 设计安全 0 风险', plan:'2026-03-28', act:'2026-03-28', state:'done'},
      {name:'M3 PACK 热扩散 STP', plan:'2026-06-15', act:'', state:'plan'},
      {name:'M4 产线 CTS 100%', plan:'2026-06-30', act:'', state:'plan'}
    ]}
  ];
}
function seedResults(){
  return [
    {id:'r1', name:'高压液体安全技术 3.0 关键专利族', type:'专利', rel:'专利竞争力', stage:'已提交', status:'已提交', owner:'王若瑜', date:'2026-06-10'},
    {id:'r2', name:'热扩散 3.0a 技术方案研究报告', type:'研究报告', rel:'技术成果转化率', stage:'转化中', status:'评审中', owner:'禹梅芳', date:'2026-06-08'},
    {id:'r3', name:'标准路线图一期专项标准文件包', type:'标准', rel:'标准路线图 2026', stage:'转化中', status:'待发布', owner:'王玉龙', date:'2026-05-30'},
    {id:'r4', name:'可靠性量化管理体系方法论', type:'方法论', rel:'可靠性量化管理体系 1.0', stage:'已转化', status:'已应用', owner:'蔡建烟', date:'2026-05-22'},
    {id:'r5', name:'CTS-SPC 预警闭环管理系统', type:'系统', rel:'BSIL 2.0', stage:'应转尽转', status:'已上线', owner:'李燕子', date:'2026-05-10'},
    {id:'r6', name:'商用车 KK 电芯项目安全设计规范', type:'规范', rel:'商用车项目', stage:'已提交', status:'已提交', owner:'刘国雄', date:'2026-06-12'},
    {id:'r7', name:'测试质量防护机制 SOW', type:'规范', rel:'测试质量防护机制', stage:'已转化', status:'已应用', owner:'历彪', date:'2026-05-25'}
  ];
}
</script><script>
/* ---------- 状态管理 ---------- */
let state = load();
function load(){
  try{
    const raw = localStorage.getItem(LS_KEY);
    if(raw){
      const d = JSON.parse(raw);
      if(d && d.indicators && d.tasks) return d;
    }
  }catch(e){}
  const s = seed();
  return s;
}
function save(){ try{ localStorage.setItem(LS_KEY, JSON.stringify(state)); }catch(e){} }
function resetData(){
  if(!confirm('将清空本地所有修改并恢复演示数据，确定继续？')) return;
  state = seed();
  save();
  toast('已恢复演示数据');
  renderAll();
}
/* ---------- 工具函数 ---------- */
function esc(s){
  return String(s==null?'':s).replace(/[&<>"']/g, c => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
}
function toast(msg){
  const t = document.getElementById('toast');
  t.textContent = msg; t.classList.add('show');
  clearTimeout(t._h); t._h = setTimeout(()=>t.classList.remove('show'), 2200);
}
function uid(p){ return p + '_' + Date.now().toString(36) + Math.random().toString(36).slice(2,6); }
function today(){ const d=new Date(); return d.getFullYear()+'-'+String(d.getMonth()+1).padStart(2,'0')+'-'+String(d.getDate()).padStart(2,'0'); }
/* 状态徽章 */
function stBadge(st){
  const map = {green:['b-green','达标'], amber:['b-amber','预警'], red:['b-red','未达标'], gray:['b-gray','未评级']};
  const [cls, txt] = map[st] || map.gray;
  return '<span class="badge '+cls+'">'+txt+'</span>';
}
function statusBadge(s){
  const map = {'未开始':['b-gray'], '进行中':['b-brand'], '已完成':['b-green'], '已逾期':['b-red']};
  const cls = (map[s]||map['未开始'])[0];
  return '<span class="badge '+cls+'">'+s+'</span>';
}
function progressBar(p){
  const n = Math.max(0, Math.min(100, Number(p)||0));
  const cls = n>=100?'green':(n>=60?'':(n>=30?'amber':'red'));
  return '<div class="progress '+cls+'"><i style="width:'+n+'%"></i></div>';
}
/* ---------- 多用户权限 ---------- */
let currentUser = null;
function getUsers(){ return state.users || seedUsers(); }
function getCurrent(){
  if(currentUser) return currentUser;
  const def = getUsers()[0] || {id:'u1', name:'王工', role:'管理层', scope:'all', label:'管理层', short:'王'};
  currentUser = def;
  return def;
}
function canWrite(scope){
  const u = getCurrent();
  if(u.role==='管理层') return true;
  if(u.scope==='all') return true;
  return scope===u.scope;
}
function scopeItem(item){
  const u = getCurrent();
  if(u.role==='管理层' || u.scope==='all') return true;
  const sc = item.dept || item.cat || '';
  if(sc==='平台' || sc==='平台') return true;
  return sc===u.scope;
}
function setU(id){
  const u = getUsers().find(x=>x.id===id);
  if(!u) return;
  currentUser = u;
  renderUserBox();
  renderAll();
  toast('已切换为：' + u.name + '（' + u.role + '）');
}
function renderUserBox(){
  const u = getCurrent();
  document.getElementById('curAvatar').textContent = u.short || u.name.slice(0,1);
  document.getElementById('curName').textContent = u.name;
  document.getElementById('curRole').textContent = u.role + (u.scope!=='all' ? ' · '+u.scope : '');
  document.getElementById('roleChip').textContent = u.role + ' · ' + u.name;
}
function openUserSwitch(){
  const users = getUsers();
  document.getElementById('modalTitle').textContent = '切换用户（权限模拟）';
  document.getElementById('modalBody').innerHTML = `
    <div class="full" style="display:flex;flex-direction:column;gap:8px;">
      ${users.map(u=>`
        <div class="mini-row" style="cursor:pointer;" onclick="setU('${u.id}');closeModal();">
          <span class="avatar" style="width:30px;height:30px;border-radius:50%;background:linear-gradient(135deg,#26c3b7,#0f7b74);color:#fff;display:flex;align-items:center;justify-content:center;font-weight:700;font-size:13px;">${esc(u.short||u.name.slice(0,1))}</span>
          <span class="name"><b>${esc(u.name)}</b><div style="font-size:11px;color:var(--ink-3);">${esc(u.role)} · 权限范围：${esc(u.scope==='all'?'全部':u.scope)}</div></span>
          ${getCurrent().id===u.id?'<span class="badge b-brand">当前</span>':''}
        </div>`).join('')}
    </div>
    <div class="full perm-note" style="margin-top:10px;">
      权限说明：<br>
      管理层：查看全部 + 指标/任务/考核/成果全量操作；<br>
      经理层：管理本部门（安全/可靠/测试）指标、任务、成果；<br>
      执行层：任务填报、成果提交。
    </div>
  `;
  openModal();
}
</script><script>
/* ============================================================
 * 渲染：总览看板
 * ============================================================ */
function renderDashboard(){
  const inds = state.indicators, tasks = state.tasks;
  const g = inds.filter(i=>i.st==='green').length;
  const a = inds.filter(i=>i.st==='amber').length;
  const r = inds.filter(i=>i.st==='red').length;
  const done = tasks.filter(t=>t.status==='已完成').length;
  const doing = tasks.filter(t=>t.status==='进行中').length;
  const over = tasks.filter(t=>t.status==='已逾期').length;
  const notstart = tasks.filter(t=>t.status==='未开始').length;
  const avgProg = tasks.length ? Math.round(tasks.reduce((s,t)=>s+(Number(t.progress)||0),0)/tasks.length) : 0;
  const warnInds = inds.filter(i=>i.st==='red'||i.st==='amber');
  const warnTasks = tasks.filter(t=>t.status==='已逾期' || (t.status==='进行中' && (Number(t.progress)||0)<30));
  const lines = ['安全','可靠','测试'];
  const lineHtml = lines.map(l=>{
    const lt = tasks.filter(t=>t.cat===l);
    const avg = lt.length ? Math.round(lt.reduce((s,t)=>s+(Number(t.progress)||0),0)/lt.length) : 0;
    return '<div class="mini-row"><span class="badge b-brand">'+l+'</span><span class="name">'+lt.length+' 项任务</span><div class="progress" style="flex:1;max-width:160px"><i style="width:'+avg+'%"></i></div><span class="val">'+avg+'%</span></div>';
  }).join('');
  const feeds = [];
  tasks.forEach(t=> (t.logs||[]).forEach(l=> feeds.push({date:l.date, text:l.author+' · '+t.name+'：'+l.content})));
  feeds.sort((a,b)=> (a.date<b.date?1:-1));
  const feedHtml = feeds.slice(0,6).map(f=>'<div class="feed-item"><div class="head"><span class="badge b-gray">'+f.date+'</span></div><div class="content">'+esc(f.text)+'</div></div>').join('') || '<div class="empty">暂无进展记录，请到「进展填报」添加</div>';
  document.getElementById('content').innerHTML = `
    <div class="stat-grid">
      <div class="stat brand"><div class="label">指标总数</div><div class="num">${inds.length}</div><div class="meta">覆盖红线/KPI/KCI/平台/评价</div></div>
      <div class="stat green"><div class="label">达标</div><div class="num">${g}</div><div class="meta">目标达成 / 零容忍未触发</div></div>
      <div class="stat amber"><div class="label">预警</div><div class="num">${a}</div><div class="meta">需重点关注</div></div>
      <div class="stat red"><div class="label">未达标</div><div class="num">${r}</div><div class="meta">触发红线或未明确</div></div>
      <div class="stat brand"><div class="label">任务总数</div><div class="num">${tasks.length}</div><div class="meta">进行中 ${doing} · 已完成 ${done}</div></div>
      <div class="stat amber"><div class="label">逾期任务</div><div class="num">${over}</div><div class="meta">未开始 ${notstart}</div></div>
    </div>
    <div class="dash-grid">
      <div class="card card-pad">
        <div class="card-title">⚠ 预警清单 <span class="hint">未达标与预警指标 · 逾期任务（${warnInds.length + warnTasks.length}）</span></div>
        <div class="mini-list">
          ${warnInds.slice(0,6).map(i=>'<div class="mini-row">'+stBadge(i.st)+'<span class="name"><b>'+esc(i.name)+'</b></span><span class="val" style="color:var(--ink-3);font-weight:400;">'+esc(i.target||'')+'</span></div>').join('') || '<div class="empty">暂无预警指标</div>'}
          ${warnTasks.slice(0,4).map(t=>'<div class="mini-row">'+statusBadge(t.status)+'<span class="name"><b>'+esc(t.name)+'</b> · '+esc(t.owner)+'</span><span class="val" style="color:var(--ink-3);font-weight:400;">'+esc(t.due||'')+'</span></div>').join('')}
        </div>
      </div>
      <div class="card card-pad">
        <div class="card-title">◈ 任务条线进度 <span class="hint">按安全 / 可靠 / 测试聚合（平均 ${avgProg}%）</span></div>
        <div class="mini-list">${lineHtml}</div>
        <div class="card-title" style="margin-top:16px;">红线状态</div>
        <div class="mini-row"><span class="badge b-green">未触发</span><span class="name">红线九大类扣分项全年目标均为 0</span><span class="val">0</span></div>
      </div>
      <div class="card card-pad wide">
        <div class="card-title">✎ 最新进展动态 <span class="hint">来自任务/课题的填报记录</span></div>
        <div class="feed">${feedHtml}</div>
      </div>
    </div>
  `;
  document.getElementById('pageTitle').textContent = '总览看板';
  document.getElementById('pageSub').textContent = '面向管理层：指标健康度 · 任务进度 · 预警清单 · 最新动态';
}
/* ============================================================
 * 渲染：指标库
 * ============================================================ */
let indFilter = {kw:'', cat:'全部'};
function renderIndicators(){
  const cats = ['全部'].concat([...new Set(state.indicators.map(i=>i.cat))]);
  const list = state.indicators.filter(i=>{
    if(!scopeItem(i)) return false;
    if(indFilter.cat!=='全部' && i.cat!==indFilter.cat) return false;
    if(indFilter.kw){
      const k = indFilter.kw.toLowerCase();
      const hay = (i.name+i.target+i.owner+i.dept+i.src+i.note).toLowerCase();
      if(!hay.includes(k)) return false;
    }
    return true;
  });
  const canEdit = canWrite('all') || canWrite(i=>i);
  const rows = list.map(i=>`
    <tr>
      <td><b>${esc(i.name)}</b><div style="font-size:11px;color:var(--ink-3);margin-top:2px;">${esc(i.note||'')}</div></td>
      <td><span class="badge ${i.cat.includes('红线')?'b-red':i.cat.includes('KPI')?'b-navy':i.cat.includes('KCI')?'b-brand':'b-gray'}">${esc(i.cat)}</span></td>
      <td style="max-width:260px;">${esc(i.target)}</td>
      <td>${stBadge(i.st)}</td>
      <td>${esc(i.owner)}</td>
      <td>${esc(i.dept)}</td>
      <td>${esc(i.src||'—')}</td>
      <td><div class="row-actions">
        ${canWrite(i.dept||i.cat)?`<button class="btn sm" onclick="openIndicator('${i.id}')">编辑</button>
        <button class="btn sm danger" onclick="delIndicator('${i.id}')">删除</button>`:'<span class="badge b-gray">只读</span>'}
      </div></td>
    </tr>`).join('');
  document.getElementById('content').innerHTML = `
    <div class="toolbar">
      <div class="search"><input type="search" placeholder="搜索指标名称 / 目标 / 负责人 / 备注..." value="${esc(indFilter.kw)}" oninput="indFilter.kw=this.value;renderIndicators()"></div>
      <select onchange="indFilter.cat=this.value;renderIndicators()">
        ${cats.map(c=>'<option '+(c===indFilter.cat?'selected':'')+'>'+esc(c)+'</option>').join('')}
      </select>
      <span class="grow"></span>
      ${canWrite('all')?'<button class="btn primary" onclick="openIndicator()">＋ 新增指标</button>':''}
    </div>
    <div class="table-wrap">
      <table>
        <thead><tr><th>指标名称</th><th>分类</th><th>目标 / 说明</th><th>状态</th><th>负责人</th><th>战略/层级</th><th>数据来源</th><th>操作</th></tr></thead>
        <tbody>${rows || '<tr><td colspan="8"><div class="empty">无匹配指标，点击右上角「新增指标」创建</div></td></tr>'}</tbody>
      </table>
    </div>
  `;
  document.getElementById('pageTitle').textContent = '指标库';
  document.getElementById('pageSub').textContent = '全量指标字典（' + list.length + ' / ' + state.indicators.length + ' 条）· 支持增删改查';
}
let modalMode = null;
let editingIndicator = null;
function openIndicator(id){
  modalMode = 'indicator';
  editingIndicator = id || null;
  const i = id ? state.indicators.find(x=>x.id===id) : null;
  const cats = ['底线红线','开发中心KPI','开发中心KCI','事业群KCI','TRUST平台指标','价值评价体系','组织竞争力'];
  document.getElementById('modalTitle').textContent = i ? '编辑指标' : '新增指标';
  document.getElementById('modalBody').innerHTML = `
    <div class="field full"><label>指标名称 *</label><input id="f_name" value="${esc(i?i.name:'')}" placeholder="例如：市场可靠性失效率"></div>
    <div class="field"><label>分类</label><select id="f_cat">${cats.map(c=>'<option '+(i&&i.cat===c?'selected':'')+'>'+c+'</option>').join('')}</select></div>
    <div class="field"><label>状态</label><select id="f_st">
      <option value="green" ${i&&i.st==='green'?'selected':''}>达标</option>
      <option value="amber" ${(!i||i.st==='amber')?'selected':''}>预警</option>
      <option value="red" ${i&&i.st==='red'?'selected':''}>未达标</option>
      <option value="gray" ${i&&i.st==='gray'?'selected':''}>未评级</option>
    </select></div>
    <div class="field full"><label>目标 / 说明</label><input id="f_target" value="${esc(i?i.target:'')}" placeholder="例如：两年累计失效率 ≤ 500ppm"></div>
    <div class="field"><label>负责人 / 承接方</label><input id="f_owner" value="${esc(i?i.owner:'')}"></div>
    <div class="field"><label>战略 / 层级</label><input id="f_dept" value="${esc(i?i.dept:'')}"></div>
    <div class="field"><label>数据来源</label><input id="f_src" value="${esc(i?i.src:'')}"></div>
    <div class="field full"><label>备注</label><textarea id="f_note" placeholder="季度达成情况、口径说明等">${esc(i?i.note:'')}</textarea></div>
  `;
  openModal();
}
function modalSubmit(){
  if(modalMode === 'indicator'){
    const name = document.getElementById('f_name').value.trim();
    if(!name){ toast('请填写指标名称'); return; }
    const data = {
      name,
      cat: document.getElementById('f_cat').value,
      st: document.getElementById('f_st').value,
      target: document.getElementById('f_target').value.trim(),
      owner: document.getElementById('f_owner').value.trim(),
      dept: document.getElementById('f_dept').value.trim(),
      src: document.getElementById('f_src').value.trim(),
      note: document.getElementById('f_note').value.trim()
    };
    if(editingIndicator){
      const i = state.indicators.find(x=>x.id===editingIndicator);
      Object.assign(i, data);
      toast('指标已更新');
    } else {
      state.indicators.push({...data, id: uid('i')});
      toast('指标已新增');
    }
    save(); closeModal(); renderAll();
  } else if(modalMode === 'task'){
    const name = document.getElementById('t_name').value.trim();
    if(!name){ toast('请填写任务名称'); return; }
    const data = {
      name,
      cat: document.getElementById('t_cat').value,
      rel: document.getElementById('t_rel').value.trim(),
      milestone: document.getElementById('t_milestone').value.trim(),
      status: document.getElementById('t_status').value,
      progress: Number(document.getElementById('t_progress').value)||0,
      owner: document.getElementById('t_owner').value.trim(),
      due: document.getElementById('t_due').value,
      note: document.getElementById('t_note').value.trim()
    };
    if(editingTask){
      const t = state.tasks.find(x=>x.id===editingTask);
      Object.assign(t, data);
      toast('任务已更新');
    } else {
      state.tasks.push({...data, id: uid('t'), logs: []});
      toast('任务已新增');
    }
    save(); closeModal(); renderAll();
  } else if(modalMode === 'log'){
    const content = document.getElementById('l_content').value.trim();
    if(!content){ toast('请填写进展内容'); return; }
    const t = state.tasks.find(x=>x.id===editingLogTask);
    if(t){
      t.logs = t.logs||[];
      t.logs.push({date: document.getElementById('l_date').value || today(), author: document.getElementById('l_author').value.trim() || '我', content});
      save(); closeModal(); renderAll();
      toast('进展已填报');
    }
  } else if(modalMode === 'quarter'){
    const q = {
      id: uid('q'),
      year: document.getElementById('q_year').value || '2026',
      quarter: document.getElementById('q_quarter').value,
      status: '考核中',
      score: Number(document.getElementById('q_score').value)||0,
      grade: Number(document.getElementById('q_score').value)>=85?'A':(Number(document.getElementById('q_score').value)>=70?'B':'C'),
      items: []
    };
    state.quarters = state.quarters||[];
    state.quarters.push(q);
    save(); closeModal(); renderAll();
    toast('季度考核已创建（可后续在数据中补充指标明细）');
  } else if(modalMode === 'milestone'){
    const t = document.getElementById('m_task').value;
    const steps = JSON.parse(document.getElementById('m_steps').value || '[]');
    if(!t){ toast('请填写任务/课题名称'); return; }
    state.milestones = state.milestones||[];
    state.milestones.push({id: uid('m'), task: t, cat: document.getElementById('m_cat').value, steps});
    save(); closeModal(); renderAll();
    toast('里程碑已新增');
  } else if(modalMode === 'result'){
    const name = document.getElementById('r_name').value.trim();
    if(!name){ toast('请填写成果名称'); return; }
    const data = {
      id: uid('r'),
      name,
      type: document.getElementById('r_type').value,
      rel: document.getElementById('r_rel').value.trim(),
      stage: document.getElementById('r_stage').value,
      status: document.getElementById('r_stage').value,
      owner: document.getElementById('r_owner').value.trim(),
      date: document.getElementById('r_date').value || today()
    };
    state.results = state.results||[];
    state.results.push(data);
    save(); closeModal(); renderAll();
    toast('成果已新增');
  }
}
function delIndicator(id){
  if(!confirm('删除该指标？此操作不可恢复。')) return;
  state.indicators = state.indicators.filter(i=>i.id!==id);
  save(); renderAll(); toast('指标已删除');
}
/* ============================================================
 * 渲染：任务 / 课题
 * ============================================================ */
let taskFilter = {kw:'', cat:'全部', status:'全部'};
function renderTasks(){
  const cats = ['全部'].concat([...new Set(state.tasks.map(t=>t.cat))]);
  const sts = ['全部','未开始','进行中','已完成','已逾期'];
  const list = state.tasks.filter(t=>{
    if(!scopeItem(t)) return false;
    if(taskFilter.cat!=='全部' && t.cat!==taskFilter.cat) return false;
    if(taskFilter.status!=='全部' && t.status!==taskFilter.status) return false;
    if(taskFilter.kw){
      const k = taskFilter.kw.toLowerCase();
      const hay = (t.name+t.rel+t.owner+t.note).toLowerCase();
      if(!hay.includes(k)) return false;
    }
    return true;
  });
  const rows = list.map(t=>`
    <tr>
      <td><b>${esc(t.name)}</b><div style="font-size:11px;color:var(--ink-3);margin-top:2px;">关联：${esc(t.rel||'—')}</div></td>
      <td><span class="badge b-brand">${esc(t.cat)}</span></td>
      <td style="max-width:180px;">${esc(t.milestone||'—')}</td>
      <td>${statusBadge(t.status)}</td>
      <td style="min-width:120px;"><div style="display:flex;align-items:center;gap:8px;">${progressBar(t.progress)}<span style="font-size:12px;color:var(--ink-3);white-space:nowrap;">${Number(t.progress)||0}%</span></div></td>
      <td>${esc(t.owner)}</td>
      <td style="white-space:nowrap;">${esc(t.due||'—')}</td>
      <td><div class="row-actions">
        <button class="btn sm" onclick="openLog('${t.id}')">填报</button>
        ${canWrite(t.cat)?`<button class="btn sm" onclick="openTask('${t.id}')">编辑</button>
        <button class="btn sm danger" onclick="delTask('${t.id}')">删除</button>`:'<span class="badge b-gray">只读</span>'}
      </div></td>
    </tr>`).join('');
  document.getElementById('content').innerHTML = `
    <div class="toolbar">
      <div class="search"><input type="search" placeholder="搜索任务 / 关联指标 / 负责人..." value="${esc(taskFilter.kw)}" oninput="taskFilter.kw=this.value;renderTasks()"></div>
      <select onchange="taskFilter.cat=this.value;renderTasks()">${cats.map(c=>'<option '+(c===taskFilter.cat?'selected':'')+'>'+esc(c)+'</option>').join('')}</select>
      <select onchange="taskFilter.status=this.value;renderTasks()">${sts.map(s=>'<option '+(s===taskFilter.status?'selected':'')+'>'+s+'</option>').join('')}</select>
      <span class="grow"></span>
      ${canWrite('all')?'<button class="btn primary" onclick="openTask()">＋ 新增任务</button>':''}
    </div>
    <div class="table-wrap">
      <table>
        <thead><tr><th>任务 / 课题</th><th>条线</th><th>里程碑</th><th>状态</th><th>进度</th><th>负责人</th><th>截止</th><th>操作</th></tr></thead>
        <tbody>${rows || '<tr><td colspan="8"><div class="empty">无匹配任务，点击右上角「新增任务」创建</div></td></tr>'}</tbody>
      </table>
    </div>
  `;
  document.getElementById('pageTitle').textContent = '任务 / 课题';
  document.getElementById('pageSub').textContent = '三级贯通：指标 → 任务/课题 → 成果 · 支持增删改查与进展填报';
}
let editingTask = null;
function openTask(id){
  modalMode = 'task';
  editingTask = id || null;
  const t = id ? state.tasks.find(x=>x.id===id) : null;
  const cats = ['安全','可靠','测试','平台','其他'];
  const sts = ['未开始','进行中','已完成','已逾期'];
  document.getElementById('modalTitle').textContent = t ? '编辑任务 / 课题' : '新增任务 / 课题';
  document.getElementById('modalBody').innerHTML = `
    <div class="field full"><label>任务 / 课题名称 *</label><input id="t_name" value="${esc(t?t.name:'')}" placeholder="例如：热扩散 3.0a 迭代课题"></div>
    <div class="field"><label>条线</label><select id="t_cat">${cats.map(c=>'<option '+(t&&t.cat===c?'selected':'')+'>'+c+'</option>').join('')}</select></div>
    <div class="field"><label>状态</label><select id="t_status">${sts.map(s=>'<option '+(t&&t.status===s?'selected':'')+'>'+s+'</option>').join('')}</select></div>
    <div class="field full"><label>关联指标</label><input id="t_rel" value="${esc(t?t.rel:'')}" placeholder="选择或输入关联的红线/KPI/KCI/平台指标" list="relList">
      <datalist id="relList">${state.indicators.slice(0,20).map(i=>'<option value="'+esc(i.name)+'">').join('')}</datalist>
    </div>
    <div class="field"><label>里程碑 / 关键节点</label><input id="t_milestone" value="${esc(t?t.milestone:'')}"></div>
    <div class="field"><label>进度（0-100）</label><input id="t_progress" type="number" min="0" max="100" value="${t?t.progress:0}"></div>
    <div class="field"><label>负责人</label><input id="t_owner" value="${esc(t?t.owner:'')}"></div>
    <div class="field"><label>截止日期</label><input id="t_due" type="date" value="${esc(t?t.due:'')}"></div>
    <div class="field full"><label>备注</label><textarea id="t_note" placeholder="任务说明、风险等">${esc(t?t.note:'')}</textarea></div>
  `;
  openModal();
}
function delTask(id){
  if(!confirm('删除该任务？其填报记录也将一并删除。')) return;
  state.tasks = state.tasks.filter(t=>t.id!==id);
  save(); renderAll(); toast('任务已删除');
}
/* ============================================================
 * 渲染：进展填报
 * ============================================================ */
let editingLogTask = null;
function openLog(taskId){
  modalMode = 'log';
  editingLogTask = taskId;
  const t = state.tasks.find(x=>x.id===taskId);
  if(!t) return;
  document.getElementById('modalTitle').textContent = '填报进展 · ' + t.name;
  document.getElementById('modalBody').innerHTML = `
    <div class="field"><label>日期</label><input id="l_date" type="date" value="${today()}"></div>
    <div class="field"><label>填报人</label><input id="l_author" value="${esc(getCurrent().name)}"></div>
    <div class="field full"><label>进展内容 *</label><textarea id="l_content" placeholder="描述本次进展：完成节点、遇到的问题、下一步计划..."></textarea></div>
    <div class="field full" style="background:var(--surface-2);border-radius:8px;padding:8px 10px;font-size:12px;color:var(--ink-3);">当前进度：${t.progress}% · 状态：${t.status} · 关联：${esc(t.rel||'—')}</div>
  `;
  openModal();
}
function renderLogs(){
  const entries = [];
  state.tasks.forEach(t=>{
    if(!scopeItem(t)) return;
    (t.logs||[]).forEach(l=>entries.push({date:l.date, task:t.name, cat:t.cat, author:l.author, content:l.content, tid:t.id}));
  });
  entries.sort((a,b)=> (a.date<b.date?1:-1));
  const catCounts = {};
  state.tasks.filter(t=>scopeItem(t)).forEach(t=>{ catCounts[t.cat]=(catCounts[t.cat]||0)+1; });
  document.getElementById('content').innerHTML = `
    <div class="dash-grid">
      <div class="card card-pad">
        <div class="card-title">快速填报进展 <span class="hint">选择任务后填写</span></div>
        <div class="mini-list">
          ${state.tasks.filter(t=>scopeItem(t)).map(t=>`<div class="mini-row">
            <span class="badge b-brand">${esc(t.cat)}</span>
            <span class="name"><b>${esc(t.name)}</b><div style="font-size:11px;color:var(--ink-3);">${statusBadge(t.status)} 进度 ${t.progress}%</div></span>
            <button class="btn sm primary" onclick="openLog('${t.id}')">填报</button>
          </div>`).join('') || '<div class="empty">暂无任务</div>'}
        </div>
      </div>
      <div class="card card-pad">
        <div class="card-title">任务概况 <span class="hint">按条线分布</span></div>
        <div class="mini-list">
          ${Object.keys(catCounts).map(c=>'<div class="mini-row"><span class="badge b-brand">'+esc(c)+'</span><span class="name">任务数量</span><span class="val">'+catCounts[c]+'</span></div>').join('')}
        </div>
        <div class="card-title" style="margin-top:16px;">操作提示</div>
        <div style="font-size:12.5px;color:var(--ink-3);line-height:1.9;">填报的进展会自动同步到「总览看板」的最新动态；任务状态与进度请在「任务/课题」中编辑。</div>
      </div>
      <div class="card card-pad wide">
        <div class="card-title">进展记录 <span class="hint">共 ${entries.length} 条</span></div>
        <div class="feed">${entries.map(e=>`
          <div class="feed-item">
            <div class="head">
              <span class="badge b-gray">${esc(e.date)}</span>
              <span class="badge b-brand">${esc(e.cat)}</span>
              <span class="meta">${esc(e.author)}</span>
            </div>
            <div class="content"><b>${esc(e.task)}</b>：${esc(e.content)}</div>
          </div>`).join('') || '<div class="empty">暂无进展记录</div>'}</div>
      </div>
    </div>
  `;
  document.getElementById('pageTitle').textContent = '进展填报';
  document.getElementById('pageSub').textContent = '面向执行层：按任务填报进展，同步形成动态与成果依据';
}
</script><script>
/* ============================================================
 * 渲染：里程碑管理
 * ============================================================ */
function msStepHtml(s){
  const stateMap = {done:['done','已完成'], plan:['plan','计划'], overdue:['overdue','逾期']};
  const [cls, txt] = stateMap[s.state]||stateMap.plan;
  return `<div class="ms-step ${cls}">
    <div class="ms-name">${esc(s.name)}</div>
    <div class="ms-date">计划：${esc(s.plan||'—')}</div>
    <div class="ms-date">实际：${esc(s.act||'—')}</div>
    <div class="ms-state">${txt}</div>
  </div>`;
}
function renderMilestones(){
  const list = state.milestones || [];
  const cards = list.map(m=>{
    const doneCnt = m.steps.filter(s=>s.state==='done').length;
    const overdueList = m.steps.filter(s=>s.state==='overdue');
    return `<div class="ms-card">
      <div class="ms-head">
        <h3>${esc(m.task)}</h3>
        <span class="badge b-brand">${esc(m.cat)}</span>
        <span class="ms-meta">${doneCnt}/${m.steps.length} 个节点已完成</span>
        ${canWrite(m.cat)?`<div class="row-actions">
          <button class="btn sm" onclick="openMilestone('${m.id}')">编辑</button>
          <button class="btn sm danger" onclick="delMilestone('${m.id}')">删除</button>
        </div>`:''}
      </div>
      <div class="ms-steps">${m.steps.map(msStepHtml).join('')}</div>
      ${overdueList.length?`<div class="ms-warn">⚠ 逾期节点：${overdueList.map(s=>esc(s.name)).join('、')}</div>`:''}
    </div>`;
  }).join('');
  document.getElementById('content').innerHTML = `
    <div class="toolbar">
      <div class="search"></div>
      <span class="hint" style="color:var(--ink-3);font-size:12.5px;">共 ${list.length} 条里程碑跟踪；成熟度节点 M1-M4，逾期自动标红。</span>
      <span class="grow"></span>
      ${canWrite('all')?'<button class="btn primary" onclick="openMilestone()">＋ 新增里程碑</button>':''}
    </div>
    ${cards || '<div class="card card-pad empty">暂无里程碑</div>'}
  `;
  document.getElementById('pageTitle').textContent = '里程碑管理';
  document.getElementById('pageSub').textContent = '按任务/课题跟踪成熟度 M1-M4 过点时间线，逾期自动预警';
}
function openMilestone(id){
  modalMode = 'milestone';
  const m = id ? (state.milestones||[]).find(x=>x.id===id) : null;
  document.getElementById('modalTitle').textContent = m ? '编辑里程碑' : '新增里程碑';
  document.getElementById('modalBody').innerHTML = `
    <div class="field full"><label>任务 / 课题名称 *</label><input id="m_task" value="${esc(m?m.task:'')}"></div>
    <div class="field"><label>条线</label><select id="m_cat"><option ${!m||m.cat==='安全'?'selected':''}>安全</option><option ${m&&m.cat==='可靠'?'selected':''}>可靠</option><option ${m&&m.cat==='测试'?'selected':''}>测试</option><option ${m&&m.cat==='平台'?'selected':''}>平台</option></select></div>
    <div class="field full"><label>节点（JSON，M1-M4）</label><textarea id="m_steps" style="min-height:140px;font-family:monospace;font-size:12px;" placeholder='[{"name":"M1 立项","plan":"2026-03-02","act":"2026-03-02","state":"done"},{"name":"M2 技术评审","plan":"2026-05-20","act":"","state":"plan"}]'>${esc(m?JSON.stringify(m.steps):'')}</textarea></div>
  `;
  openModal();
}
function delMilestone(id){
  if(!confirm('删除该里程碑？')) return;
  state.milestones = (state.milestones||[]).filter(m=>m.id!==id);
  save(); renderAll(); toast('里程碑已删除');
}
/* ============================================================
 * 渲染：季度考核
 * ============================================================ */
function renderQuarters(){
  const list = state.quarters || [];
  const cards = list.map(q=>`
    <div class="q-card">
      <div class="q-head">
        <h3>${q.year} ${q.quarter}</h3>
        ${statusBadge2(q.status)}
        <span class="grow"></span>
        <div class="q-score"><span class="score-big">${q.score}</span> 分</div>
        <span class="badge ${q.grade==='A'?'b-green':q.grade==='B'?'b-brand':'b-amber'}" style="font-size:14px;">${q.grade}</span>
        ${canWrite('all') && q.status!=='已通过' ? `<button class="btn sm primary" onclick="passQuarter('${q.id}')">标记通过</button>`:''}
      </div>
      <div class="q-items">
        ${(q.items||[]).map(it=>`
          <div class="q-item">
            <span class="qi-name">${esc(it.ind)}</span>
            <span class="qi-target">目标：${esc(it.target)}</span>
            <span class="qi-target">达成：${esc(it.achieve)}</span>
            <span class="qi-grade g${it.grade||'C'}">${it.grade||''}</span>
          </div>`).join('') || '<div class="empty">暂无指标明细</div>'}
      </div>
    </div>`).join('');
  document.getElementById('content').innerHTML = `
    <div class="toolbar">
      <div class="search"></div>
      <span style="color:var(--ink-3);font-size:12.5px;">考核自动计算：综合得分与评级（A≥85 / B≥70 / C）</span>
      <span class="grow"></span>
      ${canWrite('all')?'<button class="btn primary" onclick="openQuarter()">＋ 新建季度考核</button>':''}
    </div>
    ${cards || '<div class="card card-pad empty">暂无季度考核</div>'}
    <div class="card card-pad" style="margin-top:16px;">
      <div class="card-title">考核规则 <span class="hint">自动计算</span></div>
      <div class="kv-grid">
        <div class="kv"><div class="k">评分</div><div class="v">A=95 · B=78 · C=58</div></div>
        <div class="kv"><div class="k">评级</div><div class="v">≥85 A · ≥70 B · 其余 C</div></div>
        <div class="kv"><div class="k">闭环</div><div class="v">未达标自动生成改进任务</div></div>
      </div>
    </div>
  `;
  document.getElementById('pageTitle').textContent = '季度考核';
  document.getElementById('pageSub').textContent = '按季度对关键指标进行目标/达成/评级考核，管理层标记通过';
}
function statusBadge2(s){
  const map = {'已通过':'b-green','待评审':'b-amber','考核中':'b-brand'};
  const cls = map[s]||'b-gray';
  return '<span class="badge '+cls+'">'+s+'</span>';
}
function passQuarter(id){
  if(!confirm('标记该季度考核为“已通过”？')) return;
  const q = (state.quarters||[]).find(x=>x.id===id);
  if(q){ q.status='已通过'; save(); renderAll(); toast('季度考核已通过'); }
}
function openQuarter(){
  modalMode = 'quarter';
  document.getElementById('modalTitle').textContent = '新建季度考核';
  document.getElementById('modalBody').innerHTML = `
    <div class="field"><label>年份</label><input id="q_year" value="2026"></div>
    <div class="field"><label>季度</label><select id="q_quarter"><option>Q1</option><option>Q2</option><option>Q3</option><option>Q4</option></select></div>
    <div class="field full"><label>综合得分</label><input id="q_score" type="number" min="0" max="100" value="70"></div>
    <div class="field full perm-note">评级将根据得分自动计算（≥85 A / ≥70 B / 其余 C）。指标明细可在后续编辑数据中补充。</div>
  `;
  openModal();
}
/* ============================================================
 * 渲染：成果转化
 * ============================================================ */
const STAGE_ORDER = ['已提交','转化中','已转化','应转尽转'];
function renderResults(){
  const list = state.results || [];
  const cards = list.map(r=>{
    const idx = STAGE_ORDER.indexOf(r.stage);
    return `<div class="res-card">
      <div class="res-body">
        <h3>${esc(r.name)}</h3>
        <div class="res-meta">${esc(r.type)} · 关联指标：${esc(r.rel||'—')}</div>
        <div class="res-stage">
          ${STAGE_ORDER.map((s,i)=>'<span class="pipe-dot '+(i<=idx?'active':'')+'" style=""></span><span class="pipe '+(i<=idx?'':'')+'" style="font-weight:'+(i===idx?'700':'400')+';">'+s+'</span>'+(i<STAGE_ORDER.length-1?'<span class="pipe">→</span>':'')).join('')}
        </div>
        <div style="font-size:12px;color:var(--ink-3);margin-top:8px;">负责人：${esc(r.owner)} · 提交：${esc(r.date)}</div>
      </div>
      <div style="display:flex;flex-direction:column;gap:6px;align-items:flex-end;">
        ${canWrite('all')?`<button class="btn sm" onclick="advanceResult('${r.id}')">推进阶段</button>
        <button class="btn sm danger" onclick="delResult('${r.id}')">删除</button>`:''}
      </div>
    </div>`;
  }).join('');
  document.getElementById('content').innerHTML = `
    <div class="toolbar">
      <div class="search"></div>
      <span style="color:var(--ink-3);font-size:12.5px;">成果转化链路：应写尽写 → 转化中 → 已转化 → 应转尽转</span>
      <span class="grow"></span>
      ${canWrite('all')?'<button class="btn primary" onclick="openResult()">＋ 新增成果</button>':''}
    </div>
    ${cards || '<div class="card card-pad empty">暂无成果</div>'}
    <div class="card card-pad" style="margin-top:16px;">
      <div class="card-title">转化口径 <span class="hint">应写尽写 → 已转化 → 应转尽转</span></div>
      <div class="kv-grid">
        <div class="kv"><div class="k">应写尽写</div><div class="v">专利竞争力：专利申请应写尽写，VP 占比 ≥ 20%</div></div>
        <div class="kv"><div class="k">应转尽转</div><div class="v">技术成果转化率：实际/预期可转化率跟踪</div></div>
        <div class="kv"><div class="k">成果形态</div><div class="v">覆盖系统、标准、专利、规范、方法论</div></div>
      </div>
    </div>
  `;
  document.getElementById('pageTitle').textContent = '成果转化';
  document.getElementById('pageSub').textContent = '跟踪专利/标准/系统/方法论成果的转化阶段与应写尽写/应转尽转';
}
function advanceResult(id){
  const r = (state.results||[]).find(x=>x.id===id);
  if(!r) return;
  const idx = STAGE_ORDER.indexOf(r.stage);
  if(idx < STAGE_ORDER.length-1){
    r.stage = STAGE_ORDER[idx+1];
    r.status = r.stage;
    save(); renderAll(); toast('成果阶段推进为：' + r.stage);
  } else {
    toast('已是最终阶段「应转尽转」');
  }
}
function delResult(id){
  if(!confirm('删除该成果？')) return;
  state.results = (state.results||[]).filter(r=>r.id!==id);
  save(); renderAll(); toast('成果已删除');
}
function openResult(){
  modalMode = 'result';
  document.getElementById('modalTitle').textContent = '新增成果';
  document.getElementById('modalBody').innerHTML = `
    <div class="field full"><label>成果名称 *</label><input id="r_name" placeholder="例如：XX 专利族 / XX 研究报告"></div>
    <div class="field"><label>成果形态</label><select id="r_type"><option>专利</option><option>研究报告</option><option>标准</option><option>系统</option><option>规范</option><option>方法论</option></select></div>
    <div class="field"><label>阶段</label><select id="r_stage">${STAGE_ORDER.map(s=>'<option>'+s+'</option>').join('')}</select></div>
    <div class="field"><label>关联指标</label><input id="r_rel" list="relList2"><datalist id="relList2">${(state.indicators||[]).slice(0,20).map(i=>'<option value="'+esc(i.name)+'">').join('')}</datalist></div>
    <div class="field"><label>负责人</label><input id="r_owner" value="${esc(getCurrent().name)}"></div>
    <div class="field"><label>提交日期</label><input id="r_date" type="date" value="${today()}"></div>
  `;
  openModal();
}
/* ============================================================
 * 渲染：组织竞争力 / 价值评价
 * ============================================================ */
function renderOrg(){
  const getInd = (n)=> state.indicators.find(i=>i.name.includes(n));
  const p = getInd('人均创新指数'), c = getInd('创新成果覆盖率'), s = getInd('超均值指数占比'), x = getInd('协同创新'), d = getInd('人均点子数');
  const quads = [
    {num:'01', name:'产出效率', desc:'平台标杆 · 博士人均产出 · 成果数据量化', chips:['人均创新指数','应写尽写','应转尽转','技术转化周期','超均值指数占比','创新成果覆盖率','核心项目负责人占比'], items:[
      ['人均创新指数', p?p.st:null, p?p.note:'参考开发中心'],
      ['创新成果覆盖率', c?c.st:null, c?c.target+' · '+c.note:'80%'],
      ['超均值指数占比', s?s.st:null, s?s.target+' · '+s.note:'20.7%']
    ]},
    {num:'02', name:'创新生态', desc:'人均项目数 · 人均点子数 · 人均成果数', chips:['人均项目数','人均点子数','人均成果数','明确层级','孵化保障','项目追踪'], items:[
      ['人均点子数', d?d.st:null, d?d.note:'数据统计中'],
    ]},
    {num:'03', name:'协同创新', desc:'协同指数（赋予/接收）· 共创项目占比', chips:['协同指数（赋予）','协同指数（接收）','共创项目占比','任务发布','攻坚团队','打破部门墙'], items:[
      ['协同创新（协同指数）', x?x.st:null, x?x.note:'Q3 接收 19%（第三名）'],
    ]},
    {num:'04', name:'人才指标', desc:'人才画像 · 人尽其才 · 加速培养 · 反馈闭环', chips:['人才画像','人尽其才','加速培养','反馈闭环机制'], items:[]}
  ];
  const qHtml = quads.map(q=>`
    <div class="quad">
      <div class="q-num">${q.num}</div>
      <h3>${q.name}</h3>
      <div class="desc">${q.desc}</div>
      <div class="chip-row">${q.chips.map(c=>'<span class="chip">'+esc(c)+'</span>').join('')}</div>
      ${q.items.length?`<div style="margin-top:12px;display:flex;flex-direction:column;gap:8px;">${q.items.map(it=>{
        return '<div class="mini-row"><span class="name">'+esc(it[0])+'</span>'+stBadge(it[1]||'gray')+'<span class="val" style="font-weight:400;color:var(--ink-3);">'+esc(it[2])+'</span></div>';
      }).join('')}</div>`:''}
    </div>`).join('');
  document.getElementById('content').innerHTML = `
    <div class="quad-grid">${qHtml}</div>
    <div class="card card-pad">
      <div class="card-title">落地机制 <span class="hint">目标：KCI / KPI / OKR · 组织和文化 · 流程与协作</span></div>
      <div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(240px,1fr));gap:12px;">
        <div class="kv"><div class="k">目标明确</div><div class="v">平台发布课题、任务招募项目成员，明确研究方向和课题</div></div>
        <div class="kv"><div class="k">过程监控</div><div class="v">设置可视化看板，动态更新进度</div></div>
        <div class="kv"><div class="k">激励机制</div><div class="v">设计成果认定机制与激励机制</div></div>
        <div class="kv"><div class="k">反馈闭环</div><div class="v">能力意愿评价、岗位适配度分析、培训体系与案例库</div></div>
      </div>
    </div>
  `;
  document.getElementById('pageTitle').textContent = '组织竞争力 · 价值评价';
  document.getElementById('pageSub').textContent = '四大象限：产出效率、创新生态、协同创新、人才指标';
}
function renderValue(){
  const find = (n)=> state.indicators.find(i=>i.name.includes(n));
  const mods = [
    {icon:'◉', name:'安全模块', desc:'本征安全 · 市场表现量化评价', items:[
      ['市场产品本征安全失效率', find('市场产品本征安全失效率')],
      ['市场产品割底平均失效里程', find('市场产品割底平均失效里程')],
      ['本征失控后起火比例', find('本征失控后起火比例')]
    ]},
    {icon:'◈', name:'可靠模块', desc:'市场可靠性量化评价', items:[
      ['市场可靠性失效率', find('市场可靠性失效率')]
    ]},
    {icon:'▣', name:'测试模块', desc:'测试质量与能力量化评价', items:[
      ['测试准确度提升', find('测试准确度提升')],
      ['测试质量防护机制', find('测试质量防护机制')],
      ['测试“0”逃逸', find('测试“0”逃逸')],
      ['资源满足率', find('资源满足率')]
    ]}
  ];
  const mHtml = mods.map(m=>{
    const rows = m.items.map(([name, ind])=>`
      <div class="mini-row">
        <span class="name"><b>${esc(name)}</b></span>
        ${stBadge(ind?ind.st:'gray')}
        <span class="val" style="font-weight:400;color:var(--ink-3);">${esc(ind?ind.target:'—')}</span>
      </div>`).join('');
    return `<div class="module-card"><h3>${m.icon} ${m.name}</h3><div class="desc">${m.desc}</div><div class="mini-list">${rows}</div></div>`;
  }).join('');
  document.getElementById('content').innerHTML = `
    <div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(280px,1fr));gap:14px;margin-bottom:16px;">${mHtml}</div>
    <div class="card card-pad">
      <div class="card-title">评价口径说明 <span class="hint">基于市场表现数据</span></div>
      <div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(240px,1fr));gap:12px;">
        <div class="kv"><div class="k">安全模块</div><div class="v">本征安全失效率以新生产电池市场数据为统计口径，起火比例 0 为底线</div></div>
        <div class="kv"><div class="k">可靠模块</div><div class="v">可靠性迭代 2.0 实施后，市场可靠性两年累计失效率 ≤ 500ppm</div></div>
        <div class="kv"><div class="k">测试模块</div><div class="v">测试准确度、质量防护机制、0 逃逸与资源满足率综合评测</div></div>
      </div>
    </div>
  `;
  document.getElementById('pageTitle').textContent = '价值评价体系';
  document.getElementById('pageSub').textContent = '安全 / 可靠 / 测试三大量化评价模块';
}
/* ============================================================
 * 通用：导航 + 弹窗 + 导出
 * ============================================================ */
let currentView = 'dashboard';
const renderers = {dashboard:renderDashboard, indicators:renderIndicators, tasks:renderTasks, logs:renderLogs, milestones:renderMilestones, quarters:renderQuarters, results:renderResults, org:renderOrg, value:renderValue};
function switchView(v){
  currentView = v;
  document.querySelectorAll('.nav-item').forEach(n=>n.classList.toggle('active', n.dataset.view===v));
  (renderers[v]||renderDashboard)();
  document.getElementById('content').scrollTop = 0;
}
function renderAll(){
  document.getElementById('badgeWarn').textContent = state.indicators.filter(i=>i.st==='red'||i.st==='amber').length;
  switchView(currentView);
}
function openModal(){ document.getElementById('modalMask').classList.add('show'); }
function closeModal(){ document.getElementById('modalMask').classList.remove('show'); modalMode=editingIndicator=editingTask=editingLogTask=null; }
document.getElementById('modalMask').addEventListener('click', e=>{ if(e.target.id==='modalMask') closeModal(); });
function exportJSON(){
  const blob = new Blob([JSON.stringify(state, null, 2)], {type:'application/json'});
  const a = document.createElement('a');
  a.href = URL.createObjectURL(blob);
  a.download = 'TRUST平台指标任务数据_' + today() + '.json';
  a.click();
  URL.revokeObjectURL(a.href);
  toast('数据已导出为 JSON');
}
/* 导航绑定 */
document.querySelectorAll('.nav-item').forEach(n=>{
  n.addEventListener('click', ()=> switchView(n.dataset.view));
});
/* 初始化 */
renderUserBox();
renderAll();
</script>
</body>
</html>
