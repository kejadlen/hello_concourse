package main

import (
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestHello(t *testing.T) {
	hello := HelloServer()
	rec := httptest.NewRecorder()

	req, err := http.NewRequest("GET", "/hello", nil)
	if err != nil {
		t.Fatal("Couldn't create request")
	}

	hello.ServeHTTP(rec, req)

	body := rec.Body.String()

	if body != "Hello" {
		t.Errorf("Expected \"Hello\", got \"%s\".\n", body)
	}
}
