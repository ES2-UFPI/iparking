import { prismaClient } from '../../database/prismaClient';
import { Request, Response } from "express";
export class GetOneTicketController {
    async handle(req: Request, res: Response) {
        const { id } = req.params;
        const oneTicket = await prismaClient.ticket.findUnique({
            where: { id }
        });
        res.json(oneTicket);
    }
}