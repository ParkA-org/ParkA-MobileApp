import "package:flutter/material.dart";

class FilterPage extends StatefulWidget {
  static String routeName = "/parkSearchFilterPage";

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  double rentPriceFilter = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(child: Text("Puntuacion Minima")),
                    Expanded(
                      child: Row(
                        children: [
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(child: Text("Precio")),
                    Expanded(
                      child: Slider(
                        value: this.rentPriceFilter,
                        min: 50.0,
                        max: 1000.0,
                        onChanged: (value) {
                          setState(
                            () {
                              this.rentPriceFilter = value;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(child: Text("Tipo dereserva")),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(child: Text("Horas")),
                          Expanded(child: Text("Dias")),
                          Expanded(child: Text("Semanas")),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(child: Text("Disponibilidad")),
                    Expanded(
                      child: Row(
                        children: [
                          Text("Fecha"),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text("Horas"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ExpansionTile(
                  title: Text("Caracteristicas"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
