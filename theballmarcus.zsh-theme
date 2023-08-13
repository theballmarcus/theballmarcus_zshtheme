# Author: TheBallMarcus (Github: github.com/theballmarcus)


#date=date | awk '{print $4}'
 
failed=$'%{\e[1;31m%}✗'
prompt_gen() {
    echo '$(promt_code)'
}
prompt_user() {
    echo '%{\e[0;34m%}%B[%{\e[1;33m%}%n%{\e[1;34m%}@%{\e[0m%}%{\e[0;35m%}%m%{\e[0;34m%}%B]%b%{\e[0m%}'
}
prompt_dir() {
    echo ' %{\e[0;40m%}%{\e[32m%}%~%{\e[0;34m%} %{\e[0;34m%}-->%{\e[0;34m%}%B[%{\e[1;35m%}$%{\e[0;34m%}%B]%{\e[0m%}%b '
}
return_status() {
    echo "%(?..%{\e[1;31m%}✗ )"
}
# set the git_prompt_info text
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='$(prompt_user)$(prompt_dir)$(return_status)%b'
RPROMPT=$'%{\e[1;32m%}$(git_prompt_info)%{\e[0;0m%}[%*]'

TMOUT=1

TRAPALRM() {
    zle reset-prompt
}

# Works with the nordvpn plugin - it will display nordvpn status in right top corner. Comment out if you dont want it.
#loop_nordvpn_info;
