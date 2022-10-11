import { Request, Response } from "express";
import { CreateUserService } from "./CreateUserService";

class CreateUserController {
  constructor(private createUser: CreateUserService) {}

  async handle(request: Request, response: Response) {
    const { name, mail, password } = request.body;
    const user = await this.createUser.execute({ name, mail, password });

    return response.json(user);
  }
}

export { CreateUserController };