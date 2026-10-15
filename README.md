# Catálogo de miniaturas

Aplicação Ruby on Rails para organizar uma coleção de miniaturas por categoria, fabricante, universo, escala e progresso de pintura. Interface em português e banco SQLite.

## Funcionalidades

- Listagem, busca e filtros por categoria e pintura.
- Cadastro, edição e remoção de miniaturas e categorias.
- Contagem da coleção e quantidades por modelo.
- Edição protegida por HTTP Basic com credenciais fornecidas pelo ambiente.
- Dados fictícios para explorar o catálogo.

## Executar localmente

Requisitos: Ruby 3.2 ou superior (linha 3.x), Bundler e suporte a SQLite. A dependência principal é Rails 8.1.4 ou patch compatível.

```sh
bundle install
bundle exec rails db:prepare
bundle exec rails db:seed
bundle exec rails server
```

Abra http://localhost:3000. A consulta funciona sem login. Para habilitar a edição, defina `CATALOG_EDITOR_USER` e `CATALOG_EDITOR_PASSWORD` no ambiente do processo antes de iniciar o servidor. Use uma senha própria; nenhuma credencial é incluída no repositório. `.env.example` documenta os nomes e não é carregado automaticamente.

O banco local fica em `storage/development.sqlite3` e não é versionado. Categorias com miniaturas vinculadas não podem ser removidas. A lista apresenta no máximo 100 resultados por consulta.

## Estrutura

- `app/models`: Category e Miniature com validações.
- `app/controllers`: operações e filtros com parâmetros permitidos.
- `app/views`: telas Rails com formulários e proteção CSRF.
- `db/migrate`: criação das tabelas e restrições.
- `db/seeds.rb`: registros fictícios de demonstração.

## Estado desta entrega

Código inicial preparado sem execução local, pois Ruby e Bundler não estão instalados no ambiente de autoria. Nenhum teste foi adicionado ou executado. Após instalar as dependências, versione o `Gemfile.lock` produzido para registrar as versões resolvidas.

Este projeto é uma base de laboratório. Antes de hospedar, configure HTTPS, `SECRET_KEY_BASE`, `APP_HOSTS`, credenciais de edição e persistência do banco. Não use o servidor de desenvolvimento como hospedagem pública. Não foram adicionados workflows nem alteradas configurações de segurança da organização.

Referência: [Guia oficial do Rails 8.1](https://guides.rubyonrails.org/v8.1/getting_started.html).
