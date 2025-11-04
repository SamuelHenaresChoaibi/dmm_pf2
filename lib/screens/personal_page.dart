import 'package:flutter/material.dart';
import 'package:dmm_pf2/models/persona.dart';

/// Se utiliza StatefulWidget porque esta página maneja múltiples estados:
/// - Campos de texto que cambian con la entrada del usuario
/// - Estado de inicialización (_isInit) para cargar datos iniciales
/// - Controladores de texto que necesitan actualizarse
/// - Datos de persona que se modifican y persisten entre rebuilds
class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  /// Estilo de texto común para la interfaz
  final TextStyle _textStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  /// Color principal para elementos interactivos
  final Color _screenPrimaryColor = Colors.deepPurple;
  /// Color de fondo de la pantalla
  final Color _backgroundColorScreen = Color.fromARGB(255, 53, 53, 53);

  /// Variables para almacenar temporalmente los datos del formulario
  String _nombre = '';
  String _apellido = '';
  String _fechaNacimiento = '';
  String _email = '';
  String _password = '';

  /// Controladores para los campos de texto del formulario
  TextEditingController _inputFieldNombreController = TextEditingController();
  TextEditingController _inputFieldApellidoController = TextEditingController();
  TextEditingController _inputFieldFechaController = TextEditingController();
  TextEditingController _inputFieldMailController = TextEditingController();
  TextEditingController _inputFieldPasswordController = TextEditingController();

  late Persona _persona;
  bool _isInit = true;

  /// Inicializa los controladores de texto para cada campo del formulario
  @override
  void initState() {
    super.initState();
    _inputFieldNombreController = TextEditingController();
    _inputFieldApellidoController = TextEditingController();
    _inputFieldFechaController = TextEditingController();
    _inputFieldMailController = TextEditingController();
    _inputFieldPasswordController = TextEditingController();
  }

  /// Carga los datos de la persona recibida como argumento
  /// y los asigna a los campos del formulario
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      final argumento = ModalRoute.of(context)!.settings.arguments;

      if (argumento != null && argumento is Persona) {
        _persona = argumento;
        _nombre = _persona.nombre;
        _apellido = _persona.apellido;
        _fechaNacimiento = _persona.fechaNacimiento;
        _email = _persona.email;
        _password = _persona.password;

        _inputFieldNombreController.text = _nombre;
        _inputFieldApellidoController.text = _apellido;
        _inputFieldFechaController.text = _fechaNacimiento;
        _inputFieldMailController.text = _email;
        _inputFieldPasswordController.text = _password;
      }
      _isInit = false;
    }
  }

  /// Construye la interfaz del formulario con campos para cada dato
  /// de la persona y botones para guardar o limpiar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HENARES', style: _textStyle),
        backgroundColor: _screenPrimaryColor,
        centerTitle: true,
      ),
      backgroundColor: _backgroundColorScreen,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              _buildNombreForm(),
              SizedBox(height: 20),
              _buildApellidoCampoForm(),
              SizedBox(height: 20),
              _buildFechaNacimientoCampoForm(),
              SizedBox(height: 20),
              _buildMailCampoForm(),
              SizedBox(height: 20),
              _buildPasswordCampoForm(),
              SizedBox(height: 20),
              _buildFilaBotones(),
            ],
          ),
        ),
      ),
    );
  }

  /// Crea el campo de texto para el nombre con capitalización de frases
  TextField _buildNombreForm() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      controller: _inputFieldNombreController,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Nombre',
        labelText: 'Nombre',
        helperText: 'Escriba su nombre',
        suffixIcon: Icon(Icons.accessibility, color: _screenPrimaryColor),
        icon: Icon(Icons.account_circle, color: Colors.white),
        fillColor: Colors.white,
        helperStyle: TextStyle(color: Colors.white70),
        hintStyle: TextStyle(color: Colors.white54),
        labelStyle: TextStyle(color: Colors.white54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
    );
  }

  /// Crea el campo de texto para el apellido con capitalización de frases
  TextField _buildApellidoCampoForm() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      style: TextStyle(color: Colors.white),
      controller: _inputFieldApellidoController,
      decoration: InputDecoration(
        hintText: 'Apellido',
        labelText: 'Apellido',
        helperText: 'Escriba su apellido',
        suffixIcon: Icon(Icons.person_2, color: _screenPrimaryColor),
        icon: Icon(Icons.account_box_outlined, color: Colors.white),
        fillColor: Colors.white,
        helperStyle: TextStyle(color: Colors.white70),
        hintStyle: TextStyle(color: Colors.white54),
        labelStyle: TextStyle(color: Colors.white54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
    );
  }

  /// Crea un campo de texto de solo lectura que al tocarlo muestra
  /// un selector de fecha
  Widget _buildFechaNacimientoCampoForm() {
    return TextField(
      readOnly: true,
      controller: _inputFieldFechaController,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        helperText: 'Seleccione su fecha de nacimiento',
        suffixIcon: Icon(Icons.cake, color: _screenPrimaryColor),
        icon: Icon(Icons.calendar_month, color: Colors.white),
        helperStyle: TextStyle(color: Colors.white70),
        hintStyle: TextStyle(color: Colors.white54),
        labelStyle: TextStyle(color: Colors.white54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _seleccionarFecha(context);
      },
    );
  }

  /// Muestra un diálogo para seleccionar la fecha de nacimiento
  /// y actualiza el campo correspondiente
  void _seleccionarFecha(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _fechaNacimiento =
            '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
        _inputFieldFechaController.text = _fechaNacimiento;
      });
    }
  }

  /// Crea el campo de texto para el email con teclado de tipo email
  TextField _buildMailCampoForm() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      controller: _inputFieldMailController,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Email',
        labelText: 'Email',
        helperText: 'Escriba su email',
        suffixIcon: Icon(Icons.alternate_email, color: _screenPrimaryColor),
        icon: Icon(Icons.email_outlined, color: Colors.white),
        fillColor: Colors.white,
        helperStyle: TextStyle(color: Colors.white70),
        hintStyle: TextStyle(color: Colors.white54),
        labelStyle: TextStyle(color: Colors.white54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
    );
  }

  /// Crea el campo de texto para la contraseña con modo oculto
  TextField _buildPasswordCampoForm() {
    return TextField(
      obscureText: true,
      style: TextStyle(color: Colors.white),
      controller: _inputFieldPasswordController,
      decoration: InputDecoration(
        hintText: 'Password',
        labelText: 'Password',
        helperText: 'Escriba su password',
        suffixIcon: Icon(Icons.lock, color: _screenPrimaryColor),
        icon: Icon(Icons.password_outlined, color: Colors.white),
        fillColor: Colors.white,
        helperStyle: TextStyle(color: Colors.white70),
        hintStyle: TextStyle(color: Colors.white54),
        labelStyle: TextStyle(color: Colors.white54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
    );
  }

  /// Crea un botón flotante que guarda los datos del formulario
  /// y vuelve a la pantalla anterior con los datos de la persona actualizados
  FloatingActionButton _buildBotonEnviar() {
    return FloatingActionButton(
      heroTag: null,
      backgroundColor: _screenPrimaryColor,
      onPressed: () {
        final Persona personaResultado = Persona(
          _inputFieldNombreController.text,
          _inputFieldApellidoController.text,
          _inputFieldFechaController.text,
          _inputFieldMailController.text,
          _inputFieldPasswordController.text,
        );
        Navigator.pop(context, personaResultado);
      },
      child: Icon(Icons.send, color: Colors.white),
    );
  }

  /// Crea un botón flotante que limpia todos los campos del formulario
  FloatingActionButton _buildBotonLimpiar() {
    return FloatingActionButton(
      heroTag: null,
      backgroundColor: _screenPrimaryColor,
      onPressed: () {
        setState(() {
          _inputFieldNombreController.clear();
          _inputFieldApellidoController.clear();
          _inputFieldFechaController.clear();
          _inputFieldMailController.clear();
          _inputFieldPasswordController.clear();
        });
      },
      child: Icon(Icons.cleaning_services, color: Colors.white),
    );
  }

  /// Crea una fila con los botones de limpiar y enviar 
  Row _buildFilaBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [_buildBotonLimpiar(), _buildBotonEnviar()],
    );
  }
}
