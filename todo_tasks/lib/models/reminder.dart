class Reminder {
  final int _id; // identifier for note
  final String _description; // string (text) value

  // Constructors
  Reminder(this._id, this._description);

  // Getters
  int get id => _id;
  String get description => _description;

  // Note object to Map object
  Map<String, dynamic> toMap() {
    return {'id': _id, 'description': _description};
  }

  // toString function for readability
  @override
  String toString() {
    return "Id: $_id, Description: $_description";
  }
}
