import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';

export class CreateUserController {
  async handle(req: Request, res: Response) {
    const { name, mail, password, confirmPassword } = req.body;

    const user = await prismaClient.user.create({data: { name, mail, password }});
    return res.json(user)
  }
}
