//
//  WindowController.swift
//  TouchBarBar
//
//  Created by Guidouil on 10/29/16.
//  Modified by Blake Frederick on 11/28/19.
//

import Cocoa

@available(OSX 10.12.2, *)
fileprivate extension NSTouchBar.CustomizationIdentifier {
    static let touchBar = NSTouchBar.CustomizationIdentifier("com.blakefrederick.touchbarbar")
}

@available(OSX 10.12.2, *)
fileprivate extension NSTouchBarItem.Identifier {
    static let oof = NSTouchBarItem.Identifier("")
    static let longjump = NSTouchBarItem.Identifier("longjump")
    static let longjumpover9000 = NSTouchBarItem.Identifier("longjumpover9000")
    static let chainchomp = NSTouchBarItem.Identifier("chainchomp")
    static let champagne = NSTouchBarItem.Identifier("champagne")
    static let cocktail = NSTouchBarItem.Identifier("cocktail")
    static let beer = NSTouchBarItem.Identifier("beer")
    static let martini = NSTouchBarItem.Identifier("martini")
}

class WindowController: NSWindowController, NSTouchBarDelegate {
    override func windowDidLoad() {
        super.windowDidLoad()
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

    @objc func Soundboard(sender: NSButton) {
        let title = sender.title
        
        guard let sound = NSSound(named: NSSound.Name(rawValue: title)) else {
            return
        }
        sound.play()
    }

    @available(OSX 10.12.2, *)
    override func makeTouchBar() -> NSTouchBar? {
        let touchBar = NSTouchBar()
        touchBar.delegate = self
        touchBar.customizationIdentifier = .touchBar
        touchBar.defaultItemIdentifiers = [.oof, .longjump, .longjumpover9000, .chainchomp, .champagne, .cocktail, .beer, .martini]
        
        return touchBar
    }
    
    @available(OSX 10.12.2, *)
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
        let touchBarItem = NSCustomTouchBarItem(identifier: identifier)
        switch identifier {
        case NSTouchBarItem.Identifier.oof:
            let buttonImage = NSImage(imageLiteralResourceName: "oof")
            let button = NSButton(title: "oof", image: buttonImage, target: self, action: #selector(Soundboard))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItem.Identifier.longjump:
            let buttonImage = NSImage(imageLiteralResourceName: "longjump")
            let button = NSButton(title: "longjump", image: buttonImage, target: self, action: #selector(Soundboard))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItem.Identifier.longjumpover9000:
            let buttonImage = NSImage(imageLiteralResourceName: "longjumpover9000")
            let button = NSButton(title: "longjumpover9000", image: buttonImage, target: self, action: #selector(Soundboard))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItem.Identifier.chainchomp:
            let buttonImage = NSImage(imageLiteralResourceName: "chainchomp")
            let button = NSButton(title: "chainchomp", image: buttonImage, target: self, action: #selector(Soundboard))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItem.Identifier.champagne:
            let button = NSButton(title: "🍾", target: self, action: #selector(Soundboard))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItem.Identifier.beer:
            let button = NSButton(title: "🍺", target: self, action: #selector(Soundboard))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItem.Identifier.cocktail:
            let button = NSButton(title: "🍹", target: self, action: #selector(Soundboard))
            touchBarItem.view = button
            return touchBarItem
        case NSTouchBarItem.Identifier.martini:
            let button = NSButton(title: "😬", target: self, action: #selector(Soundboard))
            touchBarItem.view = button
            return touchBarItem
        default:
            let button = NSButton(title: "🍹", target: self, action: #selector(Soundboard))
            touchBarItem.view = button
            return touchBarItem
        }
    }
}
