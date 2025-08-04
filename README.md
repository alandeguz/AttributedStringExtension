# AttributedStringExtension

[![Language: Swift](https://img.shields.io/badge/language-swift-f48041.svg?style=flat)](https://developer.apple.com/swift)
[![Version: Swift 5.9](https://img.shields.io/badge/swift-5.9-F16D39.svg?style=flat)](https://www.swift.org/blog/swift-5.9-released/)
![Platform: macOS 12+ iOS 15+ tvOS 15+ visionOS 1+](https://img.shields.io/badge/target-macOS%2012%2B%20iOS%2015%2B%20tvOS%2015%2B%20visionOS%201%2B-blue.svg?style=flat)
[![Xcode](https://img.shields.io/badge/Xcode-13+-007ACC?style=&logo=Xcode&logoColor=white)](https://developer.apple.com/xcode/)

* [Summary](#summary)
* [Key Features](#key-features)
* [Example](#example)

## Summary

`AttributedStringExtension` is a lightweight Swift package that introduces a fluent, builder‑style API for creating and appending [`AttributedString`](https://developer.apple.com/documentation/foundation/attributedstring) values with custom attributes using [`AttributeContainer`](https://developer.apple.com/documentation/foundation/attributecontainer). This package provides a minimal alternative to more complex libraries. 

## Key Features

1. **Lightweight**  
   Distributed as a single file with two public methods. If you prefer not to use Swift Package Manager, you can copy the single‑file [gist version](https://gist.github.com/alandeguz/e2e6764b42cff517e1d323a24288c06b) directly into your project.

2. **Straightforward**  
   Extends `AttributedString` directly, with no additional classes, helpers, or boilerplate.

3. **Builder‑Style Attribute Configuration**  
   Each appended string segment can be configured with a closure that modifies an `AttributeContainer`. This makes it easy to compose rich attributed strings in a clear, declarative style.

4. **Consistent API Design**  
   The added methods `append(_:)` and `appending(_:)` align with the naming and usage patterns of `String.append(_:)` and `StringProtocol.appending(_:)`.

## Example

**Immutable, chainable API:**

```swift
import AttributedStringExtension
import SwiftUI

let str = AttributedString()
    .appending("Hello") { container in
        container.foregroundColor = .blue
        container.underlineStyle = .single
    }
    .appending(" World")
```

**Mutating API:**

```swift
import AttributedStringExtension
import SwiftUI

var str = AttributedString("Hello ")
str.append("World") { container in
    container.foregroundColor = .red
}
```
