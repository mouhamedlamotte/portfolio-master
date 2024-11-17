import NextAuth from "next-auth"
import GoogleProvider from "next-auth/providers/google";
import CredentialsProvider from "next-auth/providers/credentials"
import GitHubProvider from "next-auth/providers/github";
import LinkedInProvider from "next-auth/providers/linkedin";

const handler = NextAuth({
    providers: [
        GoogleProvider({
          clientId: process.env.GOOGLE_CLIENT_ID ?? "",
          clientSecret: process.env.GOOGLE_CLIENT_SECRET ?? ""
        }),
        CredentialsProvider({
          // The name to display on the sign in form (e.g. 'Sign in with...')
          name: 'Credentials',
          // The credentials is used to generate a suitable form on the sign in page.
          // You can specify whatever fields you are expecting to be submitted.
          // e.g. domain, username, password, 2FA token, etc.
          // You can pass any HTML attribute to the <input> tag through the object.
          credentials: {
            email: { label: "email",  type: "text", placeholder: "jsmith" },
            password: { label: "Password", type: "password" }
          },
          async authorize(credentials, req) {

            const res = await fetch("http://localhost:3000/api/auth/token", {
              method: 'POST',
              body: JSON.stringify(credentials),
              headers: { "Content-Type": "application/json" }
            })
            const user = await res.json()
            console.log("user ===?>", user);
            
      
            // If no error and we have user data, return it
            if (res.ok && user.user) {
              return user.user
            }
            // Return null if user data could not be retrieved
            return null
          }
        }),
        GitHubProvider({
          clientId: process.env.GITHUB_ID ?? "",
          clientSecret: process.env.GITHUB_SECRET ?? ""
        }),
        LinkedInProvider({
          clientId: process.env.LINKEDIN_CLIENT_ID ?? "",
          clientSecret: process.env.LINKEDIN_CLIENT_SECRET ?? ""
        })
    ]
    
    
})

export { handler as GET, handler as POST }