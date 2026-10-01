# Мой календарь

Личный календарь: дела на сегодня, месячная сетка, время, длительность, категории, повторения и отметка «сделано». Дела хранятся в Supabase и одинаковы на всех устройствах.

Сайт: https://quencilgd.github.io/calendar/

## Как устроено

- `index.html` — весь сайт (HTML, CSS и JS в одном файле).
- `config.js` — адрес проекта Supabase и публичный ключ.
- `supabase.sql` — таблица `tasks` с правилами доступа (каждый видит только свои дела).

## Настройка Supabase

1. Создайте проект на supabase.com.
2. SQL Editor → вставьте содержимое `supabase.sql` → Run.
3. Authentication → Sign In / Providers → Email → выключите **Confirm email**.
4. Project Settings → API Keys → скопируйте Project URL и publishable (anon) ключ в `config.js`.
5. После регистрации своего аккаунта можно выключить **Allow new users to sign up**, чтобы никто больше не заводил аккаунты.

## Публикация

Сайт раздаётся через GitHub Pages из ветки `main`, корневой папки. Любой коммит в `main` обновляет сайт примерно за минуту.
