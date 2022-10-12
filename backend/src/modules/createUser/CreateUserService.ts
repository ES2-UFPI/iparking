import { User } from "../../entities/User";
import { IUsersRepository } from "../../repositories/IUsersRepositories";

interface IUserRequest {
  name: string;
  mail: string;
  password: string;
}

class CreateUserService {
  constructor(private usersRepository: IUsersRepository) {}

  async execute({ name, mail, password }: IUserRequest) {
    const userAlreadyExists = await this.usersRepository.exists(mail);

    if (userAlreadyExists) {
      throw new Error("User already exists!");
    }

    const userCreate = User.create({ name, mail, password });
    const user = await this.usersRepository.create(userCreate);
    return user;
  }
}

export { CreateUserService };