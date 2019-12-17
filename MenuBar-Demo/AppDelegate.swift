//
//  AppDelegate.swift
//  MenuBar-Demo
//
//  Created by yxibng on 2019/12/17.
//  Copyright © 2019 yxibng. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)

    let popover = NSPopover.init()
    
    var eventMonitor: EventMonitor?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        popover.appearance = NSAppearance.init(named: .aqua)
        if let button = statusItem.button {
            button.image = NSImage.init(named: "StatusBarButtonImage")
            button.action = #selector(togglePopover(_:))
            button.toolTip = "dby menu bar"
        }
        popover.contentViewController = QuotesViewController.freshController()
        
        eventMonitor = EventMonitor.init(mask: [.rightMouseDown, .leftMouseDown], handler: { [weak self](event) in
            if let strongSelf = self, strongSelf.popover.isShown {
                strongSelf.closePopover(sender: event)
            }
        })
    }

    
    @objc func togglePopover(_ sender: Any?) {
        if popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }
    
    
    func showPopover(sender: Any?) {
        if let button = statusItem.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
        eventMonitor?.start()
    }
    
    func closePopover(sender: Any?)  {
        popover.performClose(sender)
        eventMonitor?.stop()
    }
    
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @objc func printQuote(_ sender: Any?) {
        let quoteText = "Never put off until tomorrow what you can do the day after tomorrow"
        let quoteAuthor = "Mark Twain"
        print("\(quoteText) - \(quoteAuthor)")
    }
    
    func constructMenu() {
        let menu = NSMenu.init()
        menu.addItem(NSMenuItem.init(title: "Print Quote", action: #selector(printQuote(_:)), keyEquivalent: "P"))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem.init(title: "Quit Quotes", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        statusItem.menu = menu
    }
}

