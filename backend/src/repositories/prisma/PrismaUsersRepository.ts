import { prismaClient  }   from "../../database/prismaClient";
import { User } from "../../entities/User";
import { IUsersRepository } from "../IUsersRepositories";

class PrismaUsersRepository implements IUsersRepository {
  async exists(mail : string): Promise<boolean> {
    const user = await prismaClient.user.findUnique({
      where: {
        mail
      },
    });

    return !!user;
  }

  async create({ mail, name, password }: User): Promise<User> {
    const user = await prismaClient.user.create({
      data: {
        mail,
        name,
        password
      },
    });

    return user;
  }
}

export { PrismaUsersRepository };