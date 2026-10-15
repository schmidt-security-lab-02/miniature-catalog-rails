# Miniature Catalog

A Ruby on Rails application for organizing a miniature collection by category, manufacturer, universe, scale, and painting progress. The interface and sample data are in English. Data is stored in SQLite.

## Features

- Browse and search miniatures; filter by category and painting status.
- Create, edit, and delete miniatures and categories.
- Track collection totals and quantities for each model.
- Protect editing with HTTP Basic credentials supplied through the environment.
- Explore the catalog using fictional sample records.

## Run locally

Requirements: Ruby 3.2 or newer in the 3.x series, Bundler, and SQLite support. The main dependency is Rails 8.1.4 or a compatible patch release.

```sh
bundle install
bundle exec rails db:prepare
bundle exec rails db:seed
bundle exec rails server
```

Open http://localhost:3000. Browsing does not require signing in. To enable editing, set `CATALOG_EDITOR_USER` and `CATALOG_EDITOR_PASSWORD` in the server process environment before starting it. Choose your own password; no credentials are included in this repository. `.env.example` documents the variable names and is not loaded automatically.

The local database is stored in `storage/development.sqlite3` and is not tracked by Git. Categories with associated miniatures cannot be deleted. Each search displays up to 100 results.

## Project structure

- `app/models`: Category and Miniature models with validation.
- `app/controllers`: operations and filters using permitted parameters.
- `app/views`: Rails pages and forms with CSRF protection.
- `db/migrate`: database tables and constraints.
- `db/seeds.rb`: fictional demonstration records.

## Delivery status

This initial code has not been run locally because Ruby and Bundler are not installed in the authoring environment. No tests have been added or run. After installing dependencies, commit the generated `Gemfile.lock` to record the resolved versions.

This is a laboratory application. Before hosting it, configure HTTPS, `SECRET_KEY_BASE`, `APP_HOSTS`, editor credentials, and persistent database storage. Do not expose the development server as a public hosting service. No workflows were added and no organization security settings were changed.

Reference: [Official Rails 8.1 guide](https://guides.rubyonrails.org/v8.1/getting_started.html).
