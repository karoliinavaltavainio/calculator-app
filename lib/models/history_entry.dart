class HistoryEntry {
  final String calculation;
  final String timestamp;

  HistoryEntry({required this.calculation, required this.timestamp});

  Map<String, dynamic> toMap() {
    return {
      'calculation': calculation,
      'timestamp': timestamp,
    };
  }

  static HistoryEntry fromMap(Map<String, dynamic> map) {
    return HistoryEntry(
      calculation: map['calculation'],
      timestamp: map['timestamp'],
    );
  }
}
