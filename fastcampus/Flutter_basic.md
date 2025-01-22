# Flutter 기초

### Flutter 아키텍쳐

#### 프레임워크
일반적으로 Dart 언어로 작성하는 위젯 등의 코드
#### 엔진
C / C++ 언어로 이루어짐
3.10 이전엔 스키아 엔진을 사용
iOS 는 임펠러 - 랜더링 속도 향상
AOS 는 스키아를 아직 사용중

RN 과 Flutter의 가장큰 차이 별도의 엔진이 있다
#### 임베더
플러그인, 패키지 등을 사용

### Hot restart 와 Hot reload
#### Hot restart
앱을 재시작하는 형태
이 기능을 활용할 시 앱의 모든 상태가 초기화 되고,
앱의 코드 변경 사항을 반영할 수 있게 됨

#### Hot reload
앱을 재 실행하지는 않지만,
코드의 변경사항을 반영하는 기능
이 기능을 활용하면 앱의 상태를 유지한 상태로,
코드의 수정사항을 확인하여 더욱 빠르게 개발할 수 있게 해줌

#### Hot restart / Hot reload 사용시 주의 사항
Hot restart / Hot reload  모두 앱을 재 컴파일 후 빌드하는 것이 아니기 때문에,
앱의 기초가 되는 네이티브 코드 수정이나, 라이브러리나 Asset의 추가 등의 상황에는 정상적으로 작동되지 않음.

또한 지나치게 많은 코드의 변경사항이 있을 경우 Reload / Restart 순으로 실행중인 프로세스가 상위 재시동을 요청 할 수 있으며, 

특히 추후 상태 관리하는 개발 단계에 도달하게 된다면, 해당 기능을 사용할때 주의를 요하게 될 수 있음.

### 디자인 가이드
Meterial Design - Google의 철학이 녹아져있는 디자인 가이드
Cupertino Design - Apple의 철학이 녹아져 있는 디자인 가이드
해당 디자인 가이드들을 디바이스에 따라 분리해서 구현 할 수 있음,
혹은 Android기기 에서 Cupertino의 디자인 가이드를 따르거나,
iPhone에서 Material 디자인 가이드를 따르게도 만들 수 있음.

#### Material Design
Google에서 제시하는 디자인 가이드 라인이며,
비교적 최근 Material 3를 발표하면서 개인화 된 앱을 구현하는데에 중점이 맞춰져 있음.
Material Design에 맞게 여려 Widgets들이 이미 구현되어있으며,
Flutter에서 Material 2와 3를 개발자의 취향에 맞게 선택하여 활용 할 수도 있음.
또한 Flutter의 경우 Google에서 주도적으로 개발하고 있는 프레임 워크이다 보니,
비교적 Cupertino Widget보다 Material Widget이 더 많이 존재하는 부분도 있음.

#### 디자인 가이드를 따르는 것이 좋을까?
디자인 가이드를 따르는 것이 독창적인 앱을 만드는 데 방해가 될 수 있다고 생각 할 수도 있지만,
사실 디자인 가이드 자체보다는 디자인 가이드 내부에 들어가는 콘텐츠가 더 독창적인 요소를 불러 일으킬 수 있음.
앱 전반의 Font 스타일링을 담당하는 Typography 부터, Color 등의 Theme 요소를 더욱 잘 활용하는 것이 독창적인 앱을 만드는데 효과적이며,
특히 별도의 디자이너 직군이 없는 소규모 앱 개발 인원을 보유한 상황이라면, 개발자들 만으로 수려하고 사용성 높은 앱을 구현하는 데에 있어, 디자인 가이드를 지키는 것이 앱의 완성도를 높이는데에 큰 도움이 될 수 있음.