# iTerm2 profile

`Default.json` is the "Default" iTerm2 profile (font, colors, key mappings, and terminal settings) exported as an iTerm2 dynamic profile.

## install

1. Copy the file into iTerm2's dynamic profiles folder:
   ```sh
   cp iterm/Default.json "$HOME/Library/Application Support/iTerm2/DynamicProfiles/"
   ```
2. iTerm2 loads dynamic profiles automatically. Open **Settings → Profiles** to check that "Default" is listed.
3. To make it your default, select it and click **Other Actions → Set as Default**.

The font needs **JetBrainsMono Nerd Font Mono** installed. Get it from [nerdfonts.com](https://www.nerdfonts.com/).

Dynamic profiles keep the same GUID as the profile they came from, so importing this file over an existing "Default" profile replaces it rather than creating a duplicate.
