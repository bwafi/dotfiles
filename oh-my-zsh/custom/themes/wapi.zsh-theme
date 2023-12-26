# Copy and self modified from ys.zsh-theme, the one of default themes in master repository
# Clean, simple, compatible and meaningful.
# Tested on Linux, Unix and Windows under ANSI colors.
# It is recommended to use with a dark background and the font Inconsolata.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# VCS
YS_VCS_PROMPT_PREFIX1="%{$fg[cyan]%}%{$reset_color%} "
YS_VCS_PROMPT_PREFIX2="%{$fg[magenta]%}‹%{$fg[magenta]%}"
YS_VCS_PROMPT_SUFFIX="%{$reset_color%} "
YS_VCS_PROMPT_DIRTY="› %{$fg[red]%}✗"
YS_VCS_PROMPT_CLEAN="› %{$fg[green]%}✔︎"

# Git info.
local git_info='$(git_prompt_info)'   
local git_last_commit='$(git_prompt_short_sha)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}%{\x1b[3m%}on %{\x1b[0m%}${YS_VCS_PROMPT_PREFIX1}${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

# Git Status
# local git_status='$(git_prompt_status)'
# ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[red]%}✻%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[red]%}⇣%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[cyan]%}⇡%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[cyan]%}↬%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}∤%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}⎯%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}✒%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%}%{$reset_color%} "

# HG info
local hg_info='$(ys_hg_prompt_info)'
ys_hg_prompt_info() {
	# make sure this is a hg dir
	if [ -d '.hg' ]; then
		echo -n "${YS_VCS_PROMPT_PREFIX1}hg${YS_VCS_PROMPT_PREFIX2}"
		echo -n $(hg branch 2>/dev/null)
		if [ -n "$(hg status 2>/dev/null)" ]; then
			echo -n "$YS_VCS_PROMPT_DIRTY"
		else
			echo -n "$YS_VCS_PROMPT_CLEAN"
		fi
		echo -n "$YS_VCS_PROMPT_SUFFIX"
	fi
}

# Git metrics function
local git_metrics='$(git_metrics_info)'
git_metrics_info() {
    local git_diff=$(git diff --shortstat 2>/dev/null)
    local added_lines=$(echo "$git_diff" | awk '{print $4}')
    local deleted_lines=$(echo "$git_diff" | awk '{print $6}')

    local result=""
    if [ -n "$added_lines" ]; then
        result+="%{${fg[green]}%}+$added_lines%{$fg[yellow]%}"
    fi
    if [ -n "$deleted_lines" ]; then
        result+=" %{${fg[red]}%}-$deleted_lines%{$fg[yellow]%}"
    fi

    if [ -n "$result" ]; then
        echo " %{$fg[yellow]%}⦗$result⦘%{$reset_color%}"
    fi
}

# return error code
local return_code=" %(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# Prompt left
PROMPT="
%{$fg_bold[cyan]%}%n %{$fg_bold[white]%}$(tput sitm)in $(tput sgr0)%{$fg[blue]%}${current_dir}${git_metrics}
%(?.%{$fg[green]%}.%{$fg[red]%})❯ %{$reset_color%}"

# Prompt right
RPROMPT="${hg_info} ${git_info}%{$fg[yellow]%}${git_last_commit}${return_code}"

if [[ "$USER" == "root" ]]; then
PROMPT="
%{$fg[red]%}%* \
%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
%{$bg[yellow]%}%{$fg[cyan]%}%n%{$reset_color%} \
%{$fg[white]%}at \
%{$fg[green]%}$(box_name) \
%{$fg[white]%}in \
%{$terminfo[bold]$fg[yellow]%}[${current_dir}]%{$reset_color%}\
${hg_info}\
${git_info}
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"
fi
