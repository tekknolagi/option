# Releasing a new version

```bash
# Make sure your changes are all on master and that you are on the latest
# commit on master locally.

# Set the appropriate version.
version=0.0.1 make release

# Now you need to go to https://github.com/tekknolagi/option/releases
# and find the latest .tar.gz from the release.
mkdir -p _build && cd _build
opam-publish prepare $THAT_URL
opam-publish submit option.0.0.1 # Or whatever version

# Now make sure that PR to opam-repository goes through and enjoy your release.
```
