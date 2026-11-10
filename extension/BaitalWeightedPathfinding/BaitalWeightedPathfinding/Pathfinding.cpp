#include <cstdint>
#define func extern "C" __declspec(dllexport)

func double DLLWeightValue(const uint16_t* buffer, double index) {

	return (buffer[(int)index]);
}