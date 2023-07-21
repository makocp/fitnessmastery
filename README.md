# FitnessMastery

## Developers
Marin Sekic (mako.codeproducer@gmail.com)
## Description
This project is for educational purposes for Mobile Application Development. The purpose of this App is to track your workouts with a timer.
## Functionalities

## Learnings
- Setup git project
    - Solve git "unrelated commit history error":
    - first pull master into local branch, then push branch to git.
    - `git pull origin master --allow-unrelated-histories`
- Architecture
    - There are different ways to setup the architecture for a SwiftUI Project. In this case, I decided to go with MVVM (Model View ViewModel)
- NavigationView nested in TabView
    - Tabbar is shown after navigating to child view, fixed by `.toolbar(.hidden, for: .tabBar)` -> delay after going back (find a better solution)
    - Fixed: Wrap Tabview inside NavigationView (-> as root)

## Conclusion

## Links

- [Implement Navigation](https://developer.apple.com/documentation/swiftui/displaying-data-in-lists)
- [Implement Timer](https://sarunw.com/posts/timer-in-swiftui/)
- [Implement Timer 2](https://dev.to/maeganwilson_/make-a-count-up-timer-using-swift-and-swiftui-5199)
