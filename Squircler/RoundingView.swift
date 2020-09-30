//
//  RoundingView.swift
//  Squircler
//
//  Created by Aidan Cline on 9/30/20.
//

import Cocoa

class RoundingView: NSView {
    
    var hasDrawn = false
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        let path = NSBezierPath(roundedRect: dirtyRect, xRadius: 0, yRadius: 0)
        NSColor.black.set()
        let radius = CGFloat(Defaults.screenCornerRadius)
        path.append(NSBezierPath(roundedRect: dirtyRect, xRadius: radius, yRadius: radius))
        path.windingRule = .evenOdd
        path.close()
        path.fill()
        NSLog(hasDrawn ? "Redrew rounded corners" : "Drew rounded corners for the first time")
        hasDrawn = true
    }
    
}
