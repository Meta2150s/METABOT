const {
    Keypair,
    clusterApiUrl,
    Connection,
    PublicKey,
    LAMPORTS_PER_SOL,
} = require("@solana/web3.js");
const bs58 = require("bs58");
const BigNumber = require("bignumber.js");
const {Config} = require("../const");

module.exports = class ApiService {
    constructor() {
        this.connection = new Connection(clusterApiUrl("devnet"), "confirmed");
        // this.connection = new Connection("https://rpc.ankr.com/solana_devnet", "confirmed");
    }

    /**
     * create wallet
     */
    async create(ctx, next) {
        // let connection = new Connection(clusterApiUrl("devnet"), "confirmed");
        // let slot = await connection.getSlot();
        // console.log(slot);
        // let blockTime = await connection.getBlockTime(slot);
        // console.log(blockTime);
        // let block = await connection.getBlock(slot);
        // console.log(block);
        try {
            let keypair = Keypair.generate();
            const pubKey = keypair.publicKey.toBase58();
            const prvKeyBuffer = keypair.secretKey;
            const prvKey = bs58.encode(prvKeyBuffer);
            console.log("publicKey=", pubKey);
            console.log("secretKey=", prvKey);
            const response = {
                "publicKey": pubKey,
                "secretKey": prvKey,
            }
            return ctx.success(response, "success");
        } catch (error) {
            return ctx.failure(error.message);
        }
    }

    /**
     * get address balance
     */
    async getBalance(ctx, next) {
        const {address} = ctx.params;
        try {
            const accountPublicKey = new PublicKey(address);
            const balanceInLamports = await this.connection.getBalance(
                accountPublicKey, "confirmed");

            let gameBalance = "0";
            let platformBalance = "0";

            const gameTokenPublicKey = new PublicKey(Config.token.game);
            const platformTokenPublicKey = new PublicKey(Config.token.platform);
            const parsedGameTokenAccounts = await this.connection.getParsedTokenAccountsByOwner(
                accountPublicKey,
                {mint: gameTokenPublicKey},
                "confirmed",
            )
            const parsedPlatformTokenAccounts = await this.connection.getParsedTokenAccountsByOwner(
                accountPublicKey,
                {mint: platformTokenPublicKey},
                "confirmed",
            )
            if (parsedGameTokenAccounts.value.length > 0) {
                const accountInfo = parsedGameTokenAccounts.value[0].account.data.parsed.info;
                gameBalance = accountInfo.tokenAmount.uiAmountString
            }
            if (parsedPlatformTokenAccounts.value.length > 0) {
                const accountInfo = parsedPlatformTokenAccounts.value[0].account.data.parsed.info;
                platformBalance = accountInfo.tokenAmount.uiAmountString
            }

            let solBalance = new BigNumber(balanceInLamports).div(
                new BigNumber(LAMPORTS_PER_SOL)).toString();

            const response = {
                address: address,
                solBalance: solBalance,
                gameBalance: gameBalance,
                platformBalance: platformBalance,
            }
            return ctx.success(response, "success");
        } catch (error) {
            console.error(
                `Error occurred while querying the balance for address ${address}:`,
                error);
            return ctx.failure(error.message);
        } finally {

        }
    }
}
