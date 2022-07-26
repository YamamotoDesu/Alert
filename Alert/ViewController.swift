//
//  ViewController.swift
//  Alert
//
//  Created by 山本響 on 2022/07/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private(set) var button: UIButton!
    
    @IBAction private func buttonTap() {
        let alert = UIAlertController(
            title: "Do the Thing?",
            message: "Let us know if you want to do the thing.",
            preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: { _ in
                print(">> Cancel")
            })
        
        let okAction = UIAlertAction(
            title: "OK",
            style: .default,
            handler: { _ in
                print(">> OK")
        })
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        alert.preferredAction = okAction
        present(alert, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

