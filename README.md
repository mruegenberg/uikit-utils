uikit-utils
===========

Utilities for UIKit


uikit-utils
==========
This is a collection of useful classes and extensions for common classes in `UIKit`. It is extracted from the [objc-utils](https://github.com/mruegenberg/objc-utils) project.

What is in here
---------------
- Various categories to make the standard UIKit classes more useful
- A few helper classes with the same purpose

Compatibility
-------------
- All code requires an ARC (Automatic Reference Counting) capable compiler.
- Everything should be compatible with the iOS SDK 5 or above

How to use
----------
Just copy the files you need (and their dependencies) to your project. 

You can also use uikit-utils with [CocoaPods](http://cocoapods.org).

0.5.* vs 0.4.*
--------------
- *PopoverManager* was renamed to *DLPopoverManager*
- *UIDeviceHardware* removed. Use [UIDevice-Hardware](https://github.com/monospacecollective/UIDevice-Hardware) instead.
- `-[UIColor prussianBlueColor]` removed
- `UIColor+HelperAdditions.{h,m}` ~> `UIColor+DLHelperAdditions.{h,m}`
- `UIImage+Additions` ~> `UIImage+DLAdditions`

License
-------
MIT.
(Before version 0.5.0, the code used a custom permissive license.)
You can redistribute and use in your commercial or non-commercial projects all of this code. No guarantee is expressed or implied.
If you redistribute the code, license notices and the name of the original author (if contained in the code) must be preserved.

## Contact

![Travis CI build status](https://api.travis-ci.org/mruegenberg/uikit-utils.png)

Bug reports and pull requests are welcome! Contact me via e-mail or just by opening an issue on GitHub.
