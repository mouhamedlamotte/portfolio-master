-- AlterTable
ALTER TABLE "Visit" ADD COLUMN     "diviceId" INTEGER;

-- AddForeignKey
ALTER TABLE "Visit" ADD CONSTRAINT "Visit_diviceId_fkey" FOREIGN KEY ("diviceId") REFERENCES "Devices"("id") ON DELETE SET NULL ON UPDATE CASCADE;
