
# Example repo to demonstrate Envoy Opa plugin

|  Request | header  | status  | http_server_response  |
|:-:|:-:|:-:|:-:|
| / public  |  -  | 200  | "message": "This is a public endpoint"  |
| / private |  -  | 403  |   |

# To run this example

1. Start the envoy server

```sh
envoy -c envoy.yml
```

2. Start the opa server
```sh
chmod +x opa_envoy_linux_amd64
./opa_envoy_linux_amd64 run --server --watch /path/to/policy.rego --log-level=debug --config-file=/path/to/opa.yaml
```

2. Start the go gin server.
```sh
go run main.go
```

3. Test
```
curl --location '127.0.0.1:10000/public'                                             #Allow
curl --location '127.0.0.1:10000/private'                                            #Unauthorized
```



