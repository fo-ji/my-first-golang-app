FROM golang:1.23.4-alpine3.21

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download \
&& apk add --no-cache gcc musl-dev sqlite-dev sqlite

COPY . .

CMD ["go", "run", "."]
