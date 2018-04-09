//
//  EventInfoController.swift
//  Bout Time
//
//  Created by Jaakko Kenttä on 07/04/2018.
//  Copyright © 2018 Jaakko Kenttä. All rights reserved.
//

import UIKit
import WebKit

class EventInfoController: UIViewController {
    
    var webDestination = ""
    
    @IBOutlet weak var webViewOutlet: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let siteURL = NSURL (string: webDestination);
        webViewOutlet.load(URLRequest(url: siteURL! as URL));

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func closeView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
