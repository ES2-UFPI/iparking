import React from 'react'
import { BrowserRouter as  Router, Routes, Route } from 'react-router-dom';

import ReactDOM from 'react-dom/client'

import App from './pages/Map/App'

import { Home } from './pages/Home';
import { Cadastro } from './pages/Cadastro/Index';

import './styles/global.css'

export const REACT_APP_GOOGLE_MAPS_API_KEY = "AIzaSyDCS-Fp2TKI2gLFOWH8AJhHRvDwxpJdNbU";

ReactDOM.createRoot(document.getElementById('root') as HTMLElement).render(
  <React.StrictMode>
    <Router>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/cadastro" element={<Cadastro />} />
        <Route path="/map" element={<App />} />
      </Routes>
    </Router>
  </React.StrictMode>
)

