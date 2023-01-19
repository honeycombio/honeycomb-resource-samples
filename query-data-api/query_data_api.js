import "dotenv/config.js";

const apiKey = process.env.HONEYCOMB_API_KEY
const queryParams = {
    "breakdowns": ["name"],
    "calculations": [{"op": "COUNT"}],
    "limit": 10,
    "time_range": 3600
};

async function createQuery() {
    try {
        const response = await fetch("https://api.honeycomb.io/1/queries/__all__", {
            method: "POST",
            body: JSON.stringify(queryParams),
            headers: {"X-Honeycomb-Team": apiKey},
        });
        return await response.json();
    } catch (error) {
        console.log(error);
    }
}

async function runQuery(responseData) {
    try {
        const response = await fetch("https://api.honeycomb.io/1/query_results/__all__", {
            method: "POST",
            headers: {"X-Honeycomb-Team": apiKey},
            body: JSON.stringify( {"query_id": responseData.id} ),
        });
        // Poll the API for query completion
        let body = await response.json()
        if (body.complete == false) {
            console.log(`Query ${body.id} still running...`)
            await new Promise(r => setTimeout(r, 5000));
            runQuery(responseData)
        }
        return body;
    } catch (error) {
        console.log(error);
    }
}

async function getQueryResults(responseData) {
    try {
        const response = await fetch("https://api.honeycomb.io/1/query_results/__all__/" + responseData.id, {
            method: "GET",
            headers: {"X-Honeycomb-Team": apiKey}
        });
        return await response.json();
    } catch (error) {
        console.log(error);
    }
}

(async function main() {
    const firstResponse = await createQuery();
    console.log(firstResponse);
    const secondResponse = await runQuery(firstResponse);
    console.log(secondResponse);
    const thirdResponse = await getQueryResults(secondResponse);
    console.log(thirdResponse);
})();
