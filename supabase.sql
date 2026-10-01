-- Таблица дел для «Моего календаря».
-- Выполните целиком в Supabase → SQL Editor → Run.

create table public.tasks (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  title text not null,
  date text not null,                       -- YYYY-MM-DD, дата или начало серии
  time text not null default '',            -- HH:MM или пусто
  duration int not null default 0,          -- минуты
  cat text not null default 'work',         -- work | personal | health | study | other
  repeat text not null default 'none',      -- none | daily | weekdays | weekly | monthly | yearly
  until text not null default '',           -- YYYY-MM-DD или пусто
  done jsonb not null default '{}'::jsonb,  -- {"2026-10-01": true, ...}
  skip jsonb not null default '[]'::jsonb,  -- удалённые дни серии
  created bigint not null default 0
);

-- Каждый пользователь видит и меняет только свои дела.
alter table public.tasks enable row level security;
create policy "own tasks" on public.tasks for all
  using (auth.uid() = user_id) with check (auth.uid() = user_id);

-- Живые обновления между устройствами.
alter publication supabase_realtime add table public.tasks;
