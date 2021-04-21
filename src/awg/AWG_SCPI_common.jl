
# Reset
reset_instr(obj::T) where {T <: AWG_SCPI} = write(obj, "*RST")

# Clear
clear_instr(obj::T) where {T <: AWG_SCPI} = write(obj, "*CLS")

# IDN
get_idn(obj::T) where {T <: AWG_SCPI} = query(obj, "*IDN?")

# Query action completed
query_complete(obj::T) where {T <: AWG_SCPI} = query(obj, "*OPC?")

# Wait for action to complete
wait_complete(obj::T) where {T <: AWG_SCPI} = query(obj, "*WAI")

"""
# Beeper
`set_beep(obj::T;st="off") where {T <: AWG_SCPI}`
- st = {"on", "off"}
"""
set_beep(obj::T;st="off") where {T <: AWG_SCPI} = write(obj, "SYST:BEEP:STAT $st")

# Read error
query_error(obj::T) where {T <: AWG_SCPI} = query(obj, "SYST:ERR?")