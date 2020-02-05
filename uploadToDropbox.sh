#!/usr/bin/sh


if [ $# -eq 2 ]
then

    curl -X POST https://content.dropboxapi.com/2/files/upload \
        --header "Authorization: Bearer ${DROPBOX_TOKEN_MAXIME}" \
        --header "Dropbox-API-Arg: {\"path\": \"/$1\",\"mode\": \"add\",\"autorename\": true,\"mute\": false,\"strict_conflict\": false}" \
        --header "Content-Type: application/octet-stream" \
        --data-binary @$2
else
    echo "invalid argument number. usage: ./uploadToDropbox.sh <name on dropbox cloud> <path to file to upload>"
fi

# curl https://api.dropbox.com/1/account/info -H "Authorization:Bearer hO6dzoLa1iAAAAAAAAAAKYayNH09spItbPtKmeQS78TqKf1-KwUFYVGzPJc87Big"
