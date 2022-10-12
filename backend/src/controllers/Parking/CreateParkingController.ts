import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';

export class CreateParkingController {
    async handle(req: Request, res: Response) {
      const { manager_id, image_url, phone, name, parking_spaces, parking_reserved, first_price, price, latitude, longitude } = req.body;

      const parking = await prismaClient.parking.create({data: { manager_id, image_url, phone, name, parking_spaces, parking_reserved, first_price, price, latitude, longitude}});
      return res.json(parking)
  }
}