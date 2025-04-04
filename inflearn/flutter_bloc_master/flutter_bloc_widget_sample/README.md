# flutter_bloc_master

### BlocProvider
- Bloc + Provider, 블럭을 제공하는 위젯
- 지연생성 옵션(lazy)
- 하위 계층 위젯들에서 접근 가능
- Bloc 생성 후 메모리 반환의 경우 자동으로 해준다

``` dart
return BlocPrivider(
    create: (context) => SampleBloc(),
    lazy: false,
    child: SamplePage(),
)
```

### MultiBlocProvider
- 여러개의 BlocProvider를 사용할 때 사용
- 하위 계층 위젯들에서 접근 가능
- Bloc 생성 후 메모리 반환의 경우 자동으로 해준다

``` dart

// MultiBlocProvider 를 사용하지 않으면
return BlocProvider<BlocA>(
    create: (context) => BlocA(),
    child: BlocProvider<BlocB>(
        create: (context) => BlocB(),
        child: BlocProvider<BlocC>(
            create: (context) => BlocC(),
            child: SamplePage(),
        ),
    ),
)

// MultiBlocProvider 를 사용하면
return MultiBlocProvider(
    providers: [
        BlocProvider(create: (context) => BlocA()),
        BlocProvider(create: (context) => BlocB()),
        BlocProvider(create: (context) => BlocC()),
    ],
    child: SamplePage(),
)
```

### BlocBuilder
- BlocProvider로 생성된 bloc을 사용할때 쓰는 widget
- Bloc의 상태를 빌드하는 위젯
- 상태가 변경될 때마다 빌드된다
- bloc 옵션을 사용하지 않고 사용시 현 context로 부터 bloc을 찾아 변화 감지를 한다.
- bloc을 지정하는 케이스의 경우 특별한케이스에서 사용하라고 권장한다.
- buildWhen 옵션을 통해 필요한 조건일때만 변화를 줄 수 있다.

``` dart
/// bloc 옵션없이 사용
BlocBuilder<SampleBloc, int>(
    builder: (context, state) {
        return Text(state.toString());
    },
)

/// bloc 옵션을 사용하여 사용
BlocBuilder<SampleBloc, int>(
    bloc: sampleBloc,
    builder: (context, state) {
        return Text(state.toString());
    },
    buildWhen: (previous, current) {
        return previous != current;
    },
)
```

### RepositoryProvider, MultiRepositoryProvider
- 데이터 베이스 처리, 로컬데이터 관리, API 통신등 데이터를 다룰때 사용
- RepositoryProvider는 BlocProvider와 동일하다.
- MultiRepositoryProvider는 RepositoryProvider를 여러개 사용할 때 사용한다.
- 둘다 지연생성 옵션(lazy)을 사용할 수 있다.
- 하위 계층 위젯들에서 접근 가능
- Bloc 생성 후 메모리 반환의 경우 자동으로 해준다

``` dart
return RepositoryProvider(
    create: (context) => RepositorySample(),
    child: BlocProvider(
        create: (context) => SampleBlocDI(context.read<RepositorySample>()),
        child: SamplePage(),
    ),
)
```

### BlocSelector
- BlocBuilder와 동일하다.
- 특정 상태만 선택하여 사용할 때 사용한다.
- 선택된 상태만 변화를 줄 수 있다.

``` dart
BlocSelector<BlocSelectorBloc, BlocSelectorState, bool>(
    selector: (state) => state.changeState,
    builder: (context, state) {
        return Text(state.toString());
    },
)
```

### BlocListener, MultiBlocListener
- BlocBuilder와 동일하다.
- 특정 상태만 선택하여 사용할 때 사용한다.
- 선택된 상태만 변화를 줄 수 있다.
- child 위젯의 경우 rebuild가 발생되지 않는다.
- 특정 상태가 변경되었을때 메세지 팝업을 띄워야 하는 상황
- Bloc간 통신이 필요할때

``` dart
BlocListener<SampleBloc, int>(
    listenWhen: (previous, current) => previous > 5,
    listener: (context, state) {
        _showMessage(context);
    },
    child: Text(
        context.read<SampleBloc>().state.toString(),
        style: TextStyle(fontSize: 70),
    )
)
```

### BlocConsumer
- BlocBuilder와 BlocListener를 합친 위젯
- 두 위젯의 기능을 모두 가지고 있다.
- 이벤트도 처리하면서 동시에 화면도 변경을 해 줘야 할때 사용

