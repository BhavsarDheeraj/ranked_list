[![awesome flutter](https://img.shields.io/badge/Awesome-Flutter-blue.svg?longCache=true&style=flat-square)](https://stackoverflow.com/questions/tagged/flutter?sort=votes)
[![pub package](https://img.shields.io/pub/v/snaplist.svg)](https://pub.dartlang.org/packages/ranked_list)

# ranked_list

A tiny library allows you to create ranked list view ex: Leaderboard

**Issues and Pull Requests are really appreciated!**

## Showcase

![Showscase gif](https://media.giphy.com/media/cRrc6hyOMgOKzmw6KP/giphy.gif)

## Include to your project

In your `pubspec.yaml` root add:

```yaml
dependencies:
  ranked_list: ^0.0.1
```

## Include

The library does provide `StatefulWidget` which is called `RankedList`.

Include the widget like this:
`import 'package:ranked_list/ranked_list.dart';`

## Usage

Use it as you'd use any widget:

```dart
Widget build(BuildContext context) {
  return RankedList(
    itemBuilder: (context, index) => ListItem(),
    rank: 25,
    itemCount: 50,
    itemHeight: 56,
    topItem: TopItem(),
    bottomItem: BottomItem(),
  );
}
```

RankedList uses scroll controller behind the scenes so you can't add your own scroll controller to the list as of now.

## Properties

There are 4 required fields:

- `itemHeight` is the size of each item in the list. This is required so rank calculations will work correctly.
- `rank` is the position of the ranked item.
- `itemBuilder` works like a regular `Flutter` builder all of us are familiar with. It will pass you the context, current item index and some additional data.
- `itemCount` - Children count as in a `ListView`.

The `data` which can be provided additionally are:

- `showTop` - Decides whether to snap the ranked item at the top or not.
- `showBottom` - Decides whether to snap the ranked item at the bottom or not.
- `topItem` - The top snapping widget.
- `bottomItem` - The bottom snapping widget.
