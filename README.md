service-configs
===============
[<img src="https://img.shields.io/docker/cloud/build/paperwork/service-configs.svg?style=for-the-badge"/>](https://hub.docker.com/r/paperwork/service-configs)

Paperwork Configs Service

## Prerequisites

### Docker

Get [Docker Desktop](https://www.docker.com/products/docker-desktop).

### Elixir/Erlang

On MacOS using [brew](https://brew.sh):

```bash
% brew install elixir
```

## Building

Fetching all dependencies:

```bash
% mix deps.get
```

Compiling:

```bash
% mix compile
```

## Running

First, we need a database. Let's run MongoDB on Docker:

```bash
% docker run -it --rm --name mongodb -p 27017:27017 mongo:latest
```

Then we can run this service from within this cloned repository:

```bash
% iex -S mix
```
