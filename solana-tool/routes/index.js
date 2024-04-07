const router = require('koa-router')()
const WalletService = require("../service/wallet.js");
const service = new WalletService();

router.prefix('/solana/wallet');

router.get('/', async (ctx, next) => {
    await ctx.render('index', {
        title: 'Welcome to Solana Tool!',
    })
})

router.get('/gen', async (ctx, next) => {
    return await service.create(ctx, next);
})

router.get('/balance', async (ctx, next) => {
    return await service.getBalance(ctx, next);
})

module.exports = router
