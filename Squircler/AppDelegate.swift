//
//  AppDelegate.swift
//  squircler
//
//  Created by Aidan Cline on 9/29/20.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var configWindowController: ConfigWindowController?
    var roundingWindowController: RoundingWindowController!
    var roundingWindow: RoundingWindow?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        roundingWindow = RoundingWindow()
        roundingWindowController = RoundingWindowController(window: roundingWindow)
        roundingWindowController.window?.orderFrontRegardless()
        if !Defaults.hasSetRadius {
            configWindowController?.window?.makeKeyAndOrderFront(self)
            NSApp.activate(ignoringOtherApps: true)
        } else {
            configWindowController?.close()
        }
    }
    
    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        configWindowController?.window?.makeKeyAndOrderFront(self)
        return false
    }
    
    @IBAction func closeWindow(_ menuItem: NSMenuItem) {
        configWindowController?.close()
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
}
