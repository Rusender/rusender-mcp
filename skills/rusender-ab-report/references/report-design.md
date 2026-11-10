# Дизайн отчёта по A/B-тесту

Утверждённая вёрстка дашборда. Отчёт собирается заново по этой спецификации: CSS — дословно из
раздела 1, разметка — по шаблонам строк из раздела 3, числа — по правилам из раздела 4.

## Содержание
1. CSS — копировать без изменений
2. Каркас страницы
3. Разделы по порядку
4. Правила расчёта ширин и цветов
5. Формат чисел

## 1. CSS — копировать без изменений

Весь блок целиком вставь в тег style в начале страницы. Не меняй ни одного значения.

```css
:root{
  --ground:#f7f6f9; --card:#ffffff; --ink:#1b1622; --muted:#6d6579;
  --line:#e7e3ee; --accent:#d81b8c; --accent-ink:#ffffff;
  --good:#15935b; --warn:#c9791b; --crit:#d23b3b;
  --gmail:#ea4335; --yandex:#fc3f1d; --mailru:#1a86e0; --other:#8a8594;
  --shadow:0 1px 2px rgba(27,22,34,.04),0 12px 32px rgba(27,22,34,.07);
  --radius:16px;
  --sans:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif;
}
@media (prefers-color-scheme:dark){
  :root{
    --ground:#131019; --card:#1d1826; --ink:#f0ecf5; --muted:#a79fb5;
    --line:#2e2739; --accent:#ff5bb0; --accent-ink:#1b1622;
    --good:#3fbe83; --warn:#e0a24a; --crit:#f2726f;
    --shadow:0 1px 2px rgba(0,0,0,.3),0 14px 36px rgba(0,0,0,.4);
  }
}
:root[data-theme="light"]{
  --ground:#f7f6f9; --card:#ffffff; --ink:#1b1622; --muted:#6d6579;
  --line:#e7e3ee; --accent:#d81b8c; --accent-ink:#ffffff;
  --good:#15935b; --warn:#c9791b; --crit:#d23b3b;
  --shadow:0 1px 2px rgba(27,22,34,.04),0 12px 32px rgba(27,22,34,.07);
}
:root[data-theme="dark"]{
  --ground:#131019; --card:#1d1826; --ink:#f0ecf5; --muted:#a79fb5;
  --line:#2e2739; --accent:#ff5bb0; --accent-ink:#1b1622;
  --good:#3fbe83; --warn:#e0a24a; --crit:#f2726f;
  --shadow:0 1px 2px rgba(0,0,0,.3),0 14px 36px rgba(0,0,0,.4);
}
*{box-sizing:border-box}
.wrap{font-family:var(--sans);background:var(--ground);color:var(--ink);min-height:100vh;padding:40px 24px 64px;line-height:1.5;-webkit-font-smoothing:antialiased}
.inner{max-width:1080px;margin:0 auto}
.eyebrow{font-size:12px;letter-spacing:.14em;text-transform:uppercase;color:var(--accent);font-weight:700;margin:0 0 10px}
h1{font-size:clamp(26px,4vw,38px);line-height:1.1;margin:0 0 14px;font-weight:800;letter-spacing:-.02em;text-wrap:balance}
.meta{display:flex;flex-wrap:wrap;gap:8px}
.chip{font-size:12.5px;color:var(--muted);background:var(--card);border:1px solid var(--line);border-radius:999px;padding:5px 12px;font-weight:600}
.chip b{color:var(--ink)}
section{margin-top:38px}
.sec-h{display:flex;align-items:baseline;gap:12px;margin:0 0 16px;flex-wrap:wrap}
.sec-h h2{font-size:15px;font-weight:700;letter-spacing:.02em;margin:0;text-transform:uppercase}
.sec-h .note{font-size:13px;color:var(--muted)}
/* brief */
.brief{background:var(--card);border:1px solid var(--line);border-left:3px solid var(--accent);border-radius:var(--radius);padding:22px 24px;box-shadow:var(--shadow)}
.brief p{margin:0 0 12px;font-size:15px;max-width:70ch}
.brief p:last-child{margin-bottom:0}
.brief .subjects{display:flex;flex-direction:column;gap:8px;margin:14px 0 0}
.subj{display:flex;align-items:center;gap:10px;font-size:14px}
.subj .n{width:22px;height:22px;border-radius:6px;background:color-mix(in srgb,var(--accent) 14%,transparent);color:var(--accent);font-weight:800;font-size:12px;display:flex;align-items:center;justify-content:center;flex:none}
.subj.w .n{background:var(--accent);color:var(--accent-ink)}
.subj .w-tag{font-size:10px;font-weight:800;letter-spacing:.05em;color:var(--accent-ink);background:var(--accent);padding:2px 7px;border-radius:999px;text-transform:uppercase}
/* KPI */
.kpis{display:grid;grid-template-columns:repeat(6,1fr);gap:12px}
.kpi{background:var(--card);border:1px solid var(--line);border-radius:var(--radius);padding:16px;box-shadow:var(--shadow)}
.kpi .l{font-size:12px;color:var(--muted);font-weight:600;margin:0 0 10px}
.kpi .v{font-size:24px;font-weight:800;letter-spacing:-.02em;font-variant-numeric:tabular-nums;line-height:1.05;display:flex;align-items:baseline;gap:6px}
.kpi .v .u{font-size:11px;font-weight:700;color:var(--muted);letter-spacing:.02em}
.kpi .v.rate{color:var(--accent)}
.kpi .v + .v{margin-top:8px}
/* funnel */
.funnel{display:flex;flex-direction:column;gap:10px;background:var(--card);border:1px solid var(--line);border-radius:var(--radius);padding:24px;box-shadow:var(--shadow)}
.frow{display:grid;grid-template-columns:96px 1fr 150px;align-items:center;gap:16px}
.frow .stage{font-size:13px;font-weight:700;text-align:right;color:var(--muted)}
.ftrackwrap{display:flex;justify-content:center}
.fbar{height:46px;border-radius:10px;display:flex;align-items:center;justify-content:center;color:var(--accent-ink);font-weight:800;font-size:15px;font-variant-numeric:tabular-nums;background:linear-gradient(90deg,color-mix(in srgb,var(--accent) 78%,#000 0%),var(--accent));box-shadow:var(--shadow);min-width:64px;transition:width .3s}
.fmeta{font-size:13px}
.fmeta .abs{font-weight:800;font-size:17px;font-variant-numeric:tabular-nums}
.fmeta .rate{font-weight:800;font-size:17px;color:var(--accent);font-variant-numeric:tabular-nums;margin-left:2px}
.fmeta .cap{color:var(--muted);font-size:11.5px;display:block;margin-top:1px}
.fnote{font-size:12px;color:var(--muted);margin:4px 0 0;text-align:center}
/* cards */
.cols{display:grid;grid-template-columns:1fr 1fr;gap:18px}
.card{background:var(--card);border:1px solid var(--line);border-radius:var(--radius);padding:20px;box-shadow:var(--shadow)}
.card h3{margin:0 0 4px;font-size:15px;font-weight:700}
.card .cap{margin:0 0 16px;font-size:12.5px;color:var(--muted)}
.bars{display:flex;flex-direction:column;gap:14px}
.bar-row{display:grid;grid-template-columns:120px 1fr auto;align-items:center;gap:12px}
.bar-row .name{font-size:13px;font-weight:600;display:flex;align-items:center;gap:7px}
.dot{width:9px;height:9px;border-radius:50%;flex:none}
.track{height:22px;background:color-mix(in srgb,var(--ink) 7%,transparent);border-radius:7px;overflow:hidden}
.fill{height:100%;border-radius:7px;background:var(--accent);min-width:2px}
.val{font-size:14px;font-weight:800;font-variant-numeric:tabular-nums;text-align:right;min-width:52px}
.win{background:color-mix(in srgb,var(--accent) 12%,transparent);border-radius:8px;padding:6px 8px;margin:-6px -8px}
.tag-win{font-size:10px;font-weight:800;letter-spacing:.06em;color:var(--accent-ink);background:var(--accent);padding:2px 7px;border-radius:999px;text-transform:uppercase}
/* matrix */
.matrix-scroll{overflow-x:auto}
table.matrix{border-collapse:separate;border-spacing:6px;width:100%;min-width:640px}
table.matrix th{font-size:12px;font-weight:700;color:var(--muted);padding:4px 8px;text-align:center;vertical-align:bottom}
table.matrix th.rowh{text-align:left;min-width:96px}
table.matrix th .grp{display:block;font-size:10px;font-weight:700;letter-spacing:.04em;text-transform:uppercase;color:var(--accent);margin-bottom:3px}
table.matrix th .sz{display:block;font-size:10px;font-weight:600;color:var(--muted);margin-top:2px}
table.matrix td{padding:0;text-align:center}
.cell{border-radius:10px;padding:14px 8px;font-weight:800;font-size:17px;font-variant-numeric:tabular-nums;position:relative}
.best{outline:2px solid var(--accent);outline-offset:-2px}
.star{position:absolute;top:4px;right:6px;font-size:10px;color:var(--accent-ink)}
.coldiv{width:2px;background:var(--line);padding:0}
.prov{display:flex;align-items:center;gap:8px;font-size:13px;font-weight:700}
.dcol{color:var(--accent-ink)}
/* insights */
.insights{display:grid;grid-template-columns:1fr 1fr;gap:14px}
.ins{background:var(--card);border:1px solid var(--line);border-left:3px solid var(--accent);border-radius:12px;padding:16px 18px;box-shadow:var(--shadow)}
.ins h4{margin:0 0 6px;font-size:14px;font-weight:700}
.ins p{margin:0;font-size:13.5px;color:var(--muted)}
.ins .big{color:var(--ink);font-weight:700}
footer{margin-top:40px;padding-top:18px;border-top:1px solid var(--line);font-size:12px;color:var(--muted)}
footer b{color:var(--ink)}
@media (max-width:860px){
  .kpis{grid-template-columns:repeat(3,1fr)}
  .cols,.insights{grid-template-columns:1fr}
}
@media (max-width:520px){
  .kpis{grid-template-columns:repeat(2,1fr)}
  .frow{grid-template-columns:70px 1fr;grid-template-areas:"s b" "s m"}
  .frow .stage{grid-area:s}.ftrackwrap{grid-area:b}.fmeta{grid-area:m;padding-left:0}
  .bar-row{grid-template-columns:96px 1fr auto}
}
```

## 2. Каркас страницы

Заголовок страницы (тег title): `A/B «{короткое имя кампании}» — отчёт`. Затем тег style с CSS из
раздела 1, затем разметка:

```html
<div class="wrap"><div class="inner">
  <header>…</header>
  <section>…</section>  <!-- 7 разделов по порядку из раздела 3 -->
  <footer>…</footer>
</div></div>
```

Заголовок каждого раздела — `<div class="sec-h"><h2>Название</h2><span class="note">подпись</span></div>`.
Названия и подписи разделов — ровно как ниже.

## 3. Разделы по порядку

### 3.0 Шапка
```html
<header>
  <p class="eyebrow">RuSender · Отчёт по A/B-тесту</p>
  <h1>«{название кампании}»</h1>
  <div class="meta">
    <span class="chip">ID <b>{id}</b></span>
    <span class="chip">Тип <b>A/B по теме</b></span>
    <span class="chip">Отправлено <b>{ДД.ММ.ГГГГ}</b></span>
    <span class="chip">База <b>{название списка}</b></span>
  </div>
</header>
```

### 3.1 «Задача» (без подписи)
Блок `.brief`, два абзаца и список тем:
- абзац 1: дата отправки (жирным), список и его размер, что тестировали — «**A/B-тест темы письма**», сколько вариантов;
- абзац 2: механика — **testPercent** базы поровну между вариантами, победитель по открываемости разослан оставшимся **(100 − testPercent)%** (досыл);
- список тем в порядке вариантов:
```html
<div class="subjects">
  <div class="subj"><span class="n">1</span><span>«{тема}»</span></div>
  <div class="subj w"><span class="n">2</span><span>«{тема-победитель}»</span><span class="w-tag">победитель</span></div>
</div>
```

### 3.2 «Итог по всей кампании»
Подпись: `тест + досыл победителем · {delivered} доставлено`. Данные — `totalStats`.
Сетка `.kpis`, ровно 6 карточек в этом порядке:

| Карточка | Строка `.v.rate` (первая) | Строка `.v` (вторая) |
|---|---|---|
| Отправлено | — | отправлено, `шт.` |
| Доставлено | delivered / sent | delivered, `шт.` |
| Открытия | OR, единица `OR` | open, `шт.` |
| Клики | CTOR, единица `CTOR` | click, `шт.` |
| Отписки | unsubscribe / delivered, 2 знака | unsubscribe, `шт.` |
| Жалобы | complaint / delivered, 2 знака | complaint, `шт.` |

```html
<div class="kpi"><p class="l">Открытия</p><div class="v rate">12,9%<span class="u">OR</span></div><div class="v">1 742<span class="u">шт.</span></div></div>
```

### 3.3 «Воронка»
Подпись: `от отправки до клика`. Четыре строки `.frow`: Отправлено → Доставлено → Открыто → Клик.

| Ступень | Ширина `.fbar` | `.rate` | `.cap` |
|---|---|---|---|
| Отправлено | 100% | 100% | базовый объём |
| Доставлено | 88% | delivered / sent | от отправленных |
| Открыто | 34% | OR | от доставленных (OR) |
| Клик | 12% | CTOR | от открытий (CTOR) |

Ширины фиксированные — это стилизация воронки, не масштаб. Внутри бара — абсолютное число.
```html
<div class="frow">
  <span class="stage">Открыто</span>
  <span class="ftrackwrap"><span class="fbar" style="width:34%">1 742</span></span>
  <span class="fmeta"><span class="rate">12,9%</span><span class="cap">от доставленных (OR)</span></span>
</div>
```
После строк: `<p class="fnote">Ширина отражает сужение воронки; проценты — конверсия каждого шага.</p>`

### 3.4 Две карточки рядом (`.cols`, без заголовка раздела)

**Левая — «Варианты темы (тестовые группы)».** `.cap`: `Открываемость на равных группах ~{размер группы} адресов`.
Строки `.bar-row` по убыванию OR. Название — тема (длинную сокращай с начала через «…», сохраняя смысловой хвост). Значение — OR варианта.
- победитель: строка с классом `win`, точка и полоса `var(--accent)`;
- второй: точка `color-mix(in srgb,var(--accent) 55%,var(--muted))`, полоса `color-mix(in srgb,var(--accent) 60%,var(--muted))`;
- третий и далее: точка и полоса `var(--muted)`.

Под строками:
```html
<div style="margin-top:16px;display:flex;align-items:center;gap:10px">
  <span class="tag-win">Победитель</span>
  <span style="font-size:13px;color:var(--muted)">CTOR {x}% · {n} кликов</span>
</div>
```

**Правая — «По почтовым системам».** `.cap`: `Открываемость досыла победителя ({delivered досыла} адресов)`.
Строки по убыванию OR: Gmail, Yandex, Mail.ru, Прочие; цвет точки и полосы — `var(--gmail)`, `var(--yandex)`, `var(--mailru)`, `var(--other)`.
Под строками: `<p style="margin:16px 0 0;font-size:13px;color:var(--muted)">Разрыв <b style="color:var(--ink)">{max/min}×</b> между {лучший} и {худший} по открываемости.</p>`

```html
<div class="bar-row">
  <span class="name"><span class="dot" style="background:var(--gmail)"></span>Gmail</span>
  <div class="track"><div class="fill" style="width:100%;background:var(--gmail)"></div></div>
  <span class="val">20,6%</span>
</div>
```

### 3.5 «Матрица: тема × почтовик»
Подпись: `открываемость (OR); ★ — лучшая тема для провайдера среди тестовых групп`.
Таблица `table.matrix` внутри `.card` → `.matrix-scroll`.
- Шапка: пустая `th.rowh`; по столбцу на вариант `<th><span class="grp">A/B тест</span>{тема}<span class="sz">~{размер группы}</span></th>`; разделитель `<th class="coldiv"></th>`; `<th><span class="grp">Досыл</span>Победитель<span class="sz">{размер досыла}</span></th>`.
- Строки: Gmail, Yandex, Mail.ru, Прочие; заголовок строки `<th class="rowh"><span class="prov"><span class="dot" style="background:var(--gmail)"></span>Gmail</span></th>`.
- Ячейка: `<td><div class="cell" style="background:color-mix(in srgb,var(--accent) {p}%,var(--card))">{OR}</div></td>`, правила `p` и цвета текста — в разделе 4.
- Лучшая ячейка строки среди тестовых столбцов: класс `best` и `<span class="star">★</span>` в начале.
- Перед ячейкой досыла — `<td class="coldiv"></td>`.

Под таблицей абзац (`margin:14px 2px 0;font-size:13px;color:var(--muted)`): какие столбцы — A/B-тест (равные группы, сравнимы), какой — досыл (одна тема, для контроля), и у каких провайдеров лучшая тема не совпала с общим победителем.

### 3.6 «Куда кликали»
Подпись: `все части кампании · {totalStats.click} кликов`. Одна `.card` с `.bars`: строки по убыванию кликов, название — понятная категория ссылки (не URL), полоса `var(--accent)` по умолчанию, значение — число кликов.
Под строками: `<b>{доля}%</b> кликов ({n} из {всего}) — на {топ-категорию}. Учтены все части: {k} тестовые группы + досыл.`

### 3.7 «Ключевые выводы» (без подписи)
Сетка `.insights`, 4 карточки `.ins`: `<h4>` — короткий тезис, `<p>` — пояснение с конкретными числами, ключевая цифра или тема в `<span class="big">`. Темы карточек — по разделу «Выводы» в SKILL.md.

### 3.8 Подвал
```html
<footer><p>Источник: RuSender API (кампания {id}, варианты {id1}/{id2}/…). Метрики: <b>OR</b> = открытия / доставленные, <b>CTOR</b> = клики / открытия. Матрица: столбцы «A/B тест» — тестовые группы (~{N} на вариант), столбец «Досыл» — рассылка темы-победителя на оставшиеся {M}. {Оговорка про малые ячейки, если есть.} {Оговорка про базу totalStats.} Сформировано {ДД.ММ.ГГГГ}.</p></footer>
```

## 4. Правила расчёта ширин и цветов

- **Полосы `.fill`** во всех списках: `width = значение / максимум в этом списке × 100%`, округлять до целого (до 0,5 — если нужно различить близкие).
- **Матрица, насыщенность `p`:** `p = OR ячейки / максимальный OR во всей матрице × 100`, округлить до целого. Досыл считается вместе со всеми.
- **Цвет текста в ячейке:** если `p ≥ 50` — добавить `color:var(--accent-ink)` в style, у досыла ещё класс `dcol`; если `p < 50` — цвет текста не задавать.
- **Звезда:** на тёмной ячейке (`p ≥ 50`) — `<span class="star">★</span>`; на светлой — `<span class="star" style="color:var(--accent)">★</span>`.
- **Разрыв почтовиков:** `max OR / min OR`, один знак после запятой.

## 5. Формат чисел

- Разряды — пробел: `13 564`.
- Десятичный разделитель — запятая: `12,9%`.
- Проценты — 1 знак; отписки и жалобы — 2 знака (`0,30%`).
- Даты — `ДД.ММ.ГГГГ` в шапке и подвале, «1 июля 2026» в блоке «Задача».
