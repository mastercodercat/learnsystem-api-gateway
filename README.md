# MindPrintLearning API Gateway

Source of truth route list and forwarding to microservices. This is for auth gate in MindPrintLearning application.

## Application Dependencies

- Express.js

- Prisma

- TypeScript

## How to start

- First, copy `.env.example` file and rename it to `.env`

- Then, run `npm install`

- Then, run `npm run dev` or `npm start`

## API endpoints

- `POST /api/auth/signin`: to sign in with email and password

- `POST /api/auth/signup`: to sign up with name, email and password

- `POST /api/auth/reset-password`: to reset password via email

- `GET /api/auth/verify`: to verify user with jwt token

## Log module

- `morgan`

- `winston`

## Authenticate/Authorize

- `passport`

## Validation

- `express-validator` for request validation
