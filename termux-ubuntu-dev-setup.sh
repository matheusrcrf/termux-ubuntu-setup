#!/data/data/com.termux/files/usr/bin/bash

termux-ubuntu-dev-setup.sh

Instala Ubuntu no Termux com usuário "dev" + Zsh + Starship + Vim + Plugins

set -e

1. Instalar dependências no Termux

pkg update && pkg upgrade -y pkg install proot-distro zsh curl git vim -y

2. Instalar Ubuntu (24.04)

proot-distro install ubuntu

3. Criar usuário dev com zsh e sudo

proot-distro login ubuntu -- bash -c ' apt update && apt install -y zsh sudo curl git vim useradd -m -s /usr/bin/zsh dev echo "dev:dev" | chpasswd usermod -aG sudo dev echo "exec zsh" >> /home/dev/.bashrc '

4. Configurar ambiente para o usuário dev

proot-distro login ubuntu --user dev -- bash -c '

Instalar Starship

curl -sS https://starship.rs/install.sh | sh -s -- -y

Instalar plugins Zsh

mkdir -p ~/.zsh git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting

Criar ~/.zshrc limpo e funcional

cat > ~/.zshrc <<EOF export PATH="$HOME/.cargo/bin:$PATH" eval "\$(starship init zsh)"

Plugins Zsh

[[ -f $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh [[ -f $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

Aliases

alias ..="cd .." alias ll="ls -la" alias cls="clear" alias vrc="vim ~/.vimrc"

Histórico

HISTFILE=$HOME/.zsh_history HISTSIZE=5000 SAVEHIST=5000 setopt inc_append_history setopt share_history EOF

Criar ~/.vimrc básico

cat > ~/.vimrc <<EOF syntax on set number set relativenumber set tabstop=2 set shiftwidth=2 set expandtab set cursorline set background=dark colorscheme desert EOF '

clear echo -e "\e[1;32m" echo "┌──────────────────────────────────────────────┐" echo "│ ✅ INSTALAÇÃO FINALIZADA COM SUCESSO         │" echo "├──────────────────────────────────────────────┤" echo "│ Usuário: dev | Senha: dev                     │" echo "│ Zsh com Starship + Plugins + Vim prontos!     │" echo "└──────────────────────────────────────────────┘" echo -e "\e[0m" echo "\nPara iniciar o ambiente, execute:" echo "proot-distro login ubuntu --user dev"


