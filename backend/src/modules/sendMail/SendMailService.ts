import { User } from '../../entities/User'
import {transporter} from '../../services/MailService'


 export function sendMail(user: User){

    transporter.sendMail({
        from: "naoresponder@iparking.com",
        to: user.mail,
        subject: "Ativação de conta",
        text: "Olá, parabéns voce se cadastrou no iparking, para ativar sua conta por favor clique no link abaixo",
        html: `<a href="${process.env.APP_LINK}/activate/${user.id}">Clique aqui para ativar sua conta</a>`
    })

 }