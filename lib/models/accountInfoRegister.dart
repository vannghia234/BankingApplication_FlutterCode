class AccountInfoRegister {
  String? _hoTen;

  String? get hoTen => _hoTen;
  String? _email;
  String? _cccd;

  set hoTen(String? value) {
    _hoTen = value;
  }

  AccountInfoRegister();

  AccountInfoRegister.name(this._hoTen, this._email, this._cccd);

  String? get email => _email;

  set email(String? value) {
    _email = value;
  }

  String? get cccd => _cccd;

  set cccd(String? value) {
    _cccd = value;
  }
}
