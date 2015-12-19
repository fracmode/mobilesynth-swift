//
//  MobilesynthViewController.swift
//
//  Created by Sho Terunuma on 11/8/15.
//  Copyright © 2015 TestOrg. All rights reserved.
//

import UIKit

class MobilesynthViewController: UIViewController {

    let controlScrollView: ControlScrollView
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.loadControlViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadControlViews() {
    }
    
}

