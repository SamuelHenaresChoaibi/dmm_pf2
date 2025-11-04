class Persona {
  String nombre, apellido, email, password, fechaNacimiento;

  Persona.empty()
    : nombre = '',
      apellido = '',
      email = '',
      password = '',
      fechaNacimiento = '';

  Persona(
    this.nombre,
    this.apellido,
    this.fechaNacimiento,
    this.email,
    this.password,
  );

  void setNombre(String nombre) => this.nombre = nombre;
  void setApellido(String apellido) => this.apellido = apellido;
  void setFechaNacimiento(String fechaNacimiento) =>
      this.fechaNacimiento = fechaNacimiento;
  void setEmail(String email) => this.email = email;
  void setPassword(String password) => this.password = password;

  String getNombre() => nombre;
  String getApellido() => apellido;
  String getFechaNacimiento() => fechaNacimiento;
  String getEmail() => email;
  String getPassword() => password;

  @override
  @override
  String toString() {
    return 'Nombre: $getNombre()\n'
        'Apellido: $getApellido()\n'
        'Fecha de nacimiento: $getFechaNacimiento()\n'
        'Email: $getEmail()\n'
        'Password: $getPassword()\n';
  }
}
