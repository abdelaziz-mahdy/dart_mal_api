class Field {
  final String _name;
  final List<Field> _fields;

  @override
  String toString() {
    var s = _name;
    if (_fields.isNotEmpty) {
      s += '{${_fields.toParamStr()}}';
    }
    return s;
  }

  Field(this._name, [List<Field>? fields])
    : _fields = fields ?? [];
}

extension FieldListExt on List<Field> {
  String toParamStr() {
    return map((field) => field.toString()).join(',');
  }
}
