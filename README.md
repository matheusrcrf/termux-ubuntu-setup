# Termux Ubuntu Dev Setup

Instalação automatizada do Ubuntu no Termux com ambiente de desenvolvimento completo:

* Usuário `dev` com senha `dev`
* Shell Zsh como padrão
* Prompt com **Starship**
* **Vim** com configuração básica
* Plugins:

  * `zsh-autosuggestions`
  * `zsh-syntax-highlighting`

---

## ✅ Requisitos

* Termux (recomendo instalar via [F-Droid](https://f-droid.org/packages/com.termux/))

---

## 🚀 Instalação (passo a passo)

```bash
# 1. Atualize o Termux e instale dependências
pkg update && pkg upgrade -y
pkg install proot-distro curl git zsh vim -y

# 2. Baixe o script
curl -fsSL https://raw.githubusercontent.com/matheusrcrf/termux-ubuntu-setup/refs/heads/main/termux-ubuntu-dev-setup.sh

# 3. Dê permissão e execute
chmod +x termux-ubuntu-dev-setup.sh
./termux-ubuntu-dev-setup.sh
```

---

## 💻 Acessando o ambiente

Após a instalação, inicie o Ubuntu com:

```bash
proot-distro login ubuntu --user dev
```

> Usuário: `dev`
> Senha: `dev`

---

## 🛠️ O que está incluso

* **Zsh** com prompt moderno via Starship
* Plugins:

  * 🔁 Auto-sugestões
  * 🎈 Syntax highlighting
* **Vim** com `.vimrc` pronto:

  * Tema `desert`
  * Numeração relativa
  * Indentação com espaços
  * Cursor destacado

---

## 📁 Estrutura após execução

```bash
~/.zshrc          # Zsh configurado
~/.vimrc          # Editor Vim pronto pra codar
~/.zsh/plugins/   # Plugins clonados
```

---

## 🪜 Reset ou reinstalação

Se quiser resetar tudo:

```bash
proot-distro remove ubuntu
proot-distro install ubuntu
./termux-ubuntu-dev-setup.sh
```
