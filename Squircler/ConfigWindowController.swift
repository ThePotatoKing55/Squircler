//
//  WindowController.swift
//  Squircler
//
//  Created by Aidan Cline on 9/29/20.
//

import Cocoa

extension NSToolbarItem.Identifier {
    public static let quit = NSToolbarItem.Identifier("QUIT")
}

class ConfigWindowController: NSWindowController, NSToolbarDelegate {
    
    struct ToolbarItemIdentifier {
        private init() {}
        static let quit = "QUIT"
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        window?.toolbar = NSToolbar(identifier: "DEFAULT")
        window?.isMovableByWindowBackground = true
        let toolbar = (window?.toolbar)!
        toolbar.allowsUserCustomization = false
        toolbar.delegate = self
        toolbar.insertItem(withItemIdentifier: .flexibleSpace, at: 0)
        toolbar.insertItem(withItemIdentifier: .quit, at: 1)
        (NSApp.delegate as? AppDelegate)?.configWindowController = self
    }
    
    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        [.flexibleSpace, .quit]
    }
    
    func toolbarSelectableItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        []
    }
    
    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        [.flexibleSpace, .quit]
    }
    
    func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier, willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        if itemIdentifier == .quit {
            let quitItem = NSToolbarItem(itemIdentifier: .quit)
            quitItem.action = #selector(self.quit)
            quitItem.title = "Quit"
            quitItem.label = "Quit"
            quitItem.image = NSImage()
            quitItem.isBordered = true
            quitItem.visibilityPriority = .high
            return quitItem
        }
        
        return nil
    }
    
    @objc func quit() {
        NSApp.terminate(nil)
    }
    
}
