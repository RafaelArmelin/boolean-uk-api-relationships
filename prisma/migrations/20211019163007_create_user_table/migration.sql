/*
  Warnings:

  - You are about to alter the column `street` on the `Address` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(225)`.
  - You are about to alter the column `city` on the `Address` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(225)`.
  - You are about to alter the column `postCode` on the `Address` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(225)`.
  - You are about to alter the column `firstName` on the `User` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(225)`.
  - You are about to alter the column `lastName` on the `User` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(225)`.
  - Added the required column `userId` to the `Address` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `Order` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Address" ADD COLUMN     "userId" INTEGER NOT NULL,
ALTER COLUMN "street" SET DATA TYPE VARCHAR(225),
ALTER COLUMN "city" SET DATA TYPE VARCHAR(225),
ALTER COLUMN "postCode" SET DATA TYPE VARCHAR(225);

-- AlterTable
ALTER TABLE "Order" ADD COLUMN     "userId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "User" ALTER COLUMN "firstName" SET DATA TYPE VARCHAR(225),
ALTER COLUMN "lastName" SET DATA TYPE VARCHAR(225);

-- AddForeignKey
ALTER TABLE "Address" ADD CONSTRAINT "Address_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
