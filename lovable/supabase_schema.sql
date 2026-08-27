create extension if not exists "uuid-ossp";

create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  full_name text,
  country text,
  curriculum text,
  grade text,
  track text,
  preferred_language text not null default 'ar' check (preferred_language in ('ar', 'en')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.study_sources (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  title text not null,
  source_type text not null check (source_type in ('text', 'pdf', 'image', 'html', 'youtube')),
  storage_path text,
  source_text text,
  source_url text,
  detected_language text check (detected_language in ('ar', 'en', 'mixed')),
  curriculum_profile text not null default 'auto',
  analysis jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create table public.quizzes (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  source_id uuid references public.study_sources(id) on delete set null,
  title text not null,
  language text not null default 'ar' check (language in ('ar', 'en', 'mixed')),
  difficulty text not null default 'mixed',
  exam_blueprint text not null default 'balanced',
  questions jsonb not null check (jsonb_typeof(questions) = 'array'),
  created_at timestamptz not null default now()
);

create table public.study_guides (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  source_id uuid references public.study_sources(id) on delete set null,
  title text not null,
  language text not null default 'ar' check (language in ('ar', 'en', 'mixed')),
  content jsonb not null,
  created_at timestamptz not null default now()
);

create table public.quiz_attempts (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  quiz_id uuid not null references public.quizzes(id) on delete cascade,
  answers jsonb not null default '{}'::jsonb,
  score numeric(5,2),
  completed_at timestamptz not null default now()
);

alter table public.profiles enable row level security;
alter table public.study_sources enable row level security;
alter table public.quizzes enable row level security;
alter table public.study_guides enable row level security;
alter table public.quiz_attempts enable row level security;

create policy "users_manage_own_profile" on public.profiles for all using (auth.uid() = id) with check (auth.uid() = id);
create policy "users_manage_own_sources" on public.study_sources for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "users_manage_own_quizzes" on public.quizzes for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "users_manage_own_guides" on public.study_guides for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "users_manage_own_attempts" on public.quiz_attempts for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
