# METHOD TEMPLATES
# basic method template: "This method has priority over the more general T:<Union{....} template"
# set_wfm(obj::INSTR{:Agilent33500B},func="sin",ch="1") = write(obj,"SOURce$ch:FUNC $func")
# more general method template, superseded by basic method template
# set_wfm(obj::T;func="sin",ch="1") where {T<:Union{F332x1,F335x2}} = write(obj,"SOURce$ch:FUNC $func")


## TRIGGER
"""
# Trigger source
`set_trig_sour(obj::T;ch="1",sour="BUS") where {T <: Union{DG1000Z}}`
- sour = {"INTernal", "EXTernal", "BUS"}
"""
set_trig_sour(obj::T;ch="1",sour="BUS") where {T <: Union{DG1000Z}} = write(obj, "TRIG$ch:SOUR $sour")

"""
# Trigger delay (del in seconds)
`set_trig_del(obj::T;ch="1",del=0) where {T <: Union{DG1000Z}}`
- del = delay in s
"""
set_trig_del(obj::T;ch="1",del=0) where {T <: Union{DG1000Z}} = write(obj, "TRIG$ch:DEL $del")

"""
# Trigger slope
`set_trig_slope(obj::T;ch="1",slp="positive") where {T <: Union{DG1000Z}}`
- slp = {"POSitive", "NEGative"}
"""
set_trig_slope(obj::T;ch="1",slp="positive") where {T <: Union{DG1000Z}} = write(obj, "TRIG$ch:SLOP $slp")

"""
# Output trigger state
"""
#set_out_trig_stat(obj::T;st="normal") where {T <: Union{DG1000Z}} = write(obj, "OUTP:TRIG $st")

"""
# Output trigger slope
"""
#set_out_trig_slope(obj::T;slp="positive") where {T <: Union{DG1000Z}} = write(obj, "OUTP:TRIG:SLOP $slp") # RG1022 has SWEep:TRIGger:TRIGOut and BURSt:TRIGger:TRIGOut

"""
# Software trigger
`send_soft_trig(obj::T) where {T <: Union{DG1000Z}}`
"""
send_soft_trig(obj::T) where {T <: Union{DG1000Z}} = write(obj, "*TRG")

## OUTPUT FUNCTION
"""
# Waveform
`set_wfm(obj::T;ch="1",func="sin") where {T <: Union{DG1000Z}}``
- func = {
    "SINusoid", "SQUare", "RAMP", "PULSe", "NOISe", "USER", "HARMonic", "CUSTom", "DC", "KAISER", " ROUNDPM", "SINC", "NEGRAMP", "ATTALT", "AMPALT", "STAIRDN", "STAIRUP", "STAIRUD", "CPULSE", " PPULSE", "NPULSE", "TRAPEZIA", "ROUNDHALF", "ABSSINE", "ABSSINEHALF", "SINETRA", " SINEVER", "EXPRISE", "EXPFALL", "TAN", "COT", "SQRT", "X2DATA", "GAUSS", "HAVERSINE", "LORENTZ ", "DIRICHLET", "GAUSSPULSE", "AIRY", "CARDIAC", "QUAKE", "GAMMA", "VOICE", "TV", "COMBIN", " BANDLIMITED", "STEPRESP", "BUTTERWORTH", "CHEBYSHEV1", "CHEBYSHEV2", "BOXCAR", " BARLETT", "TRIANG", "BLACKMAN", "HAMMING", "HANNING", "DUALTONE", "ACOS", "ACOSH", " ACOTCON", "ACOTPRO", "ACOTHCON", "ACOTHPRO", "ACSCCON", "ACSCPRO", "ACSCHCON", " ACSCHPRO", "ASECCON", "ASECPRO", "ASECH", "ASIN", "ASINH", "ATAN", "ATANH", "BESSELJ", " BESSELY", "CAUCHY", "COSH", "COSINT", "COTHCON", "COTHPRO", "CSCCON", "CSCPRO", " CSCHCON", "CSCHPRO", "CUBIC", "ERF", "ERFC", "ERFCINV", "ERFINV", "LAGUERRE", "LAPLACE", " LEGEND", "LOG", "LOGNORMAL", "MAXWELL", "RAYLEIGH", "RECIPCON", "RECIPPRO", "SECCON", " SECPRO", "SECH", "SINH", "SININT", "TANH", "VERSIERA", "WEIBULL", "BARTHANN", "BLACKMANH", " BOHMANWIN", "CHEBWIN", "FLATTOPWIN", "NUTTALLWIN", "PARZENWIN", "TAYLORWIN", " TUKEYWIN", "CWPUSLE", "LFPULSE", "LFMPULSE", "EOG", "EEG", "EMG", "PULSILOGRAM", "TENS1", " TENS2", "TENS3", "SURGE", "DAMPEDOSC", "SWINGOSC", "RADAR", "THREEAM", "THREEFM", " THREEPM", "THREEPWM", "THREEPFM", "RESSPEED", "MCNOSIE", "PAHCUR", "RIPPLE", " ISO76372TP1", "ISO76372TP2A", "ISO76372TP2B", "ISO76372TP3A", "ISO76372TP3B", " ISO76372TP4", "ISO76372TP5A", "ISO76372TP5B", "ISO167502SP", "ISO167502VR", "SRC", " IGNITION", "NIMHDISCHARGE", "GATEVIBR"
}
"""
set_wfm(obj::T;ch="1",func="sin") where {T <: Union{DG1000Z}} = write(obj, "SOURce$ch:FUNC $func")

"""
# Enable Arb Waveform output
`set_wfm_arb(obj::T;ch="1") where {T <: Union{DG1000Z}}``
"""
set_wfm_arb(obj::T;ch="1") where {T <: Union{DG1000Z}} = write(obj, "SOURce$ch:APPLy:ARBitrary")

"""
# Set Amplitude
`set_amplit(obj::T;ch="1",unit="vpp",volt=0.01) where {T <: Union{DG1000Z}}``
- unit = {"VPP", "VRMS", "DBM"}
- volt = voltage in <unit>
"""
set_amplit(obj::T;ch="1",unit="vpp",volt=0.01) where {T <: Union{DG1000Z}} = write(obj, "SOURce$ch:VOLT:UNIT $unit ; :SOURce$ch:VOLT $volt")

"""
# Set Offset
`set_offs(obj::T;ch="1",volt=0.01) where {T <: Union{DG1000Z}}`
- volt = offset voltage in Volts
"""
set_offs(obj::T;ch="1",volt=0.01) where {T <: Union{DG1000Z}} = write(obj, "SOURce$ch:VOLT:OFFset $volt")

"""
# Set High Level
`set_hilev(obj::T;ch="1",volt=0.01) where {T <: Union{DG1000Z}}`
- volt = High Level in Volts (= Offset + Amplitude/2)
"""
set_hilev(obj::T;ch="1",volt=0.01) where {T <: Union{DG1000Z}} = write(obj, "SOURce$ch:VOLT:HIGH $volt")
"""
# Set Low Level
`set_lolev(obj::T;ch="1",volt=0.01) where {T <: Union{DG1000Z}}`
- volt = Low Level in Volts (= Offset - Amplitude/2)
"""
set_lolev(obj::T;ch="1",volt=0.01) where {T <: Union{DG1000Z}} = write(obj, "SOURce$ch:VOLT:LOW $volt")

"""
# Set Frequency
`set_freq(obj::T;ch="1",fr=1000) where {T <: Union{DG1000Z}}`
- fr = Frequency in Hertz
"""
set_freq(obj::T;ch="1",fr=1000) where {T <: Union{DG1000Z}} = write(obj, "SOURce$ch:FREQ $fr")

"""
# Set Period
`set_per(obj::T;ch="1",per=0.001) where {T <: Union{DG1000Z}}`
- per = Period in Seconds
"""
set_per(obj::T;ch="1",per=0.001) where {T <: Union{DG1000Z}} = write(obj, "SOURce$ch:PER $per")

"""
# Set Phase
`set_phase(obj::T;ch="1",phase=90) where {T <: Union{DG1000Z}}`
- phase = Phase in Deg
"""
set_phase(obj::T;ch="1",phase=90) where {T <: Union{DG1000Z}} = write(obj, "SOURce$ch:PHAS $phase")

"""
# Set Symmetry
`set_sym(obj::T;ch="1",func="ramp",sym=50) where {T <: Union{DG1000Z}}`
- func = always RAMP for DG1000Z
- sym = 0% to 100%
"""
set_sym(obj::T;ch="1",func="ramp",sym=50) where {T <: Union{DG1000Z}} = write(obj, "SOURce$ch:FUNC:RAMP:SYMM $sym")

# Both Edge times
set_both_edg(obj::T;ch="1",func="pulse",dt=10e-9) where {T <: Union{DG1000Z}} = write(obj, "SOURce$ch:FUNC:$func:TRAN $dt")
# Lead Edge time
set_lead_edg(obj::T;ch="1",func="pulse",dt=10e-9) where {T <: Union{DG1000Z}} = write(obj, "SOURce$ch:FUNC:$func:TRAN:LEAD $dt")
# Trail Edge time
set_trail_edg(obj::T;ch="1",func="pulse",dt=10e-9) where {T <: Union{DG1000Z}} = write(obj, "SOURce$ch:FUNC:$func:TRAN:TRA $dt")
# Width
set_width(obj::T;ch="1",func="pulse",wd=1e-4) where {T <: Union{DG1000Z}} = write(obj, "SOURce$ch:FUNC:$func:WIDTh $wd")
#
## OUTPUT
# Output Load
set_load(obj::T;ch="1",load="INF") where {T <: Union{DG1000Z}} = write(obj, "OUTP$ch:LOAD $load")
# Output Polarity
set_pol(obj::T;ch="1",pol="normal") where {T <: Union{DG1000Z}} = write(obj, "OUTP$ch:POL $pol")

"""
# Set Output on/off
`set_outp(obj::T;ch="1",st="off") where {T <: Union{DG1000Z}}`
- st = {"on", "off"}
"""
set_outp(obj::T;ch="1",st="off") where {T <: Union{DG1000Z}} = write(obj, "OUTP$ch $st")

## SYNC
# Sync state
set_sync_stat(obj::T;ch="1",st="on") where {T <: Union{DG1000Z}} = write(obj, "OUTP$ch:SYNC $st")


## ARBITRARY WAVEFORMS
"""
# Set Arb mode
`set_arb_mode(obj::T;ch="1",mode="FREQ") where {T <: Union{DG1000Z}}``
- mode = {"FREQ", "SRATe"}
"""
set_arb_mode(obj::T;ch="1",mode="FREQ") where {T <: Union{DG1000Z}} = write(obj, "SOURce$ch:FUNC:ARB:MODE $mode")

"""
# Set sample rate for Arb mode
`set_sample_rate(obj::T;ch="1",srate=1e6) where {T <: Union{DG1000Z}}`
- srate = Sample rate in samples per second
"""
set_sample_rate(obj::T;ch="1",srate=1e6) where {T <: Union{DG1000Z}} = write(obj, "SOURce$ch:FUNC:ARB:SRAT $srate")

# Clear all arbs from volatile memory
# clear_arbs(obj::T;ch="1") where {T<:Union{DG1000Z}} = write(obj,"SOURce$ch:DATA:VOLATILE:CLEar") # Doesnt seem supported on the Rigol_DG1000Z

"""
# Load Arb data points to volatile memory
`set_arb_data(obj::T;ch="1",values="-1,-1,-0.5,-0.5,0,0.5,0.5,1.0,1.0") where {T <: Union{DG1000Z}}`
- values = -1.0 to +1.0
"""
set_arb_data(obj::T;ch="1",values="-1,-1,-0.5,-0.5,0,0.5,0.5,1.0,1.0") where {T <: Union{DG1000Z}} = write(obj, "SOURce$ch:DATA VOLATILE,$values")

"""
# Set number of data points for Arb mode
`set_arb_points(obj::T;ch="1",points=10) where {T <: Union{DG1000Z}}`
- points = 8 to 16384
"""
set_arb_points(obj::T;ch="1",points=10) where {T <: Union{DG1000Z}} = write(obj, "SOURce$ch:DATA:POIN VOLATILE,$points")


## Sweep

set_sweep_mode(obj::T; ch="1", st="off") where {T <: Union{DG1000Z}} = write(obj, "SOURce$ch:SWE:STAT $st")

"""
- time = 1ms to 500s (in seconds)
"""
set_sweep_time(obj::T; ch="1", time=1) where {T <: Union{DG1000Z}} = write(obj, "SOURce$ch:SWE:TIME $time")

set_sweep_start(obj::T; ch="1", freq::Integer=1000) where {T <: Union{DG1000Z}} = write(obj, ":SOUR$ch:FREQ:STAR $freq")

set_sweep_stop(obj::T; ch="1", freq::Integer=100) where {T <: Union{DG1000Z}} = write(obj, ":SOUR$ch:FREQ:STOP $freq")

set_sweep_center(obj::T; ch="1", freq::Integer=100) where {T <: Union{DG1000Z}} = write(obj, ":SOUR$ch:FREQ:CENT $freq")

set_sweep_span(obj::T; ch="1", span::Integer=100) where {T <: Union{DG1000Z}} = write(obj, ":SOUR$ch:FREQ:SPAN $span")

