FROM golang:1.21-alpine3.20 AS builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN go build -o main .


FROM alpine:3.20

WORKDIR /app

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

COPY --from=builder /app/main .
COPY --from=builder /app/config ./config/
COPY --from=builder /app/db ./db

RUN chown appuser:appgroup main

# Switch to the non-root user
USER appuser

EXPOSE 8080

# Command to run the executable
CMD ["./main"]
