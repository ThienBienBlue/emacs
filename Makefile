clean:
	find . -name 'session.*' -exec rm {} +
	rm -rf eln-cache
	rm -rf elpa
	rm -rf transient
	rm -rf snippets
	rm -rf auto-save-list
