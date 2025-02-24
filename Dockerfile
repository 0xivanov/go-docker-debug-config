FROM golang:1.21-alpine

EXPOSE 8080 4000

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 go install -ldflags "-s -w -extldflags '-static'" github.com/go-delve/delve/cmd/dlv@latest

RUN CGO_ENABLED=0 go build -gcflags "all=-N -l" -o go-debugger .


CMD [ "/go/bin/dlv", "--listen=:4000", "--headless=true", "--log=true", "--accept-multiclient", "--api-version=2", "exec", "/app/go-debugger" ]