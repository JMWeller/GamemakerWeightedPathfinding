#include <cstdint>
#define func extern "C" __declspec(dllexport)

func void DLLTestWriteToBuffer(uint16_t* buffer) {
	buffer[0] = 123;
}

// returns the weight from the array (pointer) at index
func double DLLWeightValue(const uint16_t* buffer, double index) {

	return (buffer[(int)index]);
}

/*
// takes in the weights buffer address and output points buffer address. usses the grid with and indexes to calculate the 
func char* DLLCaclulatePath(const uint16_t* weights, const uint16_t* points, double grid_width, double start_index, double goal_index) {

	
}
*/