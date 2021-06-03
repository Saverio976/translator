MAIN_README=README.md
DEFAULT_README=./assets/DEFAULT_README.md

build_readme: introduction	doc	end

introduction:	clean
	cat $(DEFAULT_README) >> $(MAIN_README)
	echo  >> $(MAIN_README)

doc:
	v doc . -f md -o stdout >> $(MAIN_README)
	echo   >> $(MAIN_README)

end:
	echo '# tree' >> $(MAIN_README)
	echo  >> $(MAIN_README)
	tree -a -I .git\* -Q . >> $(MAIN_README)
	echo  >> $(MAIN_README)

clean:
	rm -f $(MAIN_README)
