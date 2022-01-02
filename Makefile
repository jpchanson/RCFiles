TO_LINK := .vim .vimrc .bashrc .gitconfig

all: submodules link

.PHONY: submodules
submodules:
	git submodule init
	git submodule update

.PHONY: link
link:
	ln -s $(TO_LINK) ../

.PHONY: clean
clean:
	git submodule deinit --all
	for file in $(TO_LINK); do unlink ../$$file; done
