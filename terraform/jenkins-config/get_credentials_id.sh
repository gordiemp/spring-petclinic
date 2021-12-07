#! /bin/bash

cookie_jar="$(mktemp)"
full_crumb=$(curl -u "$user:$password" --cookie-jar "$cookie_jar" $url/crumbIssuer/api/xml?xpath=concat\(//crumbRequestField,%22:%22,//crumb\))

curl -u "$user:$password" -X GET "$url/credentials/store/system/domain/_/api/json?tree=credentials[id]" \
     -H "$full_crumb" \
<<<<<<< HEAD
     --cookie $cookie_jar 
=======
     --cookie $cookie_jar 
>>>>>>> 6efa5fa3e2d1cad0a234ae0484939eb4e74023dc
