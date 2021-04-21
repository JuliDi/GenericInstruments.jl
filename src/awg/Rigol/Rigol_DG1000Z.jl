## OUTPUT FUNCTION
"""
# Duty Cycle
`set_duty(obj::T;ch="1",func="SQUare",duty=0.01) where {T<:DG1000Z}`
- func = {"SQUare", "PULSe"})
"""
set_duty(obj::T;ch="1",func="SQUare",duty=50) where {T<:DG1000Z} = write(obj,"SOURce$ch:FUNC:$func:DCYC $duty")

## BURST
"""
# Burst on
`set_burst_stat(obj::T;ch="1",st="off") where {T<:DG1000Z}`
- st = {"on", "off"}
"""
set_burst_stat(obj::T;ch="1",st="off") where {T<:DG1000Z} = write(obj,"SOURce$ch:BURS:STAT $st")

"""
# Burst mode
`set_burst_mode(obj::T;ch="1",md="triggered") where {T<:DG1000Z}`
- md = {"TRIGgered", "INFinity", "GATed"}
"""
set_burst_mode(obj::T;ch="1",md="triggered") where {T<:DG1000Z} = write(obj,"SOURce$ch:BURS:MODE $md")

"""
# Burst polarity
`set_burst_pol(obj::T;ch="1",pol="normal") where {T<:DG1000Z}`
- pol = {"NORMal", "INVerted"}
"""
set_burst_pol(obj::T;ch="1",pol="normal") where {T<:DG1000Z} = write(obj,"SOURce$ch:BURS:GATE:POL $pol")

"""
# Burst ncycles
`set_burst_ncyc(obj::T;ch="1",nc=1) where {T<:DG1000Z}`
- nc = 1 to 1'000'000 (external or manual trigger) 1 to 500'000 (internal trigger)
"""
set_burst_ncyc(obj::T;ch="1",nc=1) where {T<:DG1000Z} = write(obj,"SOURce$ch:BURS:NCYC $nc")

"""
# Burst period
`set_burst_per(obj::T;ch="1",per=0.01) where {T<:DG1000Z}`
- per = 2.0166us to 500s (in s)
"""
set_burst_per(obj::T;ch="1",per=0.01) where {T<:DG1000Z} = write(obj,"SOURce$ch:BURS:INT:PER $per")


"""
# Burst phase
`set_burst_phase(obj::T;ch="1",unit="deg",phase=0) where {T<:DG1000Z}``
- unit: *unused* on DG1000Z
- phase = 0 to 360
"""
set_burst_phase(obj::T;ch="1",unit="deg",phase=0) where {T<:DG1000Z} = write(obj,"SOURce$ch:BURS:PHAS $phase")














