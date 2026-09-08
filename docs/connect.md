# Подключение MCP-сервера RuSender

Единый адрес сервера:

```
https://mcp.rusender.ru/mcp
```

Сервер удалённый и работает в облаке. Ничего устанавливать и разворачивать не нужно,
авторизация проходит через OAuth в аккаунте RuSender.

Перед подключением зарегистрируйтесь в [RuSender](https://app.rusender.ru/auth/register/).

Актуальные пошаговые инструкции с картинками для всех клиентов лежат в
[базе знаний](https://rusender.ru/knowledge-base/email-service/mcp/). Ниже — короткая
выжимка и готовые конфиги.

---

## Claude Desktop

Откройте `Settings → Developer → Edit Config` и добавьте сервер в `mcpServers`.
Готовый файл: [`clients/claude-desktop.json`](../clients/claude-desktop.json).

После перезапуска приложения Claude предложит авторизоваться — войдите в аккаунт RuSender
и подтвердите доступ.

## Claude Code

```bash
claude mcp add --transport http rusender https://mcp.rusender.ru/mcp
```

Затем выполните `/mcp` в сессии и пройдите авторизацию.

## claude.ai

`Settings → Connectors → Add custom connector`, вставьте URL сервера и авторизуйтесь.

## Cursor

`Settings → MCP → Add new global MCP server`.
Готовый файл: [`clients/cursor.json`](../clients/cursor.json).

## VS Code

Создайте `.vscode/mcp.json` в проекте.
Готовый файл: [`clients/vscode.json`](../clients/vscode.json).

## ChatGPT

`Settings → Connectors → Create`, укажите URL сервера и пройдите авторизацию.

## Yandex AI Studio, Gemini, opencode

Порядок тот же: в настройках клиента добавьте пользовательский MCP-сервер по адресу
`https://mcp.rusender.ru/mcp` и авторизуйтесь. Конкретные пункты меню смотрите в
[базе знаний](https://rusender.ru/knowledge-base/email-service/mcp/).

---

## Проверка

Задайте ассистенту простой вопрос, который требует обращения к аккаунту:

```
Покажи мои списки контактов и сколько в каждом подписчиков.
```

Если ответ пришёл с реальными данными — сервер подключён.

## Отзыв доступа

Доступ отзывается в любой момент в настройках аккаунта RuSender или удалением сервера
из настроек клиента.

## Если что-то не работает

- Проверьте, что адрес указан целиком, вместе с `/mcp` в конце.
- Убедитесь, что клиент поддерживает удалённые (remote) MCP-серверы, а не только локальные.
- После добавления сервера клиент нужно перезапустить.
- Остальное — [поддержка 24/7](https://rusender.ru/support/) или
  [чат в Telegram](https://t.me/RuSender_chat).
