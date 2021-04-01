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

![tabbaruiaction logo](https://github.com/chicio/TabBarUIAction/blob/main/Screenshots/logo-github.png?raw=true)

***

### Installation

There are three ways to install `TabBarUIAction` in your project: manual installation, as a standalone framework or using cocoapods.

**Manual installation**

To manually install `TabBarUIAction` simply drag and drop all the file contained in the [Source](https://github.com/chicio/TabBarUIAction/tree/master/Source) folder inside your project.

**Framework**

`TabBarUIAction` is available also as a framework. To install it follow the standard installation procedure for a cocoa touch framework:

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

`TabBarUIAction` is also available as a SPM package. Add it from the project configuration using the Github repository url. Choose main branch or a tag. 
See the [DemoSPM](https://github.com/chicio/TabBarUIAction/tree/main/DemoSPM) project for an example of the setup with the Swiftp Package Manager.

![spm](https://raw.githubusercontent.com/chicio/TabBarUIAction/master/Screenshots/spm.png)

***

### Usage

To use `TabBarUIAction` in your app you have to:

* import `TabBarUIAction` in your SwiftUI view
* define two `@State` variables:
   * a `currentTab` state variable of type `TabPosition`
   * a `showModal` state variable of type `Bool`
* configure it with colors and screens content

Below you can find two examples of tab bar:
* one with 3 screens: 2 standard tabs screen and a modal.
* one with 5 screens: 4 standard tabs screen and a modal.

```swift
import SwiftUI
import TabBarUIAction

struct YourView: View {
    @State private var currentTab: TabPosition = .tab1
    @State private var showModal: Bool = false
    //... other state of your views

    var body: some View {
        VStack {
            TabBarUIAction(
                currentTab: $currentTab,
                showModal: $showModal,
                colors: Colors(
                    tabBarBackgroundColor: Color(.white),
                    tabItemsColors: TabItemsColors(
                        tabItemColor: Color(.black),
                        tabItemSelectionColor: Color(.blue)
                    )
                )
            ) {
                TabScreen(
                    tabItem: TabItemContent(
                        systemImageName: "folder.badge.plus",
                        text: "Tab Item 1",
                        font: Font.system(size: 16)
                    )
                ) {
                    /**
                        Your first tab screen. Could be any SwiftUI view.
                        For example...
                    */
                    VStack {
                        ///...other content
                    }
                }
                TabModal {
                    /**
                        Define an element to be used as tab bar modal item.
                        Here you can find an exampl: an image used as button.
                     */   
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 55, height: 55, alignment: .center)
                        .foregroundColor(Color(.systemBlue))
                        .background(Color(.white))
                        .cornerRadius(55/2)
                        .overlay(RoundedRectangle(cornerRadius: 55/2).stroke(Color(.blue), lineWidth: 2))
                        .accessibility(identifier: "TabBarModalButton")
                } content: {
                    /**
                        Your modal screen. Could be any SwiftUI view.
                        For example...
                    */
                    VStack {
                        ///...other content
                    }
                }
                TabScreen(
                    tabItem: TabItemContent(systemImageName: "gear", text: "Tab Item 2", font: Font.system(size: 16))
                ) {
                    /**
                        Your second tab screen. Could be any SwiftUI view.
                        For example...
                    */
                    VStack {
                        ///...other content
                    }
                }
            }
        }
    }
}
```
```swift
import SwiftUI
import TabBarUIAction

struct YourView: View {
    @State private var currentTab: TabPosition = .tab1
    @State private var showModal: Bool = false

    var body: some View {
        VStack {
            TabBarUIAction(
                currentTab: $currentTab,
                showModal: $showModal,
                colors: Colors(
                    tabBarBackgroundColor: Color(.systemGray5),
                    tabItemsColors: TabItemsColors(
                        tabItemColor: Color(.systemPurple),
                        tabItemSelectionColor: Color(.systemIndigo)
                    )
                )
            ) {
                TabScreen(
                    tabItem: TabItemContent(
                        systemImageName: "tray.fill",
                        text: "Tab Item 1",
                        font: Font.system(size: 12)
                    )
                ) { 
                    /**
                        Your first tab screen. Could be any SwiftUI view.
                        For example...
                    */
                    VStack {
                        ///...other content
                    }
                }
                TabScreen(
                    tabItem: TabItemContent(
                        systemImageName: "gamecontroller.fill",
                        text: "Tab Item 2",
                        font: Font.system(size: 12)
                    )
                ) { 
                    /**
                        Your first tab screen. Could be any SwiftUI view.
                        For example...
                    */
                    VStack {
                        ///...other content
                    }
                }
                TabModal {
                    /**
                        Define an element to be used as tab bar modal item.
                        Here you can find an exampl: an image used as button.
                     */   
                    Image(systemName: "plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30, alignment: .center)
                        .foregroundColor(Color(.white))
                        .padding(10)
                        .background(Color(.systemRed))
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.systemRed), lineWidth: 2))
                        .accessibility(identifier: "TabBarModalButton")
                } content: {
                    /**
                        Your modal screen. Could be any SwiftUI view.
                        For example...
                    */
                    VStack {
                        ///...other content
                    }
                }
                TabScreen(
                    tabItem: TabItemContent(
                        systemImageName: "dpad.fill",
                        text: "Tab Item 3",
                        font: Font.system(size: 12)
                    )
                ) { 
                    /**
                        Your first tab screen. Could be any SwiftUI view.
                        For example...
                    */
                    VStack {
                        ///...other content
                    }
                }
                TabScreen(
                    tabItem: TabItemContent(
                        systemImageName: "l1.rectangle.roundedbottom.fill",
                        text: "Tab Item 4",
                        font: Font.system(size: 12)
                    )
                ) { 
                    /**
                        Your first tab screen. Could be any SwiftUI view.
                        For example...
                    */
                    VStack {
                        ///...other content
                    }
                }
            }
        }
    }
}
```

***

### Documentation

You can find the complete api documentation on [fabrizioduroni.it](https://tabbaruiaction.fabrizioduroni.it "TabBarUIAction doc").

***

### Examples

In the following screenshots you can find some TabBarUIAction usage examples. You can find these examples in the [demo catalyst app project](https://github.com/chicio/TabBarUIAction/tree/master/TabBarUIActionDemo).

![iphone screens](https://github.com/chicio/TabBarUIAction/blob/main/Screenshots/iphones-screens.png?raw=true)
![ipad screens](https://github.com/chicio/TabBarUIAction/blob/main/Screenshots/ipad-screen.png?raw=true)
