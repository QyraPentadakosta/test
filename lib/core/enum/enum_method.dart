enum EnumMethod {
  get('get'),
  post('post'),
  put('put'),
  delete('delete'),
  patch('patch');

  final String value;

  const EnumMethod(this.value);
}
