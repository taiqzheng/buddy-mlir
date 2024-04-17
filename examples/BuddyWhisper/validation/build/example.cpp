#include <buddy/Core/Container.h>
#include <random>
#include <iostream>
#include <math.h>
#include <bitset>
using namespace std;
using bfloat16_t = __bf16;
// Declare the conv2d C interface.
// extern "C" MemRef<bfloat16_t,1>  _mlir_ciface_forward(MemRef<bfloat16_t,1> *, MemRef<bfloat16_t,1> *);
extern "C" MemRef<bfloat16_t,2>  _mlir_ciface_forward(MemRef<bfloat16_t,2> *);
void print_bits(bfloat16_t num) {
    uint32_t bits = *reinterpret_cast<uint32_t*>(&num);
    std::bitset<16> bitset(bits);
    std::cout << bitset << std::endl;
}
void print_bits32(float num) {
    uint32_t bits = *reinterpret_cast<uint32_t*>(&num);
    std::bitset<32> bitset(bits);
    std::cout << bitset << std::endl;
}
int main(){
    cout << "Start processing..." << endl;
    cout << "-----------------------------------------" << endl;

    bfloat16_t *input1Align = new bfloat16_t[13*13];
    intptr_t sizesInput1[2] = {13,13};

    bfloat16_t *outputAlign = new bfloat16_t[13*13];
    intptr_t sizesOutput[2] = {13,13};

    for(int i = 0; i < 169; ++i) {
        // input1Align[i] = 1.25bf16+i;
        input1Align[i] = 1.25bf16;
        // cout<< (float)input1Align[i] << " ";
    }

    for(int i = 0; i < 13; ++i) {
        outputAlign[i] = 3.0bf16;
    }

    MemRef<bfloat16_t,2> input1(input1Align, sizesInput1);
    MemRef<bfloat16_t,2> output(outputAlign, sizesOutput);
    for(int i = 0; i < 10; ++i) {
        cout << static_cast<float>(output.getData()[i]) << " ";
    }
    cout<< endl;
    // Call the function
    output = _mlir_ciface_forward(&input1);
    float result = 1.25 / (1 + exp(-1.25));
    print_bits32(result);
    for(int i = 0; i < 169; ++i) {
        cout << static_cast<float>(output.getData()[i]) << " ";
        print_bits(output.getData()[i]);
    }
    cout<<endl;
    return 0;
}