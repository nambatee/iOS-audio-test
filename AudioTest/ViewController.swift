import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let path = Bundle.main.path(forResource: "audio_test", ofType: "html") else {
            assertionFailure()
            return
        }
        let url = URL(fileURLWithPath: path)
        guard let text = try? String(contentsOfFile: path, encoding: String.Encoding.utf8) else {
            assertionFailure()
            return
        }
        webView.configuration.allowsInlineMediaPlayback = true
        webView.loadHTMLString(text, baseURL: url)
    }
}

