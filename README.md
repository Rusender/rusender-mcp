# RuSender MCP

MCP-сервер [RuSender](https://rusender.ru/) и готовые агентские навыки (skills) для работы
с email-рассылками из ИИ-ассистента.

Подключите сервер к Claude, ChatGPT, Cursor, Gemini, Yandex AI Studio или другому
совместимому клиенту — и управляйте рассылками, базой контактов и аналитикой обычными
словами, без кода и кастомных интеграций.

```
Вы:  Отправь рассылку «Весенняя распродажа» по списку «Самые крутые клиенты».
ИИ:  ✓ выбрал список  ✓ собрал рассылку  ✓ отправил  ✓ подготовил отчёт
     Готово. Рассылка отправлена 4 218 подписчикам, доставка 100%.
```

## Быстрый старт

1. Зарегистрируйтесь в [RuSender](https://app.rusender.ru/auth/register/).
2. В настройках ИИ-клиента добавьте пользовательский MCP-сервер:

   ```
   https://mcp.rusender.ru/mcp
   ```

3. Авторизуйтесь через OAuth в аккаунте RuSender. API-ключи копировать и хранить не нужно.
4. Дайте первую команду: «Покажи статистику по последним рассылкам».

Готовые конфиги для популярных клиентов лежат в [`clients/`](clients/).
Пошаговые инструкции — в [`docs/connect.md`](docs/connect.md) и в
[базе знаний](https://rusender.ru/knowledge-base/email-service/mcp/).

## Что это такое

| | |
|---|---|
| **URL сервера** | `https://mcp.rusender.ru/mcp` |
| **Транспорт** | Remote HTTP, ничего разворачивать не нужно |
| **Авторизация** | OAuth через аккаунт RuSender |
| **Стоимость** | Подключение бесплатное. На бесплатном тарифе — до 100 отправок по API и рассылки по базе до 500 контактов |
| **Поддержка** | На стороне RuSender, [24/7](https://rusender.ru/support/) |
| **Инструментов** | 79, список в [`docs/tools.md`](docs/tools.md) |

## Что умеет

**Рассылки.** Создать черновик, собрать письмо из шаблона, запланировать отправку,
запустить A/B-тест по темам, разбить отправку на части, заархивировать старое.

**База контактов.** Списки, сегменты по условиям, импорт, перенос между списками,
переменные, отписки и возврат подписки, статистика по базе.

**Аналитика.** Итоги кампании, воронка, динамика открытий по дням, разбивка по почтовым
системам, клики по ссылкам, история отправок.

**Инфраструктура.** Домены и DNS-записи (DKIM, SPF, DMARC), отправители, ключи для
транзакционных писем, вебхуки, папки кампаний.

**Транзакционные письма.** Отправка одиночных писем и писем по шаблону через сендинг-ключ.

Полный список инструментов с описаниями — [`docs/tools.md`](docs/tools.md).
Примеры промптов — [`docs/prompts.md`](docs/prompts.md).

## Навыки (skills)

Навык — это готовый сценарий работы: вы просите «собери отчёт по рассылке», а ассистент
знает, какие инструменты вызвать, в каком порядке и как оформить результат.

| Навык | Что делает | Скачать |
|---|---|---|
| [rusender-account-report](skills/rusender-account-report/) | Дашборд-обзор аккаунта: база, объёмы отправок, инфраструктура, проблемы конфигурации | [ZIP](https://github.com/Rusender/rusender-mcp/releases/download/skills-latest/rusender-account-report.zip) |
| [rusender-campaign-report](skills/rusender-campaign-report/) | Разбор одной рассылки: воронка, динамика открытий, клики, доставляемость | [ZIP](https://github.com/Rusender/rusender-mcp/releases/download/skills-latest/rusender-campaign-report.zip) |
| [rusender-ab-report](skills/rusender-ab-report/) | Отчёт по A/B-тесту: варианты тем, победитель, матрица «тема × провайдер» | [ZIP](https://github.com/Rusender/rusender-mcp/releases/download/skills-latest/rusender-ab-report.zip) |
| [rusender-ab-provider](skills/rusender-ab-provider/) | Мульти-провайдерный A/B-тест: делит базу на Gmail, Mail.ru, Yandex и остальных | [ZIP](https://github.com/Rusender/rusender-mcp/releases/download/skills-latest/rusender-ab-provider.zip) |
| [rusender-campaign-timeline](skills/rusender-campaign-timeline/) | Таймлайн отправок: что и когда уходило, по какому списку и с каким результатом | [ZIP](https://github.com/Rusender/rusender-mcp/releases/download/skills-latest/rusender-campaign-timeline.zip) |
| [rusender-campaign-cleanup](skills/rusender-campaign-cleanup/) | Архивирует заблокированные и отклонённые модератором рассылки | [ZIP](https://github.com/Rusender/rusender-mcp/releases/download/skills-latest/rusender-campaign-cleanup.zip) |
| [rusender-campaign-create](skills/rusender-campaign-create/) | Создание рассылки по шагам: отправитель, домен, списки, шаблон, темы | [ZIP](https://github.com/Rusender/rusender-mcp/releases/download/skills-latest/rusender-campaign-create.zip) |
| [rusender-key-dashboard](skills/rusender-key-dashboard/) | Дашборд по транзакционному ключу: доставляемость, OR и CTR, ошибки, тематики | [ZIP](https://github.com/Rusender/rusender-mcp/releases/download/skills-latest/rusender-key-dashboard.zip) |
| [rusender-send-date-oracle](skills/rusender-send-date-oracle/) | Шуточный оракул: дата отправки по нумерологии, фазе Луны и дню недели | [ZIP](https://github.com/Rusender/rusender-mcp/releases/download/skills-latest/rusender-send-date-oracle.zip) |
| [rusender-japanese-style](skills/rusender-japanese-style/) | Письмо в японском стиле: сезонная палитра, погода в городе получателя, хайку | [ZIP](https://github.com/Rusender/rusender-mcp/releases/download/skills-latest/rusender-japanese-style.zip) |

Установка и подробности — [`skills/README.md`](skills/README.md).
Архивы собираются автоматически из папок навыков, ссылки всегда отдают актуальную версию.
Те же навыки есть [на странице MCP](https://rusender.ru/features/email/mcp/).

## Совместимость

Работает с любым клиентом, поддерживающим удалённые MCP-серверы: Claude (Desktop, Code,
claude.ai), ChatGPT, Cursor, Gemini, Yandex AI Studio, opencode, VS Code и другими.

Навыки в текущем виде рассчитаны на Claude Code и claude.ai. Для дистрибуции через
Claude API они не подходят: там песочница без сети и без внешних MCP-коннекторов.

## Безопасность

Доступ выдаётся через OAuth и отзывается в любой момент в настройках аккаунта RuSender.
Набор разрешённых инструментов вы определяете сами на стороне клиента. Секретов в этом
репозитории нет, и класть их сюда не нужно: авторизация проходит без ручного ввода ключей.

## Ссылки

- [Страница MCP-сервера](https://rusender.ru/features/email/mcp/)
- [Документация и инструкции по подключению](https://rusender.ru/knowledge-base/email-service/mcp/)
- [Документация Email API](https://rusender.ru/developer/api/email/)
- [Поддержка 24/7](https://rusender.ru/support/)
- [Чат в Telegram](https://t.me/RuSender_chat) · [новости](https://t.me/Ru_Sender)

## Лицензия

MIT — см. [LICENSE](LICENSE). Лицензия распространяется на содержимое этого репозитория
(документацию, конфиги и навыки). Сам сервис RuSender предоставляется на условиях
[лицензионного соглашения](https://rusender.ru/legal/agreement/).
