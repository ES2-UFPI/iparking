import { prismaClient } from "../../database/prismaClient";

import { Request, Response } from "express";

export class UpdateUserController {

  async handle(req: Request, res: Response) {

    const { id } = req.params;
    const { name,  mail, password} = req.body;

    const passwordMatch = await prismaClient.user.findFirst({
        where: {
            id
        }
    })
    if( !(password == passwordMatch.password) ) return res.json({message: "Password does not match!"})
    const updatedUser = await prismaClient.user.update({
      where: { id },
      data: { name, mail, password }
    });
    res.json(updatedUser);
  }

}