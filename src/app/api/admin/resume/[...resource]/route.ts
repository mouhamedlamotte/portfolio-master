import { NextRequest, NextResponse } from "next/server";

export async function DELETE(req : NextRequest,  { params }: { params: Promise<{ resource: string }> }) {
    const resource = (await params).resource
    if (resource.length > 2) {
        // return default 404 page
        return NextResponse.json({ message: "need to specify the resource " }, { status: 404 });
    }
    
    return NextResponse.json({ message: "success" }, { status: 200 });
}