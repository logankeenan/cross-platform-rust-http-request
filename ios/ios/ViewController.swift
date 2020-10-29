import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let response_cString = make_http_request()
        let response = String(cString: response_cString!)
        make_http_request_free(UnsafeMutablePointer(mutating: response_cString))
        print(response)
    }
}

