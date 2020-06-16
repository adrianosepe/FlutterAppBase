part of fab_lib;

typedef Act = void Function();

typedef Act1<T1> = void Function(T1);

typedef Act2<T1, T2> = void Function(T1, T2);

typedef Act3<T1, T2, T3> = void Function(T1, T2, T3);

typedef Func<TResult> = TResult Function();

typedef Func1<T1, TResult> = TResult Function(T1 param1);

typedef Func2<T1, T2, TResult> = TResult Function(T1 param1, T2 param2);

typedef Func3<T1, T2, T3, TResult> = TResult Function(T1 param1, T2 param2, T3 param3);