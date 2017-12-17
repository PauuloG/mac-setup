# iTerm2

## Customization

### Colors and Font Settings

Here are some suggested settings you can change or set, **they are all optional**.

* Set hotkey to open and close the terminal to `command + option + i`
* Go to profiles -&gt; Default -&gt; Terminal -&gt; Check silence bell to disable the terminal session from making any sound
* Download [one of iTerm2 color schemes](https://github.com/mbadolato/iTerm2-Color-Schemes/tree/master/schemes) from here. And then set these to your default profile colors.
* Change the cursor text and cursor color to yellow make it more visible
* Change the font to 14pt Source Code Pro Lite. Source Code Pro can be downloaded from [here](https://github.com/adobe-fonts/source-code-pro/releases/latest).

### MacOS shortcuts ⌘←, ⌘→ and ⌥←, ⌥→

You might be familiar with shortcuts to skip a word \(⌥\) or go to start/end of the line \(⌘\), iTerm is not set up to work with these shortcuts by default.

Open up iTerm2 preferences -&gt; Profiles -&gt; Keys -&gt; Click on + icon \(add new Keyboard shortcut\).

| shortcut | action | send |
| :---: | :---: | :---: |
| ⌘← | SEND ESC SEQ | OH |
| ⌘→ | SEND ESC SEQ | OF |
| ⌥← | SEND ESC SEQ | b |
| ⌥→ | SEND ESC SEQ | f |
| ⌥+delete | SEND HEX CODE | 0x1B 0x08 |



