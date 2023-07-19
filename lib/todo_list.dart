/// The to-do list itself. Should be the first screen seen on startup.

class ListItem {
  var _name = "";
  var _body = "";
  var _tags = [];
  bool selected = false;

  ListItem(String name, String body) {
    _name = name;
    _body = _body;
  }

  void addTag(String tag) {
    _tags.add(tag);
  }

  void removeTag(String tag) {
    _tags.remove(tag);
  }

  bool hasTag(String tag) {
    return _tags.contains(tag);
  }

  String get getName => _name;
  String get getBody => _body;
}
