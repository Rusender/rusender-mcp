# Эталон вёрстки: анализ рассылки

Утверждённый дизайн отчёта в виде образца на данных примера. Это **образец**, а не готовый файл:
страница собирается заново, данные примера заменяются реальными.

## Как собрать страницу
1. Тег title — по образцу: `Рассылка «Финал распродажи LETO33» — анализ` (подставь реальные названия и даты).
2. Тег style — весь CSS из раздела «CSS» дословно. Не меняй ни одного значения.
3. Разметка — по разделу «Разметка»: те же разделы, порядок, классы, подписи и элементы
   интерфейса. Меняются только данные: числа, проценты, даты, названия, количество строк,
   столбцов и элементов в списках, ширины и высоты полос, координаты фигур в SVG.
4. `{{ICON:Gmail}}` и подобные метки — логотип провайдера: data URI из поля `iconBase64`
   ответа `get_stats_by_domains` для этой группы.
5. `{{IMG:…}}` — картинка из шаблона письма. Внешние картинки в артефакте блокируются,
   поэтому вместо них — плейсхолдер-блок по правилам SKILL.md (раздел про превью письма).

Запреты на изменение вёрстки — в SKILL.md, раздел «Вёрстка … не меняется».

## CSS

```css
  :root{
    --ground:#f6f8fb; --card:#ffffff; --ink:#17202e; --muted:#5f6b7a;
    --line:#e3e8f0; --accent:#2563eb; --accent-ink:#ffffff;
    --good:#15935b; --warn:#c9791b; --crit:#d23b3b;
    --gmail:#4285f4; --yandex:#7b5cd6; --mailru:#1a86e0; --other:#8a8594;
    --accent2:#14b8a6;
    --shadow:0 1px 2px rgba(15,23,42,.05),0 12px 32px rgba(15,23,42,.07);
    --radius:16px;
    --sans:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif;
  }
  @media (prefers-color-scheme:dark){:root{
    --ground:#0f1520; --card:#1a2130; --ink:#eef2f8; --muted:#9aa7ba;
    --line:#273143; --accent:#6ea3f2; --accent-ink:#0f1520;
    --good:#3fbe83; --warn:#e0a24a; --crit:#f2726f;
    --shadow:0 1px 2px rgba(0,0,0,.3),0 14px 36px rgba(0,0,0,.4);
  }}
  :root[data-theme="light"]{
    --ground:#f6f8fb; --card:#ffffff; --ink:#17202e; --muted:#5f6b7a;
    --line:#e3e8f0; --accent:#2563eb; --accent-ink:#ffffff;
    --good:#15935b; --warn:#c9791b; --crit:#d23b3b;
    --shadow:0 1px 2px rgba(15,23,42,.05),0 12px 32px rgba(15,23,42,.07);
  }
  :root[data-theme="dark"]{
    --ground:#0f1520; --card:#1a2130; --ink:#eef2f8; --muted:#9aa7ba;
    --line:#273143; --accent:#6ea3f2; --accent-ink:#0f1520;
    --good:#3fbe83; --warn:#e0a24a; --crit:#f2726f;
    --shadow:0 1px 2px rgba(0,0,0,.3),0 14px 36px rgba(0,0,0,.4);
  }
  *{box-sizing:border-box}
  .wrap{font-family:var(--sans);background:var(--ground);color:var(--ink);min-height:100vh;padding:40px 24px 64px;line-height:1.5;-webkit-font-smoothing:antialiased}
  .inner{max-width:1080px;margin:0 auto}
  .eyebrow{font-size:12px;letter-spacing:.14em;text-transform:uppercase;color:var(--accent);font-weight:700;margin:0 0 10px}
  h1{font-size:clamp(24px,3.6vw,34px);line-height:1.12;margin:0 0 14px;font-weight:800;letter-spacing:-.02em;text-wrap:balance}
  /* campaign info card — email preview + facts row */
  .infocard{margin-top:6px;padding:22px 24px}
  .mailprev{display:flex;gap:14px;align-items:flex-start}
  .mp-ava{width:46px;height:46px;border-radius:13px;background:linear-gradient(135deg,var(--accent),color-mix(in srgb,var(--accent) 55%,#7b5cd6));color:#fff;display:flex;align-items:center;justify-content:center;font-weight:800;font-size:19px;flex:none}
  .mp-body{flex:1;min-width:0}
  .mp-line1{display:flex;gap:8px;align-items:baseline;flex-wrap:wrap;font-size:13px}
  .mp-from{font-weight:700}
  .mp-email{color:var(--muted)}
  .mp-date{margin-left:auto;color:var(--muted);font-size:12px;font-variant-numeric:tabular-nums}
  .mp-subj{font-size:17.5px;font-weight:800;margin:4px 0 2px;line-height:1.3;text-wrap:balance}
  .mp-pre{font-size:13.5px;color:var(--muted)}
  .ic-facts{display:grid;grid-template-columns:repeat(4,1fr);margin-top:18px;border-top:1px solid var(--line);padding-top:16px}
  .fact{padding:0 18px;border-left:1px solid var(--line);min-width:0}
  .fact:first-child{border-left:none;padding-left:0}
  .ic-l{display:block;font-size:10.5px;letter-spacing:.06em;text-transform:uppercase;color:var(--muted);font-weight:700;margin-bottom:5px}
  .ic-v{display:block;font-size:14.5px;font-weight:700;line-height:1.3;font-variant-numeric:tabular-nums;overflow-wrap:break-word}
  .ic-sub{display:block;font-size:12px;color:var(--muted);margin-top:2px;font-weight:600;font-variant-numeric:tabular-nums}
  @media (max-width:760px){
    .ic-facts{grid-template-columns:1fr 1fr;gap:14px 0}
    .fact:nth-child(odd){border-left:none;padding-left:0}
    .mp-date{margin-left:0;width:100%}
  }
  section{margin-top:36px}
  .sec-h{display:flex;align-items:baseline;gap:12px;margin:0 0 16px;flex-wrap:wrap}
  .sec-h h2{font-size:15px;font-weight:700;letter-spacing:.02em;margin:0;text-transform:uppercase}
  .sec-h .note{font-size:13px;color:var(--muted)}
  .card{background:var(--card);border:1px solid var(--line);border-radius:var(--radius);padding:20px;box-shadow:var(--shadow)}
  .brief{border-left:3px solid var(--accent)}
  .brief p{margin:0 0 10px;font-size:15px;max-width:72ch}.brief p:last-child{margin:0}
  /* KPI */
  .kpis{display:grid;grid-template-columns:repeat(7,1fr);gap:10px}
  .kpi{background:var(--card);border:1px solid var(--line);border-radius:14px;padding:14px;box-shadow:var(--shadow)}
  .kpi .l{font-size:11.5px;color:var(--muted);font-weight:600;margin:0 0 9px}
  .kpi .v{font-size:22px;font-weight:800;letter-spacing:-.02em;font-variant-numeric:tabular-nums;line-height:1.05;display:flex;align-items:baseline;gap:5px}
  .kpi .v .u{font-size:10.5px;font-weight:700;color:var(--muted)}
  .kpi .v.rate{color:var(--accent)} .kpi .v.pos{color:var(--good)}
  .kpi .v + .v{margin-top:7px}
  /* funnel */
  .funnel{display:flex;flex-direction:column;gap:10px}
  .frow{display:grid;grid-template-columns:92px 1fr 148px;align-items:center;gap:16px}
  .frow .stage{font-size:13px;font-weight:700;text-align:right;color:var(--muted)}
  .ftrackwrap{display:flex;justify-content:center}
  .fbar{height:44px;border-radius:10px;display:flex;align-items:center;justify-content:center;color:var(--accent-ink);font-weight:800;font-size:15px;font-variant-numeric:tabular-nums;background:linear-gradient(90deg,color-mix(in srgb,var(--accent) 72%,#000 0%),var(--accent));min-width:60px}
  .fmeta .rate{font-weight:800;font-size:17px;color:var(--accent);font-variant-numeric:tabular-nums}
  .fmeta .cap{color:var(--muted);font-size:11.5px;display:block;margin-top:1px}
  /* timeline columns */
  .tl{display:flex;align-items:flex-end;gap:10px;height:170px;padding-top:8px}
  .tlcol{flex:1;display:flex;flex-direction:column;align-items:center;gap:6px;height:100%;justify-content:flex-end}
  .tlbar{width:100%;max-width:46px;background:linear-gradient(180deg,var(--accent),color-mix(in srgb,var(--accent) 55%,var(--card)));border-radius:6px 6px 0 0;min-height:3px}
  .tlval{font-size:11px;font-weight:700;color:var(--ink);font-variant-numeric:tabular-nums}
  .tld{font-size:10.5px;color:var(--muted);font-variant-numeric:tabular-nums}
  .tlnote{font-size:12px;color:var(--muted);margin:12px 0 0}
  .linechart{width:100%;height:auto;display:block;overflow:visible}
  .tl-legend{display:flex;gap:16px;align-items:center;margin:0 0 12px;font-size:12px;color:var(--muted);flex-wrap:wrap}
  .tl-legend .lg{display:flex;align-items:center;gap:6px;font-weight:600;color:var(--ink)}
  .tl-legend .lg i{width:16px;height:3px;border-radius:2px;display:inline-block}
  .tl-legend .lg-note{margin-left:auto;font-weight:400}
  .verdict-banner{display:flex;gap:10px;align-items:center;background:color-mix(in srgb,var(--good) 12%,transparent);border:1px solid color-mix(in srgb,var(--good) 38%,var(--line));color:var(--good);font-weight:700;font-size:14.5px;border-radius:12px;padding:14px 16px;margin:0 0 16px}
  .verdict-banner .ic{font-size:17px;line-height:1}
  /* base section */
  .base-grid{display:grid;grid-template-columns:1fr 1.5fr;gap:0}
  .base-left{display:flex;flex-direction:column;gap:20px;border-right:1px solid var(--line);padding-right:26px}
  .base-right{padding-left:26px}
  .lchips{display:flex;flex-direction:column;gap:8px;min-width:0}
  .lchip{max-width:100%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;padding:7px 13px;border:1px solid var(--line);border-radius:9px;font-weight:600;font-size:13.5px;background:color-mix(in srgb,var(--accent) 6%,transparent)}
  .seg-note{font-size:14px;font-weight:700}
  .pbrows{display:flex;flex-direction:column;gap:13px}
  .pbrow{display:grid;grid-template-columns:104px 1fr 56px 66px;align-items:center;gap:12px}
  .pbrow .nm{display:flex;align-items:center;gap:8px;font-size:13px;font-weight:600;min-width:0}
  .pbrow .pct{font-size:14.5px;font-weight:800;text-align:right;font-variant-numeric:tabular-nums}
  .pbrow .pabs{font-size:12.5px;color:var(--muted);text-align:right;font-variant-numeric:tabular-nums}
  .logo-s{width:18px;height:18px;border-radius:5px;object-fit:contain;flex:none}
  @media (max-width:760px){
    .base-grid{grid-template-columns:1fr}
    .base-left{border-right:none;border-bottom:1px solid var(--line);padding-right:0;padding-bottom:18px}
    .base-right{padding-left:0;padding-top:18px}
    .pbrow{grid-template-columns:96px 1fr 50px 60px}
  }
  /* provider table */
  .ptbl{width:100%;border-collapse:collapse;font-variant-numeric:tabular-nums}
  .ptbl th{font-size:11px;text-transform:uppercase;letter-spacing:.03em;color:var(--muted);font-weight:700;text-align:right;padding:0 10px 10px}
  .ptbl th:first-child{text-align:left}
  .ptbl td{padding:11px 10px;border-top:1px solid var(--line);font-size:14px;font-weight:700;text-align:right}
  .ptbl td:first-child{text-align:left;font-weight:600}
  .prov{display:flex;align-items:center;gap:9px}
  .logo{width:20px;height:20px;border-radius:5px;flex:none;object-fit:contain}
  .ptbl .or{color:var(--accent);font-weight:800}
  .mini{display:inline-block;height:6px;border-radius:3px;background:var(--accent);vertical-align:middle;margin-left:8px}
  /* two-col */
  .cols{display:grid;grid-template-columns:1.2fr 1fr;gap:18px}
  .card h3{margin:0 0 4px;font-size:15px;font-weight:700}.card .cap{margin:0 0 16px;font-size:12.5px;color:var(--muted)}
  /* .bars is the real grid; .bar-row is display:contents so its children
     (name/track/val) share ONE set of column tracks across all rows —
     this is what keeps every bar's left edge aligned regardless of label length. */
  .bars{display:grid;grid-template-columns:max-content 1fr auto;column-gap:12px;row-gap:13px;align-items:center}
  .bar-row{display:contents}
  .bar-row .name{font-size:13px;font-weight:600;white-space:nowrap}
  .bar-row .track{min-width:0}
  .track{height:20px;background:color-mix(in srgb,var(--ink) 7%,transparent);border-radius:6px;overflow:hidden}
  .fill{height:100%;border-radius:6px;background:var(--accent);min-width:2px}
  .val{font-size:14px;font-weight:800;font-variant-numeric:tabular-nums;text-align:right;min-width:40px}
  /* risk */
  .risk{display:grid;grid-template-columns:repeat(3,1fr);gap:14px}
  .rtile{background:var(--card);border:1px solid var(--line);border-radius:14px;padding:16px 18px;box-shadow:var(--shadow);border-top:3px solid var(--good)}
  .rtile.ok{border-top-color:var(--good)} .rtile.warn{border-top-color:var(--warn)}
  .rtile .rl{font-size:12px;color:var(--muted);font-weight:600;margin:0 0 8px}
  .rtile .rv{font-size:24px;font-weight:800;font-variant-numeric:tabular-nums}
  .rtile .rr{font-size:12px;color:var(--muted);margin-top:3px;font-variant-numeric:tabular-nums}
  .rtile .verdict{font-size:12px;font-weight:700;margin-top:8px}
  .verdict.ok{color:var(--good)} .verdict.warn{color:var(--warn)}
  /* insights */
  .insights{display:grid;grid-template-columns:1fr 1fr;gap:14px}
  .ins{background:var(--card);border:1px solid var(--line);border-left:3px solid var(--accent);border-radius:12px;padding:16px 18px;box-shadow:var(--shadow)}
  .ins h4{margin:0 0 6px;font-size:14px;font-weight:700}.ins p{margin:0;font-size:13.5px;color:var(--muted)}.ins .big{color:var(--ink);font-weight:700}
  /* email render + click heatmap */
  .hm-grid{display:grid;grid-template-columns:minmax(0,400px) 1fr;gap:28px;align-items:start}
  .mailrender{background:#f0f1f7;border:1px solid var(--line);border-radius:14px;padding:18px}
  .mr{background:#fff;border-radius:16px;font-family:arial,"helvetica neue",helvetica,sans-serif;color:#333;font-size:12px;line-height:1.45}
  .mr-top{border-radius:16px 16px 0 0;overflow:hidden}
  .mr img{display:block;width:100%;height:auto}
  .mr-pad{padding:16px 18px}
  .mr-logo{background:#fff;padding:12px 18px;text-align:center;font-weight:800;color:#191942;font-size:15px;letter-spacing:-.01em}
  .mr-hero{height:96px;background:linear-gradient(135deg,#dfe3fb,#c9cffa);display:flex;align-items:center;justify-content:center;color:#7b83c4;font-size:11px;font-weight:700}
  .mr-h{font-size:14px;font-weight:800;color:#191942;margin:0 0 8px;line-height:1.3}
  .mr-p{margin:0 0 8px;color:#333}
  .mr-code{background:#f8f8fc;border-radius:9px;padding:14px;text-align:center;font-size:20px;font-weight:800;color:#333;letter-spacing:.02em;margin:10px 0}
  .mr-btn{background:#2424f8;color:#fafafe;border-radius:12px;padding:11px 8px;text-align:center;font-weight:700;font-size:12.5px}
  .mr-btn.ghost{background:#fff;color:#2424f8;box-shadow:inset 0 0 0 2px #2424f8}
  .mr-foot{background:#f8f8fc;padding:14px 18px;text-align:center;color:#5d5d85;font-size:10.5px;line-height:1.5}
  .mr-flinks{display:flex;justify-content:center;gap:12px;margin-top:8px;flex-wrap:wrap}
  .mr-flinks span{color:#4b4afb;text-decoration:underline}
  /* heat zones — amber scale so it never blends with the email's own blue */
  .hz{position:relative;border-radius:11px;box-shadow:0 0 0 2px var(--hc);background:color-mix(in srgb,var(--hc) 16%,transparent)}
  .hz.top{box-shadow:0 0 0 3px var(--hc);background:color-mix(in srgb,var(--hc) 24%,transparent)}
  .hz::after{content:attr(data-c);position:absolute;top:5px;right:5px;background:var(--hc);color:#3a1d00;font-family:var(--sans);font-size:10px;font-weight:800;padding:2px 8px;border-radius:999px;white-space:nowrap;box-shadow:0 1px 4px rgba(15,23,42,.3);font-variant-numeric:tabular-nums;z-index:2}
  .hz.inline::after{top:-8px;right:-4px}
  .hm-scale{display:flex;align-items:center;gap:10px;font-size:11.5px;color:var(--muted);font-weight:600;margin-bottom:16px}
  .hm-scale .grad{flex:1;height:9px;border-radius:5px;background:linear-gradient(90deg,#fde68a,#fbbf24,#f59e0b,#ea8c04)}
  .hzlist{display:grid;grid-template-columns:max-content 1fr auto auto;column-gap:12px;row-gap:12px;align-items:center}
  .hzlist .zn{display:flex;align-items:center;gap:8px;font-size:13px;font-weight:600;white-space:nowrap}
  .hzlist .sw{width:11px;height:11px;border-radius:3px;flex:none}
  .hzlist .zbar{height:8px;border-radius:4px;background:color-mix(in srgb,var(--ink) 7%,transparent);min-width:0}
  .hzlist .zbar i{display:block;height:100%;border-radius:4px}
  .hzlist .zc{font-size:14px;font-weight:800;text-align:right;font-variant-numeric:tabular-nums}
  .hzlist .zp{font-size:12px;color:var(--muted);text-align:right;font-variant-numeric:tabular-nums;min-width:38px}
  @media (max-width:820px){.hm-grid{grid-template-columns:1fr}}
  footer{margin-top:38px;padding-top:18px;border-top:1px solid var(--line);font-size:12px;color:var(--muted)}footer b{color:var(--ink)}
  @media (max-width:900px){.kpis{grid-template-columns:repeat(4,1fr)}.cols,.insights{grid-template-columns:1fr}.risk{grid-template-columns:1fr}}
  @media (max-width:520px){.kpis{grid-template-columns:repeat(2,1fr)}.frow{grid-template-columns:72px 1fr}.frow .fmeta{grid-column:2}.tlval{display:none}}
```

## Разметка

Образец на данных примера.

```html
<div class="wrap"><div class="inner">

  <header>
    <p class="eyebrow">RuSender · Анализ рассылки</p>
    <h1>«Финал распродажи: −33% на всё» (LETO33)</h1>
    <div class="card infocard">
      <div class="mailprev">
        <div class="mp-ava">R</div>
        <div class="mp-body">
          <div class="mp-line1"><span class="mp-from">RuSender</span><span class="mp-email">hello@domovoy-store.ru</span><span class="mp-date">30.07.2026</span></div>
          <div class="mp-subj">Последний день летней распродажи</div>
          <div class="mp-pre">Через 24 часа промокод LETO33 перестанет работать</div>
        </div>
      </div>
      <div class="ic-facts">
        <div class="fact"><span class="ic-l">ID · Тип</span><span class="ic-v">112538</span><span class="ic-sub">обычная рассылка</span></div>
        <div class="fact"><span class="ic-l">База</span><span class="ic-v">13 950 адресов</span><span class="ic-sub">Основная база 27.07.2026</span></div>
        <div class="fact"><span class="ic-l">Отправка</span><span class="ic-v">12:30 → 12:55 МСК</span><span class="ic-sub">длилась 25 минут</span></div>
        <div class="fact"><span class="ic-l">Статус рассылки</span><span class="ic-v" style="color:var(--good)">Завершена ✓</span><span class="ic-sub">модерация одобрена</span></div>
      </div>
    </div>
  </header>

  <section>
    <div class="sec-h"><h2>Особенности рассылки</h2></div>
    <div class="card brief">
      <p>Финальное письмо распродажи −33% с промокодом LETO33 — <b>«последний день»</b>. Это <b>4-е касание серии за ~4 дня</b> (основная 27.07 → досыл 28.07 → эта 30.07).</p>
    </div>
  </section>

  <section>
    <div class="sec-h"><h2>Итоги</h2><span class="note">13 931 доставлено</span></div>
    <div class="kpis">
      <div class="kpi"><p class="l">Отправлено</p><div class="v">13 950<span class="u">шт.</span></div></div>
      <div class="kpi"><p class="l">Доставлено</p><div class="v pos">99,9%</div><div class="v">13 931<span class="u">шт.</span></div></div>
      <div class="kpi"><p class="l">Открытия</p><div class="v rate">9,6%<span class="u">OR</span></div><div class="v">1 333<span class="u">шт.</span></div></div>
      <div class="kpi"><p class="l">Клики</p><div class="v rate">2,6%<span class="u">CTOR</span></div><div class="v">34<span class="u">шт.</span></div></div>
      <div class="kpi"><p class="l">Отписки</p><div class="v rate">0,28%</div><div class="v">39<span class="u">шт.</span></div></div>
      <div class="kpi"><p class="l">Жалобы</p><div class="v">0,00%</div><div class="v">0<span class="u">шт.</span></div></div>
      <div class="kpi"><p class="l">Ошибки</p><div class="v">0,14%</div><div class="v">19<span class="u">шт.</span></div></div>
    </div>
  </section>

  <section>
    <div class="sec-h"><h2>База</h2><span class="note">аудитория отправки · 13 950 адресов</span></div>
    <div class="card"><div class="base-grid">
      <div class="base-left">
        <div>
          <span class="ic-l">Списки</span>
          <div class="lchips">
            <span class="lchip" title="Основная база 27.07.2026">Основная база 27.07.2026</span>
          </div>
        </div>
        <div>
          <span class="ic-l">Сегментация</span>
          <div class="seg-note">Нет — отправка по всему списку</div>
        </div>
      </div>
      <div class="base-right">
        <span class="ic-l">Состав по почтовым системам</span>
        <div class="pbrows" style="margin-top:10px">
          <div class="pbrow"><span class="nm"><img class="logo-s" alt="Gmail" src="{{ICON:Gmail}}">Gmail</span><div class="track"><div class="fill" style="width:100%;background:var(--gmail)"></div></div><span class="pct">28,2%</span><span class="pabs">3 939</span></div>
          <div class="pbrow"><span class="nm"><img class="logo-s" alt="Yandex" src="{{ICON:Yandex}}">Yandex</span><div class="track"><div class="fill" style="width:91.8%;background:var(--yandex)"></div></div><span class="pct">25,9%</span><span class="pabs">3 618</span></div>
          <div class="pbrow"><span class="nm"><img class="logo-s" alt="Mail.ru" src="{{ICON:Mail.ru}}">Mail.ru</span><div class="track"><div class="fill" style="width:89%;background:var(--mailru)"></div></div><span class="pct">25,1%</span><span class="pabs">3 501</span></div>
          <div class="pbrow"><span class="nm"><img class="logo-s" alt="Прочие" src="{{ICON:Прочие}}">Прочие</span><div class="track"><div class="fill" style="width:73.4%;background:var(--other)"></div></div><span class="pct">20,7%</span><span class="pabs">2 892</span></div>
        </div>
      </div>
    </div></div>
  </section>

  <section>
    <div class="sec-h"><h2>Воронка</h2></div>
    <div class="card"><div class="funnel">
      <div class="frow"><span class="stage">Отправлено</span><span class="ftrackwrap"><span class="fbar" style="width:100%">13 950</span></span><span class="fmeta"><span class="rate">100%</span><span class="cap">базовый объём</span></span></div>
      <div class="frow"><span class="stage">Доставлено</span><span class="ftrackwrap"><span class="fbar" style="width:90%">13 931</span></span><span class="fmeta"><span class="rate">99,9%</span><span class="cap">от отправленных</span></span></div>
      <div class="frow"><span class="stage">Открыто</span><span class="ftrackwrap"><span class="fbar" style="width:30%">1 333</span></span><span class="fmeta"><span class="rate">9,6%</span><span class="cap">от доставленных (OR)</span></span></div>
      <div class="frow"><span class="stage">Клик</span><span class="ftrackwrap"><span class="fbar" style="width:11%">34</span></span><span class="fmeta"><span class="rate">2,6%</span><span class="cap">от открытий (CTOR)</span></span></div>
    </div></div>
  </section>

  <section>
    <div class="sec-h"><h2>Динамика открытий</h2><span class="note">по дням после отправки</span></div>
    <div class="card">
      <div class="tl-legend">
        <span class="lg"><i style="background:var(--accent)"></i>Открытия <span style="color:var(--muted);font-weight:600">· левая ось</span></span>
        <span class="lg"><i style="background:var(--accent2)"></i>Клики <span style="color:var(--muted);font-weight:600">· правая ось</span></span>
      </div>
      <svg class="linechart" viewBox="0 0 700 200" role="img" aria-label="Открытия и клики по дням">
        <g stroke="var(--line)">
          <line x1="44" y1="22" x2="664" y2="22" stroke-dasharray="3 4"/>
          <line x1="44" y1="97" x2="664" y2="97" stroke-dasharray="3 4"/>
          <line x1="44" y1="172" x2="664" y2="172"/>
        </g>
        <g font-size="10.5" fill="var(--muted)" text-anchor="end" font-variant-numeric="tabular-nums">
          <text x="38" y="25">1 000</text><text x="38" y="100">500</text><text x="38" y="175">0</text>
        </g>
        <g font-size="10.5" fill="var(--accent2)" text-anchor="start" font-weight="700">
          <text x="670" y="25">30</text><text x="670" y="100">15</text><text x="670" y="175">0</text>
        </g>
        <path d="M44,25 L147,142 L251,166 L354,168 L457,164 L561,168 L664,171.5 L664,172 L44,172 Z" fill="var(--accent)" fill-opacity=".12"/>
        <polyline points="44,25 147,142 251,166 354,168 457,164 561,168 664,171.5" fill="none" stroke="var(--accent)" stroke-width="2.5" stroke-linejoin="round" stroke-linecap="round"/>
        <circle cx="44" cy="25" r="4.5" fill="var(--accent)"/>
        <circle cx="147" cy="142" r="3.5" fill="var(--card)" stroke="var(--accent)" stroke-width="2"/>
        <circle cx="251" cy="166" r="3.5" fill="var(--card)" stroke="var(--accent)" stroke-width="2"/>
        <circle cx="354" cy="168" r="3.5" fill="var(--card)" stroke="var(--accent)" stroke-width="2"/>
        <circle cx="457" cy="164" r="3.5" fill="var(--card)" stroke="var(--accent)" stroke-width="2"/>
        <circle cx="561" cy="168" r="3.5" fill="var(--card)" stroke="var(--accent)" stroke-width="2"/>
        <circle cx="664" cy="171.5" r="3.5" fill="var(--card)" stroke="var(--accent)" stroke-width="2"/>
        <polyline points="44,37 147,157 251,172 354,172 457,152 561,172 664,172" fill="none" stroke="var(--accent2)" stroke-width="2" stroke-dasharray="5 4" stroke-linejoin="round" stroke-linecap="round"/>
        <circle cx="44" cy="37" r="3.5" fill="var(--accent2)"/>
        <circle cx="147" cy="157" r="3" fill="var(--card)" stroke="var(--accent2)" stroke-width="2"/>
        <circle cx="457" cy="152" r="3" fill="var(--card)" stroke="var(--accent2)" stroke-width="2"/>
        <g font-size="11" font-weight="700" fill="var(--ink)" font-variant-numeric="tabular-nums">
          <text x="52" y="20" text-anchor="start">980</text>
          <text x="147" y="133" text-anchor="middle">202</text>
          <text x="251" y="158" text-anchor="middle">39</text>
          <text x="354" y="160" text-anchor="middle">25</text>
          <text x="457" y="156" text-anchor="middle">54</text>
          <text x="561" y="160" text-anchor="middle">28</text>
          <text x="658" y="164" text-anchor="end">3</text>
        </g>
        <g font-size="10.5" font-weight="700" fill="var(--accent2)">
          <text x="54" y="49" text-anchor="start">27</text>
          <text x="158" y="162" text-anchor="start">3</text>
          <text x="448" y="147" text-anchor="end">4</text>
        </g>
        <g font-size="11" fill="var(--muted)">
          <text x="44" y="191" text-anchor="middle">30.07</text>
          <text x="147" y="191" text-anchor="middle">31.07</text>
          <text x="251" y="191" text-anchor="middle">01.08</text>
          <text x="354" y="191" text-anchor="middle">02.08</text>
          <text x="457" y="191" text-anchor="middle">03.08</text>
          <text x="561" y="191" text-anchor="middle">04.08</text>
          <text x="664" y="191" text-anchor="middle">05.08</text>
        </g>
      </svg>
      <p class="tlnote"><b style="color:var(--ink)">74%</b> открытий и <b style="color:var(--ink)">27 из 34</b> кликов — в день отправки; к третьему дню поток почти иссяк. Клики повторяют кривую открытий — короткий «хвост» акционного письма.</p>
    </div>
  </section>

  <section>
    <div class="sec-h"><h2>По почтовым системам</h2><span class="note">OR — от отправленных группе</span></div>
    <div class="card"><div style="overflow-x:auto">
      <table class="ptbl">
        <thead><tr><th>Почтовик</th><th>Отправлено</th><th>OR</th><th>CTOR</th><th>Отписки</th><th>Ошибки</th></tr></thead>
        <tbody>
          <tr><td><span class="prov"><img class="logo" alt="Прочие" src="{{ICON:Прочие}}">Прочие</span></td><td>2 892</td><td class="or">15,8%<span class="mini" style="width:40px"></span></td><td>3,3%</td><td>0,45%</td><td>15</td></tr>
          <tr><td><span class="prov"><img class="logo" alt="Gmail" src="{{ICON:Gmail}}">Gmail</span></td><td>3 939</td><td class="or">12,2%<span class="mini" style="width:31px"></span></td><td>1,0%</td><td>0,13%</td><td>4</td></tr>
          <tr><td><span class="prov"><img class="logo" alt="Mail.ru" src="{{ICON:Mail.ru}}">Mail.ru</span></td><td>3 501</td><td class="or">6,1%<span class="mini" style="width:15px"></span></td><td>2,8%</td><td>0,31%</td><td>0</td></tr>
          <tr><td><span class="prov"><img class="logo" alt="Yandex" src="{{ICON:Yandex}}">Yandex</span></td><td>3 618</td><td class="or">5,0%<span class="mini" style="width:12px"></span></td><td>4,5%</td><td>0,28%</td><td>0</td></tr>
        </tbody>
      </table>
    </div>
    <p style="margin:14px 2px 0;font-size:13px;color:var(--muted)">Открывают лучше «прочие» и <b style="color:var(--ink)">Gmail</b> (15,8% / 12,2%), <b style="color:var(--ink)">Yandex/Mail.ru</b> — «спят» (5–6%). Но у открывших Yandex/Mail.ru выше CTOR (4,5% / 2,8%) — кто открыл, кликает охотнее. Ошибки почти все в «прочих» (15 из 19) — корпоративные домены.</p>
    </div>
  </section>

  <section>
    <div class="cols">
      <div class="card">
        <h3>Куда кликали</h3>
        <p class="cap">34 клика</p>
        <div class="bars">
          <div class="bar-row"><span class="name">Распродажа (страница акции)</span><div class="track"><div class="fill" style="width:100%"></div></div><span class="val">19</span></div>
          <div class="bar-row"><span class="name">Главная</span><div class="track"><div class="fill" style="width:47%"></div></div><span class="val">9</span></div>
          <div class="bar-row"><span class="name">Telegram</span><div class="track"><div class="fill" style="width:21%"></div></div><span class="val">4</span></div>
          <div class="bar-row"><span class="name">Поддержка</span><div class="track"><div class="fill" style="width:11%"></div></div><span class="val">2</span></div>
        </div>
        <p style="margin:14px 0 0;font-size:13px;color:var(--muted)"><b style="color:var(--ink)">56%</b> кликов — на страницу распродажи. Оффер сработал по назначению: кто кликнул, шёл смотреть скидку.</p>
      </div>
      <div class="card">
        <h3>Доставляемость и риски</h3>
        <div class="verdict-banner"><span class="ic">✓</span><span>Репутация в порядке: доставка 99,9%, 0 жалоб, отписки ниже 0,3% — базу можно рассылать дальше.</span></div>
        <div class="risk" style="grid-template-columns:1fr 1fr 1fr">
          <div class="rtile ok"><p class="rl">Доставка</p><div class="rv">99,9%</div><div class="rr">19 ошибок</div><div class="verdict ok">отлично</div></div>
          <div class="rtile ok"><p class="rl">Жалобы</p><div class="rv">0</div><div class="rr">0,00%</div><div class="verdict ok">чисто</div></div>
          <div class="rtile ok"><p class="rl">Отписки</p><div class="rv">0,28%</div><div class="rr">39 шт.</div><div class="verdict ok">в норме</div></div>
        </div>
      </div>
    </div>
  </section>

  <section>
    <div class="sec-h"><h2>Письмо · тепловая карта кликов</h2><span class="note">шаблон 157632 · 34 клика распределены по зонам</span></div>
    <div class="card"><div class="hm-grid">

      <div class="mailrender">
        <div class="mr">
          <div class="mr-top hz top" style="--hc:#fbbf24" data-c="9 · 26%">
            <img src="{{IMG:логотип из шапки письма}}" alt="Логотип RuSender">
          </div>
          <img src="{{IMG:баннер письма}}" alt="Баннер письма">
          <div class="mr-pad">
            <p class="mr-h">🤝 Кроме скидки есть еще один приятный бонус</p>
            <p class="mr-p">Любой заказ со скидкой <b>33%</b> — выгода <b>до трети стоимости корзины</b>.</p>
            <p class="mr-p">Постоянным покупателям — приоритетная доставка, расширенная гарантия и персональные подборки.</p>
            <p class="mr-p"><b>Промокод вводить при оформлении заказа:</b></p>
            <div class="mr-code">LETO33</div>
            <div class="hz top" style="--hc:#ea8c04;margin:16px 0 12px" data-c="19 · 56%">
              <div class="mr-btn">Активировать скидку 33%</div>
            </div>
            <p class="mr-p">⏳ До конца акции осталось <b style="color:#fc6902">24 часа</b>.</p>
            <p class="mr-h" style="margin-top:14px">💬 Нужна помощь?</p>
            <p class="mr-p">Поможем подобрать товар, ответим на вопросы и поможем с заказом.</p>
            <div class="hz" style="--hc:#fcd34d;margin:14px 0 4px" data-c="4 · 12%">
              <div class="mr-btn ghost">Подписаться в Telegram</div>
            </div>
          </div>
          <div class="mr-foot">
            Вы получили это письмо, потому что подписались на новости нашего магазина.
            <div class="mr-flinks">
              <span class="hz inline" style="--hc:#fde68a;padding:3px 7px" data-c="2 · 6%">Написать в поддержку</span>
              <span>Отписаться от рассылки</span>
            </div>
          </div>
        </div>
      </div>

      <div>
        <div class="hm-scale"><span>меньше кликов</span><span class="grad"></span><span>больше</span></div>
        <div class="hzlist">
          <span class="zn"><span class="sw" style="background:#ea8c04"></span>Кнопка «Активировать скидку»</span>
          <span class="zbar"><i style="width:100%;background:#ea8c04"></i></span>
          <span class="zc">19</span><span class="zp">56%</span>

          <span class="zn"><span class="sw" style="background:#fbbf24"></span>Логотип в шапке</span>
          <span class="zbar"><i style="width:47%;background:#fbbf24"></i></span>
          <span class="zc">9</span><span class="zp">26%</span>

          <span class="zn"><span class="sw" style="background:#fcd34d"></span>Кнопка «Подписаться в Telegram»</span>
          <span class="zbar"><i style="width:21%;background:#fcd34d"></i></span>
          <span class="zc">4</span><span class="zp">12%</span>

          <span class="zn"><span class="sw" style="background:#fde68a"></span>«Написать в поддержку»</span>
          <span class="zbar"><i style="width:11%;background:#fde68a"></i></span>
          <span class="zc">2</span><span class="zp">6%</span>
        </div>
        <p style="margin:18px 0 0;font-size:13px;color:var(--muted);line-height:1.6">
          Главный CTA собрал <b style="color:var(--ink)">больше половины</b> кликов — оффер и кнопка сработали.
          При этом <b style="color:var(--ink)">каждый четвёртый клик пришёлся на логотип</b> в шапке: часть людей идёт
          не за скидкой, а просто в кабинет. Промокод <b style="color:var(--ink)">LETO33</b> — текст, а не ссылка,
          поэтому клики по нему не отслеживаются.
        </p>
        <p style="margin:12px 0 0;font-size:12px;color:var(--muted)">
          Превью собрано по шаблону 157632: картинки — настоящие из письма, тексты и кнопки — оригинальные
          (вёрстка упрощена под колонку отчёта). Зоны и цифры — реальные, из <b style="color:var(--ink)">get_link_clicks</b>.
        </p>
      </div>

    </div></div>
  </section>

  <footer>
    <p>Источник: RuSender API (кампания 112538). Метрики: <b>OR</b> = открытия / доставленные; <b>CTOR</b> = клики / открытия; в разбивке по доменам OR = открытия / отправленные группе. Логотипы почтовиков — из <b>get_stats_by_domains</b>. Сформировано 05.08.2026.</p>
  </footer>

</div></div>
```
