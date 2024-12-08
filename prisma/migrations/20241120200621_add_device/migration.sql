/*
  Warnings:

  - A unique constraint covering the columns `[visitId,actionType,targetElement]` on the table `PageInteraction` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "PageInteraction_visitId_actionType_targetElement_key" ON "PageInteraction"("visitId", "actionType", "targetElement");
