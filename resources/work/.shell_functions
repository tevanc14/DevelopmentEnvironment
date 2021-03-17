authToken() {
    TOKEN=$(curl --location \
                 --silent \
                 --request POST 'https://auth.dev.zillowhomeloans.net/api/v1/token/client-credentials' \
                 --header 'Content-Type: application/json' \
                 --header 'Authorization: Basic MG9hMm96N3p2eDI4NE50dkQzNTc6Y1ljekhKbnUtc1JLWXY4WTBURTFsdGRXaE1xQmV1Ukt6M2pBZkE5OA==' \
                 --data-raw '{
	"roles": [
                "zhl-service",
                "zhl-settings-reader",
                "zhl-loan-reader",
                "zhl-loan-writer",
                "zhl-entity-sync",
                "zhl-blend-activation-writer"
	],
        "identityProvider": "okta"
    }')

    echo ${TOKEN} | jq -r '.token' | pbcopy
}
