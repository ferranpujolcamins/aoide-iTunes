Open the `Package.swift` file with Xcode.

The protocols in the `ITunesModel` package exist because the classes in `iTunesLibrary`
have read-only stored properties, and thus we cannot create subclasses were the properties
can be set to an arbitrary value to use in tests.
