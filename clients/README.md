# Готовые конфиги

Скопируйте нужный файл или его содержимое в настройки клиента. Секретов внутри нет:
авторизация проходит через OAuth при первом обращении к серверу.

| Файл | Куда |
|---|---|
| `claude-desktop.json` | Claude Desktop → Settings → Developer → Edit Config |
| `cursor.json` | Cursor → Settings → MCP → Add new global MCP server |
| `vscode.json` | Файл `.vscode/mcp.json` в проекте |

Claude Code добавляется одной командой:

```bash
claude mcp add --transport http rusender https://mcp.rusender.ru/mcp
```

Для claude.ai, ChatGPT, Gemini, Yandex AI Studio и opencode конфиг не нужен: в настройках
клиента добавьте пользовательский сервер по адресу `https://mcp.rusender.ru/mcp`.

Подробности — [`../docs/connect.md`](../docs/connect.md).
