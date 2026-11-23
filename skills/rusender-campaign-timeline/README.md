# RuSender: таймлайн рассылок

**Версия:** 1.10.0 · **Лицензия:** MIT · Требует подключённого MCP-коннектора
[RuSender](https://rusender.ru/features/email/mcp/)

Строит вертикальный таймлайн рассылок аккаунта RuSender: хронику кампаний снизу вверх, где каждая запись — дата, время, тип рассылки, название, статус и её собственные метрики, а между записями видны паузы в отправках.

Работает в Claude и ChatGPT. Способ выдачи навык выбирает сам по доступным инструментам:

- есть публикация артефактов (claude.ai) — публикует дашборд;
- можно создавать файлы (ChatGPT с анализом данных, Claude Code) — отдаёт тот же дашборд HTML-файлом и короткую сводку в чате;
- ничего из этого нет — присылает отчёт в чате таблицами.

## Установка

```bash
cp -r rusender-campaign-timeline ~/.claude/skills/      # Claude Code, личные навыки
cp -r rusender-campaign-timeline .claude/skills/        # Claude Code, навыки проекта
```

Для claude.ai запакуйте папку в ZIP и загрузите в `Settings → Capabilities → Skills`.
Готовый архив: [rusender-campaign-timeline.zip](https://rusender.ru/wp-content/uploads/2026/08/rusender-campaign-timeline.zip)

## Как вызвать

Навык срабатывает сам, когда запрос попадает в его сценарий. Можно вызвать и явно:
`/rusender-campaign-timeline`.

Подробная инструкция с примерами:
https://rusender.ru/features/email/mcp/skill-timeline/

## Что внутри

```
rusender-campaign-timeline/
├── SKILL.md
├── references/timeline-template.md
├── references/palette.md
```

Полный сценарий работы и правила оформления — в [SKILL.md](SKILL.md).
