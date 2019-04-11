.PHONY: bin dotfiles src

all: bin dotfiles src

bin:
	# Move Binary Files to /usr/local/bin
	for file in $(shell find $(CURDIR)/bin); do \
		f=$$(basename $$file); \
		sudo ln -sf $$file /usr/local/bin/$$f; \
	done

src:
	# Move src Files to /usr/local/src
	for file in $(shell find $(CURDIR)/src); do \
		f=$$(basename $$file); \
		sudo ln -sf $$file /usr/local/src/$$f; \
	done

dotfiles:
	# add aliases for dotfiles
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git" -not -name ".gnupg"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done; \
