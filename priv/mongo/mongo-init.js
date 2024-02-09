db.createUser(
        {
            user: "lab1",
            pwd: "lab1",
            roles: [
                {
                    role: "readWrite",
                    db: "lab1_dev"
                }
            ]
        }
);
