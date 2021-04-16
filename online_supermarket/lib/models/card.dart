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
    this.isSelected,
  });

  final CardType cardType;
  final String number;
  final String expirationDate;
  bool isSelected;

  Card copyWith({
    CardType cardType,
    String number,
    String expirationDate,
    bool isSelected,
  }) {
    return Card(
      cardType: cardType ?? this.cardType,
      number: number ?? this.number,
      expirationDate: expirationDate ?? this.expirationDate,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
