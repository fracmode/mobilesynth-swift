//
//  TouchForwardingUIScrollView.swift
//  mobilesynthswift
//
//  Created by Sho Terunuma on 22/12/2015.
//  Copyright © 2015 TestOrg. All rights reserved.
//

import Foundation
import UIKit

class TouchForwardingUIScrollView: UIScrollView {
    var touchView: UIView? = nil

    // touchesEnded
    func _touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        super.touchesEnded(touches as! Set<UITouch>, withEvent: event)
        let subview:UIView? = self.hitSubview(touches, withEvent: event)
        if ( subview != nil ) {
            self.touchView!.touchesEnded(touches as! Set<UITouch>, withEvent: event)
        }
    }
    
    // hitSubview
    func hitSubview(touches: NSSet, withEvent event: UIEvent) -> UIView? {
        let touchArray = touches.allObjects as NSArray
        for var i = 0; i < touchArray.count; ++i {
            let touch = touchArray.objectAtIndex(i)
            let point = touch.locationInView(self)
            let subview:UIView? = self.hitTest(point, withEvent: event)
            if ( subview != nil ) {
                return subview
            }
        }
        return nil
    }
}