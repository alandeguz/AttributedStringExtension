//
//  AttributedStringExtension.swift
//  AttributedStringExtension
//
//  Created by Alan DeGuzman on 2025/07/26.
//  Copyright © 2025 Alan DeGuzman. All rights reserved.
//

import Foundation

///  extension methods for AttributedString for builder pattern
///
public extension AttributedString {

    typealias AttributeContainerMethod = (inout AttributeContainer) -> ()

    /// Returns a new attribute string created by appending the given string, exposing an attribute container in a closure.
    ///
    /// The following example builds a customized attributed string by using the
    /// `appending(_:)` method:
    ///
    ///        let str = AttributedString()
    ///            .appending("This is") {container in
    ///                container.backgroundColor = .yellow
    ///                container.foregroundColor = .blue
    ///                container.underlineStyle = .single
    ///                container.underlineColor = .green
    ///            }
    ///            .appending(" a test ")
    ///            .appending("of the attributed string") {
    ///                $0.backgroundColor = .red
    ///                $0.foregroundColor = .orange
    ///                $0.underlineColor = .purple
    ///            }
    ///            .appending(" builder.") {
    ///                $0.backgroundColor = .gray
    ///            }
    ///
    /// - Parameters:
    ///   - s:  The string to append to this instance.
    ///   - configureAttributes:  The action to configure the AttributeContainer.
    func appending(_ s: some StringProtocol, configureAttributes: AttributeContainerMethod? = nil) -> AttributedString {
        let container = makeContainer(using: configureAttributes)
        var string = self
        string.append(AttributedString(s).mergingAttributes(container))
        return string
    }

    /// Appends a string to the attribute string, exposing an attribute container in a closure.
    ///
    /// The following example builds a customized attributed string by using the
    /// `append(_:)` method:
    ///
    ///        var str = AttributedString("This ")
    ///        str.append("is") {container in
    ///            container.backgroundColor = .yellow
    ///            container.foregroundColor = .blue
    ///            container.underlineStyle = .single
    ///            container.underlineColor = .green
    ///        }
    ///        str.append(" a test ")
    ///        str.append("of the attributed string") {
    ///            $0.backgroundColor = .red
    ///            $0.foregroundColor = .orange
    ///            $0.underlineColor = .purple
    ///        }
    ///        str.append(" builder.") {
    ///            $0.backgroundColor = .gray
    ///        }
    ///
    /// - Parameters:
    ///   - s:  The string to append to this instance.
    ///   - configureAttributes:  The action to configure the AttributeContainer.
    mutating func append(_ s: some StringProtocol, configureAttributes: AttributeContainerMethod? = nil) {
        let container = makeContainer(using: configureAttributes)
        self.append(AttributedString(s).mergingAttributes(container))
    }

    private func makeContainer(using configure: AttributeContainerMethod?) -> AttributeContainer {
        var container = AttributeContainer()
        configure?(&container)
        return container
    }

}
