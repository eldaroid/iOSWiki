## Environments

Среда SwiftUI представляет собой набор environment values и environment objects, распространяемых через иерархию представлений.

Многое из того, что мы делаем в SwiftUI, влияет на среду. Несколько примеров environment values/environment objects:

* каждый стиль представления ([Button styles](https://www.fivestars.blog/articles/button-styles/), [Customize TextFields](https://www.fivestars.blog/articles/how-to-customize-textfields/), [Custom SwiftUI view styles](https://www.fivestars.blog/articles/custom-view-styles/));
* акцент, оттенок, цвета переднего плана;
* Action: [OpenURLAction](https://www.fivestars.blog/articles/openurl-openurlaction/), [TriggerSubmitAction](https://www.fivestars.blog/articles/onsubmit/), [DismissAction](https://nilcoalescing.com/blog/UsingTheDismissActionFromTheSwiftUIEnvironment/);
* приложение [AppDelegate](https://www.fivestars.blog/articles/app-delegate-scene-delegate-swiftui/#:~:text=depending%20on%20both-,delegates,-%3A) и [SceneDelegate](https://www.fivestars.blog/articles/app-delegate-scene-delegate-swiftui/#:~:text=approach%20takes%20priority.-,Scene,-delegate%20access%20via)
* ...и многое другое

---



