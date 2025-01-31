import requests
import sys

url = f"https://portal.qtorque.io/api/spaces/{sys.argv[1]}/environments/{sys.argv[2]}/labels"

payload = {
    "added_labels": [
        {
            "key": "status",
            "value": "Paused"
        }
    ],
    "removed_labels": [
        {
            "key": "status",
            "value": "Active"
        }
    ]
}
headers = {
    "Content-Type": "application/json",
    "Authorization": f"Bearer {sys.argv[3]}"
}

response = requests.put(url, json=payload, headers=headers)

if response.status_code != 200:
    sys.exit(1)