package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"flag"
	"net/http"
	"time"
)

// RUN WITH API_KEY AS FLAG i.e.
// go run query_data_api.go -apiKey "HONEYCOMB_API_KEY"

type Params struct {
	apiKey string
	breakdowns []string
	calculations []map[string]string
	limit, time_range int
}

func main() {
	var apiKey = flag.String("apiKey", "", "APIKey")
    flag.Parse()

	queryParams := Params{
		apiKey: *apiKey,
		breakdowns: []string{"name"},
		calculations: []map[string]string{{"op": "COUNT"}},
		limit: 5,
		time_range: 50,
	}
	fmt.Print("Creating Query...\n")
	queryID := createQuery(queryParams)

	fmt.Print("Running Query...\n")
	queryResultID := runQuery(queryParams, queryID)

	fmt.Print("Getting Query Results...\n")
	getQueryResults(queryParams, queryResultID)
}

func createQuery(params Params) string {
	// Create request
	jsonParams, err := json.Marshal(params)
	if err != nil {
		panic(err)
	}
    createQueryReq, err := http.NewRequest(
		"POST", 
		"https://api.honeycomb.io/1/queries/__all__", 
		bytes.NewBuffer(jsonParams),
	)
    createQueryReq.Header.Set("Content-Type", "application/json")
    createQueryReq.Header.Set("X-Honeycomb-Team", params.apiKey)

    // Send the request & read response
    client := &http.Client{}
    resp, err := client.Do(createQueryReq)
    if err != nil {
		panic(err)
	}
    defer resp.Body.Close()
    body, err := ioutil.ReadAll(resp.Body)
    if err != nil {
		panic(err)
	}

	// Persist queryID to run query
	strBody := string(body[:])
	mapResponse := map[string]any{}
    if err := json.Unmarshal([]byte(strBody), &mapResponse); err != nil {
        panic(err)
    }
	queryID := mapResponse["id"]

	return queryID.(string)
}

func runQuery(params Params, queryID string) string {
	// Create request
	jsonQueryID, err := json.Marshal(map[string]string{"query_id": queryID})
	if err != nil {
		panic(err)
	}

    runQueryReq, err := http.NewRequest(
		"POST", 
		"https://api.honeycomb.io/1/query_results/__all__", 
		bytes.NewBuffer(jsonQueryID),
	)
    runQueryReq.Header.Set("Content-Type", "application/json")
    runQueryReq.Header.Set("X-Honeycomb-Team", params.apiKey)

	// Send the request & read response
	client := &http.Client{}
	resp, err := client.Do(runQueryReq)
	if err != nil {
		panic(err)
	}
	defer resp.Body.Close()
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		panic(err)
	}

	strBody := string(body[:])
	mapResponse := map[string]any{}
    if err := json.Unmarshal([]byte(strBody), &mapResponse); err != nil {
        panic(err)
    }
	queryResultID := mapResponse["id"]

	// Poll API for the Query Results
	if mapResponse["complete"] == false {
		fmt.Print("Query still running...")
		time.Sleep(3 * time.Second)
		runQuery(params, queryID)
	}

	return queryResultID.(string)
}

func getQueryResults(params Params, queryResultID string) {
	// Create request
	if _, err := json.Marshal(map[string]string{"query_id": queryResultID}); err != nil {
		panic(err)
	}
	url := "https://api.honeycomb.io/1/query_results/__all__/"

    runQueryResultReq, err := http.NewRequest(
		"GET", 
		url + queryResultID,
		nil,
	)
    runQueryResultReq.Header.Set("Content-Type", "application/json")
    runQueryResultReq.Header.Set("X-Honeycomb-Team", params.apiKey)

	// Send the request & read response
	client := &http.Client{}
	resp, err := client.Do(runQueryResultReq)
	if err != nil {
		panic(err)
	}
	defer resp.Body.Close()
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		panic(err)
	}
	fmt.Print(string(body))
}