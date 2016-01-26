package main

import (
  "fmt"
	"io"
	"log"
	"net/http"
  "os"
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
  port := os.Getenv("PORT")
  if port == "" {
    port = "9293"
  }
  addr := fmt.Sprintf(":%s", port)
	err := http.ListenAndServe(addr, hello)
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
