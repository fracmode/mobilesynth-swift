//
//  ControlScrollView.swift
//  mobilesynthswift
//
//  Created by Sho Terunuma on 19/12/2015.
//  Copyright © 2015 TestOrg. All rights reserved.
//

import Foundation
import UIKit

class ControlScrollView : UIScrollView {
    var touchDown:Bool
    
    // init
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // touchesBegan
    func touchesBegan( touches:NSSet, event:UIEvent ) {
        if (!self.touchDown) {
            self.touchDown = true
            super.touchesBegan( touches as! Set<UITouch>, withEvent:event )
        }
    }
    
    // touchesMoved
    func touchesMoved( touches:NSSet, event:UIEvent ) {
        if (!self.touchDown) {
            return
        }
        super.touchesMoved( touches as! Set<UITouch>, withEvent:event )
    }
 
    // touchesEnded
    func touchesEnded( touches:NSSet, event:UIEvent ) {
        if (!self.touchDown) {
            self.touchDown = true
            super.touchesEnded( touches as! Set<UITouch>, withEvent:event )
        }
    }

    // touchesCanceled
    func touchesCanceled( touches:NSSet, event:UIEvent ) {
        // Do not forward these events at all
    }

}