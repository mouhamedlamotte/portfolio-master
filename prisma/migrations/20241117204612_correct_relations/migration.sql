-- CreateEnum
CREATE TYPE "SkillsCategory" AS ENUM ('FRONTEND', 'BACKEND', 'DATABASE', 'DEVOPS', 'DESIGN', 'MOBILE', 'AI', 'CLOUD', 'TESTING', 'SECURITY', 'NETWORKING', 'PROJECT_MANAGEMENT', 'COMMUNICATION', 'LEADERSHIP', 'TEAMWORK', 'PROBLEM_SOLVING', 'TIME_MANAGEMENT', 'CREATIVITY', 'ADAPTABILITY', 'NEGOTIATION');

-- CreateEnum
CREATE TYPE "Role" AS ENUM ('USER', 'ADMIN');

-- CreateEnum
CREATE TYPE "SkillLevel" AS ENUM ('BEGINNER', 'INTERMEDIATE', 'ADVANCED', 'EXPERT');

-- CreateEnum
CREATE TYPE "JobType" AS ENUM ('FULL_TIME', 'PART_TIME', 'INTERN', 'FREELANCE', 'CONTRACT', 'REMOTE', 'TEMPORARY');

-- CreateEnum
CREATE TYPE "MediaTypes" AS ENUM ('IMAGE', 'VIDEO', 'AUDIO', 'OTHER');

-- CreateEnum
CREATE TYPE "Provider" AS ENUM ('GITHUB', 'GOOGLE', 'LINKEDIN', 'FACEBOOK');

-- CreateTable
CREATE TABLE "Skill" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR NOT NULL,
    "logo" TEXT,
    "category" "SkillsCategory" NOT NULL,
    "verified" BOOLEAN NOT NULL DEFAULT false,
    "createdById" INTEGER NOT NULL,

    CONSTRAINT "Skill_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "username" VARCHAR(30) NOT NULL,
    "name" VARCHAR(150) NOT NULL,
    "email" VARCHAR(150) NOT NULL,
    "password" VARCHAR(200),
    "Role" "Role" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "provider" "Provider",

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Profile" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "bio" TEXT,
    "job" VARCHAR(200) NOT NULL,

    CONSTRAINT "Profile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserSkill" (
    "id" SERIAL NOT NULL,
    "skillId" INTEGER NOT NULL,
    "level" "SkillLevel" NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "UserSkill_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Experience" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "jobType" "JobType" NOT NULL,
    "factoryName" VARCHAR(100) NOT NULL,
    "factoryLogo" VARCHAR(200),
    "location" VARCHAR(100),
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3),
    "isActualyWorkingThere" BOOLEAN NOT NULL DEFAULT false,
    "description" TEXT,
    "userId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Experience_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Education" (
    "id" SERIAL NOT NULL,
    "school" TEXT NOT NULL,
    "degree" TEXT NOT NULL,
    "school_logo" TEXT,
    "location" TEXT,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3) NOT NULL,
    "activities" TEXT,
    "description" TEXT,
    "userId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Education_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Hobby" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Hobby_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Project" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3),
    "lastUpdatDate" TIMESTAMP(3) NOT NULL,
    "githubLink" TEXT,
    "websiteLink" TEXT,
    "userId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Project_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Certification" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "issued_by" TEXT NOT NULL,
    "issue_date" TIMESTAMP(3),
    "link" TEXT,
    "userId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Certification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Media" (
    "id" SERIAL NOT NULL,
    "url" TEXT NOT NULL,
    "type" "MediaTypes" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Media_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Devices" (
    "id" SERIAL NOT NULL,
    "apiKey" TEXT NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Devices_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Text" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Text_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_UserSkills" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_ProfileToUserSkill" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_ExperienceToSkill" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_ExperienceToMedia" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_EducationToSkill" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_EducationToMedia" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_CertificationToMedia" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_MediaToProject" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Profile_userId_key" ON "Profile"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Hobby_name_userId_key" ON "Hobby"("name", "userId");

-- CreateIndex
CREATE UNIQUE INDEX "Devices_apiKey_key" ON "Devices"("apiKey");

-- CreateIndex
CREATE UNIQUE INDEX "Devices_userId_key" ON "Devices"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Devices_apiKey_userId_key" ON "Devices"("apiKey", "userId");

-- CreateIndex
CREATE UNIQUE INDEX "_UserSkills_AB_unique" ON "_UserSkills"("A", "B");

-- CreateIndex
CREATE INDEX "_UserSkills_B_index" ON "_UserSkills"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ProfileToUserSkill_AB_unique" ON "_ProfileToUserSkill"("A", "B");

-- CreateIndex
CREATE INDEX "_ProfileToUserSkill_B_index" ON "_ProfileToUserSkill"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ExperienceToSkill_AB_unique" ON "_ExperienceToSkill"("A", "B");

-- CreateIndex
CREATE INDEX "_ExperienceToSkill_B_index" ON "_ExperienceToSkill"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ExperienceToMedia_AB_unique" ON "_ExperienceToMedia"("A", "B");

-- CreateIndex
CREATE INDEX "_ExperienceToMedia_B_index" ON "_ExperienceToMedia"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_EducationToSkill_AB_unique" ON "_EducationToSkill"("A", "B");

-- CreateIndex
CREATE INDEX "_EducationToSkill_B_index" ON "_EducationToSkill"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_EducationToMedia_AB_unique" ON "_EducationToMedia"("A", "B");

-- CreateIndex
CREATE INDEX "_EducationToMedia_B_index" ON "_EducationToMedia"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CertificationToMedia_AB_unique" ON "_CertificationToMedia"("A", "B");

-- CreateIndex
CREATE INDEX "_CertificationToMedia_B_index" ON "_CertificationToMedia"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_MediaToProject_AB_unique" ON "_MediaToProject"("A", "B");

-- CreateIndex
CREATE INDEX "_MediaToProject_B_index" ON "_MediaToProject"("B");

-- AddForeignKey
ALTER TABLE "Skill" ADD CONSTRAINT "Skill_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Profile" ADD CONSTRAINT "Profile_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserSkill" ADD CONSTRAINT "UserSkill_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "Skill"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserSkill" ADD CONSTRAINT "UserSkill_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Experience" ADD CONSTRAINT "Experience_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Education" ADD CONSTRAINT "Education_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Hobby" ADD CONSTRAINT "Hobby_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Project" ADD CONSTRAINT "Project_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Certification" ADD CONSTRAINT "Certification_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Devices" ADD CONSTRAINT "Devices_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_UserSkills" ADD CONSTRAINT "_UserSkills_A_fkey" FOREIGN KEY ("A") REFERENCES "Skill"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_UserSkills" ADD CONSTRAINT "_UserSkills_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProfileToUserSkill" ADD CONSTRAINT "_ProfileToUserSkill_A_fkey" FOREIGN KEY ("A") REFERENCES "Profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProfileToUserSkill" ADD CONSTRAINT "_ProfileToUserSkill_B_fkey" FOREIGN KEY ("B") REFERENCES "UserSkill"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ExperienceToSkill" ADD CONSTRAINT "_ExperienceToSkill_A_fkey" FOREIGN KEY ("A") REFERENCES "Experience"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ExperienceToSkill" ADD CONSTRAINT "_ExperienceToSkill_B_fkey" FOREIGN KEY ("B") REFERENCES "Skill"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ExperienceToMedia" ADD CONSTRAINT "_ExperienceToMedia_A_fkey" FOREIGN KEY ("A") REFERENCES "Experience"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ExperienceToMedia" ADD CONSTRAINT "_ExperienceToMedia_B_fkey" FOREIGN KEY ("B") REFERENCES "Media"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EducationToSkill" ADD CONSTRAINT "_EducationToSkill_A_fkey" FOREIGN KEY ("A") REFERENCES "Education"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EducationToSkill" ADD CONSTRAINT "_EducationToSkill_B_fkey" FOREIGN KEY ("B") REFERENCES "Skill"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EducationToMedia" ADD CONSTRAINT "_EducationToMedia_A_fkey" FOREIGN KEY ("A") REFERENCES "Education"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EducationToMedia" ADD CONSTRAINT "_EducationToMedia_B_fkey" FOREIGN KEY ("B") REFERENCES "Media"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CertificationToMedia" ADD CONSTRAINT "_CertificationToMedia_A_fkey" FOREIGN KEY ("A") REFERENCES "Certification"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CertificationToMedia" ADD CONSTRAINT "_CertificationToMedia_B_fkey" FOREIGN KEY ("B") REFERENCES "Media"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MediaToProject" ADD CONSTRAINT "_MediaToProject_A_fkey" FOREIGN KEY ("A") REFERENCES "Media"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MediaToProject" ADD CONSTRAINT "_MediaToProject_B_fkey" FOREIGN KEY ("B") REFERENCES "Project"("id") ON DELETE CASCADE ON UPDATE CASCADE;
