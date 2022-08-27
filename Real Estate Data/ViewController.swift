//
//  ViewController.swift
//  Real Estate Data
//
//  Created by Rohit Singh Dhakad on 19/02/22.
//

import UIKit
import WebKit


class ViewController: UIViewController {
    
    @IBOutlet var webVw: WKWebView!
    let configuration = WKWebViewConfiguration()
    let wkPreferences = WKPreferences()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wkPreferences.javaScriptCanOpenWindowsAutomatically = true
        configuration.preferences = wkPreferences
        webVw.navigationDelegate = self
        webVw.uiDelegate = self
        webVw.configuration.preferences.javaScriptEnabled = true
        webVw.configuration.preferences.javaScriptCanOpenWindowsAutomatically = true
        self.loadUrl(strUrl: "https://aiaqar.com/pagies/homepage.php")

    }

    func loadUrl(strUrl:String){
             let url = NSURL(string: strUrl)
             let request = NSURLRequest(url: url! as URL)
        self.webVw.load(request as URLRequest)
         }
      

}


extension ViewController: WKUIDelegate {
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String,
                 initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        
        let alertController = UIAlertController(title: message, message: nil,
                                                preferredStyle: UIAlertController.Style.alert);
        
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel) {
            _ in completionHandler()}
        );
        
        self.present(alertController, animated: true, completion: {});
    }
    
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {

        switch navigationAction.request.url?.scheme {
        case "tel":
            UIApplication.shared.open(navigationAction.request.url!, options: [:], completionHandler: nil)
            decisionHandler(.cancel)
            break
        default:
            decisionHandler(.allow)
            break
        }
    }
    
}


extension ViewController: WKNavigationDelegate{
    
    private func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError) {
        print(error.localizedDescription)
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Strat to load")
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finish to load")
    }
}
