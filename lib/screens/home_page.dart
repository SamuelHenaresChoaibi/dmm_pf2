import 'package:dmm_pf2/models/persona.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
            _buildFloatingActionButton(context),
            const SizedBox(height: 100),
            const Text(
              '¡Bienvenido al PF2 de Samuel Henares Choaibi!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _screenPrimaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
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
              child: Text('Ir a PersonalPage', style: _textStyle),
            ),

            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _screenPrimaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              onPressed: () {},
              child: Text('Ir a WidgetPage', style: _textStyle),
            ),

            const SizedBox(height: 200),
          ],
        ),
      ),
    );
  }

  Column _buildFloatingActionButton(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) => _crearInfoDialog(ctx),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: _screenPrimaryColor,
            shape: const CircleBorder(),
            minimumSize: const Size(140, 140),
            padding: EdgeInsets.zero,
          ),
          child: const Icon(
            Icons.info_outline,
            size: 100,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Colors.black54,
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Mostrar información de la persona actual',
          style: TextStyle(fontSize: 20, color: Colors.white24),
          textAlign: TextAlign.center,
        ),
      ],
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
              'Nombre: ${_persona.getNombre()}\n'
              'Apellido: ${_persona.getApellido()}\n'
              'Fecha de nacimiento: ${_persona.getFechaNacimiento()}\n'
              'Email: ${_persona.getEmail()}\n'
              'Password: ${_persona.getPassword()}\n',
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
