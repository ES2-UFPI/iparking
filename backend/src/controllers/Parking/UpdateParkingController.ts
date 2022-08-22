import { prismaClient } from "../../database/prismaClient";

import { Request, Response } from "express";

export class UpdateParkingController {

  async handle(req: Request, res: Response) {

    const { id } = req.params;
    const { name, latitude, longitude } = req.body;
    const updatedParking = await prismaClient.parking.update({
      where: { id },
      data: { name, latitude, longitude }
    });
    res.json(updatedParking);
  }

}