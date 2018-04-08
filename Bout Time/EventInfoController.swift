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
    
    
    @IBOutlet weak var webViewOutlet: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let str = ""
        let siteURL = NSURL (string: str);
        webViewOutlet.load(URLRequest(url: siteURL! as URL));

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func closeView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
