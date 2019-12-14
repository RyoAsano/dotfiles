#alias emacs="/usr/local/Cellar/emacs/26.1_1/Emacs.app/Contents/MacOS/Emacs"


#export PS1="\t \W\n"
#Here, \e[44;0;33m is specifier for background color, bold or normal or underlined text, foreground color.
export PS1="\e[;0;36m[\t \u@\H \w]\e[m\n"
#enable CLI to use color
export CLICOLOR=1
#set color mapping (go on web for which maps to which)
export LSCOLORS=cxfxexdxbxaghdabagacad
# G for distinguishing things by color, F for distinguishing things by the tails, h for showing size when -l
alias ls='ls -GFh'
