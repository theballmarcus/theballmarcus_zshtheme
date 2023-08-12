#autoload -Uz compdef

#alias cptheme='cp -r ~/github/ohmyzsh/plugins/nordvpn ~/.oh-my-zsh/plugins/'

#Nordvpn aliasses alphabetical order

alias nlc='nordvpn countries'
alias nlci='nordvpn cities'
alias noc='nordvpn connect'
alias nod='nordvpn disconnect'
alias nos='nordvpn status'
alias nov='nordvpn -v'
alias nol='output=$(nordvpn login); url="${output##*browser: }"; firefox $url;'

connected=0

if $(nordvpn status | grep -q -c "Status: Connected"); then
    nocity=$(nordvpn status | grep City | cut -d ':' -d ' ' -f 2)
    nocountry=$(nordvpn status | grep Country | cut -d ':' -d ' ' -f 2)
    nostatus=$(echo '\033[1;34mNordvpn:\033[0;32m Connected!')
    connected=$(printf '%s (%s, %s)\n' "$nostatus" "$nocity" "$nocountry")
else
    connected="\033[1;34mNordvpn:\033[0;31m Disconnected!"
fi

function nordvpn_info() {
    if $(nordvpn status | grep -q -c "Status: Connected"); then
        nocity=$(nordvpn status | grep City | cut -d ':' -d ' ' -f 2)
        nocountry=$(nordvpn status | grep Country | cut -d ':' -d ' ' -f 2)
        nostatus=$(echo '\033[1;34mNordvpn:\033[0;32m Connected!')
        connected=$(printf '%s (%s, %s)\n' "$nostatus" "$nocity" "$nocountry")
    else
        connected="\033[1;34mNordvpn:\033[0;31m Disconnected!"
    fi
    echo $connected
}

function loop_nordvpn_info() {
	while true
	do
		cinfo=$(nordvpn_info);
		echo -ne "\e[s\e[0;$((COLUMNS-$#cinfo))H$cinfo\e[u";
		sleep 1;
	done &;
}
