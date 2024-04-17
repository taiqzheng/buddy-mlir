memref.global "private" @ccMem : memref<16xf64> = dense<[1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0]>
memref.global "private" @chMem : memref<16xf64> = dense<[0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]>
memref.global "private" @twMem : memref<8xf64> = dense<[0.923880, 0.382683, 0.0, 0.707107, 0.707107, 0.0, 0.382683, 0.923880]>
memref.global "private" @testMem : memref<5xf64> = dense<[0.0, 0.0, 0.0, 0.0, 0.0]>
// represent factors
memref.global "private" @fctMem : memref<2xindex> = dense<[4, 4]>

func.func private @printMemrefF64(memref<*xf64>)

// #define WA(x,i) wa[(i)+(x)*(ido-1)]
// #define PM(a,b,c,d) { a=c+d; b=c-d; }
// #define MULPM(a,b,c,d,e,f) { a=c*e+d*f; b=c*f-d*e; }
// #define CC(a,b,c) cc[(a)+ido*((b)+l1*(c))]
// #define CH(a,b,c) ch[(a)+ido*((b)+cdim*(c))]

func.func private @WA(%wa : memref<8xf64>, %x : index, %i : index, %ido : index, %i1 : index) -> f64 {
  %idom1 = arith.subi %ido, %i1 : index
  %tmp1 = arith.muli %x, %idom1 : index
  %index = arith.addi %tmp1, %i : index
  %result = memref.load %wa[%index] : memref<8xf64>
  return %result : f64
}

func.func private @CC(%cc : memref<16xf64>, %a : index, %b : index, %c : index, %ido : index, %l1 : index) -> f64 {
  %tmp1 = arith.muli %l1, %c : index
  %tmp2 = arith.addi %tmp1, %b : index
  %tmp3 = arith.muli %tmp2, %ido : index
  %index = arith.addi %tmp3, %a : index
  %result = memref.load %cc[%index] : memref<16xf64>
  return %result : f64
}

func.func private @CH(%ch : memref<16xf64>, %a : index, %b : index, %c : index, %ido : index, %cdim : index, %toWrite : f64) {
  %tmp1 = arith.muli %cdim, %c : index
  %tmp2 = arith.addi %tmp1, %b : index
  %tmp3 = arith.muli %tmp2, %ido : index
  %index = arith.addi %tmp3, %a : index
  memref.store %toWrite, %ch[%index] : memref<16xf64>
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

func.func @radf4Extend(%cc : memref<16xf64>, %ch : memref<16xf64>, %wa : memref<8xf64>, %ido : index, %l1 : index, %cdim : index) -> () {
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

      %wa0im2 = func.call @WA(%wa, %i0, %im2, %ido, %i1) : (memref<8xf64>, index, index, index, index) -> (f64)
      %wa0im1 = func.call @WA(%wa, %i0, %im1, %ido, %i1) : (memref<8xf64>, index, index, index, index) -> (f64)
      %ccim1k1 = func.call @CC(%cc, %im1, %k, %i1, %ido, %l1) : (memref<16xf64>, index, index, index, index, index) -> (f64)
      %ccik1 = func.call @CC(%cc, %i, %k, %i1, %ido, %l1) : (memref<16xf64>, index, index, index, index, index) -> (f64)
      %cr2_ci2:2 = func.call @MULPM(%wa0im2, %wa0im1, %ccim1k1, %ccik1) : (f64, f64, f64, f64) -> (f64, f64)

      %wa1im2 = func.call @WA(%wa, %i1, %im2, %ido, %i1) : (memref<8xf64>, index, index, index, index) -> (f64)
      %wa1im1 = func.call @WA(%wa, %i1, %im1, %ido, %i1) : (memref<8xf64>, index, index, index, index) -> (f64)
      %ccim1k2 = func.call @CC(%cc, %im1, %k, %i1, %ido, %l1) : (memref<16xf64>, index, index, index, index, index) -> (f64)
      %ccik2 = func.call @CC(%cc, %i, %k, %i1, %ido, %l1) : (memref<16xf64>, index, index, index, index, index) -> (f64)
      %cr3_ci3:2 = func.call @MULPM(%wa1im2, %wa1im1, %ccim1k2, %ccik2) : (f64, f64, f64, f64) -> (f64, f64)

      %wa2im2 = func.call @WA(%wa, %i2, %im2, %ido, %i1) : (memref<8xf64>, index, index, index, index) -> (f64)
      %wa2im1 = func.call @WA(%wa, %i2, %im1, %ido, %i1) : (memref<8xf64>, index, index, index, index) -> (f64)
      %ccim1k3 = func.call @CC(%cc, %im1, %k, %i3, %ido, %l1) : (memref<16xf64>, index, index, index, index, index) -> (f64)
      %ccik3 = func.call @CC(%cc, %i, %k, %i3, %ido, %l1) : (memref<16xf64>, index, index, index, index, index) -> (f64)
      %cr4_ci4:2 = func.call @MULPM(%wa2im2, %wa2im1, %ccim1k3, %ccik3) : (f64, f64, f64, f64) -> (f64, f64)

      %tr1_tr4:2 = func.call @PM(%cr4_ci4#0, %cr2_ci2#0) : (f64, f64) -> (f64, f64)
      %ti1_ti4:2 = func.call @PM(%cr2_ci2#1, %cr4_ci4#1) : (f64, f64) -> (f64, f64)
      %ccim1k0 = func.call @CC(%cc, %im1, %k, %i0, %ido, %l1) : (memref<16xf64>, index, index, index, index, index) -> (f64)
      %tr2_tr3:2 = func.call @PM(%ccim1k0, %cr3_ci3#0) : (f64, f64) -> (f64, f64)
      %ccik0 = func.call @CC(%cc, %i, %k, %i0, %ido, %l1) : (memref<16xf64>, index, index, index, index, index) -> (f64)      
      %ti2_ti3:2 = func.call @PM(%ccik0, %cr3_ci3#1) : (f64, f64) -> (f64, f64)

      %chtmp1:2 = func.call @PM(%tr2_tr3#0, %tr1_tr4#0) : (f64, f64) -> (f64, f64)
      func.call @CH(%ch, %im1, %i0, %k, %ido, %cdim, %chtmp1#0) : (memref<16xf64>, index, index, index, index, index, f64) -> ()
      func.call @CH(%ch, %icm1, %i3, %k, %ido, %cdim, %chtmp1#1) : (memref<16xf64>, index, index, index, index, index, f64) -> ()

      %chtmp2:2 = func.call @PM(%ti1_ti4#0, %ti2_ti3#0) : (f64, f64) -> (f64, f64)
      func.call @CH(%ch, %i, %i0, %k, %ido, %cdim, %chtmp2#0) : (memref<16xf64>, index, index, index, index, index, f64) -> ()
      func.call @CH(%ch, %ic, %i3, %k, %ido, %cdim, %chtmp2#1) : (memref<16xf64>, index, index, index, index, index, f64) -> ()

      %chtmp3:2 = func.call @PM(%tr2_tr3#1, %ti1_ti4#1) : (f64, f64) -> (f64, f64)
      func.call @CH(%ch, %im1, %i2, %k, %ido, %cdim, %chtmp3#0) : (memref<16xf64>, index, index, index, index, index, f64) -> ()
      func.call @CH(%ch, %icm1, %i1, %k, %ido, %cdim, %chtmp3#1) : (memref<16xf64>, index, index, index, index, index, f64) -> ()

      %chtmp4:2 = func.call @PM(%tr1_tr4#1, %ti2_ti3#1) : (f64, f64) -> (f64, f64)
      func.call @CH(%ch, %i, %i2, %k, %ido, %cdim, %chtmp4#0) : (memref<16xf64>, index, index, index, index, index, f64) -> ()
      func.call @CH(%ch, %ic, %i1, %k, %ido, %cdim, %chtmp4#1) : (memref<16xf64>, index, index, index, index, index, f64) -> ()
      
      scf.yield
    }
    scf.yield
  }
  return
}

func.func @radf4(%cc : memref<16xf64>, %ch : memref<16xf64>, %wa : memref<8xf64>, %ido : index, %l1 : index) {
  %cdim = arith.constant 4 : index
  %hsqt2 = arith.constant 0.70710678118654752440 : f64
  %negHsqt2 = arith.constant -0.70710678118654752440 : f64
  %i0 = arith.constant 0 : index
  %i1 = arith.constant 1 : index
  %i2 = arith.constant 2 : index
  %i3 = arith.constant 3 : index
  %idom1 = arith.subi %ido, %i1 : index

  scf.for %k = %i0 to %l1 step %i1 {
    %cc0k3 = func.call @CC(%cc, %i0, %k, %i3, %ido, %l1) : (memref<16xf64>, index, index, index, index, index) -> (f64)
    %cc0k1 = func.call @CC(%cc, %i0, %k, %i1, %ido, %l1) : (memref<16xf64>, index, index, index, index, index) -> (f64)
    %tr1_tmp0:2 = func.call @PM(%cc0k3, %cc0k1) : (f64, f64) -> (f64, f64)
    func.call @CH(%ch, %i0, %i2, %k, %ido, %cdim, %tr1_tmp0#1) : (memref<16xf64>, index, index, index, index, index, f64) -> ()
    
    %cc0k0 = func.call @CC(%cc, %i0, %k, %i0, %ido, %l1) : (memref<16xf64>, index, index, index, index, index) -> (f64)
    %cc0k2 = func.call @CC(%cc, %i0, %k, %i2, %ido, %l1) : (memref<16xf64>, index, index, index, index, index) -> (f64)
    %tr2_tmp1:2 = func.call @PM(%cc0k0, %cc0k2) : (f64, f64) -> (f64, f64)
    func.call @CH(%ch, %idom1, %i1, %k, %ido, %cdim, %tr2_tmp1#1) : (memref<16xf64>, index, index, index, index, index, f64) -> ()
    
    %tmp2_tmp3:2 = func.call @PM(%tr2_tmp1#0, %tr1_tmp0#0) : (f64, f64) -> (f64, f64)
    func.call @CH(%ch, %i0, %i0, %k, %ido, %cdim, %tmp2_tmp3#0) : (memref<16xf64>, index, index, index, index, index, f64) -> ()
    func.call @CH(%ch, %idom1, %i3, %k, %ido, %cdim, %tmp2_tmp3#1) : (memref<16xf64>, index, index, index, index, index, f64) -> ()

    scf.yield
  }

  // if(ido & 1 == 0)
  %reminder = arith.remsi %ido, %i2 : index
  %cond0 = arith.cmpi eq, %reminder, %i0 : index
  scf.if %cond0 {
    scf.for %k = %i0 to %l1 step %i1 {
      %ccidom1k1 = func.call @CC(%cc, %idom1, %k, %i1, %ido, %l1) : (memref<16xf64>, index, index, index, index, index) -> (f64)
      %ccidom1k3 = func.call @CC(%cc, %idom1, %k, %i3, %ido, %l1) : (memref<16xf64>, index, index, index, index, index) -> (f64)
      %tmp0 = arith.addf %ccidom1k1, %ccidom1k3 : f64
      %ti1 = arith.mulf %negHsqt2, %tmp0 : f64

      %tmp1 = arith.subf %ccidom1k1, %ccidom1k3 : f64
      %tr1 = arith.mulf %hsqt2, %tmp1 : f64

      %ccidom1k0 = func.call @CC(%cc, %idom1, %k, %i0, %ido, %l1) : (memref<16xf64>, index, index, index, index, index) -> (f64)
      %tmp2_tmp3:2 = func.call @PM(%ccidom1k0, %tr1) : (f64, f64) -> (f64, f64)
      func.call @CH(%ch, %idom1, %i0, %k, %ido, %cdim, %tmp2_tmp3#0) : (memref<16xf64>, index, index, index, index, index, f64) -> ()
      func.call @CH(%ch, %idom1, %i2, %k, %ido, %cdim, %tmp2_tmp3#1) : (memref<16xf64>, index, index, index, index, index, f64) -> ()

      %ccidom1k2 = func.call @CC(%cc, %idom1, %k, %i2, %ido, %l1) : (memref<16xf64>, index, index, index, index, index) -> (f64)
      %tmp4_tmp5:2 = func.call @PM(%ti1, %ccidom1k2) : (f64, f64) -> (f64, f64)
      func.call @CH(%ch, %i0, %i3, %k, %ido, %cdim, %tmp4_tmp5#0) : (memref<16xf64>, index, index, index, index, index, f64) -> ()
      func.call @CH(%ch, %i0, %i1, %k, %ido, %cdim, %tmp4_tmp5#1) : (memref<16xf64>, index, index, index, index, index, f64) -> ()

      scf.yield
    }
    scf.yield
  }

  // if(ido > 2)
  %cond1 = arith.cmpi sgt, %ido, %i2 : index
  scf.if %cond1 {
    func.call @radf4Extend(%cc, %ch, %wa, %ido, %l1, %cdim) : (memref<16xf64>, memref<16xf64>, memref<8xf64>, index, index, index) -> ()
    
    scf.yield
  }
  
  return 
}

func.func @main() {
  %cc = memref.get_global @ccMem : memref<16xf64>
  %ch = memref.get_global @chMem : memref<16xf64>
  %wa = memref.get_global @twMem : memref<8xf64>
  %fct = memref.get_global @fctMem : memref<2xindex>
  %ido = arith.constant 1 : index
  %l1 = arith.constant 4 : index
  %i0 = arith.constant 0 : index
  %i1 = arith.constant 1 : index
  %nf = arith.constant 2 : index
  %initK = arith.subi %nf, %i1 : index

  // scf.for %iv = %i0 to %nf step %i1 iter_args(%k = %initK, %ido = %initIdo, %l1 = %initL1) {
  //   %ip = memref.load %fct[%k] : memref<2xindex>
  //   %condEq4 = arith.cmpi %ip

  //   scf.yield %k, %ido, %l1 : index, index, index
  // }

  func.call @radf4(%cc, %ch, %wa, %ido, %l1) : (memref<16xf64>, memref<16xf64>, memref<8xf64>, index, index) -> ()
  func.call @radf4(%ch, %cc, %wa, %l1, %ido) : (memref<16xf64>, memref<16xf64>, memref<8xf64>, index, index) -> ()

  %print_out = memref.cast %cc : memref<16xf64> to memref<*xf64>
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
