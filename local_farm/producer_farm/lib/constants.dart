import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Constants {
  static const String baseUrl = 'http://10.0.2.2:8080/api/';

  static const statusOrder = {
    1: {
      'status': 'Aguardando\nAgendamento',
      'cor': Colors.blue,
      'icon': Icons.calendar_today
    },
    2: {
      'status': 'Aguardando\nPagamento',
      'cor': Colors.orange,
      'icon': Icons.credit_card
    },
    3: {
      'status': 'Pagamento\nEfetuado',
      'cor': Colors.green,
      'icon': Icons.check_circle
    },
    4: {
      'status': 'Pedido\nEntregue',
      'cor': Colors.blue,
      'icon': Icons.check_circle
    },
  };
}
