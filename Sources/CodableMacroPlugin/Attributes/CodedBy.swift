import SwiftSyntax

/// Attribute type for `CodedBy` macro-attribute.
///
/// This type can validate`CodedBy` macro-attribute
/// usage and extract data for `Codable` macro to
/// generate implementation.
struct CodedBy: PropertyAttribute {
    /// The node syntax provided
    /// during initialization.
    let node: AttributeSyntax

    /// Creates a new instance with the provided node.
    ///
    /// The initializer fails to create new instance if the name
    /// of the provided node is different than this attribute.
    ///
    /// - Parameter node: The attribute syntax to create with.
    /// - Returns: Newly created attribute instance.
    init?(from node: AttributeSyntax) {
        guard
            node.attributeName.as(SimpleTypeIdentifierSyntax.self)!
                .description == Self.name
        else { return nil }
        self.node = node
    }
}
