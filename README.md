This project is based on a book ***Flutter apprentice*** by **Mike Katz, Kevin D Moore & Vincent Ngo**.

* **`Column`** and **`Row`** widgets are like **`ListView`** but without the scroll view.
* It is good to set `primary: false` if a **`ListView`** is not the scrollable one - in this case also add `physics: const NeverScrollableScrollPhysics()` setting to the same **ListView**.
* Usually a **`ListView`** (as well as `GridView`, `PageView` and `CustomScrollView`) tries to fill all the available space given by the parent element, even when the list items would require less space. With `shrinkWrap: true`, you can change this behavior so that the **`ListView`** only occupies the space it needs (it will still scroll when there more items). If you do not set the `shrinkWrap` property, your **`ListView`** will be as big as its parent.
* The **main axis** always corresponds to the scroll direction!
* Although `aspectRatio` is of `double` type, it is recommended by Flutter documentation to specify it as `width / height`, so instead of value `1.0` write `1 / 1`.
* You should not use **`Container`** as a **`SizedBox`** because the first widget needs a lot more processing than the latter.
* **`InkWell`** adds the tap effect on user gestures and **`Dismissible`** allows to handle the swipe gestures easily.
* **`IndexedStack`** is a widget that holds the state of the app, so when switching between views, data is not being lost.
* In **Navigator 2.0**, the navigation is not imperative as in **Navigator 1.0** where you had to operate with manually adding and removing pages with `.push()` and `.pop()`. calls. In the new declarative navigation, the instead of telling the navigator what to do with `.push()` and `.pop()`, you tell it: when the state is **X**, render **Y** pages.
* **shared_preferences** is a Flutter plugin that allows to save data in a key-value format - it does not require any setup or configuration, stores simple data, but is not a good fit to store sensitive data (use **flutter_secure_storage** instead)
* **json_annotation** and **json_serializable** are Google packages for auto-generation, serialization and parsing of JSONs from and to classes
* **rootBundle** is the top-level property that holds references to all the items in the asset folder

## Resources

* [Why Flutter stateful widgets are split into two classes?](https://stackoverflow.com/questions/50612237/why-are-stateful-widgets-defined-as-two-classes-in-flutter)
* [Android Studio Flutter snippets and shortcuts](https://medium.com/flutter-community/flutter-ide-shortcuts-for-faster-development-2ef45c51085b)