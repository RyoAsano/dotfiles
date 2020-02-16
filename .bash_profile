export TEXINPUTS=$TEXINPUTS:~/Library/tex/sty
export BSTINPUTS=$BSTINPUTS:~/Library/tex/bst
export BIBINPUTS=$BIBINPUTS:~/Library/tex/bib
# export TEXMF=$TEXMF:/System/Library/Fonts

export PATH="/usr/local/bin:$PATH"

export GTEST_ROOT=~/googletest
export GTEST_INCLUDEDIR=$GTEST_ROOT/googletest/include
export GMOCK_INCLUDEDIR=$GTEST_ROOT/googlemock/include
export GMOCK_LIBDIR=$GTEST_ROOT/mybuild/lib
export GTEST_LIBDIR=$GTEST_ROOT/mybuild/lib

git config --global core.editor vi
source ~/.bashrc

