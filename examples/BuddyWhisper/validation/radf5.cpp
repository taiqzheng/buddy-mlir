#include <buddy/Core/Container.h>
#include <cstdint>
#include <iostream>

// Declare the dynamic radf5 interface.
extern "C" {
    MemRef<float,1>  _mlir_ciface_radf5(MemRef<float,1> *input_audio);
}

int main() {
    int length = 400;
    intptr_t sizeofInput[1] = {length};

    // MemRef copys all data, so data here are actually not accessed.
    MemRef<float, 1>
}
