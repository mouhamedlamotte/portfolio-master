import { prismaClient } from "@/lib/prisma.client";
import { createUserSchema } from "@/schema/CreateUserSchema";
import { z } from "zod";



export const createUser = async (data : z.infer<typeof createUserSchema>) => {
    try {
        const user = await prismaClient.user.create({
            data : {
                name : data.name,
                email : data.email,
                provider : data.provider,
                Role : "USER", 
                password : data.password
            },
            select : {
                id : true,
                username : true,
                name : true,
                email : true
            }
        })
        return user
    } catch (error) {
        console.log(error);
        return null
    }
}