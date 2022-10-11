import express, {  Request, Response, NextFunction } from "express";

import swaggerUi from "swagger-ui-express";

import swaggerDocument from "./swagger.json";

const app = express();

const PORT = process.env.PORT || 3333;

import { routes } from "./routes";

app.use(express.json());

app.use("/api-docs", swaggerUi.serve, swaggerUi.setup(swaggerDocument));

app.use(
  (err: Error, request: Request, response: Response, next: NextFunction) => {
    if (err instanceof Error) {
      return response.status(400).json({
        message: err.message,
      });
    }
    return response.status(500).json({
      status: "error",
      message: `Internal server error - ${err}`,
    });
  }
);

app.use(routes);


app.listen(PORT, () =>
  console.log(`⚡️[server]: Server is running at http://localhost:${PORT}`)
);
