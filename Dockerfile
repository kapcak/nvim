FROM alpine:latest
RUN apk add python3 py3-pip curl git neovim && \
ln -s python3 /usr/bin/python && \
pip install pynvim python-lsp-server[all] && \
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' && \
mkdir -p /root/.config/nvim
COPY init.vim /root/.config/nvim
RUN nvim +PlugInstall; nvim +PlugInstall || :
CMD nvim
