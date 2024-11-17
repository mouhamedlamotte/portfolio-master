import { getUserIdByApikey } from "@/lib/auth";
import { prismaClient } from "@/lib/prisma.client";
import { NextRequest, NextResponse } from "next/server";

export async function GET(req: NextRequest) {
        const userId = await  getUserIdByApikey(req.headers.get("api-key") ?? "")
        const certifications = await prismaClient.certification.findMany({
            where : {
                userId : userId
            }
        })
        const project = await prismaClient.project.findMany({
            where : {
                userId : userId
            }
        })
        const experience = await prismaClient.experience.findMany({
            where : {
                userId : userId
            }
        })
        const education = await prismaClient.education.findMany({
            where : {
                userId : userId
            }
        })
        const hobbies = await prismaClient.hobby.findMany({
            where : {
                userId : userId
            }
        })
        const skills = await prismaClient.userSkill.findMany({
            where : {
                userId : userId
            }
        })
        const profile = await prismaClient.profile.findMany({
            where : {
                userId : userId
            }
        })
        return NextResponse.json({ message: "success", profile, experience, project, education, hobbies, skills, certifications }, { status: 200 });

    }
