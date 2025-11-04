/// Clase que representa una persona con sus datos personales básicos
class Persona {
  String nombre, apellido, email, password, fechaNacimiento;

  /// Constructor nombrado que crea una persona con todos los campos vacíos
  Persona.empty()
    : nombre = '',
      apellido = '',
      email = '',
      password = '',
      fechaNacimiento = '';

  /// Constructor principal que inicializa todos los campos de la persona
  Persona(
    this.nombre,
    this.apellido,
    this.fechaNacimiento,
    this.email,
    this.password,
  );

  /// Métodos set para modificar los datos de la persona
  void setNombre(String nombre) => this.nombre = nombre;
  void setApellido(String apellido) => this.apellido = apellido;
  void setFechaNacimiento(String fechaNacimiento) =>
      this.fechaNacimiento = fechaNacimiento;
  void setEmail(String email) => this.email = email;
  void setPassword(String password) => this.password = password;

  /// Métodos get para acceder a los datos de la persona
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
