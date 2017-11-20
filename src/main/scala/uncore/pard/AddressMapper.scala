package uncore.pard

import Chisel._
import freechips.rocketchip.config._
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.tilelink._
import freechips.rocketchip.coreplex.{ExtMem, NTiles}

case object AddressMapperBase extends Field[BigInt]

class WithAddressMapperBase(n: BigInt) extends Config((site, here, up) => {
   case AddressMapperBase => n
})

class AddressMapper(implicit p: Parameters) extends LazyModule {
  private val mem = p(ExtMem)
  private val nTiles = p(NTiles)

  val node = TLAdapterNode(
    clientFn = { c => c },
    managerFn = { m =>
      require(m.managers.size == 1, "Only expect one external memory device.")
      require(m.managers(0).address.size == 1, "Only expect one external memory space.")
      m.copy(managers = m.managers.map { man =>
        man.copy(address = man.address.map { addr =>
          addr.copy(mask = (addr.mask + 1) / nTiles - 1)  // Only allow clients see address range describe in config / dts.
        })
      })
    })

  lazy val module = new LazyModuleImp(this) {
    val (bundleIn, _) = node.in.unzip
    val (bundleOut, _) = node.out.unzip

    val io = IO(new Bundle {
      val in = bundleIn
      val out = bundleOut
    })

    // Jump the 0 element as dsid starts from 1.
    val bases = Vec(0.U +: Seq.tabulate(nTiles) { i => (p(AddressMapperBase) + mem.size * i).U })

    (io.in zip io.out) foreach { case (in, out) =>
      out <> in
      out.a.bits.address := (in.a.bits.address & (mem.size - 1).U) | bases(in.a.bits.dsid)
      // C channel's address is optimized out.
    }
  }
}
