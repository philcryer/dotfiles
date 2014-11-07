# fak3r-zsh.theme - MIT Lic 2014
# for http://ohmyz.sh/

# Some symbols you could use:
# ☀ ✹ ☄ ♆ ♀ ♁ ♐ ♇ ♈ ♉ ♚ ♛ ♜ ♝ ♞ ♟ ♠ ♣ ⚢ ⚲ ⚳ ⚴ ⚥ ⚤ ⚦ ⚒ ⚑ ⚐ ♺ ♻ ♼ ☰ ☱ ☲ ☳ ☴ ☵ ☶ ☷
# ✡ ✔ ✖ ✚ ✱ ✤ ✦ ❤ ➜ ➟ ➼ ✂ ✎ ✐ ⨀ ⨁ ⨂ ⨍ ⨎ ⨏ ⨷ ⩚ ⩛ ⩡ ⩱ ⩲ ⩵  ⩶ ⨠
# ⬅ ⬆ ⬇ ⬈ ⬉ ⬊ ⬋ ⬒ ⬓ ⬔ ⬕ ⬖ ⬗ ⬘ ⬙ ⬟  ⬤ 〒 ǀ ǁ ǂ ĭ Ť Ŧ

# define your box name at ~/.box_name if you want something special
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

#local rvm_ruby='‹$(rvm-prompt i v g)›%{$reset_color%}'   # no rvm for me
local current_dir='${PWD/#$HOME/~}'
local git_info='$(git_prompt_info)'
grey='\e[0;90m'

#ZSH_THEME_GIT_PROMPT_PREFIX=" ☁  %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_PREFIX=" ☁  %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ☂" # Ⓓ
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭" # ⓣ
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ☀" # Ⓞ
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ☀" # Ⓞ

kkZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✚" # ⓐ ⑃
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ⚡"  # ⓜ ⑁
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖" # ⓧ ⑂
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➜" # ⓡ ⑄
kZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ♒" # ⓤ ⑊
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[blue]%} 𝝙"

function prompt_char {
	if [ $UID -eq 0 ]; then echo "%{$fg[red]%}#%{$reset_color%}"; else echo $; fi
}

PROMPT="%{$terminfo[bold]$FG[033]%}${current_dir}%{$reset_color%}$(git_prompt_info)${git_info}
⚡ %{$fg[green]%} %{$reset_color%}"
RPROMPT='%{$FG[239]%}%D | %*%{$reset_color%}'
