import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';
import 'package:sistema_ticket/src/models/tickets.dart';

class TicketsProvider {

// https://sistema-tickets-jou16.herokuapp.com/publico.html
// http://192.168.137.1:3000/publico
  String _url = 'https://sistema-tickets-jou16.herokuapp.com/publico';
  
    //oe mejor pon el video de fernando jajaj, anda a la carpeta
  
  Future<List<Ticket>> getTickets() async{
    final resp = await http.get(_url);
    final decodeData = json.decode(resp.body);
    final tickets = new Tickets.fromJsonList(decodeData);
    return tickets.items;
  }

}
