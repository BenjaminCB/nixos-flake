#!/bin/sh

languages=`echo "haskell latex c csharp js nodejs" | tr ' ' '\n'`
core_utils=`echo "" | tr ' ' '\n'`

selected=`printf "$languages\ncore_utils" | fzf`
read -p "query: " query

if printf $languages | grep -qs $selected; then
    curl cht.sh/$selected/`echo $query | tr ' ' '+'`
else
    curl cht.sh/$selected-$query
fi
