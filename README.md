# Thai Lotto

Thai lottery dataset project prepared for GitHub and Supabase.

## Project structure

- `Thai_Lotto.csv` original source data
- `Thai_Lotto_updated.csv` latest source data
- `supabase/migrations/` database schema for Supabase
- `supabase/seed.sql` initial seed generated from `Thai_Lotto_updated.csv`
- `scripts/export_seed_sql.py` regenerate `supabase/seed.sql` from CSV

## Supabase schema

The main table is `public.lotto_results`.

Columns:

- `draw_date` draw date
- `first_prize` 6-digit first prize
- `front_3_digits` front 3-digit prizes as JSON array
- `back_3_digits` back 3-digit prizes as JSON array
- `last_2_digits` 2-digit prize
- `source_file` source CSV file name

## How to use with Supabase

1. Open your Supabase project SQL Editor.
2. Run `supabase/migrations/20260410_create_lotto_results.sql`
3. Run `supabase/seed.sql`

## Environment variables for future app work

Create a local `.env` file from `.env.example` when you start building the app:

```env
SUPABASE_URL=
SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=
```

## Regenerate seed file

```powershell
python .\scripts\export_seed_sql.py
```

