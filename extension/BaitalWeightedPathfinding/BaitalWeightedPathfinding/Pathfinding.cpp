#define func extern "C" __declspec(dllexport)

class Node {

	double f = 0;
	double g = 0;
	double h = 0;

};

func double get_array_value(double _inp[]) {
	return _inp[0];
}