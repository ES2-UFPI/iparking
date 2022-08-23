import { Request, response, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';

export class CloseTicketController{

async handle(req : Request, res: Response){
    const {id} = req.params;

    const ticket = await prismaClient.ticket.findFirst({where:{id}});

    return res.json(ticket)

}
    

}