import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:papago_example/.fvm/flutter_sdk/packages/flutter/test/rendering/table_test.dart';
import 'package:papago_example/papago.dart';

class LongText extends StatefulWidget {
  const LongText({super.key});

  @override
  State<LongText> createState() => _LongTextState();
}

class _LongTextState extends State<LongText> {
  String _translatedText = '변환된 텍스트';
  String _text = '대법원장과 대법관이 아닌 법관의 임기는 10년으로 하며, 법률이 정하는 바에 의하여 연임할 수 있다. 선거에 관한 경비는 법률이 정하는 경우를 제외하고는 정당 또는 후보자에게 부담시킬 수 없다. 모든 국민은 근로의 의무를 진다. 국가는 근로의 의무의 내용과 조건을 민주주의원칙에 따라 법률로 정한다. 위원은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다. 대통령은 국회에 출석하여 발언하거나 서한으로 의견을 표시할 수 있다. 명령·규칙 또는 처분이 헌법이나 법률에 위반되는 여부가 재판의 전제가 된 경우에는 대법원은 이를 최종적으로 심사할 권한을 가진다. 국방상 또는 국민경제상 긴절한 필요로 인하여 법률이 정하는 경우를 제외하고는, 사영기업을 국유 또는 공유로 이전하거나 그 경영을 통제 또는 관리할 수 없다. 사면·감형 및 복권에 관한 사항은 법률로 정한다. 정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다. 국민경제자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 누구든지 체포 또는 구속을 당한 때에는 즉시 변호인의 조력을 받을 권리를 가진다. 다만, 형사피고인이 스스로 변호인을 구할 수 없을 때에는 법률이 정하는 바에 의하여 국가가 변호인을 붙인다. 모든 국민은 법률이 정하는 바에 의하여 납세의 의무를 진다. 재판의 심리와 판결은 공개한다. 다만, 심리는 국가의 안전보장 또는 안녕질서를 방해하거나 선량한 풍속을 해할 염려가 있을 때에는 법원의 결정으로 공개하지 아니할 수 있다. 대통령은 제4항과 제5항의 규정에 의하여 확정된 법률을 지체없이 공포하여야 한다. 제5항에 의하여 법률이 확정된 후 또는 제4항에 의한 확정법률이 정부에 이송된 후 5일 이내에 대통령이 공포하지 아니할 때에는 국회의장이 이를 공포한다. 각급 선거관리위원회는 선거인명부의 작성등 선거사무와 국민투표사무에 관하여 관계 행정기관에 필요한 지시를 할 수 있다. 헌법재판소 재판관은 정당에 가입하거나 정치에 관여할 수 없다. 누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 형사피의자 또는 형사피고인으로서 구금되었던 자가 법률이 정하는 불기소처분을 받거나 무죄판결을 받은 때에는 법률이 정하는 바에 의하여 국가에 정당한 보상을 청구할 수 있다. 국가는 지역간의 균형있는 발전을 위하여 지역경제를 육성할 의무를 진다. 대통령의 선거에 관한 사항은 법률로 정한다. 비상계엄하의 군사재판은 군인·군무원의 범죄나 군사에 관한 간첩죄의 경우와 초병·초소·유독음식물공급·포로에 관한 죄중 법률이 정한 경우에 한하여 단심으로 할 수 있다. 다만, 사형을 선고한 경우에는 그러하지 아니하다. 공무원의 직무상 불법행위로 손해를 받은 국민은 법률이 정하는 바에 의하여 국가 또는 공공단체에 정당한 배상을 청구할 수 있다. 이 경우 공무원 자신의 책임은 면제되지 아니한다. 이 헌법은 1988년 2월 25일부터 시행한다. 다만, 이 헌법을 시행하기 위하여 필요한 법률의 제정·개정과 이 헌법에 의한 대통령 및 국회의원의 선거 기타 이 헌법시행에 관한 준비는 이 헌법시행 전에 할 수 있다.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('장문 변환'),
        leading: IconButton(
          onPressed: () => context.go('/'),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              color: Colors.grey[200],
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Text(_text)),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    var result = await papago(_text, 'en');
                    setState(() {
                      _translatedText = result;
                    });
                  },
                  child: const Text('영어 변환'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    var result = await papago(_text, 'ja');
                    setState(() {
                      _translatedText = result;
                    });
                  },
                  child: const Text('일본어 변환'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    var result = await papago(_text, 'zh-CN');
                    setState(() {
                      _translatedText = result;
                    });
                  },
                  child: const Text('중국어 변환'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: 300,
              height: 300,
              padding: const EdgeInsets.all(10),
              color: Colors.grey[200],
              child: SingleChildScrollView(
                child: Text(_translatedText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}