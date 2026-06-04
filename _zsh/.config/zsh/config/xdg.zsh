###############
###   XDG   ###
###############


local core_dirs=(
    "$XDG_CONFIG_HOME"
    "$XDG_CACHE_HOME"
    "$XDG_DATA_HOME"
    "$XDG_STATE_HOME"
    
    "$ZSH_STATE"
    "$ZSH_CACHE"
)

for dir in ${core_dirs[@]}; do
    [[ ! -d "$dir" ]] && mkdir -p "$dir"
done

unset core_dirs

