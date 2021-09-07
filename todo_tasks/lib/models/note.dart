class Note {
  final int _id; // identifier for note
  final String _title; //
  final String _description; // string (text) value

  // Constructors
  Note(this._id, this._title, this._description);

  // Getters
  int get id => _id;
  String get title => _title;
  String get description => _description;

  // Note object to Map object
  Map<String, dynamic> toMap() {
    return {'id': _id, 'title': _title, 'description': _description};
  }

  // toString function for readability
  @override
  String toString() {
    return "Id: $_id, Title: $_title, Description: $_description";
  }
}
