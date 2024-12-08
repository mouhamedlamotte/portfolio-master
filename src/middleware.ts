import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";

// import { verifyApiKey } from "./lib/auth";


export async function middleware(request: NextRequest) {
  const headers = request.headers;
  const api_key = headers.get("api-key");
  if (request.nextUrl.pathname.includes("/api/public") || request.nextUrl.pathname.includes("/api/account")) {
    {
      if (!api_key) {
        return NextResponse.json({ message: "missing api-key", success: false }, { status: 401 });
      }
      const verify = await  fetch(`${request.nextUrl.origin}/api/auth/verifyapikey`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          apikey : api_key
        }),
      })
      if (!verify.ok) {
        return NextResponse.json({ message: "invalid api-key", success: false }, { status: 401 });
      }
    }
  }
  if (request.nextUrl.pathname.includes("/api/auth")) {
    return NextResponse.next();
  }

  return NextResponse.next();  
}

export const config = {
  matcher: "/api/:path*",
};
