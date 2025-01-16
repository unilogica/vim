Baixar o arquivo de configuracao do Vim / Neovim
```shell
curl -fLo ~/.vimrc https://raw.githubusercontent.com/unilogica/vim/refs/heads/main/.vimrc
```

Instalar o Neovim última versão
```shell
add-apt-repository ppa:neovim-ppa/unstable
apt install neovim
apt install ripgrep
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
apt install nodejs -y
apt install npm
```

Instalar o Plug e linkar a configuração do Vim com o Neovim
```shell
cd ~ 
mkdir -p .config/nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/.vimrc ~/.config/nvim/init.vim
```

Após abrir Vim e o Neovim e rodar o comando abaixo para instalar os plugins dependentes
```Neovim
:PlugInstall
```

Depois autenticar o Codeium

```Neovim
:Codeium auth
```

Abra a URL de autenticação segurando (**⌘**) CMD e clicando no link, após copie o token e cole no terminal do Neovim

![Auth Codeium](https://static.unilogica.com/auth-codeium.png)
