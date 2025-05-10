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

* Android 7+
* Termux instalado via [F-Droid](https://f-droid.org/packages/com.termux/) (recomendado)

---

## 🚀 Passo a passo

### 1. Instale o Termux da F-Droid

Evite o da Play Store — ele é obsoleto. Use o link:

> [https://f-droid.org/packages/com.termux/](https://f-droid.org/packages/com.termux/)

### 2. Atualize os pacotes do Termux

```bash
pkg update && pkg upgrade -y
```

### 3. Instale ferramentas base

```bash
pkg install proot-distro zsh curl git vim -y
```

### 4. Baixe e execute o script de setup

```bash
curl -fsSL https://raw.githubusercontent.com/matheusrcrf/termux-ubuntu-setup/main/termux-ubuntu-dev-setup.sh -o setup.sh
chmod +x setup.sh
./setup.sh
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
