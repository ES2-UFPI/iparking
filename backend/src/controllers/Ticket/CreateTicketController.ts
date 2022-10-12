import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';

export class CreateTicketController{
    async handle(req:Request, res:Response) {
        const { user_id, parking_id } = req.body;
        
        const ticket = await prismaClient.ticket.create({data:{user_id, parking_id}});
        const parking1 = await prismaClient.parking.findFirst(
            {where: 
                { id: 
                    parking_id
                }
            });
        if(parking1.parking_reserved >= parking1.parking_spaces){
            return res.json({'error': 'Estacionamento Lotado'})
        }
        const parking = await prismaClient.parking.update({where: { id: parking_id }, data: { parking_reserved: 1+ parking1.parking_reserved }});
        return res.json(ticket)
    }
}