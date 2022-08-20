import { Request, Response } from "express";
import { Router } from "express";
const routes = Router()

import {CreateParkingController} from "./controllers/Parking/CreateParkingController";
import { GetParkingController } from "./controllers/Parking/GetParkingController";

routes.get("/",(req: Request, res: Response) => {
    return res.json({ message: "Iparking API, for more info please access https://github.com/ES2-UFPI/iparking" })
})

routes.post("/parking", new CreateParkingController().handle)
routes.get("/parking", new GetParkingController().handle)
    
export  {routes};