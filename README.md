# LearnSystem API Gateway

Source of truth route list and forwarding to microservices. This is for auth gate in LearnSystem application.

## Application Dependencies

- Express.js

- Prisma

- TypeScript

## How to start

- First, copy `.env.example` file and rename it to `.env`

- Make your own certificate files(`id_rsa_priv.pem`, `id_rsa_pub.pem`) inside the `certificates` directory

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
