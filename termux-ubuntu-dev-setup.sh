#!/data/data/com.termux/files/usr/bin/bash
# termux-ubuntu-dev-setup.sh
# Instala Ubuntu no Termux com usuário "dev" + Zsh + Starship + Vim + Plugins

set -e

### 1. Instalar dependências no Termux
pkg update && pkg upgrade -y
pkg install proot-distro zsh curl git vim -y

### 2. Instalar Ubuntu (24.04)
proot-distro install ubuntu

### 3. Criar usuário dev com zsh e sudo
proot-distro login ubuntu -- bash -c '
  apt update && apt install -y zsh sudo curl git vim
  useradd -m -s /usr/bin/zsh dev
  echo "dev:dev" | chpasswd
  usermod -aG sudo dev
  echo "exec zsh" >> /home/dev/.bashrc
'

### 4. Configurar ambiente para o usuário dev
proot-distro login ubuntu --user dev -- bash -c '
  # Instalar Starship
  curl -sS https://starship.rs/install.sh | sh -s -- -y

  # Criar ~/.zshrc
  cat > ~/.zshrc <<EOF
export PATH=\"\$HOME/.cargo/bin:\$PATH\"
eval \"\\$(starship init zsh)\"
alias ll=\"ls -la\"
alias ..=\"cd ..\"
alias cls=\"clear\"

# Plugins Zsh
source \$HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source \$HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
EOF

  # Criar ~/.vimrc
  cat > ~/.vimrc <<EOF
syntax on
set number
set relativenumber
set tabstop=2
set shiftwidth=2
set expandtab
set cursorline
set background=dark
colorscheme desert
EOF

  # Instalar plugins Zsh
  mkdir -p ~/.zsh/plugins
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/plugins/zsh-syntax-highlighting
'

clear
echo "\n✅ Finalizado! Agora execute:"
echo "proot-distro login ubuntu --user dev"
echo "Usuário: dev | Senha: dev"
echo "Zsh com Starship e plugins + Vim já configurados."
