# Навыки RuSender

Навык (skill) — это готовый сценарий работы для ИИ-ассистента. Вместо того чтобы объяснять,
какие данные собрать и как их оформить, вы просто говорите «собери отчёт по рассылке», а
ассистент подхватывает нужный навык сам.

Почти все навыки требуют подключённого MCP-коннектора RuSender. Исключения отмечены в таблице.

## Список

| Навык | Версия | Что делает | Скачать | Инструкция |
|---|---|---|---|---|
| [`rusender-account-report`](rusender-account-report/) | 1.15.0 | Дашборд-обзор аккаунта: база, объёмы отправок, инфраструктура, проблемы конфигурации | [ZIP](https://github.com/Rusender/rusender-mcp/releases/download/skills-latest/rusender-account-report.zip) | [ссылка](https://rusender.ru/features/email/mcp/skill-account-analyst/) |
| [`rusender-campaign-report`](rusender-campaign-report/) | 1.0.0 | Разбор одной рассылки: воронка, динамика открытий, клики, доставляемость | [ZIP](https://github.com/Rusender/rusender-mcp/releases/download/skills-latest/rusender-campaign-report.zip) | [ссылка](https://rusender.ru/features/email/mcp/skill-campaign-report/) |
| [`rusender-ab-report`](rusender-ab-report/) | 1.0.0 | Отчёт по A/B-тесту: варианты тем, победитель, матрица «тема × провайдер» | [ZIP](https://github.com/Rusender/rusender-mcp/releases/download/skills-latest/rusender-ab-report.zip) | [ссылка](https://rusender.ru/features/email/mcp/skill-ab/) |
| [`rusender-ab-provider`](rusender-ab-provider/) | 1.0.0 | Мульти-провайдерный A/B-тест: делит базу на Gmail, Mail.ru, Yandex и остальных | [ZIP](https://github.com/Rusender/rusender-mcp/releases/download/skills-latest/rusender-ab-provider.zip) | [ссылка](https://rusender.ru/features/email/mcp/skill-ab-provider/) |
| [`rusender-campaign-timeline`](rusender-campaign-timeline/) | 1.8.0 | Таймлайн отправок: что и когда уходило, по какому списку и с каким результатом | [ZIP](https://github.com/Rusender/rusender-mcp/releases/download/skills-latest/rusender-campaign-timeline.zip) | [ссылка](https://rusender.ru/features/email/mcp/skill-timeline/) |
| [`rusender-campaign-cleanup`](rusender-campaign-cleanup/) | 1.0.0 | Архивирует заблокированные и отклонённые модератором рассылки | [ZIP](https://github.com/Rusender/rusender-mcp/releases/download/skills-latest/rusender-campaign-cleanup.zip) | [ссылка](https://rusender.ru/features/email/mcp/skill-cleanup/) |
| [`rusender-campaign-create`](rusender-campaign-create/) | 1.0.0 | Создание рассылки по шагам: отправитель, домен, списки, шаблон, темы. Сохраняет черновиком | [ZIP](https://github.com/Rusender/rusender-mcp/releases/download/skills-latest/rusender-campaign-create.zip) | [ссылка](https://rusender.ru/features/email/mcp/skill-campaign-create/) |
| [`rusender-key-dashboard`](rusender-key-dashboard/) | 1.0.0 | Дашборд по транзакционному ключу: доставляемость, OR и CTR, ошибки, тематики писем | [ZIP](https://github.com/Rusender/rusender-mcp/releases/download/skills-latest/rusender-key-dashboard.zip) | [ссылка](https://rusender.ru/features/email/mcp/skill-key-dashboard/) |
| [`rusender-send-date-oracle`](rusender-send-date-oracle/) | 1.1.0 | Шуточный оракул: подбирает дату отправки по нумерологии, фазе Луны и дню недели | [ZIP](https://github.com/Rusender/rusender-mcp/releases/download/skills-latest/rusender-send-date-oracle.zip) | [ссылка](https://rusender.ru/features/email/mcp/skill-send-date-oracle/) |
| [`rusender-japanese-style`](rusender-japanese-style/) | 1.0.0 | Шаблон письма в японском стиле: сезонная палитра, реальная погода в городе получателя, хайку | [ZIP](https://github.com/Rusender/rusender-mcp/releases/download/skills-latest/rusender-japanese-style.zip) | [ссылка](https://rusender.ru/features/email/mcp/skill-japanese-style/) |

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

Скачайте ZIP из таблицы выше и загрузите в `Settings → Capabilities → Skills`.
Архивы собираются автоматически из этих папок, ссылки всегда отдают актуальную версию.

## Как пользоваться

Навык срабатывает сам, когда запрос попадает в его сценарий:

```
Собери отчёт по рассылке 12345.
Покажи хронику отправок за последние полгода.
Наведи порядок в списке рассылок.
Создай рассылку по списку «Активные».
```

Можно вызвать и явно, командой вида `/rusender-campaign-report`.

## Ограничения

- Навыки рассчитаны на **Claude Code** и **claude.ai** с подключённым MCP-коннектором.
- Для дистрибуции через **Claude API** не подходят: там песочница без сети и без внешних коннекторов.
- Отчётные навыки публикуют результат артефактом, поэтому клиент должен уметь их отображать.
- `rusender-send-date-oracle` работает и без MCP. `rusender-japanese-style` обращается к
  внешнему сервису погоды Open-Meteo.

## Лицензия

MIT — см. [LICENSE](../LICENSE) в корне репозитория.
