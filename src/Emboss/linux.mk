OSNAME = linux

build:
	gunzip -c $(NAME)-$(VERSION).tar.gz | $(TAR) -xf -
	( \
		cd $(NAME)-$(VERSION); \
		./configure --prefix=$(PKGROOT) \
			--with-java=$(JAVA_HOME)/include \
			--with-javaos=$(JAVA_HOME)/include/$(OSNAME)/; \
		$(MAKE); \
	)
