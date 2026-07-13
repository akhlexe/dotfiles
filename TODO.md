# tmux + WezTerm + WSL Review

Environment reviewed:

- Windows 10
- WezTerm on Windows
- WSL Ubuntu 24.04
- tmux 3.4 running inside WSL

Files reviewed:

- `tmux/.tmux.conf`
- `wezterm.lua`

Facts verified during review:

- Local `tmux-256color` terminfo exists on Ubuntu 24.04.
- The active outer terminal seen by tmux is `xterm-256color`.
- WezTerm has `enable_csi_u_key_encoding = true`.
- `tmux-yank` resolves to Windows `clip.exe` correctly under WSL.
- `lazygit` is installed, so the popup binding should work.

## Findings


### 2. High: `allow-passthrough on` reduces output and clipboard isolation

- `tmux/.tmux.conf:61` enables passthrough for visible panes.
- This allows programs to bypass tmux and write raw terminal escape sequences to WezTerm.

Impact:

- Helpful for some modern TUIs and graphics use cases.
- Also means a process can bypass tmux clipboard restrictions and send OSC 52 directly to the terminal.

Recommended action:

- Keep only if you intentionally need passthrough-dependent applications.
- Otherwise consider disabling it.

### 3. Medium: `prefix d` no longer detaches tmux

- `tmux/.tmux.conf:83` remaps `prefix d` to vertical split.

Impact:

- Standard `Ctrl-a d` detach muscle memory is broken.
- This can be confusing during debugging, SSH, and recovery scenarios.

Recommended action:

- Consider restoring a dedicated detach binding.

### 4. Medium: `tmux-256color` can break on remote hosts without terminfo

- `tmux/.tmux.conf:59` sets `default-terminal "tmux-256color"`.
- This is valid locally, but remote systems entered through SSH may not have that terminfo entry.

Impact:

- Full-screen apps on remote machines may fail with unknown terminal type errors.

Recommended action:

- Ensure remote machines have `tmux-256color` installed, or be ready to fall back when needed.

### 5. Medium: Kitty graphics in tmux are not guaranteed

- `wezterm.lua:79` enables kitty graphics.
- Inside tmux, applications see `TERM=tmux-256color`.

Impact:

- Some applications will disable graphics because they do not detect a Kitty-like terminal.
- Others may need tmux passthrough support to work correctly.

Recommended action:

- Expect mixed behavior for image-capable TUIs inside tmux.
- Validate each application individually.

### 6. Medium: tmux mouse mode takes over selection and scrollback

- `tmux/.tmux.conf:86` enables `mouse on`.

Impact:

- Native WezTerm selection and scrollback are intercepted by tmux.
- You will usually need `Shift` to bypass tmux mouse handling.

Recommended action:

- Keep this if pane resizing and mouse copy in tmux are important.
- Otherwise consider reducing reliance on tmux mouse mode.

### 7. Medium: Resurrect is manual, not automatic

- `tmux-resurrect` is installed.
- `tmux-continuum` is not installed.

Impact:

- WSL or Windows restarts will not continuously save or auto-restore tmux state.
- You must manually save and restore.

Useful bindings:

- `prefix Ctrl-s` saves
- `prefix Ctrl-r` restores

Recommended action:

- If you want persistent recovery after Windows/WSL restarts, consider adding `tmux-continuum`.

### 8. Low: `*:Tc` is too broad for mixed terminal usage

- `tmux/.tmux.conf:60` sets `terminal-overrides ",*:Tc"`.

Impact:

- Correct for WezTerm.
- Overstates truecolor support if you ever attach from a weaker terminal.

Recommended action:

- Narrow matching if you use multiple terminal emulators.

### 9. Low: scratch popup path quoting can fail

- `tmux/.tmux.conf:45` embeds `#{pane_current_path}` inside shell single quotes.

Impact:

- A path containing a single quote can break the `Alt-g` scratch popup command.

Recommended action:

- Rework quoting if you want this to be robust for all paths.

### 10. Low: Alt bindings may vary on Windows keyboard layouts

- Root bindings use `M-g`, `M-j`, `M-k`, `M-l`, `M-n`, `M-o`.

Impact:

- On some Windows layouts, especially those involving AltGr behavior, Meta bindings can be less predictable.
- Fixing extkeys should help, but may not eliminate layout-specific issues.

Recommended action:

- Validate these bindings on your actual keyboard layout.

## Likely First Fixes

- Fix `terminal-features` matching for WezTerm-on-WSL clients.
- Decide whether `allow-passthrough on` is worth the clipboard/security tradeoff.
- Restore an explicit detach key.
- Decide whether you want manual restore only or automatic session persistence.

## Suggested Validation After Changes

- Check active tmux client features with:

```bash
tmux list-clients -F 'term=#{client_termname} features=#{client_termfeatures}'
```

- Check tmux terminal info with:

```bash
tmux info | rg '^(Ms|Tc|RGB|extkeys|AX|U8):'
```

- Test inside tmux:

```text
Alt bindings
Ctrl/Alt Neovim mappings
Clipboard yank from copy-mode
Mouse selection with and without Shift
Scratch popup from normal project paths and unusual paths
```
