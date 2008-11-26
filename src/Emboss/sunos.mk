OSNAME = solaris

build:
	gunzip -c $(NAME)-$(VERSION).tar.gz | $(TAR) -xf -
	( \
		cd $(NAME)-$(VERSION); \
		./configure --prefix=$(PKGROOT) \
			--enable-64 CFLAGS="-D_POSIX_C_SOURCE" \
			--with-java=$(JAVA_HOME)/include \
			--with-javaos=$(JAVA_HOME)/include/$(OSNAME)/; \
		$(MAKE); \
	)
