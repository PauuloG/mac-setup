# Zsh

We'll install `zsh` for all the features offered by `oh-my-zsh`. The installation and usage is really intuitive. We will also create the file `env.sh`, it is a config file we maintain so as to not pollute the `~/.zshrc` too much. `env.sh` holds aliases, exports, path changes etc. and you can find it at the bottom of this page.

## Zsh

If you're still in the default shell, change default shell to zsh manually:

```
$ chsh -s /usr/local/bin/zsh
```

Add plugins \(they are all optional but recommended\) to Oh My Zsh and use theme by editing `~/.zshrc` and adding:

```
ZSH_THEME=pygmalion
plugins=(git colored-man colorize github jira vagrant virtualenv pip python brew osx zsh-syntax-highlighting)
```







