/*
  Warnings:

  - A unique constraint covering the columns `[title,issued_by,userId]` on the table `Certification` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "Certification" ADD COLUMN     "description" TEXT;

-- AlterTable
ALTER TABLE "Experience" ADD COLUMN     "story" TEXT;

-- AlterTable
ALTER TABLE "Media" ADD COLUMN     "name" TEXT,
ADD COLUMN     "primary" BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE "Profile" ADD COLUMN     "avatar" VARCHAR(200),
ADD COLUMN     "cvId" INTEGER;

-- CreateTable
CREATE TABLE "SocialLink" (
    "id" SERIAL NOT NULL,
    "url" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "profileId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SocialLink_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ProjectToSkill" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "SocialLink_name_profileId_key" ON "SocialLink"("name", "profileId");

-- CreateIndex
CREATE UNIQUE INDEX "_ProjectToSkill_AB_unique" ON "_ProjectToSkill"("A", "B");

-- CreateIndex
CREATE INDEX "_ProjectToSkill_B_index" ON "_ProjectToSkill"("B");

-- CreateIndex
CREATE UNIQUE INDEX "Certification_title_issued_by_userId_key" ON "Certification"("title", "issued_by", "userId");

-- AddForeignKey
ALTER TABLE "SocialLink" ADD CONSTRAINT "SocialLink_profileId_fkey" FOREIGN KEY ("profileId") REFERENCES "Profile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Profile" ADD CONSTRAINT "Profile_cvId_fkey" FOREIGN KEY ("cvId") REFERENCES "Media"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProjectToSkill" ADD CONSTRAINT "_ProjectToSkill_A_fkey" FOREIGN KEY ("A") REFERENCES "Project"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProjectToSkill" ADD CONSTRAINT "_ProjectToSkill_B_fkey" FOREIGN KEY ("B") REFERENCES "Skill"("id") ON DELETE CASCADE ON UPDATE CASCADE;
