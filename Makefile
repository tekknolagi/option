build:
	ocamlbuild -package topkg pkg/build.native
	./build.native build

release:
	git add opam
	git commit -m "Version $(version)"
	git tag -a $(version) -m "Version $(version)."
	# Push first the objects, then the tag.
	git push "git@github.com:tekknolagi/option.git"
	git push "git@github.com:tekknolagi/option.git" tag $(version)

clean:
	ocamlbuild -clean

.PHONY: build release
