import { getUserIdByApikey } from "@/lib/auth";
import { prismaClient } from "@/lib/prisma.client";
import { NextRequest, NextResponse } from "next/server";

export async function GET(req: NextRequest) {
        const userId = await  getUserIdByApikey(req.headers.get("api-key") ?? "")
        const hobbies = await prismaClient.hobby.findMany({
            where : {
                userId : userId
            },
            select : {
                id : true,
                name : true
            }
        })
        if (hobbies) {
            return NextResponse.json({ message: "success", hobbies }, { status: 200 });
        } else {
            return NextResponse.json({ message: "une erreur est survenue", success: false }, { status: 501 });
        }
    }
