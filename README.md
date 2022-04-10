# dotfiles

This repository has a nosfill's dotfiles and Makefile that set dotfiles.

## Install

```bash
bash -c "source $(curl -fsSL https://raw.githubusercontent.com/nosfill/dotfiles/main/install.sh)"
```

## Test

To test makefile, use test environment.

```bash
docker-compose up -d
docker-compose exec test bash
```

For retry

```bash
docker-compose down && docker-compose up -d && docker-compose exec test bash
```