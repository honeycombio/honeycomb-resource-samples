import json
import os
import requests
import time
from dotenv import load_dotenv

def create_query() -> requests.Response:
    query_data = json.dumps({
        "breakdowns": ["name"],
        "calculations": [{"op": "COUNT"}],
        "limit": 5,
        "time_range": 50
    })
    query_request = requests.post(
        # url="https://api.honeycomb.io/1/queries/<dataset>",
        url="https://api.honeycomb.io/1/queries/__all__",
        headers={"X-Honeycomb-Team": os.environ.get("HONEYCOMB_API_KEY")},
        data=query_data,
    )
    return query_request

def run_query(response: requests.Response) -> requests.Response:
    query_id = json.loads(response.text)['id']
    query_id_payload = json.dumps({"query_id": query_id})
    run_query_request = requests.post(
        # url="https://api.honeycomb.io/1/query_results/<dataset>/<query-result-id>",
        url="https://api.honeycomb.io/1/query_results/__all__",
        headers={"X-Honeycomb-Team": os.environ.get("HONEYCOMB_API_KEY")},
        data=query_id_payload,
    )
    # Poll the API for query completion
    if json.loads(run_query_request.text)["complete"] is False:
        print("Query still running...")
        time.sleep(3)
        run_query(response)
    return run_query_request

def get_query_results(run_query_response: requests.Response) -> requests.Response:
    query_result_id = json.loads(run_query_response.text)['id']
    query_result_request = requests.get(
        url=f"https://api.honeycomb.io/1/query_results/__all__/{query_result_id}",
        headers={"X-Honeycomb-Team": os.environ.get("HONEYCOMB_API_KEY")}
    )
    return query_result_request


def main():
    load_dotenv(".env")
    create_query_response = create_query()
    print(f"Create Query Response:{json.loads(create_query_response.text)}\n{json.loads(create_query_response.text)['id']}\n")

    run_query_response = run_query(create_query_response)
    print(f"Response:{json.loads(run_query_response.text)}\n{json.loads(run_query_response.text)['id']}\n")

    query_results = get_query_results(run_query_response)
    print(f"Response:{json.loads(query_results.text)}\n{json.loads(query_results.text)['id']}\n")


if __name__ == "__main__":
    main()