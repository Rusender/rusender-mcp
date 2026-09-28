#!/bin/bash
# Проверка навыков перед коммитом.
# Запуск из корня репозитория:  bash scripts/check-skills.sh

cd "$(dirname "$0")/.." || exit 1
ERR=0
WARN=0

echo "=== Фронтматтер ==="
for d in skills/*/; do
  name=$(basename "$d")
  [ "$name" = "all" ] && continue
  if [ ! -f "$d/SKILL.md" ]; then
    echo "  ОШИБКА  $name — нет SKILL.md, навык не попадёт в релиз"; ERR=$((ERR+1)); continue
  fi
  python3 - "$d" "$name" << 'PY'
import sys, os, yaml
d, folder = sys.argv[1], sys.argv[2]
raw = open(os.path.join(d, "SKILL.md"), encoding="utf-8").read()
try:
    fm_raw = raw.split("---")[1]
    fm = yaml.safe_load(fm_raw)
except Exception as e:
    print(f"  ОШИБКА  {folder} — не читается фронтматтер: {e}"); sys.exit(1)

bad, warn = [], []
if fm.get("name") != folder:
    bad.append(f"name={fm.get('name')!r} не совпадает с папкой")
if not fm.get("license"):
    bad.append("нет license")
md = fm.get("metadata") or {}
if not md.get("version"):
    bad.append("нет metadata.version")
if ">-" in fm_raw or ">\n" in fm_raw:
    warn.append("description через >- — часть каталогов его не парсит, надёжнее одна строка в кавычках")
if not fm.get("description"):
    bad.append("нет description")

if bad:
    print(f"  ОШИБКА  {folder}: " + "; ".join(bad)); sys.exit(1)
if warn:
    print(f"  ПРОВЕРЬТЕ {folder}: " + "; ".join(warn)); sys.exit(2)
print(f"  ок      {folder}  v{md.get('version')}")
PY
  rc=$?
  [ $rc -eq 1 ] && ERR=$((ERR+1))
  [ $rc -eq 2 ] && WARN=$((WARN+1))
done

echo
echo "=== Почтовые адреса ==="
MAILS=$(grep -rhoiE "[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}" skills/ 2>/dev/null \
  | grep -viE "@(example\.(com|ru|org)|shop\.example\.ru|partner\.example\.ru|rusender\.ru|domovoy-store\.ru|promo-partner\.ru)" \
  | grep -viE "^(imya\.familiya@gmail\.com|domovoy\.store@gmail\.com)$" | sort -u)
if [ -n "$MAILS" ]; then
  echo "  ПРОВЕРЬТЕ — адреса вне белого списка:"
  echo "$MAILS" | sed 's/^/    /'
  WARN=$((WARN+1))
else
  echo "  ок      посторонних адресов нет"
fi

echo
echo "=== Внутренние адреса и туннели ==="
HOSTS=$(grep -rhoiE "ngrok[a-z0-9.-]*|crm\.[a-z0-9.-]+|localhost:[0-9]+|127\.0\.0\.1" skills/ 2>/dev/null | sort -u)
if [ -n "$HOSTS" ]; then
  echo "  ПРОВЕРЬТЕ:"; echo "$HOSTS" | sed 's/^/    /'; WARN=$((WARN+1))
else
  echo "  ок      не найдено"
fi

echo
echo "=== Секреты ==="
SEC=$(grep -rniE "(api[_-]?key|secret|token|password|bearer)[\"' ]*[:=][\"' ]*[a-z0-9_-]{16,}" skills/ 2>/dev/null | head -5)
if [ -n "$SEC" ]; then
  echo "  ОШИБКА — похоже на секрет:"; echo "$SEC" | sed 's/^/    /'; ERR=$((ERR+1))
else
  echo "  ок      секретов не найдено"
fi

echo
echo "=== Согласованность README ==="
CNT=$(ls -d skills/*/ 2>/dev/null | grep -v "skills/all/" | wc -l | tr -d ' ')
R1=$(grep -c "^| \[rusender" README.md 2>/dev/null)
R2=$(grep -c "^| \[\`rusender" skills/README.md 2>/dev/null)
echo "  папок навыков: $CNT, строк в README.md: $R1, в skills/README.md: $R2"
[ "$CNT" != "$R1" ] && { echo "  ПРОВЕРЬТЕ — таблица в README.md не совпадает"; WARN=$((WARN+1)); }
[ "$CNT" != "$R2" ] && { echo "  ПРОВЕРЬТЕ — таблица в skills/README.md не совпадает"; WARN=$((WARN+1)); }

echo
if [ $ERR -gt 0 ]; then
  echo "ИТОГ: ошибок $ERR, предупреждений $WARN — пушить рано"; exit 1
elif [ $WARN -gt 0 ]; then
  echo "ИТОГ: ошибок нет, предупреждений $WARN — посмотрите список выше"; exit 0
else
  echo "ИТОГ: всё чисто, можно пушить"; exit 0
fi
