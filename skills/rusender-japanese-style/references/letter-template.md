# Шаблон письма и сборка

Утверждённая вёрстка письма и правила сборки. Модель пишет только погодную фразу и хайку;
вёрстку, цвета и тексты шаблона не трогает.

## 1. Проверь текст перед сборкой

Погодная фраза:
- не пустая, длина от 30 до 260 символов;
- без цифр;
- без слов «прогноз», «градус», «метео», «осадк…», «синоптик», «по данным» и знаков «°», «%»;
- одно-два предложения (не больше двух знаков конца предложения: «.», «!», «?», «…»).

Хайку:
- ровно три непустые строки;
- без цифр, каждая строка не длиннее 42 символов;
- ни одна строка не повторяет погодную фразу (не входит в неё целиком).

Не прошло — исправь **текст** и проверь снова. Вёрстку ради текста не меняй.

## 2. Подставь значения в шаблон

Метки вида `%%ИМЯ%%` в шаблоне ниже заменяются так (`s` — сезон из `assets/seasons.json`,
общие цвета — из корня того же файла):

| Метка | Значение |
|---|---|
| `%%TITLE%%` | `s.jp · s.label` |
| `%%PREHEADER%%` | погодная фраза, не длиннее 140 символов |
| `%%BG%%` | `s.bg` |
| `%%LINE%%` | `s.line` |
| `%%ACCENT%%` | `s.accent` |
| `%%SOFT%%` | `s.soft` |
| `%%INK%%` | `ink` |
| `%%MUTED%%` | `muted` |
| `%%JP%%` | `s.jp` |
| `%%LABEL%%` | `s.label` |
| `%%MOTTO%%` | `s.motto` |
| `%%WEATHER%%` | погодная фраза |
| `%%HAIKU_1%%`, `%%HAIKU_2%%`, `%%HAIKU_3%%` | строки хайку |

Текстовые значения экранируй для HTML (`&`, `<`, `>`); цвета вставляй как есть.

После подстановки проверь:
- в письме не осталось ни одной метки `%%…%%`;
- `{{unsubscribe_url}}` встречается ровно один раз (это переменная RuSender, её не заменяй).

## 3. Что получается на выходе

- **HTML письма** — шаблон с подставленными значениями.
- **Текстовая версия:**

  ```text
  {s.label с заглавной буквы} — {s.motto}

  {погодная фраза}

  {хайку, строка 1}
  {хайку, строка 2}
  {хайку, строка 3}

  —
  Отписаться от рассылки: {{unsubscribe_url}}
  ```

- **Превью для артефакта** — заголовок страницы `{s.jp} · {город}`, тот же блок стилей, что в
  письме, плюс правило `body{margin:0;background:{s.bg}}`, затем содержимое тега body письма.
- **Имя шаблона:** `Кисэцу · {s.label} · {город} · {ДД.ММ.ГГГГ}`.
- **Строка сезона для пользователя:** `{s.jp} ({s.reading}) · {s.label} — {s.motto}`.
- **Какая погода взята:** описание по коду прогноза или «нет прогноза — по сезону».

## 4. Пример результата

Мытищи, 17.09.2026, ранняя осень (`autumn_early`), прогноз «пасмурно».

- Имя шаблона: `Кисэцу · ранняя осень · Мытищи · 17.09.2026`.
- Строка сезона: `萩 (хаги) · ранняя осень — договоры приносят плоды`.
- Погода: «пасмурно».
- Текстовая версия начинается строкой «Ранняя осень — договоры приносят плоды», затем пустая
  строка, погодная фраза, пустая строка, три строки хайку, разделитель «—» и ссылка отписки.

Частые ошибки:
- подставить в `%%SOFT%%` цвет `ink` или `muted` — хайку станет слишком тёмным или спорить с
  подписью сезона; нужен именно `s.soft`;
- править фиксированный текст шаблона: строка «Получатель-сан…» и подпись «Ваш преданный
  отправитель» остаются как есть, дальше письмо дописывает пользователь;
- заменить `{{unsubscribe_url}}` реальной ссылкой — это переменная RuSender, она подставляется
  при отправке.

## 5. Шаблон письма

Копируется дословно, меняются только метки из раздела 2.

```html
<!DOCTYPE html>
<html lang="ru">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="x-apple-disable-message-reformatting">
<title>%%TITLE%%</title>
<style>
@media (max-width:620px){
  .k-card{padding:36px 26px !important}
  .k-text{font-size:16px !important}
  .k-pad{padding-left:14px !important;padding-right:14px !important}
}
</style>
</head>
<body style="margin:0;padding:0;background:%%BG%%;">
<div style="display:none;max-height:0;overflow:hidden;opacity:0;mso-hide:all;">%%PREHEADER%%</div>
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="background:%%BG%%;">
<tr><td align="center" class="k-pad" style="padding:0 20px;">
<table role="presentation" width="600" cellpadding="0" cellspacing="0" border="0" style="width:600px;max-width:100%;">

  <tr><td align="center" style="padding:48px 0 30px;">
    <table role="presentation" cellpadding="0" cellspacing="0" border="0">
      <tr><td align="center" style="border:1px solid %%ACCENT%%;padding:9px 14px 10px;font-family:'Hiragino Mincho ProN','Yu Mincho','MS Mincho',Georgia,serif;font-size:23px;line-height:1;letter-spacing:4px;color:%%ACCENT%%;">%%JP%%</td></tr>
    </table>
    <div style="margin-top:12px;font-family:Georgia,'Times New Roman',serif;font-size:13px;letter-spacing:2px;color:%%MUTED%%;">%%LABEL%% — %%MOTTO%%</div>
  </td></tr>

  <tr><td class="k-card" align="left" style="background:#ffffff;border:1px solid %%LINE%%;padding:52px 56px;">
    <p class="k-text" style="margin:0;font-family:Arial,Helvetica,sans-serif;font-size:16px;line-height:1.6;text-align:left;color:%%INK%%;">%%WEATHER%%</p>
    <p class="k-text" style="margin:16px 0 0;font-family:Arial,Helvetica,sans-serif;font-size:16px;line-height:1.6;text-align:left;color:%%INK%%;">Получатель-сан, надеюсь мое предложение найдет вас в хорошем расположении духа.</p>
    <!-- Продолжение письма: следующий абзац пишется здесь -->
    <p class="k-text" style="margin:24px 0 0;font-family:Arial,Helvetica,sans-serif;font-size:16px;line-height:1.6;text-align:left;color:%%INK%%;">=====<br>Ваш преданный отправитель</p>
  </td></tr>

  <tr><td align="center" style="padding:40px 0 16px;">
    <table role="presentation" cellpadding="0" cellspacing="0" border="0"><tr><td style="width:32px;height:1px;background:%%ACCENT%%;font-size:0;line-height:0;">&nbsp;</td></tr></table>
    <p style="margin:22px 0 0;font-family:Georgia,'Times New Roman',serif;font-size:16px;line-height:1.4;font-style:italic;color:%%SOFT%%;">%%HAIKU_1%%<br>%%HAIKU_2%%<br>%%HAIKU_3%%</p>
  </td></tr>

  <tr><td align="center" style="padding:24px 0 48px;font-family:Georgia,'Times New Roman',serif;font-size:12px;line-height:1.6;color:%%MUTED%%;">
    <a href="{{unsubscribe_url}}" style="color:%%MUTED%%;text-decoration:underline;">Отписаться от рассылки</a>
  </td></tr>

</table>
</td></tr>
</table>
</body>
</html>
```
