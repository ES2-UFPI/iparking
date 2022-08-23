import { Request, Response } from 'express';
import { realpathSync } from 'fs';
import { prismaClient } from '../../database/prismaClient';

export class CloseTicketController{
async handle(req : Request, res: Response){
    const {id} = req.params;

    const parking = await prismaClient.parking.findFirst(
        {where: 
            { id: 
                (await prismaClient.ticket.findFirst({where: {id}}))?.parking_id, 
            }
        })
    
    if (parking) return res.json(parking);
    return res.json({ error: "id inválido"})
}

}