# Django REST Boilerplate

This app is a boilerplate for creating Django REST APIs. It uses **poetry** for dependency management, **PostgreSQL** for database, and a handful of useful Django app libraries.

---

## Getting Started

0. Install base requirements:

   - PostgreSQL
   - Poetry

1. `make install` to install dependencies

2. `make db` to create database

3. `make test` to run `black` formatter, `flake8` linter and unit tests

4. `make start` to run development server

## Swagger

This app uses [drf-yasg](https://github.com/axnsan12/drf-yasg) for creating a Swagger/OpenAPI 2.0 schema that describes the REST API and also provides a Web UI that allows you to interact with the API directly. This can be very helpful when testing endpoints.

The Web UI is available at `/swagger`, so if running locally you can access it at [http://localhost:8000/swagger/](http://localhost:8000/swagger/).

The `drf-yasg` app will auto-discover the REST endpoints that are built with the Django REST Framework. It works better when the views inherit from the generic DRF views. It's also important to specify a serializer on each Class Based View, because that's what's used for showing the inputs of each endpoint in the Swagger Web UI.
