# Calendário da Turma · Medicina

Site estático (GitHub Pages) com dados no Supabase.

- Alunos: só visualizam, sem login. Escolhem o grupo (A–H) no topo.
- Representantes: entram com e-mail e senha e editam tudo.
- Cores: aula azul, reposição verde, entrega amarelo, prova vermelho.
- Visões: mês, semana, dia e lista.

Sem configurar o Supabase, o site roda em **modo demo** (senha `demo`, dados só no navegador).

## 1. Supabase (banco + login)

1. Crie um projeto grátis em supabase.com.
2. SQL Editor → cole o conteúdo de `supabase.sql` → Run.
3. Authentication → Sign In / Providers → **desative "Allow new users to sign up"**.
   Assim ninguém cria conta sozinho.
4. Authentication → Users → **Add user**: crie o e-mail e a senha de cada representante.
5. Project Settings → API: copie a **Project URL** e a **anon public key**.
6. No `index.html`, preencha `SUPABASE_URL` e `SUPABASE_ANON_KEY`.

A anon key pode ficar pública. Quem protege a edição são as regras (RLS) do `supabase.sql`.

## 2. GitHub Pages (link público)

1. Crie um repositório público e suba `index.html` (e os outros arquivos).
2. Settings → Pages → Source: **Deploy from a branch** → `main` / root → Save.
3. Em 1–2 minutos o link fica em `https://SEU-USUARIO.github.io/NOME-DO-REPO/`.

## Personalizar

No topo do `index.html`:

```js
const NOME_TURMA = "Medicina · Turma";
const GRUPOS = ["A","B","C","D","E","F","G","H"];
```

## Dica para a grade

Ao criar uma **aula**, use "Repetir toda semana até" para lançar o semestre inteiro de uma vez.
