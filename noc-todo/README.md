# Noctalia Add-On for todo.txt (UNOFFICIAL)

This is a "learning experience" type of project. The gist of it is to provide
an add-on to **Noctalia Shell** that displays the current number of open tasks
from your local **todo.txt-cli** in a bar widget and provide a panel that
displays the current list of tasks on demand.

> [!NOTE]
> **Use at own risk** - There is and will not be any support outside
> the instructions in this Readme file.

## Plugin

| Field           | Value                            |
|-----------------|----------------------------------|
| ID              | `fil-at-werma/noc-todo`          |
| Entries         | Bar widget:`tasks`; panel:`list` |
| Launcher Prefix | -                                |

## Prerequisites

The panel widget relies on the existence and the output of an installation
of the `todo.txt-cli` tool on the `$PATH`. **Make sure it is installed and
working before you proceed to install this plugin!**

## Installation

> [!IMPORTANT]
> **This plugin is neither in official nor community add-on sources.**

### Add the Plugin Source

1. Go to **Settings ⟶ Plugins ⟶ Sources**, click `Add Source`. Keep `Git` for Type.
1. Pick a reasonable Package ID
1. For `Location` enter: `https://github.com/fil-at-werma/fils-noctalia-plugins`
 
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
