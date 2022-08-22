import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';

export class CreateParkingController {
  async handle(req: Request, res: Response) {
    const { name, latitude, longitude } = req.body;
   
    const createdParking = await prismaClient.parking.create({data:{name, latitude, longitude}});
  

    res.json(createdParking);
  }
}
