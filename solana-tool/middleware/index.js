/**
 * Request parameters middleware
 */
const routerParams = async function (ctx, next) {
    console.log('\n===> ctx.query = %s', JSON.stringify(ctx.query))
    console.log('\n===> ctx.request.body = %s', JSON.stringify(ctx.request.body))
    ctx.params = {
        ...ctx.query,
        ...ctx.request.body,
    }
    await next()
}

const routerRequest = async function async(ctx, next) {
    const options = {
        url: ctx.request.url,
        method: ctx.request.method,
        headers: ctx.request.headers,
        params: {
            ...ctx.query,
            ...ctx.request.body,
        },
        ip: ctx.request.ip,
    }
    console.log("\n===> requestHandler = %s", JSON.stringify(options, null, 2))
    await next()
}

const routerResponse = function (config = {}) {
    return async function (ctx, next) {
        ctx.success = function (data, msg) {
            ctx.type = config.type || 'json'
            let resMsg = ctx.response.message;
            if (resMsg !== null && resMsg !== '' && resMsg.toLowerCase() === 'ok') {
                resMsg = 'success';
            }
            ctx.body = {
                code: config.successCode || 200,
                msg: msg || resMsg || 'success',
                data: data
            }
        }
        ctx.failure = function (msg, code) {
            ctx.type = config.type || 'json'
            ctx.body = {
                code: code || config.failureCode || 500,
                msg: msg || ctx.response.message || 'failure',
            }
        }
        if (ctx.response.status === 404) {
            ctx.body = {
                code: 404,
                msg: `${ctx.request.method} ${ctx.request.url} ${ctx.response.message}`
            }
        }
        await next()
        console.log('\n<------ routerResponse <------\n%s', JSON.stringify(ctx.response, null, 2));
    }
}

module.exports = {
    routerParams,
    routerRequest,
    routerResponse,
}
