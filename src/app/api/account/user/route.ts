import { createUserSchema } from "@/app/schemas/account";
import { getUserRoleByApikey } from "@/lib/auth";
import { prismaClient } from "@/lib/prisma.client";
import { Prisma } from "@prisma/client";
import { NextRequest, NextResponse } from "next/server";

export async function POST (req : NextRequest){
    try {
        const userRole = await getUserRoleByApikey(req.headers.get("api-key") ?? "")

        if (userRole !== "ADMIN") {
            return NextResponse.json({
                message : "Vous n'avez pas les droits nécessaires"
            }, {
                status : 403
            })
        }

        const data = createUserSchema.parse(await req.json())
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
        return NextResponse.json({
            message : "Utilisateur créé avec succès",
            user
        })
    } catch (e) {
        if (e instanceof Prisma.PrismaClientKnownRequestError) {
            if (e.code === 'P2002') {
              return NextResponse.json({
                message : "Cet email est déjà utilisé",
                success : false
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