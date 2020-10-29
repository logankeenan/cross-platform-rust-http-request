use std::collections::HashMap;

pub fn http_request() -> String {
    let client = reqwest::blocking::Client::new();
    let response = client.get("https://httpbin.org/ip").send().unwrap();
    let resp = response.json::<HashMap<String, String>>().unwrap();
    format!("{:#?}", resp)
}
