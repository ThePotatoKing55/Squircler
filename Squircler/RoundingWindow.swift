//
//  RoundingWindow.swift
//  Squircler
//
//  Created by Aidan Cline on 9/30/20.
//

import Cocoa

class RoundingWindow: NSWindow {
    
    override func constrainFrameRect(_ frameRect: NSRect, to screen: NSScreen?) -> NSRect {
        return frameRect
    }
    
}
