create extension if not exists pgcrypto;

create table if not exists public.lotto_results (
  id uuid primary key default gen_random_uuid(),
  draw_date date not null unique,
  first_prize text not null check (char_length(first_prize) = 6),
  front_3_digits jsonb not null default '[]'::jsonb,
  back_3_digits jsonb not null default '[]'::jsonb,
  last_2_digits text not null check (char_length(last_2_digits) = 2),
  source_file text not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists lotto_results_draw_date_idx
  on public.lotto_results (draw_date desc);

create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists lotto_results_set_updated_at on public.lotto_results;

create trigger lotto_results_set_updated_at
before update on public.lotto_results
for each row
execute function public.set_updated_at();

