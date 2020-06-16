part of fab_lib;

class Lazy<T> {
	final Func<T> _func;

	bool _isEvaluated = false;
	T _value;

	Lazy(this._func);

	T get value {
		if(!_isEvaluated) {
			if(_func != null) {
				_value = _func();
			}

			_isEvaluated = true;
		}

		return _value;
	}

	void reset() {
		_isEvaluated = false;
	}
}