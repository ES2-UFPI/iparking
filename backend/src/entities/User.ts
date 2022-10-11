class User {
    id?: string;
    name!: string;
    mail!: string;
    password!: string;
  
    private constructor({ name, mail, password }: User) {
      return Object.assign(this, {
        name,
        mail,
        password
      });
    }
  
    static create({ name, mail, password }: User) {
      const user = new User({ name, mail, password });
      return user;
    }
  }
  
  export { User };