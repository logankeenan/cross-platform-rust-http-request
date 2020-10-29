use neon::prelude::*;
use rust_core::http_request;

fn make_http_request(mut cx: FunctionContext) -> JsResult<JsString> {
    let result = http_request();
    Ok(cx.string(result))
}

register_module!(mut cx, {
    cx.export_function("make_http_request", make_http_request)
});
