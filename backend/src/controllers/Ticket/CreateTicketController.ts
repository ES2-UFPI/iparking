import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';

export class CreateTicketController{
    async handle(req:Request, res:Response) {
        const { user_id } = req.body;
        
        const ticket = await prismaClient.ticket.create({data:{user_id}})
        return res.json(ticket)
    }
}