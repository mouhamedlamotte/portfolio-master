import { getUserIdByApikey } from "@/lib/auth";
import { prismaClient } from "@/lib/prisma.client";
import { NextRequest, NextResponse } from "next/server";

export async function GET(req: NextRequest) {
        const userId = await  getUserIdByApikey(req.headers.get("api-key") ?? "")
        const skills = await prismaClient.userSkill.findMany({
            where : {
                userId : userId
            },
            select : {
                id : true,
                level : true,
                skill : {
                    select : {
                        id : true,
                        name : true,
                        logo : true,
                        category : true
                        
                    }
                }
            }
        })
        
        if (skills) {
            return NextResponse.json({ message: "success", skills }, { status: 200 });
        } else {
            return NextResponse.json({ message: "une erreur est survenue", success: false }, { status: 501 });
        }
    }
