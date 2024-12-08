-- CreateTable
CREATE TABLE "Visit" (
    "id" TEXT NOT NULL,
    "ipAddress" TEXT,
    "country" TEXT,
    "region" TEXT,
    "deviceType" TEXT,
    "os" TEXT,
    "browser" TEXT,
    "language" TEXT,
    "referrer" TEXT,
    "visitedPage" TEXT NOT NULL,
    "visitDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "sessionId" TEXT,

    CONSTRAINT "Visit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PageInteraction" (
    "id" TEXT NOT NULL,
    "visitId" TEXT NOT NULL,
    "actionType" TEXT NOT NULL,
    "targetElement" TEXT,
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PageInteraction_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "Visit_ipAddress_visitDate_idx" ON "Visit"("ipAddress", "visitDate");

-- CreateIndex
CREATE INDEX "PageInteraction_actionType_timestamp_idx" ON "PageInteraction"("actionType", "timestamp");

-- AddForeignKey
ALTER TABLE "PageInteraction" ADD CONSTRAINT "PageInteraction_visitId_fkey" FOREIGN KEY ("visitId") REFERENCES "Visit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
