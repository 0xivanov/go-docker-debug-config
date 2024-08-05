```
docker build  --tag go-debugger-image .
```

```
docker run -d -p 8080:8080 -p 4000:4000 --name  go-debugger-container go-debugger-image
```