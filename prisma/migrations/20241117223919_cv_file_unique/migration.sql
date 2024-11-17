/*
  Warnings:

  - A unique constraint covering the columns `[cvId]` on the table `Profile` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Profile_cvId_key" ON "Profile"("cvId");
