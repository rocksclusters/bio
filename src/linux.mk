SRCDIRS = `find * -prune -type d \
	  ! -name CVS ! -name .	`

pkg rpm::
	cp -rf ../../base/src/foundation-python-extras ./
