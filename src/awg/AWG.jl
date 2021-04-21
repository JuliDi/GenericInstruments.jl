module AWG
using Libdl # for NI dlls
include("../INSTR_TYPES.jl")
include("../lib_locations.jl")
include("../visa/VISA.jl")
#
## include all AWG files
include("./Agilent/AWG_Agilent_common.jl")
include("./Agilent/Agilent33500B.jl")
include("./Agilent/Agilent33250A.jl")
# NI
include("NIFgen/NIFgen.jl")
include("NIFgen/NIFgen_Misc.jl")
# Rigol
include("Rigol/AWG_Rigol_common.jl")
include("Rigol/Rigol_DG1000Z.jl")


## Common functions
# Type Alias for SCPI devices
AWG_SCPI = Union{DG1000Z, F335x2, F332x1}
include("AWG_SCPI_common.jl")

"""
# Generate a sine Waveform
`function gen_sin(obj::T; ch="1", freq::Real=1e6, amp::Real=1, offset::Signed=0, phase::Real=0) where {T <: AWG_SCPI}`
- ch = {"1", "2"}
- freq = Frequency in Hertz
- amp = Amplitude in Volts
- offset = Offsett in Volts
- phase = Phase in Deg
"""
function gen_sin(obj::T; ch="1", freq::Real=1e6, amp::Real=1, offset::Signed=0, phase::Real=0) where {T <: AWG_SCPI}
    set_freq(obj; ch, fr=freq);
    set_wfm(obj; ch, func="SIN");
    set_amplit(obj; ch, volt=amp);
    set_offs(obj; ch, volt=offset);
    set_phase(obj; ch, phase);
end

"""
# Generate a square Waveform
`function gen_square(obj::T; ch="1", freq::Real=1e6, amp::Real=1, offset::Signed=0, phase::Real=0, duty::Real=50) where {T <: AWG_SCPI}`
- ch = {"1", "2"}
- freq = Frequency in Hertz
- amp = Amplitude in Volts
- offset = Offsett in Volts
- phase = Phase in Deg
- duty = Duty cycle in %
"""
function gen_square(obj::T; ch="1", freq::Real=1e6, amp::Real=1, offset::Signed=0, phase::Real=0, duty::Real=50) where {T <: AWG_SCPI}
    set_freq(obj; ch, fr=freq);
    set_wfm(obj; ch, func="SQU");
    set_amplit(obj; ch, volt=amp);
    set_offs(obj; ch, volt=offset);
    set_phase(obj; ch, phase);
    set_duty(obj; ch, duty);
end

end #endmodule
