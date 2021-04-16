import 'package:online_supermarket/models/card.dart';

List<Card> cardListDB = [
  Card(
    cardType: CardType.visa,
    number: '1234-5678-1234',
    expirationDate: '07/24',
  ),
  Card(
    cardType: CardType.masterCard,
    number: '9876-5678-9876',
    expirationDate: '02/23',
  ),
  Card(
    cardType: CardType.americanExpress,
    number: '4356-2786-4321',
    expirationDate: '01/25',
  ),
  Card(
    cardType: CardType.maestro,
    number: '2398-8865-0876',
    expirationDate: '09/26',
  ),
];
