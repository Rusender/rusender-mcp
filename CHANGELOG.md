# Changelog

Формат основан на [Keep a Changelog](https://keepachangelog.com/ru/1.1.0/).

## [Unreleased]

### Изменено
- Навыки работают одной версией и в Claude, и в ChatGPT. Отчётные навыки выбирают способ
  выдачи по доступным инструментам: публикация артефакта (как раньше в Claude), HTML-файл
  (ChatGPT с анализом данных, Claude Code) или отчёт в чате. Ветка публикации для Claude
  не изменилась: `rusender-campaign-report` (1.2.0), `rusender-ab-report` (1.2.0),
  `rusender-account-report` (1.17.0), `rusender-campaign-timeline` (1.10.0),
  `rusender-send-date-oracle` (1.3.0), `rusender-japanese-style` (1.2.0).
- `rusender-key-dashboard` (1.1.0) больше не требует скиллов `sites-building`/`sites-hosting`:
  использует их, если они есть (ChatGPT), иначе — публикацию артефакта, файл или отчёт в чате.
- `plugin.json` 1.0.2: в описание для ChatGPT добавлены все 10 навыков.
- Репозиторий приведён к требованиям каталога плагинов Claude: только Markdown, JSON, YAML,
  текст и картинки.
- HTML-шаблоны навыков перенесены в `references/*.md`: `rusender-ab-report` (1.1.0, шаблон
  описан спецификацией), `rusender-account-report` (1.16.0), `rusender-campaign-report` (1.1.0),
  `rusender-campaign-timeline` (1.9.0), `rusender-send-date-oracle` (1.2.0).
- `rusender-japanese-style` (1.1.0) работает без скриптов: погода и сборка письма описаны в
  `references/weather.md` и `references/letter-template.md`, цвет хайку заранее посчитан
  в `seasons.json`.
- Иконка плагина: исправлен путь в манифесте Claude.

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
