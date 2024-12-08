import { prismaClient } from "@/lib/prisma.client";
import { NextRequest, NextResponse } from "next/server";
import { z } from "zod";

const creadentialsSchema = z.object({
    email : z.string(),
    password : z.string()
})

export async function POST(req: NextRequest) {
    try {
        const data = creadentialsSchema.parse(await req.json())

        console.log("data ===>", data);
        

        const user = await prismaClient.user.findUnique({
            where : {
                email : data.email,
                password : data.password
            },
            select : {
                id : true,
                username : true,
                name : true,
                email : true
            }
        })
        if (!user) {
            return NextResponse.json({ message: "invalid credentials", success: false }, { status: 401 });
        }
        return NextResponse.json({
            message : "success",
            user
        }, { status: 200 });
    } catch (error) {
            console.log(error);
            return NextResponse.json({ message: "une erreur est survenue", success: false }, { status: 501 });
    }
}