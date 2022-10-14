import { useState } from 'react';

import api from '../../services/api';


export function Cadastro() {
    const [name, setName] = useState("");
    const [mail, setMail] = useState("");
    const [password, setPassword] = useState("");
    

    async function hendleRegister(e : any) {
      e.preventDefault();
  
      const data = {
        name,
        mail,
        password
      }
      try {
        const response = await api.post('users', data);
        console.log(response);
        alert(response.data);
       
      } catch (err : any) {
        console.log(err);
        alert('Erro no cadastro, tente novamente.   ' + err.response.data.message );
      }
    }
  
    return (
        <div className='w-screen h-screen flex items-center justify-center gap-2' >
            <form onSubmit={hendleRegister}>
                <div className='flex items-center justify-center mb-2 flex-col' >
                    <img src="data:image/jpeg;base64,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" alt="My logo" />

                    <h1 className=' text-xl mb-6' >Cadastro Iparking</h1>
                </div>

                <label className='text-grey-700'>Nome</label> 
                <input 
                    className='w-full py-2 bg-gray-50 text-gray-500 px-1 outline-none mb-4' 
                    type="text" 
                    name="name"
                    value={name}
                    onChange={ e => setName(e.target.value)}
                />
                <label className='text-grey-700'>E-mail</label> 
                <input 
                    className='w-full py-2 bg-gray-50 text-gray-500 px-1 outline-none mb-4' 
                    type="mail" 
                    name="email" 
                    value={mail}
                    onChange={ e => setMail(e.target.value)}
                />
                <label className='text-grey-700'>Password</label> 
                <input 
                    className='w-full py-2 bg-gray-50 text-gray-500 px-1 outline-none mb-4' 
                    type="password" 
                    name="name" 
                    value={password}
                    onChange={ e => setPassword(e.target.value)}
                />
                <button 
                    className='w-full bg-blue-500 text-gray-100 py-2 rounded hover:bg-blue-600' 
                    type="submit"
                >Cadastrar</button>
            </form >
        </div>

    )
}