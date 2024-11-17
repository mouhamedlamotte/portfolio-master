import { getUserIdByApikey } from "@/lib/auth";
import { prismaClient } from "@/lib/prisma.client";
import { NextRequest, NextResponse } from "next/server";

export async function GET(req: NextRequest) {
        const userId = await  getUserIdByApikey(req.headers.get("api-key") ?? "")
        const certifications = await prismaClient.certification.findMany({
            where : {
                userId : userId
            },
            select : {
                title : true,
                issued_by : true,
                issue_date : true,
                link : true,
                id : true,
                media : {
                    select : {
                        id : true,
                        type : true,
                        url : true
                    }
                }
            }
        })
        if (certifications) {
            return NextResponse.json({ message: "success", certifications }, { status: 200 });
        } else {
            return NextResponse.json({ message: "une erreur est survenue", success: false }, { status: 501 });
        }
    }
