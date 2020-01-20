 
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:sistema_ticket/src/providers/tickets_providers.dart';

class GenerarTicket extends StatefulWidget {
  GenerarTicket({Key key}) : super(key: key);

  @override
  _GenerarTicketState createState() => _GenerarTicketState();
}

class _GenerarTicketState extends State<GenerarTicket> {
  String _nuevoTicket = 'GENERAR MI TICKET';

  @override
  void initState() {
    // TicketsProvider().procesarRespuesta();
    super.initState();
  }

    
// https://sistema-tickets-jou16.herokuapp.com/nuevo-ticket.html
// http://192.168.137.1:3000/nuevo-ticket

  void _generarTicket() async {
    var response = await http.put('https://sistema-tickets-jou16.herokuapp.com/nuevo-ticket');
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      setState(() {
        _nuevoTicket = 'TU TICKET ES ${response.body}';
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generar Ticket'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'TICKETS',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Generar Tickets',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Image(
                        image: AssetImage('assets/images/tickets.png'),
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width / 5,
                      )
                    ],
                  ),
                ],
              ),
              Container(
                child: Center(
                  child: MaterialButton(
                    onPressed: () {
                      _nuevoTicket != 'GENERAR MI TICKET' ? 
                      Navigator.of(context).pop()
                      : _generarTicket();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.greenAccent,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: Text(
                        _nuevoTicket,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
