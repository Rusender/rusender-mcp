# Навыки RuSender

Навык (skill) — это готовый сценарий работы для ИИ-ассистента. Вместо того чтобы объяснять,
какие данные собрать и как их оформить, вы просто говорите «собери отчёт по рассылке», а
ассистент подхватывает нужный навык сам.

Все навыки требуют подключённого MCP-коннектора RuSender.

## Список

| Навык | Версия | Что делает | Инструкция |
|---|---|---|---|
| [`rusender-account-report`](rusender-account-report/) | 1.15.0 | Дашборд-обзор аккаунта: база, объёмы отправок, инфраструктура, проблемы конфигурации | [ссылка](https://rusender.ru/features/email/mcp/skill-account-analyst/) |
| [`rusender-campaign-report`](rusender-campaign-report/) | 1.0.0 | Разбор одной рассылки: воронка, динамика открытий, клики, доставляемость | [ссылка](https://rusender.ru/features/email/mcp/skill-campaign-report/) |
| [`rusender-ab-report`](rusender-ab-report/) | 1.0.0 | Отчёт по A/B-тесту: варианты тем, победитель, матрица «тема × провайдер» | [ссылка](https://rusender.ru/features/email/mcp/skill-ab/) |
| [`rusender-ab-provider-test`](rusender-ab-provider-test/) | 1.0.0 | Мульти-провайдерный A/B-тест: делит базу на Gmail / Mail.ru / Yandex / остальные | [ссылка](https://rusender.ru/features/email/mcp/skill-ab-provider/) |
| [`rusender-campaign-timeline`](rusender-campaign-timeline/) | 1.8.0 | Вертикальный таймлайн отправок: что и когда уходило, где были паузы | [ссылка](https://rusender.ru/features/email/mcp/skill-timeline/) |
| [`rusender-campaign-cleanup`](rusender-campaign-cleanup/) | 1.0.0 | Архивирует заблокированные и отклонённые модератором рассылки | [ссылка](https://rusender.ru/features/email/mcp/skill-cleanup/) |

## Установка

### Claude Code

Скопируйте папку навыка в личные или проектные навыки:

```bash
cp -r skills/rusender-campaign-report ~/.claude/skills/      # личные
cp -r skills/rusender-campaign-report .claude/skills/        # проектные
```

Или сразу все:

```bash
cp -r skills/rusender-* ~/.claude/skills/
```

### claude.ai

Запакуйте папку навыка в ZIP и загрузите в `Settings → Capabilities → Skills`.
Готовые архивы также лежат [на странице MCP](https://rusender.ru/features/email/mcp/).

## Как пользоваться

Навык срабатывает сам, когда запрос попадает в его сценарий:

```
Собери отчёт по рассылке 12345.
Покажи хронику отправок за последние полгода.
Наведи порядок в списке рассылок.
```

Можно вызвать и явно, командой вида `/rusender-campaign-report`.

## Ограничения

- Навыки рассчитаны на **Claude Code** и **claude.ai** с подключённым MCP-коннектором.
- Для дистрибуции через **Claude API** не подходят: там песочница без сети и без внешних
  коннекторов.
- Отчётные навыки публикуют результат артефактом, поэтому клиент должен уметь их
  отображать.

## Лицензия

MIT — см. [LICENSE](../LICENSE) в корне репозитория.
