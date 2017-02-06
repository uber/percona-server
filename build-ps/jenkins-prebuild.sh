rm -f ../percona-server-5.6*
#Export git revision for debian/rules
export REVISION=$(git rev-parse --short HEAD)
#Prepare INFO_SRC for copying to source tarball
cmake . && make INFO_SRC
git add -f Docs/INFO_SRC
git commit -m "commit INFO_SRC"
git clean -dxf
git submodule foreach git clean -dxf
#Copy debian scripts to proper location
cp -ap build-ps/debian debian
