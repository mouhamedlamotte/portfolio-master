import { createUserSchema } from "@/app/schemas/account";
import { prismaClient } from "@/lib/prisma.client";
import { Prisma } from "@prisma/client";
import { NextRequest, NextResponse } from "next/server";

export async function POST (req : NextRequest){
    try {
        const data = createUserSchema.parse(await req.json())
        const user = await prismaClient.user.create({
            data : {
                name : data.name,
                email : data.email,
                provider : data.provider,
                Role : "USER" 
            }
        })
        return NextResponse.json({
            message : "Utilisateur créé avec succès",
            user
        })
    } catch (e) {
        if (e instanceof Prisma.PrismaClientKnownRequestError) {
            if (e.code === 'P2002') {
              return NextResponse.json({
                message : e.message
              }, {
                status : 409
              })
            }
          }
        return NextResponse.json({
            message : "Une erreur est survenue lors de la création de l'utilisateur",
        }, {
            status : 411
        })
    }
}