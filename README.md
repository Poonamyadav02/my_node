My Node Project

A simple Node.js application demonstrating server setup, Docker containerization, and CI/CD pipeline integration with GitHub Actions.

📝 Overview

This is a basic Node.js app (called my-node) that runs a simple server on port 3000.
It’s designed to:

Run locally on Node.js

Be containerized using Docker

Use GitHub Actions for CI/CD pipeline

📂 Project Structure
my-node/
│
├── index.js            # Main Node.js server file  
├── package.json        # Dependencies and scripts  
├── Dockerfile          # Docker build file  
├── .dockerignore       # Files to ignore for Docker  
├── .github/
│   └── workflows/
│       └── node-docker.yml  # GitHub Actions CI/CD file
└── README.md           # Project documentation  

✅ Prerequisites

Before you begin, ensure you have the following installed:

Node.js
 v18+

npm
 v9+

Docker Desktop

Git

A GitHub account

⚙️ Installation

Clone the repository:

git clone https://github.com/Poonamyadav02/my_node
cd my-node


Install dependencies:

npm install

Running Locally

Run the app locally with Node:

node index.js


By default, the server runs on:

http://localhost:3000

Using Docker

Build the Docker image:

docker build -t my-node .


Run the Docker container:

docker run -p 3000:3000 my-node


Check it at:

http://localhost:3000


Stop container (optional):

docker ps        # Get container ID
docker stop <5d031d16aebb>

🔗 Git & GitHub Setup

Initialize git (if not already):

git init
git remote add origin https://github.com/Poonamyadav02/my_node


Add & commit changes:

git add .
git commit -m "Initial commit"
git push -u origin main

 CI/CD Pipeline

This project uses GitHub Actions (.github/workflows/node-docker.yml) to:

Install dependencies

Run tests (if added)

Build and push Docker image

Deploy to server or cloud 

node-docker.yml Example:
name: CI/CD Pipeline

on:
  push:
    branches: [ "main" ]

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'

      - name: Install dependencies
        run: npm install

      - name: Run tests
        run: npm test

      - name: Build Docker image
        run: docker build -t my-node .

      - name: Run Docker container
        run: docker run -p 3000:3000 my-node



PORT=3000
NODE_ENV=development


And in your code:

const port = process.env.PORT || 3000;



Fork the repository

Create your feature branch (git checkout -b feature/fooBar)

Commit your changes (git commit -m 'Add some fooBar')

Push to the branch (git push origin feature/fooBar)

Open a Pull Request



Quick Start Commands
# Install dependencies
npm install

# Run locally
node index.js

# Docker build
docker build -t my-node .

# Docker run
docker run -p 3000:3000 my-node

add all screenshot inside screenshot folder