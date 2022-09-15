import { GoogleMap, useJsApiLoader } from '@react-google-maps/api';


import './styles.css';

function App() {

  const { isLoaded } = useJsApiLoader({
    id: 'google-map-script',
    googleMapsApiKey: "AIzaSyDCS-Fp2TKI2gLFOWH8AJhHRvDwxpJdNbU"
  })

  return (
    <div className='map'>
      {isLoaded ? (
        <GoogleMap
          mapContainerStyle={{width: '100%', height: '100%'}}
          center={{
            lat:-5.0562191,
            lng: -42.7920532
          }}
          zoom={15}
          
        >
          { /* Child components, such as markers, info windows, etc. */}
          <></>
        </GoogleMap>
      ) : <></>
      }
    </div>
  )
}

export default App
