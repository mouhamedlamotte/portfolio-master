import { z } from "zod";

export const createUserSchema = z.object({
    name: z.string(),
    email: z.string(),
    provider : z.enum(["GITHUB", "GOOGLE", "LINKEDIN", "FACEBOOK", "EMAILANDPASSWORD"]).default("EMAILANDPASSWORD"),
    password : z.string().optional(),
    Role : z.enum(["USER", "ADMIN"]).default("USER")
})