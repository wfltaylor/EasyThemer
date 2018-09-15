![EasyThemer](https://raw.githubusercontent.com/wfltaylor/EasyThemer/master/easythemer.png)

[![Version](https://img.shields.io/cocoapods/v/EasyThemer.svg?style=flat)](https://cocoapods.org/pods/EasyThemer)
[![License](https://img.shields.io/cocoapods/l/EasyThemer.svg?style=flat)](https://cocoapods.org/pods/EasyThemer)
[![Platform](https://img.shields.io/cocoapods/p/EasyThemer.svg?style=flat)](https://cocoapods.org/pods/EasyThemer)

## Features

- [x] Prebuilt UIKit controls with automatic theming
- [x] Themes can be JSON or a struct
- [x] Quick and easy to implement
- [x] Flexible and straightforward to extend

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS 8 and Swift 4

## Installation

EasyThemer is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'EasyThemer'
```

## Docs

https://wfltaylor.github.io/EasyThemer/

## Usage

### Declaring Theme

There are two ways to declare a theme.

#### Code Method

Themes can be declared by overriding ```ThemeDecleration```. This is the reccomended method for most uses.

##### Example

```swift
class LightTheme: ThemeDeclaration {
    override func setupProperties() {
        titleFont = UIFont(name: "Gill Sans", size: 44)
        primaryFont = UIFont(name: "Gill Sans", size: 12)
        backgroundColor = UIColor.white
        prefersLargeTitles = true
        barStyle = UIBarStyle.default
    }
}
```
You can also declare a theme by conforming to the ```Theme``` protocol but the ThemeDecleration method is recomended due to the greater level of clarity.

You can also add custom properties to your theme like this:
```swift
class LightTheme: ThemeDeclaration {
    var seperatorColor: UIColor
    override func setupProperties() {
        titleFont = UIFont(name: "Gill Sans", size: 44)
        primaryFont = UIFont(name: "Gill Sans", size: 12)
        backgroundColor = UIColor.white
        prefersLargeTitles = true
        barStyle = UIBarStyle.default
        seperatorColor = UIColor.gray
    }
}
```

#### JSON Method

Themes can be declared by using a JSON file. This isn't reccomended for local use but can be good for downloading themes from a server.

##### Example
```json
{
  "backgroundColorCode" : {
    "red" : 0,
    "alpha" : 1,
    "blue" : 0,
    "green" : 1
  },
  "barStyle" : "default",
  "primaryFontCode" : {
    "name" : "Chalkboard SE",
    "pointSize" : 12
  },
  "barTintColorCode" : {
    "red" : 1,
    "alpha" : 1,
    "blue" : 0,
    "green" : 0.6
  },
  "titleFontCode" : {
    "name" : "Chalkboard SE",
    "pointSize" : 54
  },
  "textColorCode" : {
    "red" : 0,
    "alpha" : 1,
    "blue" : 0,
    "green" : 0
  },
  "prefersLargeTitles" : true,
  "tintColorCode" : {
    "red" : 1,
    "alpha" : 1,
    "blue" : 0,
    "green" : 0
  }
}
```
If this was a file in the bundle, and called ```CrazyTheme.json``` you could initialize using ```JSONTheme(named: "CrazyTheme")```

### Using ThemeEngine

#### Configuring

To configure the ThemeEngine singleton you can put ```ThemeEngine.standard.configure(theme: LightTheme())``` in your "did finish launching with options". You must provide a default theme.

#### Setting Theme

```swift
ThemeEngine.standard.setTheme(theme: LightTheme())
```

#### Getting Current Theme

```swift
ThemeEngine.standard.currentTheme!
```

### Using Premade UIKit Components

The library includes some premade UIKit components including ```ThemeableNavigationBar```, ```ThemeableTabBar```, ```ThemeableLabel```, ```ThemeableButton```, and ```ThemeableView```.

These are design mostly for convenience whilst using Interface Builder and make assumptions about what you want applied to what part of the control.

To use, simply set the views Custom Class to one of the avaliable subclasses. These are automatically setup and will change themes with the standard ThemeEngine singleton.

### Using ThemeEngineDelegate

The reccomended way to impliment custom theming is by using the ```ThemeEngineDelegate```.

#### Example

```swift
extension MyViewController: ThemeEngineDelegate {

    func themeChanged(theme: Theme) {
        setTheme(theme: theme)
    }
    func themeReady(theme: Theme) {
        setTheme(theme: theme)
    }
    
    func setTheme(theme: Theme) {
        tableView.backgroundColor = theme.backgroundColor
    }
    func setupThemes() {
        ThemeEngine.standard.register(self)
    }
    
}
```
In this example, ```setupThemes()``` is called in the viewDidLoad. It is important to not immediately set the theme in ```viewDidLoad()``` or when initalizing because the ThemeEngine may not be configured yet - "did finish launching with options" is called after the Storyboard is loaded.

## Author

William Taylor

## License

EasyThemer is available under the MIT license. See the LICENSE file for more info.
