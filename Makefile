PELICAN=pelican
PELICANOPTS=

BASEDIR=$(CURDIR)
INPUTDIR=$(BASEDIR)/content
OUTPUTDIR=$(BASEDIR)/output
CONFFILE=$(BASEDIR)/pelicanconf.py
PUBLISHCONF=$(BASEDIR)/publishconf.py
DEPLOYREPOSITORY=blog

FTP_HOST=localhost
FTP_USER=anonymous
FTP_TARGET_DIR=/

SSH_HOST=localhost
SSH_PORT=22
SSH_USER=root
SSH_TARGET_DIR=/var/www

DROPBOX_DIR=~/Dropbox/Public/

help:
	@echo 'Makefile for a pelican Web site                                        '
	@echo '                                                                       '
	@echo 'Usage:                                                                 '
	@echo '   make html                        (re)generate the web site          '
	@echo '   make serve                       serve site at http://localhost:8000'
	@echo '   make deploy                      publish the made html via gh-pages  '
	@echo '   make storage                     just store made html @ github master'
	@echo '   make clean                       remove the generated files         '
	@echo '   make regenerate                  regenerate files upon modification '
	@echo '   make publish                     generate using production settings '
	@echo '   make serve                       serve site at http://localhost:8000'
	@echo '   make devserver                   start/restart develop_server.sh    '
	@echo '   ssh_upload                       upload the web site via SSH        '
	@echo '   rsync_upload                     upload the web site via rsync+ssh  '
	@echo '   dropbox_upload                   upload the web site via Dropbox    '
	@echo '   ftp_upload                       upload the web site via FTP        '
	@echo '   make deploy                      publish the web site via gh-pages  '
	@echo '   make storage                     make html and store @ github master'
	@echo '   github                           upload the web site via gh-pages; NEEDS GHP-IMPORT INSTALLED FIRS'
	@echo '                                                                       '


html: clean $(OUTPUTDIR)/index.html
	@echo 'Done'

$(OUTPUTDIR)/%.html:
	$(PELICAN) $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS)

clean:
	[ ! -d $(OUTPUTDIR) ] || find $(OUTPUTDIR) -mindepth 1 -delete

regenerate: clean
	$(PELICAN) -r $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS)

serve:
	cd $(OUTPUTDIR) && python -m SimpleHTTPServer

devserver:
	$(BASEDIR)/develop_server.sh restart

publish:
	$(PELICAN) $(INPUTDIR) -o $(OUTPUTDIR) -s $(PUBLISHCONF) $(PELICANOPTS)

ssh_upload: publish
	scp -P $(SSH_PORT) -r $(OUTPUTDIR)/* $(SSH_USER)@$(SSH_HOST):$(SSH_TARGET_DIR)

rsync_upload: publish
	rsync -e "ssh -p $(SSH_PORT)" -P -rvz --delete $(OUTPUTDIR) $(SSH_USER)@$(SSH_HOST):$(SSH_TARGET_DIR)

dropbox_upload: publish
	cp -r $(OUTPUTDIR)/* $(DROPBOX_DIR)

ftp_upload: publish
	lftp ftp://$(FTP_USER)@$(FTP_HOST) -e "mirror -R $(OUTPUTDIR) $(FTP_TARGET_DIR) ; quit"

deploy: publish
	if test -d _build; \
	then echo " (_build directory exists)"; \
	else mkdir _build; \
	fi
	if test -d _build/$(DEPLOYREPOSITORY); \
	then echo "  (repository directory exists)"; \
	else cd _build && git clone https://github.com/fomightez/$(DEPLOYREPOSITORY).git; \
	fi
	cd _build/$(DEPLOYREPOSITORY) && git pull
	rsync -r $(OUTPUTDIR)/* _build/$(DEPLOYREPOSITORY)/
	cd _build/$(DEPLOYREPOSITORY) && git add . && git commit -m "deploy made html to gh-pages"
	cd _build/$(DEPLOYREPOSITORY) && git push origin master
	cd _build/$(DEPLOYREPOSITORY) && git symbolic-ref "refs/heads/gh-pages" "refs/heads/master"
	cd _build/$(DEPLOYREPOSITORY) && git push --mirror


storage: publish
	if test -d _build; \
	then echo " (_build directory exists)"; \
	else mkdir _build; \
	fi
	if test -d _build/$(DEPLOYREPOSITORY); \
	then echo "  (repository directory exists)"; \
	else cd _build && git clone https://github.com/fomightez/$(DEPLOYREPOSITORY).git; \
	fi
	cd _build/$(DEPLOYREPOSITORY) && git pull
	rsync -r $(OUTPUTDIR)/* _build/$(DEPLOYREPOSITORY)/
	cd _build/$(DEPLOYREPOSITORY) && git add . && git commit -m "just storing made html on master at github, not deploying to gh-pages"
	cd _build/$(DEPLOYREPOSITORY) && git push origin master

github: publish
	ghp-import $(OUTPUTDIR)
	git push origin gh-pages

.PHONY: html help clean regenerate serve devserver publish ssh_upload rsync_upload dropbox_upload ftp_upload github
