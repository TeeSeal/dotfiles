mise activate fish | source

if status is-interactive
    starship init fish | source

    fish_vi_key_bindings
    set fish_cursor_default block blink
    set fish_cursor_insert line blink
    set fish_cursor_visual block blink
    set fish_cursor_replace underscore blink
    set fish_cursor_unknown block blink
end
