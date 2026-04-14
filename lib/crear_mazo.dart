import 'package:flutter/material.dart';
import 'lista_mazos.dart';

class CrearMazoScreen extends StatefulWidget {
  const CrearMazoScreen({Key? key}) : super(key: key);

  @override
  _CrearMazoScreenState createState() => _CrearMazoScreenState();
}

class _CrearMazoScreenState extends State<CrearMazoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _cantidadController = TextEditingController();

  void _guardarMazo() {
    if (_formKey.currentState!.validate()) {
      ListaMazos.agregarMazo(
        nombre: _nombreController.text,
        descripcion: _descripcionController.text,
        cantidadTarjetas: int.parse(_cantidadController.text),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Mazo guardado correctamente',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xFFFF6D00),
          duration: Duration(seconds: 2),
        ),
      );

      // Limpiar campos
      _nombreController.clear();
      _descripcionController.clear();
      _cantidadController.clear();

      // Navegar a la lista de mazos
      Navigator.pushNamed(context, '/ver');
    }
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _descripcionController.dispose();
    _cantidadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Nuevo Mazo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.add_box,
                size: 80,
                color: Color(0xFFFF6D00),
              ),
              const SizedBox(height: 32),
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre del Mazo',
                  prefixIcon: Icon(Icons.title, color: Colors.white70),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor ingresa un nombre';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descripcionController,
                decoration: const InputDecoration(
                  labelText: 'Descripción',
                  prefixIcon: Icon(Icons.description, color: Colors.white70),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor ingresa una descripción';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _cantidadController,
                decoration: const InputDecoration(
                  labelText: 'Cantidad de Tarjetas',
                  prefixIcon:
                      Icon(Icons.format_list_numbered, color: Colors.white70),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor ingresa la cantidad';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Por favor ingresa un número entero válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: _guardarMazo,
                icon: const Icon(Icons.save),
                label: const Text('Guardar', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
