//
//  ViewController.swift
//  KonfioApp
//
//  Created by Cristian Hernandez Garcia on 30/10/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let controller = HomeRouter.createModule()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
