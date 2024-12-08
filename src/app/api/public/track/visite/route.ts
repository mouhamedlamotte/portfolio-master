import { visitSchema } from "@/app/schemas/track";
import { prismaClient } from "@/lib/prisma.client";
import { NextRequest, NextResponse } from "next/server";




export async function POST(req : NextRequest) {
    try {
        const api_key = req.headers.get("api-key")
        const device = await prismaClient.devices.findUnique({
            where : {
                apiKey : api_key ?? ""
            },
            select : {
                id : true
            }
        })
        console.log("device ===>", device);
        
        const data = visitSchema.parse(await req.json())
        console.log("data ===>", data);
        
        const visit= await prismaClient.visit.create({
                data : {
                    deviceType : data.deviceType,
                    os : data.os,
                    browser : data.browser,
                    language : data.language,
                    referrer : data.referrer,
                    visitedPage : data.visitedPage,
                    visitDate : new Date(),
                }
        })
        console.log("visit ===>", visit);
        return NextResponse.json({ message: "success" }, { status: 200 });
    } catch (e) {
       return NextResponse.json({ message: "une erreur est survenue", success: false }, { status: 501 });
    }
}