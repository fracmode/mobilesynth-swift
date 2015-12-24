//
//  BlackKeyView.swift
//  mobilesynthswift
//
//  Created by Sho Terunuma on 24/12/2015.
//  Copyright © 2015 TestOrg. All rights reserved.
//

import Foundation
import UIKit

class BlackKeyView: KeyView {
    let kKeySideStartColor: CGFloat = 0.05
    let kKeySideEndColor: CGFloat = 0.41
    let kKeyTopColor: CGFloat = 0.32
    let kKeyGradientSteps = 3

    // shrinkRect
    func shrinkRect(var rect: CGRect, amount pixels: Int32) -> CGRect {
        let _pixels = CGFloat( pixels )
        rect.origin.x += _pixels
        rect.origin.y += _pixels
        rect.size.width -= _pixels * 2
        rect.size.height -= _pixels * 2
        return rect
    }
    
    // drawRect
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        var fillcolor: [CGFloat] = [ kKeySideStartColor, kKeySideStartColor, kKeySideStartColor, 1.0 ]
        CGContextSaveGState(context)
        CGContextSetShadow(context, CGSizeMake(0.0, -3.0), 4.0)
        CGContextBeginPath(context)
        var fillRect = self.shrinkRect(rect, amount: 4)
        fillRect.size.height -= 5
        fillRect.size.width -= 2
        CGContextSetLineWidth(context, 10.0)
        CGContextSetLineJoin(context, CGLineJoin.Round)
        CGContextSetStrokeColor(context, fillcolor)
        CGContextAddRect(context, fillRect)
        CGContextStrokePath(context)
        CGContextRestoreGState(context)
        fillcolor[0] = kKeyTopColor
        fillcolor[1] = kKeyTopColor
        fillcolor[2] = kKeyTopColor
        fillRect = self.shrinkRect(fillRect, amount: 5)
        fillRect.origin.y -= 1
        CGContextSetStrokeColor(context, fillcolor)
        CGContextSetLineJoin(context, CGLineJoin.Round)
        CGContextSetLineWidth(context, 7.0)
        CGContextAddRect(context, fillRect)
        CGContextStrokePath(context)
        CGContextSetFillColor(context, fillcolor)
        CGContextFillRect(context, fillRect)
        fillcolor[0] = kKeySideEndColor
        fillcolor[1] = kKeySideEndColor
        fillcolor[2] = kKeySideEndColor
        fillRect = self.shrinkRect(fillRect, amount: -2)
        CGContextSetStrokeColor(context, fillcolor)
        CGContextSetLineJoin(context, CGLineJoin.Round)
        CGContextSetLineWidth(context, 1.0)
        CGContextAddRect(context, fillRect)
        CGContextStrokePath(context)
        if keyPressed {
            let colors: [CGFloat] = [0.1, 0.1, 0.1, 0.0, 0.1, 0.1, 0.1, 0.8]
            let locations: [CGFloat] = [1, 0]
            let colorSpace = CGColorSpaceCreateDeviceRGB()
            let topGradient = CGGradientCreateWithColorComponents(colorSpace, colors, locations, 2)
            var startPoint = CGPoint()
            startPoint.x = 0
            startPoint.y = 0
            var endPoint = CGPoint()
            endPoint.x = 0
            endPoint.y = rect.size.height - 4
            CGContextDrawLinearGradient(context, topGradient, startPoint, endPoint, CGGradientDrawingOptions(rawValue: 0) )
        }
    }
}
