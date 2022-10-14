import * as nodemailer from "nodemailer";


var transport = nodemailer.createTransport({
  host: "smtp.mailtrap.io",
  port: 2525,
  auth: {
    user: "a1cc4559cfe52a",
    pass: "3027747fbd1236"
  }
});

export { transport } 