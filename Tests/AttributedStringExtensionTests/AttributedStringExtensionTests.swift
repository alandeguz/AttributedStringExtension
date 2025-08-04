//
//  AttributedStringExtensionTests.swift
//  AttributedStringExtension
//
//  Created by Alan DeGuzman on 2025/07/26.
//  Copyright © 2025 Alan DeGuzman. All rights reserved.
//

import Foundation
import Testing
import SwiftUI

@testable import AttributedStringExtension

struct AttributedStringBuilderTests {

    @Test
    func appendingWithoutAttributes() {
        let result = AttributedString().appending("Hello").appending(" World")
        #expect(String(result.characters) == "Hello World")

        let attrs = NSAttributedString(result).attributes(at: 0, effectiveRange: nil)
        #expect(attrs.count == 0)
    }

    @Test
    func appendingWithAttributes() {
        let result = AttributedString()
            .appending("Hello") { container in
                container.foregroundColor = .red
            }
            .appending(" World")

        #expect(String(result.characters) == "Hello World")

        let runs = Array(result.runs)
        #expect(runs.count == 2)

        // First segment has red foreground color
        #expect(runs[0].attributes.foregroundColor == .red)
        // Second segment has no foreground color
        #expect(runs[1].attributes.foregroundColor == nil)
    }

    @Test
    func appendAndAppendingEquivalence() {
        var mutable = AttributedString("Start ")
        mutable.append("One") { $0.foregroundColor = .blue }

        let immutable = AttributedString("Start ")
            .appending("One") { $0.foregroundColor = .blue }

        #expect(mutable == immutable)
    }

    @Test
    func multipleAttributes() {
        let attributed = AttributedString()
            .appending("Styled") { container in
                container.backgroundColor = .yellow
                container.foregroundColor = .blue
                container.underlineStyle = .single
            }

        let run = attributed.runs.first!
        #expect(run.attributes.backgroundColor == .yellow)
        #expect(run.attributes.foregroundColor == .blue)
        #expect(run.attributes.underlineStyle == .single)
    }

    @Test
    func appendingEmptyString() {
        let original = AttributedString("Hello")
        let result = original.appending("")
        #expect(result == original)
    }

    @Test
    func attributesDoNotLeakBetweenSegments() {
        let attributed = AttributedString()
            .appending("One") { $0.foregroundColor = .red }
            .appending("Two")

        let runs = Array(attributed.runs)
        #expect(runs.count == 2)
        #expect(runs[1].attributes.foregroundColor == nil)
    }

    @Test
    func nsAttributedStringRoundTrip() {
        let original = AttributedString()
            .appending("Hello") { $0.foregroundColor = .green }
            .appending(" World")

        let bridged = NSAttributedString(original)
        let back = AttributedString(bridged)
        #expect(original == back)
    }

}
