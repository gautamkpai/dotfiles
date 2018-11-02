dotfiles
========

### Mac setup

Installs

- Google Chrome, iterm2
- zsh with oh-my-zsh
- Dropbox, vlc, caffeine, simplenote, the-unarchiver

```
$ ansible-playbook mac.yml
```

### vim setup

Installs vim from homebrew and symlinks vim config files.

```
$ ansible-playbook vim.yml
```

