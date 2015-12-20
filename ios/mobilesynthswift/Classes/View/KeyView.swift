//
//  KeyView.swift
//  mobilesynthswift
//
//  Created by Sho Terunuma on 12/20/15.
//  Copyright © 2015 TestOrg. All rights reserved.
//

import Foundation
import UIKit

class KeyView : UIView {
    var key:Int32 = 0
    var keyPressed:Bool = false

    // initWithFrame
    func initWithFrame( frame:CGRect, withKey keyNumber:Int32 ) {
        super.init(frame: frame)

        // old iOS
        // self.setBackgroundColor = UIColor.clearColor()
        // self.setMultipleTouchEnabled = true
        self.backgroundColor = UIColor.clearColor()
        self.multipleTouchEnabled = true
        self.key = keyNumber
        self.keyPressed = false
    }

}