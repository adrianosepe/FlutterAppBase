part of fab_lib;

class ExEnum {
		static String getName(dynamic e) => e.toString().split('.')[1];

    static TEnum fromMap<TEnum>(int value, List<TEnum> enums) {
    	if(value == null) {
    	  return null;
    	}

	    return enums[value];
    }

		static int toMap<TEnum>(TEnum value, List<TEnum> enums) {
			if(value == null) {
				return null;
			}

			return enums.indexOf(value);
		}
}