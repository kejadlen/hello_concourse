package main

import (
	"io"
	"log"
	"net/http"
)

func HelloServer() *http.ServeMux {
	hello := http.NewServeMux()
	hello.HandleFunc("/hello", func(w http.ResponseWriter, r *http.Request) {
		io.WriteString(w, "Hello")
	})
	return hello
}

func main() {
  hello := HelloServer()
	err := http.ListenAndServe(":9293", hello)
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
