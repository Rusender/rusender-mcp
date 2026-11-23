# RuSender: дашборд-отчёт по рассылке (обычной)

**Версия:** 1.2.0 · **Лицензия:** MIT · Требует подключённого MCP-коннектора
[RuSender](https://rusender.ru/features/email/mcp/)

Собирает визуальный дашборд-отчёт по обычной (не A/B) рассылке RuSender: по id кампании тянет из MCP итоги, воронку, динамику открытий по дням, разбивку по почтовым системам, клики по ссылкам и панель доставляемости/рисков (ошибки, отписки, жалобы) — и выдаёт адаптивный HTML-дашборд.

Работает в Claude и ChatGPT. Способ выдачи навык выбирает сам по доступным инструментам:

- есть публикация артефактов (claude.ai) — публикует дашборд;
- можно создавать файлы (ChatGPT с анализом данных, Claude Code) — отдаёт тот же дашборд HTML-файлом и короткую сводку в чате;
- ничего из этого нет — присылает отчёт в чате таблицами.

## Установка

```bash
cp -r rusender-campaign-report ~/.claude/skills/      # Claude Code, личные навыки
cp -r rusender-campaign-report .claude/skills/        # Claude Code, навыки проекта
```

Для claude.ai запакуйте папку в ZIP и загрузите в `Settings → Capabilities → Skills`.
Готовый архив: [rusender-campaign-report.zip](https://rusender.ru/wp-content/uploads/2026/08/rusender-campaign-report.zip)

В ChatGPT навык входит в плагин RuSender.

## Как вызвать

Навык срабатывает сам, когда запрос попадает в его сценарий. Можно вызвать и явно:
`/rusender-campaign-report`.

Подробная инструкция с примерами:
https://rusender.ru/features/email/mcp/skill-campaign-report/

## Что внутри

```
rusender-campaign-report/
├── SKILL.md
├── references/dashboard-template.md
```

Полный сценарий работы и правила оформления — в [SKILL.md](SKILL.md).
