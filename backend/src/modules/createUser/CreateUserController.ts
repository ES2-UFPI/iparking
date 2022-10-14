import { Request, Response } from "express";
import { CreateUserService } from "./CreateUserService";

class CreateUserController {
  constructor(private createUser: CreateUserService) {}

  async handle(request: Request, response: Response) {
    const { name, mail, password } = request.body;
    const user = await this.createUser.execute({ name, mail, password });

     if (user instanceof Error)  return response.status(400).json({ message: user.message });
    return response.json(user);
  }
}

export { CreateUserController };