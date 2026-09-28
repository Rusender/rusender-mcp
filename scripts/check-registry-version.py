#!/usr/bin/env python3
"""Сравнивает version в server.json с тем, что уже опубликовано в реестре MCP.

Выходит с кодом 1, если версия совпадает — значит публиковать нечего и надо
сначала поднять номер.
"""
import json
import sys
import urllib.request

REGISTRY = "https://registry.modelcontextprotocol.io/v0/servers?search="

local = json.load(open("server.json", encoding="utf-8"))
name, version = local["name"], local["version"]
query = name.split("/")[-1]

print(f"Сервер:        {name}")
print(f"В server.json: {version}")

try:
    with urllib.request.urlopen(REGISTRY + query, timeout=20) as r:
        data = json.load(r)
except Exception as e:
    print(f"Реестр недоступен ({e}) — пробуем публиковать.")
    sys.exit(0)

remote = None
for item in data.get("servers", []):
    srv = item.get("server", {})
    if srv.get("name") == name:
        remote = srv.get("version")
        break

print(f"В реестре:     {remote or 'записи нет'}")

if remote is None:
    print("\nПубликуем впервые.")
    sys.exit(0)

if remote == version:
    print(f"\nОСТАНОВКА: версия {version} уже опубликована.")
    print("Поднимите version в server.json перед запуском:")
    print("  патч  1.0.1 — правка описания или ссылок")
    print("  минор 1.1.0 — новые возможности сервера")
    print("  мажор 2.0.0 — смена URL или способа подключения")
    sys.exit(1)

print("\nВерсия отличается — публикуем.")
