import 'package:fast_app_base/screen/main/tab/home/bank_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

final bankAccountShinhan1 = BankAccount(bankShinhan, 30000000, accountTypeName: '신한 주거래 우대통장(저축예금)');
final bankAccountShinhan2 = BankAccount(bankShinhan, 300000000, accountTypeName: '저축예금');
final bankAccountShinhan3 = BankAccount(bankShinhan, 3000000000, accountTypeName: '저축예금');
final bankAccountKakao = BankAccount(bankKakao, 500000000);
final bankAccountToss = BankAccount(bankTtoss, 700000000, accountTypeName: '입출금통장');

main() {
  // print(bankAccounts[3].accountTypeName);

  // for (final item in bankAccounts) {
  //   print(item.accountTypeName);
  // }

  final shinhankBank = bankMap["shinhan1"];
  print(shinhankBank == bankAccountShinhan1);

  for(final entry in bankMap.entries) {
    entry.key;
    entry.value;
  }

  bankSet.contains(bankAccountShinhan1);

  bankAccounts.toSet();

  bankSet.toList();
}

// List
final List<BankAccount> bankAccounts = [
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountKakao,
  bankAccountToss,
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountKakao,
  bankAccountToss,
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountKakao,
  bankAccountToss,
];

// Map
final bankMap = {
  "shinhan1" : bankAccountShinhan1,
  "shinhan2" : bankAccountShinhan2,
};

//Set
final bankSet = {
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountKakao,
  bankAccountToss,
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountKakao,
  bankAccountToss,
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountKakao,
  bankAccountToss,
};