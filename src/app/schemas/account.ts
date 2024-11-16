import { z } from "zod";

export const createUserSchema = z.object({
    name: z.string(),
    email: z.string(),
    provider : z.enum(["GITHUB", "GOOGLE", "LINKEDIN", "FACEBOOK"])

})

export const profileSchema = z.object({
    
})