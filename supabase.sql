-- Rode no Supabase: SQL Editor > New query > cole tudo > Run

create table if not exists public.eventos (
  id         bigint generated always as identity primary key,
  tipo       text not null check (tipo in ('aula','reposicao','entrega','prova')),
  titulo     text not null,
  inicio     timestamptz not null,
  fim        timestamptz,             -- vazio para "entrega" (só prazo)
  local      text default '',
  obs        text default '',
  grupos     text[] not null default '{Todos}',
  criado_em  timestamptz default now()
);

alter table public.eventos enable row level security;

-- Qualquer pessoa (aluno, sem login) pode VER
create policy "todos leem" on public.eventos
  for select using (true);

-- Só representante logado pode criar, editar e excluir
create policy "rep cria" on public.eventos
  for insert to authenticated with check (true);
create policy "rep edita" on public.eventos
  for update to authenticated using (true) with check (true);
create policy "rep exclui" on public.eventos
  for delete to authenticated using (true);

-- Atualização em tempo real para os alunos
alter publication supabase_realtime add table public.eventos;
