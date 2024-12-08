/*
  Warnings:

  - You are about to drop the column `diviceId` on the `Visit` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Visit" DROP CONSTRAINT "Visit_diviceId_fkey";

-- AlterTable
ALTER TABLE "Visit" DROP COLUMN "diviceId",
ADD COLUMN     "deviceId" INTEGER;

-- AddForeignKey
ALTER TABLE "Visit" ADD CONSTRAINT "Visit_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES "Devices"("id") ON DELETE SET NULL ON UPDATE CASCADE;
