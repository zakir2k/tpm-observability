package main

import (
    "fmt"
    "time"
    "math/rand"
    "net/http"
    "strconv"
)

func main() {

    ticker := time.NewTicker(10 * time.Millisecond)
    done := make(chan bool)

    go func() {
        for {
            select {
            case <-done:
                return
            case t := <-ticker.C:
                fmt.Println("Tick at", t) 
                x:= strconv.Itoa(rand.Intn(100))
                y:= strconv.Itoa(rand.Intn(100))
                var route string;

                switch z:= rand.Intn(3); z {
                case 1:
                    route = "multiply"
                case 2:
                    route = "add"
                default:
                    route = "multiply"
                }

                resp, err := http.Get("https://api.techprogramstraining.com/v1/"+route+"/"+x+"/"+y)
                if err != nil {
                    fmt.Println("error at", t) 
                    fmt.Println(err)
                    //time.Sleep(10 * time.Millisecond)
                } else {
                    resp.Body.Close() 
                }

            }
        }
    }()

    time.Sleep(20000000000 * time.Millisecond)
    ticker.Stop()
    done <- true
    fmt.Println("Ticker stopped")
}
