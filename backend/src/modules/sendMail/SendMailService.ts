import { User } from '../../entities/User'
import {transport } from '../../services/MailService'


 export function sendMail(user: User){

    transport.sendMail({
        from: "naoresponder@iparking.com",
        to: user.mail,
        subject: "Ativação de conta",
        text: "",
        html: `Olá, parabéns voce se cadastrou no iparking, para ativar sua conta por favor clique no link abaixo 
        <br/><br/><br/>
        <center><a href="${process.env.APP_URL}/users/activate/${user.id}">Clique aqui para ativar sua conta</a></center`
    })

 }