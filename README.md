dotfiles
========

### Mac setup

Installs

- Google Chrome
- zsh with oh-my-zsh
- Dropbox, vlc, caffeine, simplenote, the-unarchiver

```
$ ansible-playbook mac.yml
```

### (n)vim setup

Installs vim & nvim from homebrew and symlinks config files.

```
$ ansible-playbook vim.yml
```

## Keyboard shortcuts quick ref

### Slack

- Jump to all Unreads - ⌘ + ⇧ + A
- Toggle left sidebar - ⌘ + ⇧ + D
- Toggle right sidebar - ⌘ + .
- Toggle mute on a huddle - ⌘ + ⇧ + Space
- Go back in history - ⌘ + [
- Go forwards in history - ⌘ + ]

### Apple Mail
|||
|---|---|
| Fetch new mails(refresh) | ⌘ + ⇧ + N |
| Mark read / unread | ⌘ + ⇧ + U |
| Archive | ⌘ + ⌃ + A |
| Toggle sidebar | ⌘ + ⌃ + S |

## Terminal

- clear current line:
    - Ctrl+A Ctrl+K
    - Ctrl+E Ctrl+U
    - Ctrl+C
- clear backwards till beginning of line: Ctrl+U
- clear forwards till end of line: Ctrl+K
- Jump to beginning of line: Ctrl+A | fn + ←
- Jump to end of line: Ctrl+E | fn + →
- Jump word forward: Esc f or Ctrl-[ f
- Jump word backward: Esc b or Ctrl-[ b
- kill-word: Esc D
- kill-word-backword: Ctrl+W

### Unicode values (Ctl V + unicode)
- ⇧ - U+21E7
- ⌃ - U+2303
- ⎈ - U+2388
- ⌥ - U+2325
- ⌘ - U+2318

## Misc
