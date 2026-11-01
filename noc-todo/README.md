# Noctalia Add-On for todo.txt (UNOFFICIAL)

This is a "learning experience" type of project. The gist of it is to provide
an add-on to **Noctalia Shell** that displays the current number of open tasks
from your local **todo.txt-cli** in a bar widget and provide a panel that
displays the current list of tasks on demand.

> :warning: **Use at own risk** - There is and will not be any support outside
> the instructions in this Readme file.

## Plugin

| Field           | Value                            |
|-----------------|----------------------------------|
| ID              | `fil-at-werma/noc-todo`          |
| Entries         | Bar widget:`tasks`; panel:`list` |
| Launcher Prefix | -                                |

## Installation

> :warning: **This plugin is neither in official nor community add-on sources.**

### Download

Choose one of these methods:

#### Copy or link into plugin path
 
1. Checkout or download the git repository. For example to `$HOME/GitHub/fil-at-werma/noc-todo/`
1. Either **move** or **copy** the contents of that path to `$HOME/.local/share/noctalia/plugins/noc-todo/`  
   OR link to it:
```bash
cd $HOME/.local/share/noctalia/plugins
ln -s ~/GitHub/fil-at-werma/noc-todo
cd -
```

#### Setup a local plugin source

1. Make a local dir, for example `$HOME/dev/mynoctaliapluginsource/`
1. Add that path in **Settings ⟶ Plugins ⟶ Sources ⟶ Add Source** as a Path source
1. Checkout the git repo there (`$HOME/dev/mynoctaliapluginsource/noc-todo`)  
   or link it to there (see above).

> :bulb: _May_ need a noctalia restart.
 
### Enable and add Plugin

1. Enable the plugin: `noctalia msg plugins enable fil-at-werma/noc-todo`  
   or via **Settings ⟶ Plugins ⟶ Internet Time**
1. Add it to your bar in `~/.config/noctalia/config.toml`  
   or via **Settings ⟶ Bar ⟶ Add widget**

## Settings

| Setting     | Type     | Default                        | Description                    |
|-------------|----------|--------------------------------|--------------------------------|
| `todo_path` | `string` | `$HOME/OneDrive/todo/todo.txt` | The path to your todo.txt file |

## Dependencies

- [Noctalia Shell](https://noctalia.dev/)
- [todo.txt-cli](https://github.com/todotxt/todo.txt-cli)

## Features

- Bar - Widget shows number of tasks. Click opens the panel.
- Panel - Full scrollable list of pending + completed tasks.

## Known issues
- ~~Expects (hard-coded) the TODO_PATH at `$HOME/OneDrive/todo`~~ v0.9.1

## Planned Features (Not implented, yet)
- ~~Setting to adjust TODO_PATH (where `todo.txt`, `done.txt` reside)~~ v0.9.1

## Version 0.9.1 / 2026-11-01

### Added 

- Setting for TODO_PATH

## Version 0.9.0

- Initial Version.
