import { getUserIdByApikey } from "@/lib/auth";
import { prismaClient } from "@/lib/prisma.client";
import { NextRequest, NextResponse } from "next/server";

export async function GET(req: NextRequest) {
        const userId = await  getUserIdByApikey(req.headers.get("api-key") ?? "")
        const experience = await prismaClient.experience.findMany({
            where : {
                userId : userId
            },
            select : {
                id : true,
                name : true,
                jobType : true,
                factoryName : true,
                factoryLogo : true,
                location : true,
                startDate : true,
                endDate : true,
                isActualyWorkingThere : true,
                description : true,
                skills : {
                    select : {
                        id  : true,
                        logo : true,
                        name : true,
                        category : true,
                    }
                }, 
                media : {
                    select : {
                        id : true,
                        type : true,
                        url : true
                        // name : true
                    }
                }
            }
        })
        if (experience) {
            return NextResponse.json({ message: "success", experience }, { status: 200 });
        } else {
            return NextResponse.json({ message: "une erreur est survenue", success: false }, { status: 501 });
        }
    }
