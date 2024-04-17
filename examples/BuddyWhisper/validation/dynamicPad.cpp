#include <buddy/Core/Container.h>
#include <cstdint>
#include <iostream>

// Declare the dynamic pad interface.
extern "C" {
    MemRef<float,1>  _mlir_ciface_dynamicPad(MemRef<float,1> *input_audio);
}

int main(){
    int length = 6;
    intptr_t sizeofAudio[1] = {length};

    // MemRef copys all data, so data here are actually not accessed.
    MemRef<float, 1> inputAudio(sizeofAudio);
    float *outputAlign = new float[48];
    intptr_t sizesOutput[1] = {48};
    MemRef<float, 1> output(outputAlign, sizesOutput);

    for(int i = 0; i < length; ++i) {
        inputAudio[i] = i;
    }

    std::cout << "Start processing..." << std::endl;
    std::cout << "-----------------------------------------" << std::endl;

    // output length is 48, the method pad the input to 48 with number 0
    output = _mlir_ciface_dynamicPad(&inputAudio);
    
    std::cout << "-----------------------------------------" << std::endl
    std::cout << "End processing..." << std::endl;

    for(int i = 0; i < 48; ++i) {
        std::cout << output[i] << " " ;
    }
    std::cout << std::endl;

    return 0;
}