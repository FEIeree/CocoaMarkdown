//
//  ViewController.swift
//  Example-iOS
//
//  Created by Indragie on 1/15/15.
//  Copyright (c) 2015 Indragie Karunaratne. All rights reserved.
//

import UIKit
import CocoaMarkdown

class ViewController: UIViewController, UITextViewDelegate {
    @IBOutlet var textView: UITextView!

    var renderer: CMAttributedStringRenderer?
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "test", ofType: "md")!
        let document = CMDocument(contentsOfFile: path, options: .sourcepos)
        renderer = CMAttributedStringRenderer(document: document, attributes: CMTextAttributes())
        renderer!.registerCustomURLSchemes(["howdyhub"])
        renderer!.register(CMHTMLStrikethroughTransformer())
        renderer!.register(CMHTMLSuperscriptTransformer())
        renderer!.register(CMHTMLUnderlineTransformer())
        renderer!.renderAndSync(with: textView)
        textView.isEditable = false
        textView.isSelectable = true
        textView.delegate = self
    }

    @nonobjc func textView(textView: UITextView, shouldInteractWithTextAttachment textAttachment: NSTextAttachment, inRange characterRange: NSRange) -> Bool {
        if let textAttachment = textAttachment as? CMTextAttachment, let url = textAttachment.url {
            UIApplication.shared.openURL(url)
            return false
        }
        return true
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        print("DID END PARSING")
    }
}

