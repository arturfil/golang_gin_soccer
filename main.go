package main

import (
	"log"
	"soccer/api"
)

const (
	dbDriver      = "postgres"
	serverAddress = "0.0.0.0:8080"
)

func main() {
	server := api.NewServer()
	err := server.Start(serverAddress)
	if err != nil {
		log.Fatal("Couldn't connect to server")
	}

}
