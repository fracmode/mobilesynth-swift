//
//  OctaveView.swift
//  mobilesynthswift
//
//  Created by Sho Terunuma on 26/12/2015.
//  Copyright © 2015 TestOrg. All rights reserved.
//

import Foundation
import UIKit

class OctaveView: UIView {
    
    let kKeysPerOctave = 12
    let kBlackKeyHeightScale = 0.62
    let kBlackKeyOffset = 0.68
    let kWhiteKeyNumbers:[Int32] = [0, 2, 4, 5, 7, 9, 11]
    var kWhiteKeyCount = 0
    let kBlackKey1Numbers = 1 3
    let kBlackKey1Count = sizeof(kBlackKey1Numbers) / sizeof(Int32)
    let kBlackKey2Numbers = 6 8 10
    let kBlackKey2Count = sizeof(kBlackKey2Numbers) / sizeof(Int32)
    
    // init
    init( frame: CGRect, withKey keyNumber: Int32 ) {
        self.kWhiteKeyCount = sizeof(kWhiteKeyNumbers) / sizeof(Int32)
        
        var keyFrame: CGRect
        keyFrame.origin.y = 0
        keyFrame.size.width = frame.size.width / kWhiteKeyCount
        keyFrame.size.height = frame.size.height
        for var i = 0; i < kWhiteKeyCount; ++i {
            keyFrame.origin.x = i * keyFrame.size.width
            var key = WhiteKeyView(frame: keyFrame, withKey: keyNumber + kWhiteKeyNumbers[i])
            self.addSubview(key)
        }
        keyFrame.origin.x = kBlackKeyOffset * keyFrame.size.width
        keyFrame.size.height = kBlackKeyHeightScale * frame.size.height
        for var i = 0; i < kBlackKey1Count; ++i {
            var key = BlackKeyView(frame: keyFrame, withKey: keyNumber + kBlackKey1Numbers[i])
            self.addSubview(key)
            keyFrame.origin.x += keyFrame.size.width
        }
        keyFrame.origin.x += keyFrame.size.width
        for var i = 0; i < kBlackKey2Count; ++i {
            var key = BlackKeyView(frame: keyFrame, withKey: keyNumber + kBlackKey2Numbers[i])
            self.addSubview(key)
            keyFrame.origin.x += keyFrame.size.width
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // keyCount
    func keyCount() -> Int32 {
        return kKeysPerOctave
    }
    
    func reset() {
        var count = self.subviews().count()
        for var i = 0; i < count; ++i {
            var keyView = self.subviews().objectAtIndex(i) as! KeyView
            keyView.keyUp()
        }
    }
    
    func isOpaque() -> Bool {
        return true
    }
    
}
