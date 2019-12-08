# Notebook

Fedora 31 - 64-bit\
12 GiB RAM DDR3 1600MHz\
Intel® Core™ i7-6500U CPU @ 2.50GHz × 4

# Result

| Project         | Requests/sec |
|-----------------|:------------:|
| elixir - cowboy | 15064 |
| dotnet core 2.2 | 24661 |  
| dotnet core 3.1 | 39910 |

\
![Result](result\elixir-dotnetcore2.2-dotnetcore3.1-minimal-servers.png)

## elixir

run elixir minimal server
```
cd elixir_minimal_server/
mix run --no-halt
```

run wrk - elixir
```
./wrk -t12 -c400 -d60s http://localhost:4000/customer
```
## dotnetcore 2.2

run dotnet core 2.2 minimal server 
```
cd dotnetcore2.2_minimal_server/
dotnet run -c release --launch-profile Production
```

run wrk - dotnet core 2.2
```
./wrk -t12 -c400 -d60s http://localhost:5000/api/values
```

## dotnetcore 3.1

run dotnet core 3.1 minimal server
```
cd dotnetcore3.1_minimal_server/
dotnet run -c release --launch-profile Production
```

run wrk - dotnet core 3.1
```
./wrk -t12 -c400 -d60s http://localhost:5020/WeatherForecast
```
