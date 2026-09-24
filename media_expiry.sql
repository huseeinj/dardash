-- سياسة مدة الوسائط: 24 ساعة فقط.
-- يضاف created_at و expires_at لأي سجل وسائط في الرسائل والستوريات.

alter table if exists public.messages
  add column if not exists media_created_at timestamptz,
  add column if not exists media_expires_at timestamptz;

create table if not exists public.stories (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  media_url text not null,
  media_type text not null check (media_type in ('image','video')),
  created_at timestamptz not null default now(),
  expires_at timestamptz not null default (now() + interval '24 hours')
);

alter table public.stories enable row level security;

create policy if not exists "active stories readable"
on public.stories for select
to authenticated
using (expires_at > now());

create policy if not exists "own stories insert"
on public.stories for insert
to authenticated
with check (user_id = auth.uid());

-- شغّل هذه الدالة بجدولة Supabase Cron/pg_cron كل ساعة.
create or replace function public.cleanup_expired_media()
returns void
language plpgsql
security definer
as $$
begin
  delete from public.stories where expires_at <= now();

  -- حذف سجلات الرسائل التي تحتوي وسائط من قاعدة البيانات بعد انتهاء 24 ساعة.
  delete from public.messages
  where media_expires_at is not null
    and media_expires_at <= now();
end;
$$;

-- ملاحظة: حذف ملفات Storage نفسها يحتاج job/server function يستدعي
-- Storage API بعد معرفة path الخاص بالملف. لا يكفي حذف سجل قاعدة البيانات.
