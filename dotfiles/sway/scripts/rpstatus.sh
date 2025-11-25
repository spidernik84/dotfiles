curl -s 'https://api.radioparadise.com/api/nowplaying_list_v2022' | jq -r ".song[0] | \"Artist: \(.artist), Title: \(.title), Year: \(.year)\""
