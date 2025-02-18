# PRISMA

## 1. Installation
```bash
npm init -y
npm install @prisma/client
npm install --save-dev prisma
npx prisma init
```

## 2. Declaration
```prisma
generator client {
  provider = "prisma-client-js"
}

datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL") // Set this in .env file
}

model User {
  id    Int    @id @default(autoincrement())
  name  String
  email String @unique
}
```

## 3. Operation
### 1. Initialize migration
```bash
npx prisma init
```

### 2. Create new migration
```bash
npx prisma migrate dev --name init
```

### 3. Deploy new migration
```bash
npx prisma migrate deploy
```

### 4. Check migration status
```bash
npx prisma migrate status
```

### 5. Rerun all migration ( development only )
```bash
npx prisma migrate reset
```

### 6. Manually edit migration
```bash
npx prisma migrate resolve --applied migration_id
```

### 7. Quick sync
```bash
npx prisma db push
```

### 8. Rollback
```bash
npx prisma migrate resolve --rolled-back migration_id
```

## 4. Code
```js
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function main() {
  // Create a new user
  const user = await prisma.user.create({
    data: { name: "Alice", email: "alice@example.com" },
  });
  console.log("Created User:", user);

  // Get all users
  const users = await prisma.user.findMany();
  console.log("All Users:", users);
}

main()
  .catch(e => console.error(e))
  .finally(async () => {
    await prisma.$disconnect();
  });

```


