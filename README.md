This project is based on a book ***Flutter apprentice*** by **Mike Katz, Kevin D Moore & Vincent Ngo**.

* **`Column`** and **`Row`** widgets are like **`ListView`** but without the scroll view.
* It is good to set `primary: false` if a **`ListView`** is not the scrollable one - in this case also add `physics: const NeverScrollableScrollPhysics()` setting to the same **ListView**.
* Usually a **`ListView`** (as well as `GridView`, `PageView` and `CustomScrollView`) tries to fill all the available space given by the parent element, even when the list items would require less space. With `shrinkWrap: true`, you can change this behavior so that the **`ListView`** only occupies the space it needs (it will still scroll when there more items). If you do not set the `shrinkWrap` property, your **`ListView`** will be as big as its parent.
* The **main axis** always corresponds to the scroll direction!
* Although `aspectRatio` is of `double` type, it is recommended by Flutter documentation to specify it as `width / height`, so instead of value `1.0` write `1 / 1`.
* You should not use **`Container`** as a **`SizedBox`** because the first widget needs a lot more processing than the latter.

## Resources

* [Why Flutter stateful widgets are split into two classes?](https://stackoverflow.com/questions/50612237/why-are-stateful-widgets-defined-as-two-classes-in-flutter)
* [Android Studio Flutter snippets and shortcuts](https://medium.com/flutter-community/flutter-ide-shortcuts-for-faster-development-2ef45c51085b)