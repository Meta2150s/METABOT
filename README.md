# METABOT

> How to play this game?

  1. First you need to install the chrome browser.
  2. Then find and open the chrome browser extension.
  3. Then open the developer mode of the chrome extension.
  4. Then select the `web-game-chrome` folder and load it.
  5. At this time, you can open the game (MetaBot) interface in the chrome plug-in bar and interact with twitter Bind login.
  6. You may need an invitation code, you can use the official invitation code (`FUJ91VGLQV`).
  7. Finally, you can enter the game, let’s get started!

> File directory introduction

| file | description |
|:---|:---|
| solana-chain | Services that interact with the solana network, mainly used for transfer transactions, creating NFT, etc. |
| solana-tool | solana's tool service, mainly used to create accounts and obtain account balances |
| web-admin-ui | The management background of the metabot game, which can manage the background data of the game |
| web-game-chrome | metabot game, player main interface |
| server | The back-end service program of metabot game, which handles various business logic in the game. It includes jar main program, running script, nginx configuration, etc. |
| sql | metabot game database file, mysql |

> HOW TO RUN?

**Necessary environment for the project**

oracle jdk 8

mysql 5.7

redis 5.X

minio or cloud storage that supports S3 protocol

maven 3.6.3 3.8.X

nodejs >= 12 < 18

npm 6.X 8.X

- Solana-chain

  Running the node service is very easy. You only need to execute `npm i`, and then execute `npm run dev` to start the service.

- Solana-tool

  Similarly, you must first execute `npm i`, and then execute `node index.js` to start the service. 
  
  You can also use `pm2 start index.js --name solana-chain` to mount the background process for execution.

- Game backend

   - jar

     You need to execute `run.sh start` on the linux system,
     
     You can also execute `run.sh stop` or `run.sh` status to better control the running of the `metabot-admin.jar`.

     The default port for startup is 8080

   - mysql/redis
     
     The user must be `root` and the password is empty

     You need to create a mysql database named `xbot`, use *utf8mb4* as the character set, and then import `metabot_mysql.sql` into the database

   - nginx

     `nginx.conf` implements the reverse proxy of the game management background

   - minio

     ```bash
     wget https://dl.min.io/server/minio/release/linux-amd64/minio
   
     chmod +x minio
   
     MINIO_ROOT_USER=admin MINIO_ROOT_PASSWORD=123456 nohup ./minio server --config-dir ./config --console-address ":9001" /mnt/data > ./logs/minio.log 2>&1 &#
     ```

- Game management platform

  If you have configured the local nginx environment, you can access the game management platform.
