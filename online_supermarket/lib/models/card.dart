enum CardType {
  masterCard,
  visa,
  americanExpress,
  maestro,
}

class Card {
  Card({
    this.cardType,
    this.number,
    this.expirationDate,
  });

  final CardType cardType;
  final String number;
  final String expirationDate;

  Card copyWith({
    CardType cardType,
    String number,
    String expirationDate,
  }) {
    return Card(
      cardType: cardType ?? this.cardType,
      number: number ?? this.number,
      expirationDate: expirationDate ?? this.expirationDate,
    );
  }
}
