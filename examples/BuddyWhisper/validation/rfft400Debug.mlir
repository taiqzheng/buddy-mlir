memref.global "private" @ccMem : memref<400xf64> = dense<[1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0, 20.0, 21.0, 22.0, 23.0, 24.0, 25.0, 26.0, 27.0, 28.0, 29.0, 30.0, 31.0, 32.0, 33.0, 34.0, 35.0, 36.0, 37.0, 38.0, 39.0, 40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0, 50.0, 51.0, 52.0, 53.0, 54.0, 55.0, 56.0, 57.0, 58.0, 59.0, 60.0, 61.0, 62.0, 63.0, 64.0, 65.0, 66.0, 67.0, 68.0, 69.0, 70.0, 71.0, 72.0, 73.0, 74.0, 75.0, 76.0, 77.0, 78.0, 79.0, 80.0, 81.0, 82.0, 83.0, 84.0, 85.0, 86.0, 87.0, 88.0, 89.0, 90.0, 91.0, 92.0, 93.0, 94.0, 95.0, 96.0, 97.0, 98.0, 99.0, 100.0, 101.0, 102.0, 103.0, 104.0, 105.0, 106.0, 107.0, 108.0, 109.0, 110.0, 111.0, 112.0, 113.0, 114.0, 115.0, 116.0, 117.0, 118.0, 119.0, 120.0, 121.0, 122.0, 123.0, 124.0, 125.0, 126.0, 127.0, 128.0, 129.0, 130.0, 131.0, 132.0, 133.0, 134.0, 135.0, 136.0, 137.0, 138.0, 139.0, 140.0, 141.0, 142.0, 143.0, 144.0, 145.0, 146.0, 147.0, 148.0, 149.0, 150.0, 151.0, 152.0, 153.0, 154.0, 155.0, 156.0, 157.0, 158.0, 159.0, 160.0, 161.0, 162.0, 163.0, 164.0, 165.0, 166.0, 167.0, 168.0, 169.0, 170.0, 171.0, 172.0, 173.0, 174.0, 175.0, 176.0, 177.0, 178.0, 179.0, 180.0, 181.0, 182.0, 183.0, 184.0, 185.0, 186.0, 187.0, 188.0, 189.0, 190.0, 191.0, 192.0, 193.0, 194.0, 195.0, 196.0, 197.0, 198.0, 199.0, 200.0, 201.0, 202.0, 203.0, 204.0, 205.0, 206.0, 207.0, 208.0, 209.0, 210.0, 211.0, 212.0, 213.0, 214.0, 215.0, 216.0, 217.0, 218.0, 219.0, 220.0, 221.0, 222.0, 223.0, 224.0, 225.0, 226.0, 227.0, 228.0, 229.0, 230.0, 231.0, 232.0, 233.0, 234.0, 235.0, 236.0, 237.0, 238.0, 239.0, 240.0, 241.0, 242.0, 243.0, 244.0, 245.0, 246.0, 247.0, 248.0, 249.0, 250.0, 251.0, 252.0, 253.0, 254.0, 255.0, 256.0, 257.0, 258.0, 259.0, 260.0, 261.0, 262.0, 263.0, 264.0, 265.0, 266.0, 267.0, 268.0, 269.0, 270.0, 271.0, 272.0, 273.0, 274.0, 275.0, 276.0, 277.0, 278.0, 279.0, 280.0, 281.0, 282.0, 283.0, 284.0, 285.0, 286.0, 287.0, 288.0, 289.0, 290.0, 291.0, 292.0, 293.0, 294.0, 295.0, 296.0, 297.0, 298.0, 299.0, 300.0, 301.0, 302.0, 303.0, 304.0, 305.0, 306.0, 307.0, 308.0, 309.0, 310.0, 311.0, 312.0, 313.0, 314.0, 315.0, 316.0, 317.0, 318.0, 319.0, 320.0, 321.0, 322.0, 323.0, 324.0, 325.0, 326.0, 327.0, 328.0, 329.0, 330.0, 331.0, 332.0, 333.0, 334.0, 335.0, 336.0, 337.0, 338.0, 339.0, 340.0, 341.0, 342.0, 343.0, 344.0, 345.0, 346.0, 347.0, 348.0, 349.0, 350.0, 351.0, 352.0, 353.0, 354.0, 355.0, 356.0, 357.0, 358.0, 359.0, 360.0, 361.0, 362.0, 363.0, 364.0, 365.0, 366.0, 367.0, 368.0, 369.0, 370.0, 371.0, 372.0, 373.0, 374.0, 375.0, 376.0, 377.0, 378.0, 379.0, 380.0, 381.0, 382.0, 383.0, 384.0, 385.0, 386.0, 387.0, 388.0, 389.0, 390.0, 391.0, 392.0, 393.0, 394.0, 395.0, 396.0, 397.0, 398.0, 399.0, 400.0]>
memref.global "private" @chMem : memref<400xf64> = dense<[0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]>
memref.global "private" @tw0Mem : memref<297xf64> = dense<[0.999877, 0.015707, 0.999507, 0.031411, 0.998890, 0.047106, 0.998027, 0.062791, 0.996917, 0.078459, 0.995562, 0.094108, 0.993961, 0.109734, 0.992115, 0.125333, 0.990024, 0.140901, 0.987688, 0.156434, 0.985109, 0.171929, 0.982287, 0.187381, 0.979223, 0.202787, 0.975917, 0.218143, 0.972370, 0.233445, 0.968583, 0.248690, 0.964557, 0.263873, 0.960294, 0.278991, 0.955793, 0.294040, 0.951057, 0.309017, 0.946085, 0.323917, 0.940881, 0.338738, 0.935444, 0.353475, 0.929776, 0.368125, 0.923880, 0.382683, 0.917755, 0.397148, 0.911403, 0.411514, 0.904827, 0.425779, 0.898028, 0.439939, 0.891007, 0.453990, 0.883766, 0.467930, 0.876307, 0.481754, 0.868632, 0.495459, 0.860742, 0.509041, 0.852640, 0.522499, 0.844328, 0.535827, 0.835807, 0.549023, 0.827081, 0.562083, 0.818150, 0.575005, 0.809017, 0.587785, 0.799685, 0.600420, 0.790155, 0.612907, 0.780430, 0.625243, 0.770513, 0.637424, 0.760406, 0.649448, 0.750111, 0.661312, 0.739631, 0.673013, 0.728969, 0.684547, 0.718126, 0.695913, 0.000000, 0.999507, 0.031411, 0.998027, 0.062791, 0.995562, 0.094108, 0.992115, 0.125333, 0.987688, 0.156434, 0.982287, 0.187381, 0.975917, 0.218143, 0.968583, 0.248690, 0.960294, 0.278991, 0.951057, 0.309017, 0.940881, 0.338738, 0.929776, 0.368125, 0.917755, 0.397148, 0.904827, 0.425779, 0.891007, 0.453990, 0.876307, 0.481754, 0.860742, 0.509041, 0.844328, 0.535827, 0.827081, 0.562083, 0.809017, 0.587785, 0.790155, 0.612907, 0.770513, 0.637424, 0.750111, 0.661312, 0.728969, 0.684547, 0.707107, 0.707107, 0.684547, 0.728969, 0.661312, 0.750111, 0.637424, 0.770513, 0.612907, 0.790155, 0.587785, 0.809017, 0.562083, 0.827081, 0.535827, 0.844328, 0.509041, 0.860742, 0.481754, 0.876307, 0.453990, 0.891007, 0.425779, 0.904827, 0.397148, 0.917755, 0.368125, 0.929776, 0.338738, 0.940881, 0.309017, 0.951057, 0.278991, 0.960294, 0.248690, 0.968583, 0.218143, 0.975917, 0.187381, 0.982287, 0.156434, 0.987688, 0.125333, 0.992115, 0.094108, 0.995562, 0.062791, 0.998027, 0.031411, 0.999507, 0.000000, 0.998890, 0.047106, 0.995562, 0.094108, 0.990024, 0.140901, 0.982287, 0.187381, 0.972370, 0.233445, 0.960294, 0.278991, 0.946085, 0.323917, 0.929776, 0.368125, 0.911403, 0.411514, 0.891007, 0.453990, 0.868632, 0.495459, 0.844328, 0.535827, 0.818150, 0.575005, 0.790155, 0.612907, 0.760406, 0.649448, 0.728969, 0.684547, 0.695913, 0.718126, 0.661312, 0.750111, 0.625243, 0.780430, 0.587785, 0.809017, 0.549023, 0.835807, 0.509041, 0.860742, 0.467930, 0.883766, 0.425779, 0.904827, 0.382683, 0.923880, 0.338738, 0.940881, 0.294040, 0.955793, 0.248690, 0.968583, 0.202787, 0.979223, 0.156434, 0.987688, 0.109734, 0.993961, 0.062791, 0.998027, 0.015707, 0.999877, -0.031411, 0.999507, -0.078459, 0.996917, -0.125333, 0.992115, -0.171929, 0.985109, -0.218143, 0.975917, -0.263873, 0.964557, -0.309017, 0.951057, -0.353475, 0.935444, -0.397148, 0.917755, -0.439939, 0.898028, -0.481754, 0.876307, -0.522499, 0.852640, -0.562083, 0.827081, -0.600420, 0.799685, -0.637424, 0.770513, -0.673013, 0.739631, 0.000000]>
memref.global "private" @tw1Mem : memref<72xf64> = dense<[0.998027, 0.062791, 0.992115, 0.125333, 0.982287, 0.187381, 0.968583, 0.248690, 0.951057, 0.309017, 0.929776, 0.368125, 0.904827, 0.425779, 0.876307, 0.481754, 0.844328, 0.535827, 0.809017, 0.587785, 0.770513, 0.637424, 0.728969, 0.684547, 0.992115, 0.125333, 0.968583, 0.248690, 0.929776, 0.368125, 0.876307, 0.481754, 0.809017, 0.587785, 0.728969, 0.684547, 0.637424, 0.770513, 0.535827, 0.844328, 0.425779, 0.904827, 0.309017, 0.951057, 0.187381, 0.982287, 0.062791, 0.998027, 0.982287, 0.187381, 0.929776, 0.368125, 0.844328, 0.535827, 0.728969, 0.684547, 0.587785, 0.809017, 0.425779, 0.904827, 0.248690, 0.968583, 0.062791, 0.998027, -0.125333, 0.992115, -0.309017, 0.951057, -0.481754, 0.876307, -0.637424, 0.770513]>
memref.global "private" @tw2Mem : memref<16xf64> = dense<[0.968583, 0.248690, 0.876307, 0.481754, 0.876307, 0.481754, 0.535827, 0.844328, 0.728969, 0.684547, 0.062791, 0.998027, 0.535827, 0.844328, -0.425779, 0.904827]>

memref.global "private" @testMem : memref<8xf64> = dense<[0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]>
// represent factors
memref.global "private" @fctMem : memref<4xindex> = dense<[5, 5, 4, 4]>

func.func private @printMemrefF64(memref<*xf64>)

func.func private @WA(%wa : memref<?xf64>, %x : index, %i : index, %ido : index, %i1 : index) -> f64 {
  %idom1 = arith.subi %ido, %i1 : index
  %tmp1 = arith.muli %x, %idom1 : index
  %index = arith.addi %tmp1, %i : index
  %result = memref.load %wa[%index] : memref<?xf64>
  return %result : f64
}

func.func private @CC(%cc : memref<400xf64>, %a : index, %b : index, %c : index, %ido : index, %l1 : index) -> f64 {
  %tmp1 = arith.muli %l1, %c : index
  %tmp2 = arith.addi %tmp1, %b : index
  %tmp3 = arith.muli %tmp2, %ido : index
  %index = arith.addi %tmp3, %a : index
  %result = memref.load %cc[%index] : memref<400xf64>
  return %result : f64
}

func.func private @CH(%ch : memref<400xf64>, %a : index, %b : index, %c : index, %ido : index, %cdim : index, %toWrite : f64) {
  %tmp1 = arith.muli %cdim, %c : index
  %tmp2 = arith.addi %tmp1, %b : index
  %tmp3 = arith.muli %tmp2, %ido : index
  %index = arith.addi %tmp3, %a : index
  memref.store %toWrite, %ch[%index] : memref<400xf64>
  return
}

func.func private @PM(%c : f64, %d : f64) -> (f64, f64) {
  %a = arith.addf %c, %d : f64
  %b = arith.subf %c, %d : f64
  return %a, %b : f64, f64
}

func.func private @MULPM(%c : f64, %d : f64, %e : f64, %f : f64) -> (f64, f64) {
  %tmp1 = arith.mulf %c, %e : f64
  %tmp2 = arith.mulf %d, %f : f64
  %a = arith.addf %tmp1, %tmp2 : f64
  %tmp3 = arith.mulf %c, %f : f64
  %tmp4 = arith.mulf %d, %e : f64
  %b = arith.subf %tmp3, %tmp4 : f64
  return %a, %b : f64, f64
}

func.func @radf4Extend(%cc : memref<400xf64>, %ch : memref<400xf64>, %wa : memref<?xf64>, %ido : index, %l1 : index, %cdim : index) -> () {
  %i0 = arith.constant 0 : index
  %i1 = arith.constant 1 : index
  %i2 = arith.constant 2 : index
  %i3 = arith.constant 3 : index

  scf.for %k = %i0 to %l1 step %i1 {
    scf.for %i = %i2 to %ido step %i2 {
      %ic = arith.subi %ido, %i : index
      %icm1 = arith.subi %ic, %i1 : index
      %im1 = arith.subi %i, %i1 : index
      %im2 = arith.subi %i, %i2 : index

      %wa0im2 = func.call @WA(%wa, %i0, %im2, %ido, %i1) : (memref<?xf64>, index, index, index, index) -> (f64)
      %wa0im1 = func.call @WA(%wa, %i0, %im1, %ido, %i1) : (memref<?xf64>, index, index, index, index) -> (f64)
      %ccim1k1 = func.call @CC(%cc, %im1, %k, %i1, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
      %ccik1 = func.call @CC(%cc, %i, %k, %i1, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
      %cr2_ci2:2 = func.call @MULPM(%wa0im2, %wa0im1, %ccim1k1, %ccik1) : (f64, f64, f64, f64) -> (f64, f64)

      %wa1im2 = func.call @WA(%wa, %i1, %im2, %ido, %i1) : (memref<?xf64>, index, index, index, index) -> (f64)
      %wa1im1 = func.call @WA(%wa, %i1, %im1, %ido, %i1) : (memref<?xf64>, index, index, index, index) -> (f64)
      %ccim1k2 = func.call @CC(%cc, %im1, %k, %i1, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
      %ccik2 = func.call @CC(%cc, %i, %k, %i1, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
      %cr3_ci3:2 = func.call @MULPM(%wa1im2, %wa1im1, %ccim1k2, %ccik2) : (f64, f64, f64, f64) -> (f64, f64)

      %wa2im2 = func.call @WA(%wa, %i2, %im2, %ido, %i1) : (memref<?xf64>, index, index, index, index) -> (f64)
      %wa2im1 = func.call @WA(%wa, %i2, %im1, %ido, %i1) : (memref<?xf64>, index, index, index, index) -> (f64)
      %ccim1k3 = func.call @CC(%cc, %im1, %k, %i3, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
      %ccik3 = func.call @CC(%cc, %i, %k, %i3, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
      %cr4_ci4:2 = func.call @MULPM(%wa2im2, %wa2im1, %ccim1k3, %ccik3) : (f64, f64, f64, f64) -> (f64, f64)

      %tr1_tr4:2 = func.call @PM(%cr4_ci4#0, %cr2_ci2#0) : (f64, f64) -> (f64, f64)
      %ti1_ti4:2 = func.call @PM(%cr2_ci2#1, %cr4_ci4#1) : (f64, f64) -> (f64, f64)
      %ccim1k0 = func.call @CC(%cc, %im1, %k, %i0, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
      %tr2_tr3:2 = func.call @PM(%ccim1k0, %cr3_ci3#0) : (f64, f64) -> (f64, f64)
      %ccik0 = func.call @CC(%cc, %i, %k, %i0, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)      
      %ti2_ti3:2 = func.call @PM(%ccik0, %cr3_ci3#1) : (f64, f64) -> (f64, f64)

      %chtmp1:2 = func.call @PM(%tr2_tr3#0, %tr1_tr4#0) : (f64, f64) -> (f64, f64)
      func.call @CH(%ch, %im1, %i0, %k, %ido, %cdim, %chtmp1#0) : (memref<400xf64>, index, index, index, index, index, f64) -> ()
      func.call @CH(%ch, %icm1, %i3, %k, %ido, %cdim, %chtmp1#1) : (memref<400xf64>, index, index, index, index, index, f64) -> ()

      %chtmp2:2 = func.call @PM(%ti1_ti4#0, %ti2_ti3#0) : (f64, f64) -> (f64, f64)
      func.call @CH(%ch, %i, %i0, %k, %ido, %cdim, %chtmp2#0) : (memref<400xf64>, index, index, index, index, index, f64) -> ()
      func.call @CH(%ch, %ic, %i3, %k, %ido, %cdim, %chtmp2#1) : (memref<400xf64>, index, index, index, index, index, f64) -> ()

      %chtmp3:2 = func.call @PM(%tr2_tr3#1, %ti1_ti4#1) : (f64, f64) -> (f64, f64)
      func.call @CH(%ch, %im1, %i2, %k, %ido, %cdim, %chtmp3#0) : (memref<400xf64>, index, index, index, index, index, f64) -> ()
      func.call @CH(%ch, %icm1, %i1, %k, %ido, %cdim, %chtmp3#1) : (memref<400xf64>, index, index, index, index, index, f64) -> ()

      %chtmp4:2 = func.call @PM(%tr1_tr4#1, %ti2_ti3#1) : (f64, f64) -> (f64, f64)
      func.call @CH(%ch, %i, %i2, %k, %ido, %cdim, %chtmp4#0) : (memref<400xf64>, index, index, index, index, index, f64) -> ()
      func.call @CH(%ch, %ic, %i1, %k, %ido, %cdim, %chtmp4#1) : (memref<400xf64>, index, index, index, index, index, f64) -> ()
      
      scf.yield
    }
    scf.yield
  }
  return
}

func.func @radf4(%cc : memref<400xf64>, %ch : memref<400xf64>, %wa : memref<?xf64>, %ido : index, %l1 : index) {
  %cdim = arith.constant 4 : index
  %hsqt2 = arith.constant 0.70710678118654752440 : f64
  %negHsqt2 = arith.constant -0.70710678118654752440 : f64
  %i0 = arith.constant 0 : index
  %i1 = arith.constant 1 : index
  %i2 = arith.constant 2 : index
  %i3 = arith.constant 3 : index
  %idom1 = arith.subi %ido, %i1 : index

  scf.for %k = %i0 to %l1 step %i1 {
    %cc0k3 = func.call @CC(%cc, %i0, %k, %i3, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
    %cc0k1 = func.call @CC(%cc, %i0, %k, %i1, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
    %tr1_tmp0:2 = func.call @PM(%cc0k3, %cc0k1) : (f64, f64) -> (f64, f64)
    func.call @CH(%ch, %i0, %i2, %k, %ido, %cdim, %tr1_tmp0#1) : (memref<400xf64>, index, index, index, index, index, f64) -> ()
    
    %cc0k0 = func.call @CC(%cc, %i0, %k, %i0, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
    %cc0k2 = func.call @CC(%cc, %i0, %k, %i2, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
    %tr2_tmp1:2 = func.call @PM(%cc0k0, %cc0k2) : (f64, f64) -> (f64, f64)
    func.call @CH(%ch, %idom1, %i1, %k, %ido, %cdim, %tr2_tmp1#1) : (memref<400xf64>, index, index, index, index, index, f64) -> ()
    
    %tmp2_tmp3:2 = func.call @PM(%tr2_tmp1#0, %tr1_tmp0#0) : (f64, f64) -> (f64, f64)
    func.call @CH(%ch, %i0, %i0, %k, %ido, %cdim, %tmp2_tmp3#0) : (memref<400xf64>, index, index, index, index, index, f64) -> ()
    func.call @CH(%ch, %idom1, %i3, %k, %ido, %cdim, %tmp2_tmp3#1) : (memref<400xf64>, index, index, index, index, index, f64) -> ()

    scf.yield
  }

  // if(ido & 1 == 0)
  %reminder = arith.remsi %ido, %i2 : index
  %cond0 = arith.cmpi eq, %reminder, %i0 : index
  scf.if %cond0 {
    scf.for %k = %i0 to %l1 step %i1 {
      %ccidom1k1 = func.call @CC(%cc, %idom1, %k, %i1, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
      %ccidom1k3 = func.call @CC(%cc, %idom1, %k, %i3, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
      %tmp0 = arith.addf %ccidom1k1, %ccidom1k3 : f64
      %ti1 = arith.mulf %negHsqt2, %tmp0 : f64

      %tmp1 = arith.subf %ccidom1k1, %ccidom1k3 : f64
      %tr1 = arith.mulf %hsqt2, %tmp1 : f64

      %ccidom1k0 = func.call @CC(%cc, %idom1, %k, %i0, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
      %tmp2_tmp3:2 = func.call @PM(%ccidom1k0, %tr1) : (f64, f64) -> (f64, f64)
      func.call @CH(%ch, %idom1, %i0, %k, %ido, %cdim, %tmp2_tmp3#0) : (memref<400xf64>, index, index, index, index, index, f64) -> ()
      func.call @CH(%ch, %idom1, %i2, %k, %ido, %cdim, %tmp2_tmp3#1) : (memref<400xf64>, index, index, index, index, index, f64) -> ()

      %ccidom1k2 = func.call @CC(%cc, %idom1, %k, %i2, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
      %tmp4_tmp5:2 = func.call @PM(%ti1, %ccidom1k2) : (f64, f64) -> (f64, f64)
      func.call @CH(%ch, %i0, %i3, %k, %ido, %cdim, %tmp4_tmp5#0) : (memref<400xf64>, index, index, index, index, index, f64) -> ()
      func.call @CH(%ch, %i0, %i1, %k, %ido, %cdim, %tmp4_tmp5#1) : (memref<400xf64>, index, index, index, index, index, f64) -> ()

      scf.yield
    }
    scf.yield
  }

  // if(ido > 2)
  %cond1 = arith.cmpi sgt, %ido, %i2 : index
  scf.if %cond1 {
    func.call @radf4Extend(%cc, %ch, %wa, %ido, %l1, %cdim) : (memref<400xf64>, memref<400xf64>, memref<?xf64>, index, index, index) -> ()
    
    scf.yield
  }
  
  return 
}

func.func @radf5Extend(%cc : memref<400xf64>, %ch : memref<400xf64>, %wa : memref<?xf64>, %ido : index, %l1 : index, %cdim : index) -> () {
  %tr11 = arith.constant 0.3090169943749474241 : f64
  %tr12 = arith.constant -0.8090169943749474241 : f64
  %ti11 = arith.constant 0.95105651629515357212 : f64
  %ti12 = arith.constant 0.58778525229247312917 : f64
  %i0 = arith.constant 0 : index
  %i1 = arith.constant 1 : index
  %i2 = arith.constant 2 : index
  %i3 = arith.constant 3 : index
  %i4 = arith.constant 4 : index

  scf.for %k = %i0 to %l1 step %i1 {
    scf.for %i = %i2 to %ido step %i2 {
      %ic = arith.subi %ido, %i : index
      %icm1 = arith.subi %ic, %i1 : index
      %im1 = arith.subi %i, %i1 : index
      %im2 = arith.subi %i, %i2 : index

      %wa0im2 = func.call @WA(%wa, %i0, %im2, %ido, %i1) : (memref<?xf64>, index, index, index, index) -> (f64)
      %wa0im1 = func.call @WA(%wa, %i0, %im1, %ido, %i1) : (memref<?xf64>, index, index, index, index) -> (f64)
      %ccim1k1 = func.call @CC(%cc, %im1, %k, %i1, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
      %ccik1 = func.call @CC(%cc, %i, %k, %i1, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
      %dr2_di2:2 = func.call @MULPM(%wa0im2, %wa0im1, %ccim1k1, %ccik1) : (f64, f64, f64, f64) -> (f64, f64)

      %wa1im2 = func.call @WA(%wa, %i1, %im2, %ido, %i1) : (memref<?xf64>, index, index, index, index) -> (f64)
      %wa1im1 = func.call @WA(%wa, %i1, %im1, %ido, %i1) : (memref<?xf64>, index, index, index, index) -> (f64)
      %ccim1k2 = func.call @CC(%cc, %im1, %k, %i1, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
      %ccik2 = func.call @CC(%cc, %i, %k, %i1, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
      %dr3_di3:2 = func.call @MULPM(%wa1im2, %wa1im1, %ccim1k2, %ccik2) : (f64, f64, f64, f64) -> (f64, f64)

      %wa2im2 = func.call @WA(%wa, %i2, %im2, %ido, %i1) : (memref<?xf64>, index, index, index, index) -> (f64)
      %wa2im1 = func.call @WA(%wa, %i2, %im1, %ido, %i1) : (memref<?xf64>, index, index, index, index) -> (f64)
      %ccim1k3 = func.call @CC(%cc, %im1, %k, %i3, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
      %ccik3 = func.call @CC(%cc, %i, %k, %i3, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
      %dr4_di4:2 = func.call @MULPM(%wa2im2, %wa2im1, %ccim1k3, %ccik3) : (f64, f64, f64, f64) -> (f64, f64)

      %wa3im2 = func.call @WA(%wa, %i3, %im2, %ido, %i1) : (memref<?xf64>, index, index, index, index) -> (f64)
      %wa3im1 = func.call @WA(%wa, %i3, %im1, %ido, %i1) : (memref<?xf64>, index, index, index, index) -> (f64)
      %ccim1k4 = func.call @CC(%cc, %im1, %k, %i4, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
      %ccik4 = func.call @CC(%cc, %i, %k, %i4, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
      %dr5_di5:2 = func.call @MULPM(%wa3im2, %wa3im1, %ccim1k4, %ccik4) : (f64, f64, f64, f64) -> (f64, f64)
//DEBUG
      %test = memref.get_global @testMem : memref<8xf64>
      %i5 = arith.constant 5 : index
      %i6 = arith.constant 6 : index
      %i7 = arith.constant 7 : index
      memref.store %wa0im2, %test[%i0] : memref<8xf64>
      memref.store %wa0im1, %test[%i1] : memref<8xf64>
      memref.store %wa1im2, %test[%i2] : memref<8xf64>
      memref.store %wa1im1, %test[%i3] : memref<8xf64>
      memref.store %wa2im2, %test[%i4] : memref<8xf64>
      memref.store %wa2im1, %test[%i5] : memref<8xf64>
      memref.store %wa3im2, %test[%i6] : memref<8xf64>
      memref.store %wa3im1, %test[%i7] : memref<8xf64>      
    // //   memref.store %dr2_di2#0, %test[%i0] : memref<8xf64>
    // //   memref.store %dr2_di2#1, %test[%i1] : memref<8xf64>
    // //   memref.store %dr3_di3#0, %test[%i2] : memref<8xf64>
    // //   memref.store %dr3_di3#1, %test[%i3] : memref<8xf64>
    // //   memref.store %dr4_di4#0, %test[%i4] : memref<8xf64>
    // //   memref.store %dr4_di4#1, %test[%i5] : memref<8xf64>
    // //   memref.store %dr5_di5#0, %test[%i6] : memref<8xf64>
    // //   memref.store %dr5_di5#1, %test[%i7] : memref<8xf64>
    %print_test = memref.cast %test : memref<8xf64> to memref<*xf64>
    func.call @printMemrefF64(%print_test) : (memref<*xf64>) -> ()

      %cr2_ci5:2 = func.call @PM(%dr5_di5#0, %dr2_di2#0) : (f64, f64) -> (f64, f64)
      %ci2_cr5:2 = func.call @PM(%dr2_di2#1, %dr5_di5#1) : (f64, f64) -> (f64, f64)
      %cr3_ci4:2 = func.call @PM(%dr4_di4#0, %dr3_di3#0) : (f64, f64) -> (f64, f64)
      %ci3_cr4:2 = func.call @PM(%dr3_di3#1, %dr4_di4#1) : (f64, f64) -> (f64, f64)

      %ccim1k0 = func.call @CC(%cc, %im1, %k, %i0, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
      %tmpch0 = arith.addf %ccim1k0, %cr2_ci5#0 : f64
      %chim10k = arith.addf %tmpch0, %cr3_ci4#0 : f64
      func.call @CH(%ch, %im1, %i0, %k, %ido, %cdim, %chim10k) : (memref<400xf64>, index, index, index, index, index, f64) -> ()

      %ccik0 = func.call @CC(%cc, %i, %k, %i0, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
      %tmpch1 = arith.addf %ccik0, %ci2_cr5#0 : f64
      %chi0k = arith.addf %tmpch1, %ci3_cr4#0 : f64
      func.call @CH(%ch, %i, %i0, %k, %ido, %cdim, %chi0k) : (memref<400xf64>, index, index, index, index, index, f64) -> ()

      %tmp2 = arith.mulf %tr11, %cr2_ci5#0 : f64
      %tmp3 = arith.addf %ccim1k0, %tmp2 : f64
      %tmp4 = arith.mulf %tr12, %cr3_ci4#0 : f64
      %tr2 = arith.addf %tmp3, %tmp4 : f64

      %tmp5 = arith.mulf %tr11, %ci2_cr5#0 : f64
      %tmp6 = arith.addf %ccik0, %tmp5 : f64
      %tmp7 = arith.mulf %tr12, %ci3_cr4#0 : f64
      %ti2 = arith.addf %tmp6, %tmp7 : f64

      %tmp8 = arith.mulf %tr12, %cr2_ci5#0 : f64
      %tmp9 = arith.addf %ccim1k0, %tmp8 : f64
      %tmp10 = arith.mulf %tr11, %cr3_ci4#0 : f64
      %tr3 = arith.addf %tmp9, %tmp10 : f64

      %tmp11 = arith.mulf %tr12, %ci2_cr5#0 : f64
      %tmp12 = arith.addf %ccik0, %tmp11 : f64
      %tmp13 = arith.mulf %tr11, %ci3_cr4#0 : f64
      %ti3 = arith.addf %tmp12, %tmp13 : f64

      %tr5_tr4:2 = func.call @MULPM(%ci2_cr5#1, %ci3_cr4#1, %ti11, %ti12) : (f64, f64, f64, f64) -> (f64, f64)
      %ti5_ti4:2 = func.call @MULPM(%cr2_ci5#1, %cr3_ci4#1, %ti11, %ti12) : (f64, f64, f64, f64) -> (f64, f64)

      %chtmp1:2 = func.call @PM(%tr2, %tr5_tr4#0) : (f64, f64) -> (f64, f64)
      func.call @CH(%ch, %im1, %i2, %k, %ido, %cdim, %chtmp1#0) : (memref<400xf64>, index, index, index, index, index, f64) -> ()
      func.call @CH(%ch, %icm1, %i1, %k, %ido, %cdim, %chtmp1#1) : (memref<400xf64>, index, index, index, index, index, f64) -> ()

      %chtmp2:2 = func.call @PM(%ti5_ti4#0, %ti2) : (f64, f64) -> (f64, f64)
      func.call @CH(%ch, %i, %i2, %k, %ido, %cdim, %chtmp2#0) : (memref<400xf64>, index, index, index, index, index, f64) -> ()
      func.call @CH(%ch, %ic, %i1, %k, %ido, %cdim, %chtmp2#1) : (memref<400xf64>, index, index, index, index, index, f64) -> ()

      %chtmp3:2 = func.call @PM(%tr3, %tr5_tr4#1) : (f64, f64) -> (f64, f64)
      func.call @CH(%ch, %im1, %i4, %k, %ido, %cdim, %chtmp3#0) : (memref<400xf64>, index, index, index, index, index, f64) -> ()
      func.call @CH(%ch, %icm1, %i3, %k, %ido, %cdim, %chtmp3#1) : (memref<400xf64>, index, index, index, index, index, f64) -> ()

      %chtmp4:2 = func.call @PM(%ti5_ti4#1, %ti3) : (f64, f64) -> (f64, f64)
      func.call @CH(%ch, %i, %i4, %k, %ido, %cdim, %chtmp4#0) : (memref<400xf64>, index, index, index, index, index, f64) -> ()
      func.call @CH(%ch, %ic, %i3, %k, %ido, %cdim, %chtmp4#1) : (memref<400xf64>, index, index, index, index, index, f64) -> ()
      

        // %print_out = memref.cast %ch : memref<400xf64> to memref<*xf64>
        // func.call @printMemrefF64(%print_out) : (memref<*xf64>) -> ()
      scf.yield
    }
    scf.yield
  }
  return
}

func.func @radf5(%cc : memref<400xf64>, %ch : memref<400xf64>, %wa : memref<?xf64>, %ido : index, %l1 : index) {
  %cdim = arith.constant 5 : index
  %tr11 = arith.constant 0.3090169943749474241 : f64
  %tr12 = arith.constant -0.8090169943749474241 : f64
  %ti11 = arith.constant 0.95105651629515357212 : f64
  %ti12 = arith.constant 0.58778525229247312917 : f64
  %i0 = arith.constant 0 : index
  %i1 = arith.constant 1 : index
  %i2 = arith.constant 2 : index
  %i3 = arith.constant 3 : index
  %i4 = arith.constant 4 : index
  %idom1 = arith.subi %ido, %i1 : index

  scf.for %iv = %i0 to %l1 step %i1 {
    %cc0k4 = func.call @CC(%cc, %i0, %iv, %i4, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
    %cc0k1 = func.call @CC(%cc, %i0, %iv, %i1, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
    %cr2_ci5:2 = func.call @PM(%cc0k4, %cc0k1) : (f64, f64) -> (f64, f64)
    
    %cc0k3 = func.call @CC(%cc, %i0, %iv, %i3, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
    %cc0k2 = func.call @CC(%cc, %i0, %iv, %i2, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
    %cr3_ci4:2 = func.call @PM(%cc0k3, %cc0k2) : (f64, f64) -> (f64, f64)
    
    %cc0k0 = func.call @CC(%cc, %i0, %iv, %i0, %ido, %l1) : (memref<400xf64>, index, index, index, index, index) -> (f64)
    %tmpch0 = arith.addf %cc0k0, %cr2_ci5#0 : f64
    %ch0 = arith.addf %tmpch0, %cr3_ci4#0 : f64
    func.call @CH(%ch, %i0, %i0, %iv, %ido, %cdim, %ch0) : (memref<400xf64>, index, index, index, index, index, f64) -> ()

    %tmpch1 = arith.mulf %tr11, %cr2_ci5#0 : f64
    %tmpch2 = arith.mulf %tr12, %cr3_ci4#0 : f64
    %tmpch3 = arith.addf %cc0k0, %tmpch1 : f64
    %ch1 = arith.addf %tmpch2, %tmpch3 : f64
    func.call @CH(%ch, %idom1, %i1, %iv, %ido, %cdim, %ch1) : (memref<400xf64>, index, index, index, index, index, f64) -> ()

    %tmpch4 = arith.mulf %ti11, %cr2_ci5#1 : f64
    %tmpch5 = arith.mulf %ti12, %cr3_ci4#1 : f64
    %ch2 = arith.addf %tmpch4, %tmpch5 : f64
    func.call @CH(%ch, %i0, %i2, %iv, %ido, %cdim, %ch2) : (memref<400xf64>, index, index, index, index, index, f64) -> ()

    %tmpch6 = arith.mulf %tr12, %cr2_ci5#0 : f64
    %tmpch7 = arith.mulf %tr11, %cr3_ci4#0 : f64
    %tmpch8 = arith.addf %tmpch6, %tmpch7 : f64
    %ch3 = arith.addf %cc0k0, %tmpch8 : f64
    func.call @CH(%ch, %idom1, %i3, %iv, %ido, %cdim, %ch3) : (memref<400xf64>, index, index, index, index, index, f64) -> ()

    %tmpch9 = arith.mulf %ti12, %cr2_ci5#1 : f64
    %tmpch10 = arith.mulf %ti11, %cr3_ci4#1 : f64
    %ch4 = arith.subf %tmpch9, %tmpch10 : f64
    func.call @CH(%ch, %i0, %i4, %iv, %ido, %cdim, %ch4) : (memref<400xf64>, index, index, index, index, index, f64) -> ()
    
    scf.yield
  }

  %condition = arith.cmpi ne, %ido, %i1 : index
  scf.if %condition {
    func.call @radf5Extend(%cc, %ch, %wa, %ido, %l1, %cdim) : (memref<400xf64>, memref<400xf64>, memref<?xf64>, index, index, index) -> ()

    scf.yield
  }
  
  return 
}

func.func @main() {
  %cc = memref.get_global @ccMem : memref<400xf64>
  %ch = memref.get_global @chMem : memref<400xf64>
  %wa0 = memref.get_global @tw0Mem : memref<297xf64>
  %wa0Dynamic = memref.cast %wa0 : memref<297xf64> to memref<?xf64>

  %wa1 = memref.get_global @tw1Mem : memref<72xf64>
  %wa1Dynamic = memref.cast %wa1 : memref<72xf64> to memref<?xf64>

  %wa2 = memref.get_global @tw2Mem : memref<16xf64>
  %wa2Dynamic = memref.cast %wa2 : memref<16xf64> to memref<?xf64>

  %fct = memref.get_global @fctMem : memref<4xindex>
  %ido = arith.constant 1 : index
  %l1 = arith.constant 4 : index
  %i0 = arith.constant 0 : index
  %i1 = arith.constant 1 : index
  %i4 = arith.constant 4 : index
  %i5 = arith.constant 5 : index
  %i16 = arith.constant 16 : index
  %i25 = arith.constant 25 : index
  %i80 = arith.constant 80 : index
  %i100 = arith.constant 100 : index
  %nf = arith.constant 2 : index
  %initK = arith.subi %nf, %i1 : index

  // scf.for %iv = %i0 to %nf step %i1 iter_args(%k = %initK, %ido = %initIdo, %l1 = %initL1) {
  //   %ip = memref.load %fct[%k] : memref<2xindex>
  //   %condEq4 = arith.cmpi %ip

  //   scf.yield %k, %ido, %l1 : index, index, index
  // }
  func.call @radf5(%cc, %ch, %wa2Dynamic, %i1, %i80) : (memref<400xf64>, memref<400xf64>, memref<?xf64>, index, index) -> ()
  func.call @radf5(%ch, %cc, %wa2Dynamic, %i5, %i16) : (memref<400xf64>, memref<400xf64>, memref<?xf64>, index, index) -> ()
//   %print_out = memref.cast %cc : memref<400xf64> to memref<*xf64>
//   func.call @printMemrefF64(%print_out) : (memref<*xf64>) -> ()
  func.call @radf4(%cc, %ch, %wa1Dynamic, %i25, %i4) : (memref<400xf64>, memref<400xf64>, memref<?xf64>, index, index) -> ()
  func.call @radf4(%ch, %cc, %wa0Dynamic, %i100, %i1) : (memref<400xf64>, memref<400xf64>, memref<?xf64>, index, index) -> ()

  %print_out = memref.cast %cc : memref<400xf64> to memref<*xf64>
  func.call @printMemrefF64(%print_out) : (memref<*xf64>) -> ()

  return
}

// //DEBUG
// %print_1 = memref.cast %ch : memref<16xf64> to memref<*xf64>
// func.call @printMemrefF64(%print_1) : (memref<*xf64>) -> ()

// %test = memref.get_global @testMem : memref<5xf64>
// memref.store %tr1_tmp0#0, %test[%i0] : memref<5xf64>
// memref.store %tr2_tmp1#0, %test[%i1] : memref<5xf64>
// %print_test = memref.cast %test : memref<5xf64> to memref<*xf64>
// func.call @printMemrefF64(%print_test) : (memref<*xf64>) -> ()
