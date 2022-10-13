import { User } from "../../entities/User";
import { IUsersRepository } from "../../repositories/IUsersRepositories";
import { sendMail } from "../sendMail/SendMailService";

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
      return( {message:"User already exists!"});
    }
    
    const userCreate = User.create({ name, mail, password });
    const user = await this.usersRepository.create(userCreate);
    sendMail(user)
    return user;
  }
}

export { CreateUserService };