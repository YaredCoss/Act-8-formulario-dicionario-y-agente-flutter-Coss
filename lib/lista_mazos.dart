import 'mazo.dart';

class ListaMazos {
  static Map<int, Mazo> datosMazos = {};
  static int _siguienteId = 1;

  static void agregarMazo({
    required String nombre,
    required String descripcion,
    required int cantidadTarjetas,
  }) {
    final nuevoMazo = Mazo(
      id: _siguienteId,
      nombre: nombre,
      descripcion: descripcion,
      cantidadTarjetas: cantidadTarjetas,
    );
    datosMazos[_siguienteId] = nuevoMazo;
    _siguienteId++;
  }
}
