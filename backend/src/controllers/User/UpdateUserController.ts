import { prismaClient } from "../../database/prismaClient";

import { Request, Response } from "express";

export class UpdateParkingController {

  async handle(req: Request, res: Response) {

    const { id } = req.params;
    const { name,  mail, password, newPassword, confirmNewPasswod  } = req.body;
    const updateUser = await prismaClient.user.update({
      where: { id },
      data: { name,  mail, password, newPassword, confirmNewPasswod }
    });
    res.json(updateUser);
  }

}