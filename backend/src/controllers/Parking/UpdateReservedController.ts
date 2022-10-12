import { prismaClient } from "../../database/prismaClient";

import { Request, Response } from "express";

export class UpdateReservedController {

  async handle(req: Request, res: Response) {

    const { id } = req.params;
    const { parking_reserved } = req.body;
    const updatedParking = await prismaClient.parking.update({
      where: { id },
      data: { parking_reserved }
    });
    res.json(updatedParking);
  }

}