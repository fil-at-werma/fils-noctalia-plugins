# Internet Time Bar Widget For Noctalia Shell

This is a "learning experience" type of project. The gist of it is to provide
an add-on to Noctalia Shell that displays the current "Internet Time" in a bar
widget.

> :warning: **Use at own risk** - There is and will not be any support outside
> the instructions in this Readme file.

## Installation

> :warning: **This plugin is neither in official nor community add-on sources.**

### Download

Choose one of these methods:

#### Copy or link into plugin path
 
1. Checkout or download the git repository. For example to `$HOME/GitHub/fil-at-werma/internet-time/`
1. Either **move** or **copy** the contents of that path to `$HOME/.local/share/noctalia/plugins/internet-time/`  
   OR link to it:
```bash
cd $HOME/.local/share/noctalia/plugins
ln -s ~/GitHub/fil-at-werma/internet-time
cd -
```

#### Setup a local plugin source

1. Make a local dir, for example `$HOME/dev/mynoctaliapluginsource/`
1. Add that path in **Settings ⟶ Plugins ⟶ Sources ⟶ Add Source** as a Path source
1. Checkout the git repo there (`$HOME/dev/mynoctaliapluginsource/internet-time`)  
   or link it to there (see above).

> :bulb: _May_ need a noctalia restart.
 
### Enable and add Plugin

1. Enable the plugin: `noctalia msg plugins enable fil-at-werma/internet-time`  
   or via **Settings ⟶ Plugins ⟶ Internet Time**
1. Add it to your bar in `~/.config/noctalia/config.toml`  
   or via **Settings ⟶ Bar ⟶ Add widget**

## Version 0.9.0

Initial Version - Just shows the current Internet Time (a.k.a Swatch .Beats) in
full beats, only - no fractions. Updates every second.

No settings whatsoever (for now).
