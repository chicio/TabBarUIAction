# TabBarUIAction

[![Build iOS](https://github.com/chicio/TabBarUIAction/actions/workflows/build-ios.yml/badge.svg)](https://github.com/chicio/TabBarUIAction/actions/workflows/build-ios.yml)
[![Build iPadOS](https://github.com/chicio/TabBarUIAction/actions/workflows/build-ipados.yml/badge.svg)](https://github.com/chicio/TabBarUIAction/actions/workflows/build-ipados.yml)
[![Build macOS](https://github.com/chicio/TabBarUIAction/actions/workflows/build-macos.yml/badge.svg)](https://github.com/chicio/TabBarUIAction/actions/workflows/build-macos.yml)
![SwiftLint](https://github.com/chicio/TabBarUIAction/workflows/SwiftLint/badge.svg)
[![codecov](https://codecov.io/gh/chicio/TabBarUIAction/branch/main/graph/badge.svg?token=c8kYDnOOhu)](https://codecov.io/gh/chicio/TabBarUIAction)
[![Supported platform](https://img.shields.io/badge/platform-macOS%20%7C%20iOS%20%7C%20iPadOS-orange.svg)](https%3A%2F%2Fimg.shields.io%2Fbadge%2Fplatform-macOS%20%7C%20iOS%20%7C%20iPadOS-orange.svg)
[![codebeat badge](https://codebeat.co/badges/5b39bd5d-32fc-45a9-987c-d38abe4c97f5)](https://codebeat.co/projects/github-com-chicio-tabbaruiaction-main)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/chicio/TabBarUIAction/master/LICENSE.md)
 
📚📱 A SwiftUI custom TabBar view with action button for modal content display. Fully compatible with Mac Catalyst. 📚📱

<p align="center">
  <img src="https://raw.githubusercontent.com/chicio/TabBarUIAction/master/Screenshots/zxr.png">
</p>

***

### Installation

There are three ways to install `TabBarUIAction` in your project: manual installation, as a standalone framework or using cocoapods.

**Manual installation**

To manually install `TabBarUIAction` simply drag and drop all the file contained in the [Source](https://github.com/chicio/TabBarUIAction/tree/master/Source) folder inside your project.

**Framework**

`TabBarUIAction` is available also as a framework. To install it follow the standard procedure used to install a custom cocoa touch framework:

- drag the TabBarUIAction.xcodeproj inside your project 
- add it to the Embedded Binaries/Linked Frameworks and Libraries section of your project. 

See the `TabBarUIAction` demo project/target for an example of the setup of the framework.

**CocoaPods**

`TabBarUIAction` is also available as a pod on <a href="https://cocoapods.org/pods/TabBarUIAction">CocoaPods</a>.
Add the dependency to your Podfile similar to the following:

```
target 'MyApp' do
    pod 'TabBarUIAction', '~> 0.8'
end
```

and then run pod install (or pod update).

**Swift Package Manager (SPM)**

`TabBarUIAction` is also available as a SPM package. Add it from the project configuration using the Github repository url. Choose master or a tag. 

![spm 1](https://raw.githubusercontent.com/chicio/TabBarUIAction/master/Screenshots/spm1.png)
![spm 2](https://raw.githubusercontent.com/chicio/TabBarUIAction/master/Screenshots/spm2.png)
![spm 3](https://raw.githubusercontent.com/chicio/TabBarUIAction/master/Screenshots/spm3.png)

***

### Usage

....

***

### Documentation

You can find the complete api documentation on [fabrizioduroni.it](https://tabbaruiaction.fabrizioduroni.it "TabBarUIAction doc").

***

### Examples

In the following screenshot you can find some TabBarUIAction usage examples. You can find this examples in the [demo project](https://github.com/chicio/TabBarUIAction/tree/master/TabBarUIActionDemo).

<p align="center">
<img  hspace="50" src="https://raw.githubusercontent.com/chicio/TabBarUIAction/master/Screenshots/YYY.png">
</p>

