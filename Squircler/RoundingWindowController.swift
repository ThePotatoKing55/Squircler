//
//  RoundingWindowController.swift
//  Squircler
//
//  Created by Aidan Cline on 9/30/20.
//

import Cocoa

class RoundingWindowController: NSWindowController {
    
    override init(window: NSWindow?) {
        super.init(window: window)
        guard let window = window as? RoundingWindow else { fatalError("Rounding window either doesn't exist or isn't the right class; can't configure!") }
        NotificationCenter.default.addObserver(forName: .setScreenCornerRadius, object: nil, queue: .main) { (_) in
            guard let screen = window.screen else {
                NSLog("Rounding window was told to redraw corners, but doesn't have a screen ")
                return
            }
            guard let view = window.contentView as? RoundingView else {
                NSLog("Rounding window was told to redraw corners, but doesn't have a valid view")
                return
            }
            
            view.setNeedsDisplay(view.bounds)
            window.setFrame(screen.frame, display: true)
            NSLog("Observed corner radius change")
        }
        
        configure(window: window)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(window: RoundingWindow) {
        guard let screen = window.screen else { fatalError("Rounding window doesn't have an associated screen; can't configure!") }
        window.level = .mainMenu + 2
        window.styleMask = [.borderless]
        window.backgroundColor = .clear
        window.ignoresMouseEvents = true
        window.collectionBehavior = [.stationary, .canJoinAllSpaces, .ignoresCycle]
        window.isOpaque = false
        window.setFrame(screen.frame, display: true)
        window.contentView = RoundingView(frame: NSRect(origin: .zero, size: window.frame.size))
    }
    
}
