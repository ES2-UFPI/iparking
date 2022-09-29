import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './pages/Map/App'
export const REACT_APP_GOOGLE_MAPS_API_KEY = "AIzaSyDCS-Fp2TKI2gLFOWH8AJhHRvDwxpJdNbU";
ReactDOM.createRoot(document.getElementById('root') as HTMLElement).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
)

