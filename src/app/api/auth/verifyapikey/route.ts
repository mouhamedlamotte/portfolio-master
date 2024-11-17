import { prismaClient } from "@/lib/prisma.client";
import { NextRequest, NextResponse } from "next/server";
import { z } from "zod";

const veryfySchema = z.object({
    apikey : z.string()
})

export async function POST(req: NextRequest) {
    const data = veryfySchema.parse(await req.json())
    const apikey = await prismaClient.devices.findFirst({
        where : {
            apiKey : data.apikey
        }
    })
    if (apikey) {
        return NextResponse.json({ message: "success" }, { status: 200 });
    } else {
        return NextResponse.json({ message: "invalid api-key", success: false }, { status: 401 });
    }
}