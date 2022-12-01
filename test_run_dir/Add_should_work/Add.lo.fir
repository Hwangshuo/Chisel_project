circuit Add :
  module Add :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<8>
    input io_b : UInt<8>
    output io_c : UInt<8>

    reg reg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), reg) @[Add.scala 20:20]
    node _reg_T = mul(io_a, io_b) @[Add.scala 21:15]
    io_c <= reg @[Add.scala 23:8]
    reg <= bits(mux(reset, UInt<8>("h0"), _reg_T), 7, 0) @[Add.scala 20:{20,20} 21:7]
