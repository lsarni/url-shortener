# URL Shortener

Small Rails project that given a url it returns a shorter version that redirects to the original one.

Deployed at [https://shrt-gf.herokuapp.com/](https://shrt-gf.herokuapp.com/)

## Prerequisites

- Ruby: 2.7.0
- PostgreSQL

## Install

### Clone the repository

```shell
git clone git@github.com:lsarni/url-shortener.git
cd shortener
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```shell
bundle install
```

### Set environment variables

Create a copy of `.env.exampl` and rename it to `.env`. 

Fill out any missing fields with the correct information.

### Initialize the database

```shell
rails db:create db:migrate
```

## Serve

```shell
rails s
```

## Test

```shell
rspec -fd
```
