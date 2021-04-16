enum CardType {
  masterCard,
  visa,
  americanExpress,
  maestro,
}

class PaymentCard {
  PaymentCard({
    this.cardType,
    this.number,
    this.expirationDate,
    this.isSelected,
  });

  final CardType cardType;
  final String number;
  final String expirationDate;
  bool isSelected;

  PaymentCard copyWith({
    CardType cardType,
    String number,
    String expirationDate,
    bool isSelected,
  }) {
    return PaymentCard(
      cardType: cardType ?? this.cardType,
      number: number ?? this.number,
      expirationDate: expirationDate ?? this.expirationDate,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
