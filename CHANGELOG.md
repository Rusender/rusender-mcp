# Changelog

Формат основан на [Keep a Changelog](https://keepachangelog.com/ru/1.1.0/).

## [Unreleased]

### Изменено
- Репозиторий приведён к требованиям каталога плагинов Claude: только Markdown, JSON, YAML,
  текст и картинки.
- HTML-шаблоны навыков перенесены в `references/*.md`: `rusender-ab-report` (1.1.0, шаблон
  описан спецификацией), `rusender-account-report` (1.16.0), `rusender-campaign-report` (1.1.0),
  `rusender-campaign-timeline` (1.9.0), `rusender-send-date-oracle` (1.2.0).
- `rusender-japanese-style` (1.1.0) работает без скриптов: погода и сборка письма описаны в
  `references/weather.md` и `references/letter-template.md`, цвет хайку заранее посчитан
  в `seasons.json`.
- Иконка плагина: путь в `.claude-plugin/plugin.json` исправлен на `./assets/logo-512.png`.

### Удалено
- GitHub Actions: сборка архивов навыков, публикация в реестр MCP, зеркало в GitVerse.
- Скрипты `scripts/check-skills.sh`, `scripts/check-registry-version.py`.

## [2026-09-17]

### Добавлено
- Навыки `rusender-campaign-create` (1.0.0), `rusender-key-dashboard` (1.0.0),
  `rusender-send-date-oracle` (1.1.0), `rusender-japanese-style` (1.0.0).
- Автосборка ZIP-архивов навыков в релиз `skills-latest` при изменениях в `skills/`.
  Ссылки на архивы постоянные и всегда отдают актуальную версию.
- Манифесты для Cursor: `.mcp.json` и `plugin.json` в корне репозитория.

### Изменено
- Навык `rusender-ab-provider-test` переименован в `rusender-ab-provider`.
- Таблицы навыков в `README.md` и `skills/README.md` приведены к актуальному составу,
  добавлены прямые ссылки на архивы.

## [2026-09-09]

### Добавлено
- Манифест `server.json` и публикация в официальном реестре MCP
  (`io.github.Rusender/rusender-mcp`) через GitHub Actions.
- `SECURITY.md`.

## [2026-08-27]

### Добавлено
- Первая публикация репозитория: документация по подключению, справочник инструментов,
  примеры промптов, готовые конфиги клиентов.
- Навыки: `rusender-account-report` (1.15.0), `rusender-campaign-timeline` (1.8.0),
  `rusender-campaign-report` (1.0.0), `rusender-ab-report` (1.0.0),
  `rusender-ab-provider` (1.0.0), `rusender-campaign-cleanup` (1.0.0).
