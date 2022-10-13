import { prismaClient } from "../../database/prismaClient";
import { Request, Response } from "express";

class activateUserController {
    async handle(request: Request, response: Response) {
      const { id } = request.params;
      const user = await prismaClient.user.findFirst({where: {id}})
      if (!user) return response.status(400).json({message: "User not found"})
      if (!user.active) await prismaClient.user.update({ where: { id }, data: { active: true } });
      if (user.active) return response.status(400).json({message: "User already active"})

      return response.json({ message: "User activated" });
    }
  }
  
  export { activateUserController };