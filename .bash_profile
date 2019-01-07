export TEXINPUTS=$TEXINPUTS:~/Library/tex/sty
export BSTINPUTS=$BSTINPUTS:~/Library/tex/bst
export BIBINPUTS=$BIBINPUTS:~/Library/tex/bib
# export TEXMF=$TEXMF:/System/Library/Fonts

# Setting PATH for Python 3.6
# The original version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# added by Anaconda3 4.3.1 installer
export PATH="/Users/Owner/anaconda/bin:$PATH"

export PATH="/usr/local/bin:$PATH"

# for llvm setting
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

export GTEST_ROOT=~/googletest
export GTEST_INCLUDEDIR=$GTEST_ROOT/googletest/include
export GMOCK_INCLUDEDIR=$GTEST_ROOT/googlemock/include
export GMOCK_LIBDIR=$GTEST_ROOT/mybuild/lib
export GTEST_LIBDIR=$GTEST_ROOT/mybuild/lib


source ~/.bashrc

