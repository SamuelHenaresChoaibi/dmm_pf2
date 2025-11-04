import 'package:dmm_pf2/models/persona.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextStyle _textStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  final Color _screenPrimaryColor = Colors.deepPurple;
  final Color _backGroundColor = Color.fromARGB(255, 53, 53, 53);

  late Persona _persona;

  @override
  void initState() {
    super.initState();
    DateTime fechaNacimientoPorDefecto = DateTime(2005, 09, 10);
    _persona = Persona(
      "Samuel",
      "Henares Choaibi",
      '${fechaNacimientoPorDefecto.year}-${fechaNacimientoPorDefecto.month.toString().padLeft(2, '0')}-${fechaNacimientoPorDefecto.day.toString().padLeft(2, '0')}',
      "samuelhenares@paucasesnovescifp.cat",
      "1234ABCD",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backGroundColor,
      appBar: AppBar(
        title: Text('PF2', style: _textStyle),
        backgroundColor: _screenPrimaryColor,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Icon(Icons.home, size: 100, color: Colors.white),
            const SizedBox(height: 25),
            Text(
              '¡Bienvenido al PF2 de Samuel Henares Choaibi!',
              style: _textStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            _buildFloatingActionButton(context),

            const SizedBox(height: 30),

            _buildFloatingActionButtonPersonalPage(context),
            const SizedBox(height: 12),
            _buildFloatingActionButtonWidgetPage(context),

            const SizedBox(height: 200),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(context: context, builder: (ctx) => _crearInfoDialog(ctx));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: _screenPrimaryColor,
        shape: const StadiumBorder(),
        minimumSize: const Size(160, 64),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.info_outline,
            size: 28,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Colors.black54,
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
          const SizedBox(width: 12),
          const Text(
            'Mostrar información de la persona actual',
            style: TextStyle(fontSize: 16, color: Colors.white),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButtonPersonalPage(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: _screenPrimaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      onPressed: () async {
        final result = await Navigator.pushNamed(
          context,
          '/personal',
          arguments: _persona,
        );
        if (result != null && result is Persona) {
          setState(() {
            _persona = result;
          });
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.person, size: 24, color: Colors.white),
          SizedBox(width: 8),
          Text('Ir a PersonalPage', style: _textStyle),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButtonWidgetPage(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: _screenPrimaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/widget');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.widgets, size: 24, color: Colors.white),
          SizedBox(width: 8),
          Text('Ir a WidgetPage', style: _textStyle),
        ],
      ),
    );
  }

  Dialog _crearInfoDialog(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Información de la persona actual',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              '- Nombre: ${_persona.getNombre().isEmpty ? "Sin nombre" : _persona.getNombre()}\n\n'
              '- Apellido: ${_persona.getApellido().isEmpty ? "Sin apellido" : _persona.getApellido()}\n\n'
              '- Fecha de nacimiento: ${_persona.getFechaNacimiento().isEmpty ? "Sin fecha de nacimiento" : _persona.getFechaNacimiento()}\n\n'
              '- Email: ${_persona.getEmail().isEmpty ? "Sin email" : _persona.getEmail()}\n\n'
              '- Password: ${_persona.getPassword().isEmpty ? "Sin password" : _persona.getPassword()}\n\n',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        ),
      ),
    );
  }
}
