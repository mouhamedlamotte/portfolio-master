import { getUserIdByApikey } from "@/lib/auth";
import { prismaClient } from "@/lib/prisma.client";
import { NextRequest, NextResponse } from "next/server";

export async function GET(req: NextRequest) {
  const userId = await getUserIdByApikey(req.headers.get("api-key") ?? "");
  const profile = await prismaClient.profile.findUnique({
    where: {
      userId: userId,
    },
    select: {
      id: true,
      bio: true,
      job: true,
      mainSkills: true,
      avatar: true,
      cv: {
        select: {
          name: true,
          url: true,
          type: true,
          id: true,
        },
      },
      user: {
        select: {
          name: true,
          email: true,
        },
      },
      SocialLink: {
        select: {
          id: true,
          name: true,
          url: true,
        },
      },
      metadata: true,
    },
  });
  if (profile) {
    return NextResponse.json({ message: "success", profile }, { status: 200 });
  } else {
    return NextResponse.json(
      { message: "une erreur est survenue", success: false },
      { status: 501 }
    );
  }
}