import { getUserIdByApikey } from "@/lib/auth";
import { prismaClient } from "@/lib/prisma.client";
import { NextRequest, NextResponse } from "next/server";

export async function GET(req: NextRequest) {
        const userId = await  getUserIdByApikey(req.headers.get("api-key") ?? "")
        const project = await prismaClient.project.findMany({
            where : {
                userId : userId
            },
            select : {
                id : true,
                title : true,
                description: true,
                startDate: true,
                endDate: true,
                lastUpdatDate: true,
                githubLink: true,
                websiteLink: true,
                media: {
                    select : {
                        id : true,
                        type : true,
                        url : true
                    }
                }
            }
        })
        if (project) {
            return NextResponse.json({ message: "success", project }, { status: 200 });
        } else {
            return NextResponse.json({ message: "une erreur est survenue", success: false }, { status: 501 });
        }
    }
