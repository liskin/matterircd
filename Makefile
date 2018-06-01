export GOPATH
GOPATH=$(CURDIR)/gopath
GO=go

.PHONY: matterircd
matterircd: | $(GOPATH)
	git archive --prefix=src/github.com/42wim/matterircd/ HEAD \
		| tar -x -C $(GOPATH)
	cd $(GOPATH)/src/github.com/42wim/matterircd/ \
		&& $(GO) get \
		&& $(GO) build -x -o $(CURDIR)/matterircd

install:
	install -m 0755 -D -t $(DESTDIR)/usr/bin matterircd

$(GOPATH):
	mkdir -p $@
