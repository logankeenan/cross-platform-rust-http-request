#![cfg(target_os = "android")]
#![allow(non_snake_case)]

use jni::JNIEnv;
use jni::objects::{JObject};
use jni::sys::{jstring};
use rust_core::http_request;

#[no_mangle]
pub unsafe extern fn Java_com_example_android_MainActivity_makehttprequest(env: JNIEnv, _: JObject) -> jstring {
    let http_response = http_request();

    let output = env.new_string(http_response.to_owned()).unwrap();
    output.into_inner()
}