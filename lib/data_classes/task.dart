class Task {
  int _id = 0;
  String _name = "";
  String _content = "";
  bool _status = false;
  int _difficulty = 0;

  Task(this._id, this._name, this._content, this._status, this._difficulty);

  Task.defaultTask();

  int get difficulty => _difficulty;

  set difficulty(int value) {
    _difficulty = value;
  }

  bool get status => _status;

  set status(bool value) {
    _status = value;
  }

  String get content => _content;

  set content(String value) {
    _content = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  @override
  String toString() {
    return 'Task{_id: $_id, _name: $_name, _content: $_content, _status: $_status, _difficulty: $_difficulty}';
  }
}
