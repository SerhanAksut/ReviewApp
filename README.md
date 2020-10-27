# ReviewApp
 ING Bank case challange iOS app

## Table of contents
* [General info](#general-info)
* [Design Pattern](#design-pattern)
* [Built-in Packages](#built-in-Packages)
* [Technologies](#technologies)
* [Dependencies](#dependencies)
* [Setup](#setup)

## General info
This is an iOS Project using `UIKit` for ING Bank mobile team. It is a three pages application which lists reviews, filters reviews and displays detailed information about selected review. The first one is that ReviewList page contains a `UITableView` to display reviews. The second one is that FilterOptions page contains a vertical `UIStackView` to display filtering options and the last one is that ReviewDetail page contains a `UIScrollView` and vertial `UIStackView` to display detailed information.

## Design Pattern
MVVM is used to make the project more readable and easily testable. The slight difference between commonly known MVVM and the one used in this project is using IO(Input/Output) mechanism as protocols for view models.
<br />
Using protocol keeps view model private and decoupled. You can easily substitute it with another object conforming the protocol of the view model. It helps you mocking even view models.
<br />
Using output protocol helps you to test outputs triggered by view actions. In addition, you can easily test the orders of the outputs after trigger an input function. 
<br />
Finally, builder pattern is used to create view controllers. Each page has own builder as a public access control and these builders are used for creation of contollers.

## Navigation
Coordinator pattern is used to maintain navigation between controllers in order to decoupling them by using builders. The biggest advantage is that decreasing compile time by decoupling dependencies between controllers.

## Built-in Packages
There are 10 Swift Packages in total for the project. All Swift Packages are separated to two main folders that called Common & Screens.
<br />
Common folder contains;
* AppstoreAPI <br />
It is an API layer for AppStore Reviews. Also, It contains both live and mock version in the package. In addition, it proxies between requestor and core network layer. Also, this layer is responsible from the parsing & error handling operations. Besides, if we want to integrate another api such as Google Play Store Reviews, we will create a new Swift Package for it. The main purpose is that separating each APIs from each other. Because each APIs may have different request & response structure.
<br />
* Coordinators <br />
It is a navigation layer. Entire app navigation flows are managed by this layer. For the current situation, we have only one coordinator that called ReviewListCoordinator. We can scale our navigation layer by creating different flows in the app.
* Entities <br />
* NetworkCore <br />
* SwiftKit <br />
* UIKitHelper <br />
* UIKitPreview <br />
It allows us to preview view controllers easily without the need of recompiling whole project. You can even preview a controller in live mode. 
It uses SwiftUI and UIViewControllerRepresentable even this project is not a SwiftUI Project. It is inspired by a Brian Voong's youtube video.

## Technologies
The app is developed using:
* Swift Language version: 5
* Swift Package Managers

## Dependencies
There is no third party dependency in the app.
	
## Setup
There is no dependency to wait for installation. <br />
The project was developed by using Xcode Version 12.1 (12A7403).
