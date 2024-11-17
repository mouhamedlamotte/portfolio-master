/*
  Warnings:

  - A unique constraint covering the columns `[name,userId]` on the table `Hobby` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateTable
CREATE TABLE "Devices" (
    "id" SERIAL NOT NULL,
    "apiKey" TEXT NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Devices_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Devices_apiKey_key" ON "Devices"("apiKey");

-- CreateIndex
CREATE UNIQUE INDEX "Devices_userId_key" ON "Devices"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Devices_apiKey_userId_key" ON "Devices"("apiKey", "userId");

-- CreateIndex
CREATE UNIQUE INDEX "Hobby_name_userId_key" ON "Hobby"("name", "userId");

-- AddForeignKey
ALTER TABLE "Devices" ADD CONSTRAINT "Devices_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
