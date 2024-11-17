import { prismaClient } from "./prisma.client"

export const getUserIdByApikey = async (apikey : string) => {
    const user = await prismaClient.devices.findFirst({
        where : {
            apiKey : apikey
        }
    })
    return user?.userId ?? -1
}