import 'dart:collection';

import 'package:fast_app_base/common/dart/extension/collection_extension.dart';
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

  // 삽입
  bankAccounts.insert(1, bankAccountKakao);

  // 위치 이동
  final temp = bankAccounts.removeAt(4);
  bankAccounts.insert(4, temp);

  // 교환
  bankAccounts.swap(0, 5);

  // 변환
  final banks = bankAccounts.map((e) => e.bank).toList();
  for (final bank in banks) {
    print(bank.toString());
  }
  final map = HashMap<String, BankAccount>();
  map['ttoss'] = bankAccountToss;
  map['kakao'] = bankAccountKakao;
  map.putIfAbsent('kakao', () => bankAccountKakao);

  final uniqueBanks = banks.toSet();
  for (final bank in uniqueBanks) {
    print(bank.toString());
  }
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