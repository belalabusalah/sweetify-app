class SupportTicketModel {
  final bool status;
  final String message;
  final TicketData data;

  SupportTicketModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SupportTicketModel.fromJson(Map<String, dynamic> json) {
    return SupportTicketModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data:  json['data'] != null
          ? TicketData.fromJson(json['data'])
          : TicketData(ticketId: 0, status: ''),
    );
  }
}

class TicketData {
  final int ticketId;
  final String status;

  TicketData({required this.ticketId, required this.status});

  factory TicketData.fromJson(Map<String, dynamic> json) {
    return TicketData(
      ticketId: json['ticket_id'] ?? 0,
      status: json['status'] ?? '',
    );
  }
}
