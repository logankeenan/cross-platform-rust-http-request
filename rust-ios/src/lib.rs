use std::os::raw::{c_char};
use std::ffi::{CString};
use rust_core::http_request;

#[no_mangle]
pub extern fn make_http_request() -> *mut c_char {
    let response = http_request();

    CString::new(response).unwrap().into_raw()
}

#[no_mangle]
pub extern fn make_http_request_free(s: *mut c_char) {
    unsafe {
        if s.is_null() { return }
        CString::from_raw(s)
    };
}