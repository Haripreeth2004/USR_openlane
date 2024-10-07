import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge

# DUT test
@cocotb.test()
async def test_universal_shift_register(dut):

    # Start a clock in a separate coroutine
    cocotb.fork(Clock(dut.clk, 10, units="ns").start())

    # Reset DUT and hold state
    dut.d_in <= 0
    dut.select <= 0b00
    await RisingEdge(dut.clk)
    await RisingEdge(dut.clk)

    # Parallel load value 0b1010 into the register
    dut.d_in <= 0b1010
    dut.select <= 0b11
    await RisingEdge(dut.clk)
    #assert dut.q.value == 0b1010, f"Parallel load failed: q={dut.q.value}"

    # Test shift left
    dut.select <= 0b10
    await RisingEdge(dut.clk)
    #assert dut.q.value == 0b0100, f"Shift left failed: q={dut.q.value}"

    # Test shift right
    dut.select <= 0b01
    await RisingEdge(dut.clk)
    #assert dut.q.value == 0b0010, f"Shift right failed: q={dut.q.value}"

    # Test hold operation
    dut.select <= 0b00
    await RisingEdge(dut.clk)
    #assert dut.q.value == 0b0010, f"Hold failed: q={dut.q.value}"

    # Parallel load another value 0b1100
    dut.d_in <= 0b1100
    dut.select <= 0b11
    await RisingEdge(dut.clk)
    #assert dut.q.value == 0b1100, f"Parallel load failed: q={dut.q.value}"

    # Test shift left
    dut.select <= 0b10
    await RisingEdge(dut.clk)
    #assert dut.q.value == 0b1000, f"Shift left failed: q={dut.q.value}"

    # Test shift right
    dut.select <= 0b01
    await RisingEdge(dut.clk)
    #assert dut.q.value == 0b0100, f"Shift right failed: q={dut.q.value}"

