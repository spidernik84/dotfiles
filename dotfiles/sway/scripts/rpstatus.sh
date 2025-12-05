### Print the Radioparadise song currently playing on the main mix channel, plus show the cover in kitty.
### TODO: use single curl call
curl -s 'https://api.radioparadise.com/api/nowplaying_list_v2022' | jq -r ".song[0] | \"Artist: \(.artist), Title: \(.title), Year: \(.year)\""
kitten icat --align left https://img.radioparadise.com/$(curl -s 'https://api.radioparadise.com/api/nowplaying_list_v2022' | jq -r ".song[0].cover")
