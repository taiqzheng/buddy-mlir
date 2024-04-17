memref.global "private" @ccMem : memref<25xf64> = dense<[1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0, 20.0, 21.0, 22.0, 23.0, 24.0, 25.0]>
memref.global "private" @chMem : memref<25xf64> = dense<[0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]>
memref.global "private" @twMem : memref<16xf64> = dense<[0.968583, 0.248690, 0.876307, 0.481754, 0.876307, 0.481754, 0.535827, 0.844328, 0.728969, 0.684547, 0.062791, 0.998027, 0.535827, 0.844328, -0.425779, 0.904827]>
memref.global "private" @testMem : memref<5xf64> = dense<[0.0, 0.0, 0.0, 0.0, 0.0]>
// represent factors
memref.global "private" @fctMem : memref<2xindex> = dense<[5, 5]>

func.func private @printMemrefF64(memref<*xf64>)

// #define WA(x,i) wa[(i)+(x)*(ido-1)]
// #define PM(a,b,c,d) { a=c+d; b=c-d; }
// #define MULPM(a,b,c,d,e,f) { a=c*e+d*f; b=c*f-d*e; }
// #define CC(a,b,c) cc[(a)+ido*((b)+l1*(c))]
// #define CH(a,b,c) ch[(a)+ido*((b)+cdim*(c))]

func.func private @WA(%wa : memref<16xf64>, %x : index, %i : index, %ido : index, %i1 : index) -> f64 {
  %idom1 = arith.subi %ido, %i1 : index
  %tmp1 = arith.muli %x, %idom1 : index
  %index = arith.addi %tmp1, %i : index
  %result = memref.load %wa[%index] : memref<16xf64>
  return %result : f64
}

func.func private @CC(%cc : memref<25xf64>, %a : index, %b : index, %c : index, %ido : index, %l1 : index) -> f64 {
  %tmp1 = arith.muli %l1, %c : index
  %tmp2 = arith.addi %tmp1, %b : index
  %tmp3 = arith.muli %tmp2, %ido : index
  %index = arith.addi %tmp3, %a : index
  %result = memref.load %cc[%index] : memref<25xf64>
  return %result : f64
}

func.func private @CH(%ch : memref<25xf64>, %a : index, %b : index, %c : index, %ido : index, %cdim : index, %toWrite : f64) {
  %tmp1 = arith.muli %cdim, %c : index
  %tmp2 = arith.addi %tmp1, %b : index
  %tmp3 = arith.muli %tmp2, %ido : index
  %index = arith.addi %tmp3, %a : index
  memref.store %toWrite, %ch[%index] : memref<25xf64>
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

func.func @radf5Extend(%cc : memref<25xf64>, %ch : memref<25xf64>, %wa : memref<16xf64>, %ido : index, %l1 : index, %cdim : index) -> () {
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

      %wa0im2 = func.call @WA(%wa, %i0, %im2, %ido, %i1) : (memref<16xf64>, index, index, index, index) -> (f64)
      %wa0im1 = func.call @WA(%wa, %i0, %im1, %ido, %i1) : (memref<16xf64>, index, index, index, index) -> (f64)
      %ccim1k1 = func.call @CC(%cc, %im1, %k, %i1, %ido, %l1) : (memref<25xf64>, index, index, index, index, index) -> (f64)
      %ccik1 = func.call @CC(%cc, %i, %k, %i1, %ido, %l1) : (memref<25xf64>, index, index, index, index, index) -> (f64)
      %dr2_di2:2 = func.call @MULPM(%wa0im2, %wa0im1, %ccim1k1, %ccik1) : (f64, f64, f64, f64) -> (f64, f64)

      %wa1im2 = func.call @WA(%wa, %i1, %im2, %ido, %i1) : (memref<16xf64>, index, index, index, index) -> (f64)
      %wa1im1 = func.call @WA(%wa, %i1, %im1, %ido, %i1) : (memref<16xf64>, index, index, index, index) -> (f64)
      %ccim1k2 = func.call @CC(%cc, %im1, %k, %i1, %ido, %l1) : (memref<25xf64>, index, index, index, index, index) -> (f64)
      %ccik2 = func.call @CC(%cc, %i, %k, %i1, %ido, %l1) : (memref<25xf64>, index, index, index, index, index) -> (f64)
      %dr3_di3:2 = func.call @MULPM(%wa1im2, %wa1im1, %ccim1k2, %ccik2) : (f64, f64, f64, f64) -> (f64, f64)

      %wa2im2 = func.call @WA(%wa, %i2, %im2, %ido, %i1) : (memref<16xf64>, index, index, index, index) -> (f64)
      %wa2im1 = func.call @WA(%wa, %i2, %im1, %ido, %i1) : (memref<16xf64>, index, index, index, index) -> (f64)
      %ccim1k3 = func.call @CC(%cc, %im1, %k, %i3, %ido, %l1) : (memref<25xf64>, index, index, index, index, index) -> (f64)
      %ccik3 = func.call @CC(%cc, %i, %k, %i3, %ido, %l1) : (memref<25xf64>, index, index, index, index, index) -> (f64)
      %dr4_di4:2 = func.call @MULPM(%wa2im2, %wa2im1, %ccim1k3, %ccik3) : (f64, f64, f64, f64) -> (f64, f64)

      %wa3im2 = func.call @WA(%wa, %i3, %im2, %ido, %i1) : (memref<16xf64>, index, index, index, index) -> (f64)
      %wa3im1 = func.call @WA(%wa, %i3, %im1, %ido, %i1) : (memref<16xf64>, index, index, index, index) -> (f64)
      %ccim1k4 = func.call @CC(%cc, %im1, %k, %i4, %ido, %l1) : (memref<25xf64>, index, index, index, index, index) -> (f64)
      %ccik4 = func.call @CC(%cc, %i, %k, %i4, %ido, %l1) : (memref<25xf64>, index, index, index, index, index) -> (f64)
      %dr5_di5:2 = func.call @MULPM(%wa3im2, %wa3im1, %ccim1k4, %ccik4) : (f64, f64, f64, f64) -> (f64, f64)

      %cr2_ci5:2 = func.call @PM(%dr5_di5#0, %dr2_di2#0) : (f64, f64) -> (f64, f64)
      %ci2_cr5:2 = func.call @PM(%dr2_di2#1, %dr5_di5#1) : (f64, f64) -> (f64, f64)
      %cr3_ci4:2 = func.call @PM(%dr4_di4#0, %dr3_di3#0) : (f64, f64) -> (f64, f64)
      %ci3_cr4:2 = func.call @PM(%dr3_di3#1, %dr4_di4#1) : (f64, f64) -> (f64, f64)

      %ccim1k0 = func.call @CC(%cc, %im1, %k, %i0, %ido, %l1) : (memref<25xf64>, index, index, index, index, index) -> (f64)
      %tmpch0 = arith.addf %ccim1k0, %cr2_ci5#0 : f64
      %chim10k = arith.addf %tmpch0, %cr3_ci4#0 : f64
      func.call @CH(%ch, %im1, %i0, %k, %ido, %cdim, %chim10k) : (memref<25xf64>, index, index, index, index, index, f64) -> ()

      %ccik0 = func.call @CC(%cc, %i, %k, %i0, %ido, %l1) : (memref<25xf64>, index, index, index, index, index) -> (f64)
      %tmpch1 = arith.addf %ccik0, %ci2_cr5#0 : f64
      %chi0k = arith.addf %tmpch1, %ci3_cr4#0 : f64
      func.call @CH(%ch, %i, %i0, %k, %ido, %cdim, %chi0k) : (memref<25xf64>, index, index, index, index, index, f64) -> ()

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

      //DEBUG
      // %print_cc = memref.cast %cc : memref<25xf64> to memref<*xf64>
      // func.call @printMemrefF64(%print_cc) : (memref<*xf64>) -> ()

      // %print_ch = memref.cast %ch : memref<25xf64> to memref<*xf64>
      // func.call @printMemrefF64(%print_ch) : (memref<*xf64>) -> ()

      // %test = memref.get_global @testMem : memref<5xf64>
      // memref.store %tr2, %test[%i0] : memref<5xf64>
      // memref.store %ti2, %test[%i1] : memref<5xf64>
      // memref.store %tr3, %test[%i2] : memref<5xf64>
      // memref.store %ti3, %test[%i3] : memref<5xf64>
      // %print_test = memref.cast %test : memref<5xf64> to memref<*xf64>
      // func.call @printMemrefF64(%print_test) : (memref<*xf64>) -> ()

      %tr5_tr4:2 = func.call @MULPM(%ci2_cr5#1, %ci3_cr4#1, %ti11, %ti12) : (f64, f64, f64, f64) -> (f64, f64)
      %ti5_ti4:2 = func.call @MULPM(%cr2_ci5#1, %cr3_ci4#1, %ti11, %ti12) : (f64, f64, f64, f64) -> (f64, f64)

      %chtmp1:2 = func.call @PM(%tr2, %tr5_tr4#0) : (f64, f64) -> (f64, f64)
      func.call @CH(%ch, %im1, %i2, %k, %ido, %cdim, %chtmp1#0) : (memref<25xf64>, index, index, index, index, index, f64) -> ()
      func.call @CH(%ch, %icm1, %i1, %k, %ido, %cdim, %chtmp1#1) : (memref<25xf64>, index, index, index, index, index, f64) -> ()

      %chtmp2:2 = func.call @PM(%ti5_ti4#0, %ti2) : (f64, f64) -> (f64, f64)
      func.call @CH(%ch, %i, %i2, %k, %ido, %cdim, %chtmp2#0) : (memref<25xf64>, index, index, index, index, index, f64) -> ()
      func.call @CH(%ch, %ic, %i1, %k, %ido, %cdim, %chtmp2#1) : (memref<25xf64>, index, index, index, index, index, f64) -> ()

      %chtmp3:2 = func.call @PM(%tr3, %tr5_tr4#1) : (f64, f64) -> (f64, f64)
      func.call @CH(%ch, %im1, %i4, %k, %ido, %cdim, %chtmp3#0) : (memref<25xf64>, index, index, index, index, index, f64) -> ()
      func.call @CH(%ch, %icm1, %i3, %k, %ido, %cdim, %chtmp3#1) : (memref<25xf64>, index, index, index, index, index, f64) -> ()

      %chtmp4:2 = func.call @PM(%ti5_ti4#1, %ti3) : (f64, f64) -> (f64, f64)
      func.call @CH(%ch, %i, %i4, %k, %ido, %cdim, %chtmp4#0) : (memref<25xf64>, index, index, index, index, index, f64) -> ()
      func.call @CH(%ch, %ic, %i3, %k, %ido, %cdim, %chtmp4#1) : (memref<25xf64>, index, index, index, index, index, f64) -> ()
      
      scf.yield
    }
    scf.yield
  }
  return
}

func.func @radf5(%cc : memref<25xf64>, %ch : memref<25xf64>, %wa : memref<16xf64>, %ido : index, %l1 : index) {
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
    %cc0k4 = func.call @CC(%cc, %i0, %iv, %i4, %ido, %l1) : (memref<25xf64>, index, index, index, index, index) -> (f64)
    %cc0k1 = func.call @CC(%cc, %i0, %iv, %i1, %ido, %l1) : (memref<25xf64>, index, index, index, index, index) -> (f64)
    %cr2_ci5:2 = func.call @PM(%cc0k4, %cc0k1) : (f64, f64) -> (f64, f64)
    
    %cc0k3 = func.call @CC(%cc, %i0, %iv, %i3, %ido, %l1) : (memref<25xf64>, index, index, index, index, index) -> (f64)
    %cc0k2 = func.call @CC(%cc, %i0, %iv, %i2, %ido, %l1) : (memref<25xf64>, index, index, index, index, index) -> (f64)
    %cr3_ci4:2 = func.call @PM(%cc0k3, %cc0k2) : (f64, f64) -> (f64, f64)
    
    %cc0k0 = func.call @CC(%cc, %i0, %iv, %i0, %ido, %l1) : (memref<25xf64>, index, index, index, index, index) -> (f64)
    %tmpch0 = arith.addf %cc0k0, %cr2_ci5#0 : f64
    %ch0 = arith.addf %tmpch0, %cr3_ci4#0 : f64
    func.call @CH(%ch, %i0, %i0, %iv, %ido, %cdim, %ch0) : (memref<25xf64>, index, index, index, index, index, f64) -> ()

    %tmpch1 = arith.mulf %tr11, %cr2_ci5#0 : f64
    %tmpch2 = arith.mulf %tr12, %cr3_ci4#0 : f64
    %tmpch3 = arith.addf %cc0k0, %tmpch1 : f64
    %ch1 = arith.addf %tmpch2, %tmpch3 : f64
    func.call @CH(%ch, %idom1, %i1, %iv, %ido, %cdim, %ch1) : (memref<25xf64>, index, index, index, index, index, f64) -> ()

    %tmpch4 = arith.mulf %ti11, %cr2_ci5#1 : f64
    %tmpch5 = arith.mulf %ti12, %cr3_ci4#1 : f64
    %ch2 = arith.addf %tmpch4, %tmpch5 : f64
    func.call @CH(%ch, %i0, %i2, %iv, %ido, %cdim, %ch2) : (memref<25xf64>, index, index, index, index, index, f64) -> ()

    %tmpch6 = arith.mulf %tr12, %cr2_ci5#0 : f64
    %tmpch7 = arith.mulf %tr11, %cr3_ci4#0 : f64
    %tmpch8 = arith.addf %tmpch6, %tmpch7 : f64
    %ch3 = arith.addf %cc0k0, %tmpch8 : f64
    func.call @CH(%ch, %idom1, %i3, %iv, %ido, %cdim, %ch3) : (memref<25xf64>, index, index, index, index, index, f64) -> ()

    %tmpch9 = arith.mulf %ti12, %cr2_ci5#1 : f64
    %tmpch10 = arith.mulf %ti11, %cr3_ci4#1 : f64
    %ch4 = arith.subf %tmpch9, %tmpch10 : f64
    func.call @CH(%ch, %i0, %i4, %iv, %ido, %cdim, %ch4) : (memref<25xf64>, index, index, index, index, index, f64) -> ()
    
    scf.yield
  }

  %condition = arith.cmpi ne, %ido, %i1 : index
  scf.if %condition {
    func.call @radf5Extend(%cc, %ch, %wa, %ido, %l1, %cdim) : (memref<25xf64>, memref<25xf64>, memref<16xf64>, index, index, index) -> ()
    
    scf.yield
  }
  
  return 
}

func.func @main() {
  %cc = memref.get_global @ccMem : memref<25xf64>
  %ch = memref.get_global @chMem : memref<25xf64>
  %wa = memref.get_global @twMem : memref<16xf64>
  %fct = memref.get_global @fctMem : memref<2xindex>
  %ido = arith.constant 1 : index
  %l1 = arith.constant 5 : index
  %i0 = arith.constant 0 : index
  %i1 = arith.constant 1 : index
  %nf = arith.constant 2 : index
  %initK = arith.subi %nf, %i1 : index

  // scf.for %iv = %i0 to %nf step %i1 iter_args(%k = %initK, %ido = %initIdo, %l1 = %initL1) {
  //   %ip = memref.load %fct[%k] : memref<2xindex>
  //   %condEq4 = arith.cmpi %ip

  //   scf.yield %k, %ido, %l1 : index, index, index
  // }

  func.call @radf5(%cc, %ch, %wa, %ido, %l1) : (memref<25xf64>, memref<25xf64>, memref<16xf64>, index, index) -> ()
  func.call @radf5(%ch, %cc, %wa, %l1, %ido) : (memref<25xf64>, memref<25xf64>, memref<16xf64>, index, index) -> ()

  %print_out = memref.cast %cc : memref<25xf64> to memref<*xf64>
  func.call @printMemrefF64(%print_out) : (memref<*xf64>) -> ()

  return
}


  // //DEBUG
  // %print_out = memref.cast %ch : memref<5xf64> to memref<*xf64>
  // func.call @printMemrefF64(%print_out) : (memref<*xf64>) -> ()
