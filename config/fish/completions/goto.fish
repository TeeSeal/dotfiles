# LICENSE: https://github.com/matusf/goto/blob/master/LICENSE

complete -c goto -x -n "test (count (commandline -opc)) -lt 2" -a "(__goto_find_aliases)"
complete -c goto -x -s u -l unregister -d "unregister an alias" -a "(__goto_find_aliases)"
complete -c goto -x -s x -l expand -d "expands an alias" -a "(__goto_find_aliases)"
complete -c goto -x -s r -l register -d "register an alias"
complete -c goto -x -s h -l help -d "prints help message"
complete -c goto -x -s l -l list -d "lists aliases"
complete -c goto -x -s c -l cleanup -d "deletes non existent directory aliases"
complete -c goto -x -s v -l version -d "prints version"
