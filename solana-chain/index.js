// Import required libraries
const restify = require('restify');
const {
    Connection,
    clusterApiUrl,
    Keypair,
    PublicKey,
    SystemProgram,
    Transaction,
    sendAndConfirmTransaction,
    LAMPORTS_PER_SOL,
} = require('@solana/web3.js');
const {
    getOrCreateAssociatedTokenAccount,
    transfer,
    mintTo,
} = require('@solana/spl-token');
const bs58 = require('bs58');
const {Metaplex, keypairIdentity} = require('@metaplex-foundation/js');

const MITC_TOKEN_ID = 'F6api4ahB1L7CtPLHRTgLUX6NbWrqEoyyASnCm8oEugD';
const METS_TOKEN_ID = 'CmVbtgZN7LmrQW8XrtpxZrG6QFpkT38SQL92n7NKB5Xz';

const RPC_URL = clusterApiUrl('devnet'); //'devnet' | 'testnet' | 'mainnet-beta'

// Initialize connection
const connection = new Connection(RPC_URL, 'confirmed');

// Initialize server
const server = restify.createServer({
    name: 'Solana Wallet Service',
});
server.use([
    restify.plugins.acceptParser(server.acceptable),
    restify.plugins.authorizationParser(),
    restify.plugins.queryParser(),
    restify.plugins.gzipResponse(),
    restify.plugins.bodyParser(),
]);

// Helper functions
const parseBodyJson = req => (req.is('json') ? req.body : Promise.reject(
    'Content-type is not JSON'));

// sol transfer
server.post('/api/transferSOL', async (req, res) => {
    const q = parseBodyJson(req);

    if (q.privateKey === undefined ||
        q.addressTo === undefined ||
        q.value === undefined ||
        q.privateKey === null ||
        q.addressTo === null ||
        q.value === null) {
        return Promise.reject('params not enough');
    }

    var value = parseFloat(q.value);

    var fromWallet = Keypair.fromSecretKey(bs58.decode(q.privateKey));
    var toPublicKey = new PublicKey(q.addressTo);

    const transferTransaction = new Transaction().add(
        SystemProgram.transfer({
            fromPubkey: fromWallet.publicKey,
            toPubkey: toPublicKey,
            lamports: BigInt(value * 1e9),
        }),
    );

    var signature = await sendAndConfirmTransaction(connection,
        transferTransaction, [fromWallet]);
    res.contentType = 'json';
    var code = true;
    var txHash = signature;
    res.send({code, txHash});
});

// mitc transfer
server.post('/api/transferMITC', async (req, res) => {
    const q = parseBodyJson(req);

    if (q.privateKey === undefined ||
        q.addressTo === undefined ||
        q.value === undefined ||
        q.privateKey === null ||
        q.addressTo === null ||
        q.value === null) {
        return Promise.reject('params not enough');
    }

    var value = parseFloat(q.value);

    var fromWallet = Keypair.fromSecretKey(bs58.decode(q.privateKey));
    var toPublicKey = new PublicKey(q.addressTo);

    var mint = new PublicKey(MITC_TOKEN_ID);
    const fromTokenAccount = await getOrCreateAssociatedTokenAccount(connection,
        fromWallet, mint, fromWallet.publicKey);
    const toTokenAccount = await getOrCreateAssociatedTokenAccount(connection,
        fromWallet, mint, toPublicKey);

    var signature = await transfer(
        connection,
        fromWallet,
        fromTokenAccount.address,
        toTokenAccount.address,
        fromWallet.publicKey,
        BigInt(value * 1e9),
    );

    res.contentType = 'json';
    var code = true;
    var txHash = signature;
    res.send({code, txHash});
});

// mets transfer
server.post('/api/transferMETS', async (req, res) => {
    const q = parseBodyJson(req);

    if (q.privateKey === undefined ||
        q.addressTo === undefined ||
        q.value === undefined ||
        q.privateKey === null ||
        q.addressTo === null ||
        q.value === null) {
        return Promise.reject('params not enough');
    }
    var value = parseFloat(q.value);

    var fromWallet = Keypair.fromSecretKey(bs58.decode(q.privateKey));
    var toPublicKey = new PublicKey(q.addressTo);

    var mint = new PublicKey(METS_TOKEN_ID);
    const fromTokenAccount = await getOrCreateAssociatedTokenAccount(connection,
        fromWallet, mint, fromWallet.publicKey);
    const toTokenAccount = await getOrCreateAssociatedTokenAccount(connection,
        fromWallet, mint, toPublicKey);

    var signature = await transfer(
        connection,
        fromWallet,
        fromTokenAccount.address,
        toTokenAccount.address,
        fromWallet.publicKey,
        BigInt(value * 1e9),
    );

    res.contentType = 'json';
    var code = true;
    var txHash = signature;
    res.send({code, txHash});
});

// Increase mitc issuance
server.post('/api/increaseMITC', async (req, res) => {
    const q = parseBodyJson(req);

    if (q.privateKey === undefined ||
        q.value === undefined ||
        q.privateKey === null ||
        q.value === null) {
        return Promise.reject('params not enough');
    }

    var value = parseFloat(q.value);

    var fromWallet = Keypair.fromSecretKey(bs58.decode(q.privateKey));
    var mint = new PublicKey(MITC_TOKEN_ID);
    const fromTokenAccount = await getOrCreateAssociatedTokenAccount(connection,
        fromWallet, mint, fromWallet.publicKey);

    let signature = await mintTo(
        connection,
        fromWallet,
        mint,
        fromTokenAccount.address,
        fromWallet.publicKey,
        BigInt(value * 1e9),
    );

    res.contentType = 'json';
    var code = true;
    var txHash = signature;
    res.send({code, txHash});
});

// nft mint
server.post('/api/mintNFT', async (req, res) => {
    const q = parseBodyJson(req);

    if (q.privateKey === undefined ||
        q.metaurl === undefined ||
        q.name === undefined ||
        q.symbol === undefined ||
        q.privateKey === null ||
        q.metaurl === null ||
        q.name === null ||
        q.symbol === null) {
        return Promise.reject('params not enough');
    }

    var fromWallet = Keypair.fromSecretKey(bs58.decode(q.privateKey));

    var metaplex = new Metaplex(connection);
    metaplex.use(keypairIdentity(fromWallet));

    const mintNFTResponse = await metaplex.nfts().create({
        uri: q.metaurl,
        name: q.name,
        symbol: q.symbol,
        maxSupply: 1,
    });

    res.contentType = 'json';
    var code = true;
    var txHash = mintNFTResponse.response.signature;

    res.send({code, txHash});
});

server.listen(8089, '127.0.0.1', () => {
    console.log(`Server listening at ${server.url}`);
});
