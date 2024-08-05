package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	log.Println("starting server...")
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Println("Request received")
		w.Write([]byte(`Hello world`))
	})
	log.Fatal(http.ListenAndServe(":8080", nil))
}
