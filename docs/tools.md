# Инструменты MCP-сервера RuSender

79 инструментов, сгруппированных по разделам. Имена приведены без префикса сервера —
префикс назначается клиентом при подключении и может меняться, поэтому в навыках и
скриптах его не стоит хардкодить.

## Рассылки (campaigns)

| Инструмент | Что делает |
|---|---|
| `public_campaigns_list` | Список кампаний аккаунта |
| `public_campaigns_get_by_id` | Кампания по ID, с опциональной статистикой |
| `public_campaigns_create` | Создать кампанию в статусе черновика |
| `public_campaigns_update` | Обновить черновик |
| `public_campaigns_delete` | Удалить черновик |
| `public_campaigns_schedule` | Запустить черновик: отправка на модерацию и в очередь |
| `public_campaigns_archive` | Убрать завершённую кампанию в архив |
| `public_campaigns_unarchive` | Вернуть кампанию из архива |
| `public_campaigns_ab_test_preview` | Как распределятся контакты между вариантами A/B |
| `public_campaigns_chunks_preview` | Как разобьётся отправка на части |
| `public_campaigns_get_activity` | Открытия и клики по периодам |
| `public_campaigns_get_link_clicks` | Клики в разбивке по ссылкам |
| `public_campaigns_get_stats_by_domains` | Статистика по почтовым системам получателей |

## Контакты (contacts)

| Инструмент | Что делает |
|---|---|
| `public_contacts_list` | Поиск контактов с фильтрами и пагинацией |
| `public_contacts_get_by_id` | Контакт по идентификатору |
| `public_contacts_update` | Обновить имя, телефон и другие атрибуты |
| `public_contacts_delete` | Удалить контакт из всех списков |
| `public_contacts_bulk_delete` | Массовое удаление по списку ID |
| `public_contacts_remove_from_all_lists` | Убрать из всех списков без удаления |
| `public_contacts_unsubscribe` | Отписать глобально |
| `public_contacts_subscribe_back` | Вернуть подписку |
| `public_contacts_statistics` | Сводная статистика по базе |
| `public_contacts_api_sending_history` | История транзакционных отправок |
| `public_contacts_distribution_sending_history` | История отправок в рассылках |

## Списки (lists)

| Инструмент | Что делает |
|---|---|
| `public_lists_list` | Все списки контактов |
| `public_lists_get_by_id` | Список по ID |
| `public_lists_create` | Создать список |
| `public_lists_update` | Обновить список |
| `public_lists_delete` | Удалить список |
| `public_lists_statistics` | Статистика контактов в списке |
| `public_lists_contacts_list` | Контакты внутри списка |
| `public_lists_contacts_create` | Создать контакт или переиспользовать существующий |
| `public_lists_contacts_add` | Добавить существующие контакты в список |
| `public_lists_contacts_import` | Импорт до 1000 контактов за раз |
| `public_lists_contacts_update` | Обновить контакт в контексте списка, включая переменные |
| `public_lists_contacts_move` | Атомарно перенести контакты в другой список |
| `public_lists_contacts_remove` | Убрать контакты из списка без удаления |

## Сегменты (segments)

| Инструмент | Что делает |
|---|---|
| `public_segments_list` | Сегменты с условиями |
| `public_segments_get_by_id` | Сегмент по ID |
| `public_segments_create` | Создать сегмент с произвольным набором условий |
| `public_segments_update` | Обновить сегмент |
| `public_segments_list_filters` | Какие поля доступны для условий |

## Переменные (variables)

| Инструмент | Что делает |
|---|---|
| `public_variables_list` | Переменные списка |
| `public_variables_create` | Создать переменную |
| `public_variables_update` | Обновить имя или значение по умолчанию |
| `public_variables_delete` | Удалить переменную и все её значения |

## Шаблоны (templates)

| Инструмент | Что делает |
|---|---|
| `public_templates_list_v2` | Шаблоны аккаунта |
| `public_templates_get_by_id` | Шаблон с HTML-содержимым |
| `public_templates_create` | Создать HTML-шаблон |
| `public_templates_update` | Обновить HTML-шаблон |
| `public_templates_list` | Устаревший вариант списка, оставлен для совместимости |

## Отправители и домены

| Инструмент | Что делает |
|---|---|
| `public_senders_list` | Адреса отправителей |
| `public_senders_get_by_id` | Отправитель по ID |
| `public_senders_create` | Добавить адрес отправителя |
| `public_senders_resend_confirmation` | Переотправить письмо подтверждения |
| `public_domains_list` | Домены с DNS-записями |
| `public_domains_get_by_id` | Домен по ID |
| `public_domains_create` | Добавить домен и сгенерировать DKIM, SPF, DMARC |
| `public_domains_verify` | Проверить DNS-записи домена |
| `public_domains_delete` | Удалить неподтверждённый домен |

## Транзакционные письма

| Инструмент | Что делает |
|---|---|
| `public_external_mail_send` | Отправить письмо через сендинг-ключ |
| `public_external_mail_send_by_template` | Отправить письмо по сохранённому шаблону |
| `public_external_mail_keys_list` | Сендинг-ключи аккаунта |
| `public_external_mail_keys_get_by_id` | Ключ по ID |
| `public_external_mail_keys_create` | Создать ключ для подтверждённого домена |
| `public_external_mail_keys_update` | Переименовать ключ |
| `public_external_mail_keys_delete` | Удалить ключ |

## Папки, вебхуки, цепочки

| Инструмент | Что делает |
|---|---|
| `public_folders_list` | Папки кампаний |
| `public_folders_get_by_id` | Папка по ID |
| `public_folders_create` | Создать папку |
| `public_folders_update` | Обновить папку |
| `public_folders_delete` | Удалить папку |
| `public_folders_campaigns_add` | Положить кампании в папку |
| `public_folders_campaigns_remove` | Убрать кампании из папки |
| `public_webhooks_list` | Вебхуки аккаунта |
| `public_webhooks_get_by_id` | Вебхук по ID |
| `public_webhooks_create` | Создать вебхук |
| `public_webhooks_update` | Частично обновить вебхук |
| `public_chains_trigger` | Запустить активную цепочку писем для контакта |

---

Полное описание параметров и форматов ответов — в
[документации Email API](https://rusender.ru/developer/api/email/).
