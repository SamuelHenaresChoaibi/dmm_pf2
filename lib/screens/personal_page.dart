import 'package:flutter/material.dart';
import 'package:dmm_pf2/models/persona.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  final TextStyle _textStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  final Color _screenPrimaryColor = Colors.deepPurple;
  final Color _backgroundColorScreen = Color.fromARGB(255, 53, 53, 53);

  String _nombre = '';
  String _apellido = '';
  String _fechaNacimiento = '';
  String _email = '';
  String _password = '';

  TextEditingController _inputFieldNombreController = TextEditingController();
  TextEditingController _inputFieldApellidoController = TextEditingController();
  TextEditingController _inputFieldFechaController = TextEditingController();
  TextEditingController _inputFieldMailController = TextEditingController();
  TextEditingController _inputFieldPasswordController = TextEditingController();

  late Persona _persona;
  bool _isInit = true;

  @override
  void initState() {
    super.initState();
    _inputFieldNombreController = TextEditingController();
    _inputFieldApellidoController = TextEditingController();
    _inputFieldFechaController = TextEditingController();
    _inputFieldMailController = TextEditingController();
    _inputFieldPasswordController = TextEditingController();
  }

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
              _crearNombreForm(),
              SizedBox(height: 20),
              _crearApellidoCampoForm(),
              SizedBox(height: 20),
              _crearFechaNacimientoCampoForm(),
              SizedBox(height: 20),
              _crearMailCampoForm(),
              SizedBox(height: 20),
              _crearPasswordCampoForm(),
              SizedBox(height: 20),
              _crearFilaBotones(),
            ],
          ),
        ),
      ),
    );
  }

  TextField _crearNombreForm() {
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

  TextField _crearApellidoCampoForm() {
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

  Widget _crearFechaNacimientoCampoForm() {
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

  TextField _crearMailCampoForm() {
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

  TextField _crearPasswordCampoForm() {
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

  FloatingActionButton _crearBotonEnviar() {
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

  FloatingActionButton _crearBotonLimpiar() {
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

  Row _crearFilaBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [_crearBotonLimpiar(), _crearBotonEnviar()],
    );
  }
}
