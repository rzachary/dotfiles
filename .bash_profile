# Add `~/bin` to the `$PATH`
export PATH=$PATH:/Users/rzachary/tootls/google-cloud-sdk/
# export PATH=/usr/local/opt/python@3.8/bin/:$PATH
# export PATH=/usr/local/opt/ruby/bin/:$PATH
# export PATH=/usr/local/share/python:$PATH
export PATH=/usr/local/bin/:$PATH
export PATH=~/.local/bin/scripts:~/.local/bin:$PATH

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
# I moved these over to the .zshrc file because I am using zshell
# shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
# I moved these over to the .zshrc file because I am using zshell
# shopt -s histappend;

# Autocorrect typos in path names when using `cd`
# I moved these over to the .zshrc file because I am using zshell
# shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
#for option in autocd globstar; do
#	shopt -s "$option" 2> /dev/null;
#done;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
 source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
 source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rzachary/tools/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rzachary/tools/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rzachary/tools/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rzachary/tools/google-cloud-sdk/completion.zsh.inc'; fi

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;
