import 'package:flutter/material.dart';
import 'lista_mazos.dart';

class VerMazosScreen extends StatelessWidget {
  const VerMazosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtenemos todos los mazos guardados en el diccionario
    final mazos = ListaMazos.datosMazos.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Mazos'),
      ),
      body: mazos.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.inbox, size: 80, color: Colors.white54),
                  SizedBox(height: 16),
                  Text(
                    'No hay mazos registrados.',
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: mazos.length,
              itemBuilder: (context, index) {
                final mazo = mazos[index];
                return Card(
                  color: Colors.white,
                  elevation: 4,
                  margin: const EdgeInsets.only(bottom: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xFFFF6D00),
                      radius: 24,
                      child: Text(
                        '${mazo.id}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18, // Mejor legibilidad
                        ),
                      ),
                    ),
                    title: Text(
                      mazo.nombre,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        '${mazo.descripcion}\nTarjetas: ${mazo.cantidadTarjetas}',
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ),
                    isThreeLine: true,
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: Color(0xFF252525),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
