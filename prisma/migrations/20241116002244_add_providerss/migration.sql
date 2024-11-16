-- CreateEnum
CREATE TYPE "Provider" AS ENUM ('GITHUB', 'GOOGLE', 'LINKEDIN', 'FACEBOOK');

-- AlterTable
ALTER TABLE "User" ALTER COLUMN "password" DROP NOT NULL;
