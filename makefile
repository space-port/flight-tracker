# Variables
BACKEND_IMAGE=flight-tracker-backend:latest
FRONTEND_IMAGE=flight-tracker-frontend:latest

.PHONY: all build-backend build-frontend run-backend run-frontend test-backend test-frontend clean

# Build both images
all: build-backend build-frontend

# Build Backend Image
build-backend:
	docker build -t $(BACKEND_IMAGE) ./backend

# Build Frontend Image
build-frontend:
	docker build -t $(FRONTEND_IMAGE) ./frontend

# Run Backend Container
run-backend:
	docker run -d --name backend -p 5000:5000 $(BACKEND_IMAGE)

# Run Frontend Container
run-frontend:
	docker run -d --name frontend -p 8080:80 $(FRONTEND_IMAGE)

# Test Backend API
test-backend: run-backend
	sleep 5
	curl http://localhost:5000/api/flight || (docker stop backend && docker rm backend && exit 1)
	docker stop backend && docker rm backend

# Test Frontend UI
test-frontend: run-frontend
	sleep 5
	curl http://localhost:8080 || (docker stop frontend && docker rm frontend && exit 1)
	docker stop frontend && docker rm frontend

# Clean up Docker containers
clean:
	docker stop backend frontend || true
	docker rm backend frontend || true
