# Internet Time Bar Widget For Noctalia Shell

**This is a "learning experience" type of project.** The of this plugin is to
provide an add-on to [Noctalia Shell](https://noctalia.dev) that displays the
current "Internet Time" in a bar widget.

> :warning: **Use at own risk** - There is and will not be any support outside
> the instructions in this Readme file.

## Installation

> :warning: **This plugin is neither in official nor community add-on sources.**

### Add the Plugin Source

1. Go to **Settings ⟶ Plugins ⟶ Sources**, click `Add Source`. Keep `Git` for Type.
1. Pick a reasonable Package ID
1. For `Location` enter: `https://github.com/fil-at-werma/fils-noctalia-plugins`

### Enable and add Plugin

1. Enable the plugin: `noctalia msg plugins enable fil-at-werma/internet-time`  
   or via **Settings ⟶ Plugins ⟶ Internet Time**
1. Add it to your bar in `~/.config/noctalia/config.toml`  
   or via **Settings ⟶ Bar ⟶ Add widget**

## Version 0.9.0

Initial Version - Just shows the current Internet Time (a.k.a Swatch .Beats) in
full beats, only - no fractions. Updates every second.

No settings whatsoever (for now).
