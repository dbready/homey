# Fish

## Virtual fish

1. Install virtualfish (`pipx install virtualfish`)
2. `vf install`
3. Add virtual environment to shell prompt. Run `funced --editor vim fish_prompt` and add following:
```
if set -q VIRTUAL_ENV
    echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
end
```
4. `funcsave fish_prompt`
