module OnlineSampling

using Chain
using MacroTools
using MacroTools: prewalk, postwalk
using IRTools
using IRTools: @dynamo, IR, recurse!, Meta, arguments, xcall, Statement, self
using IRTools.Inner: varmap, Variable
using Accessors
import Distributions
using Distributions:
    Distribution, Normal, MvNormal, AbstractMvNormal, Multivariate, Continuous
using LinearAlgebra
# For llvm code debugging
using InteractiveUtils

using Reexport

include("delayed_sampling/DelayedSampling.jl")
import ..DelayedSampling as DS
export DelayedSampling

include("online_smc/OnlineSMC.jl")
import ..OnlineSMC as SMC
import ..OnlineSMC: Cloud, expectation
export OnlineSMC, Cloud, expectation

include("macro_utils.jl")
include("ir_utils.jl")
include("wrapper_utils.jl")
include("notinit_removal.jl")
include("observe.jl")
include("tracked_rv.jl")
include("smc_utils.jl")
include("ir_pass.jl")
include("node_build.jl")
include("node_run.jl")
include("macros.jl")
include("special_nodes.jl")

export @node, @init, @prev, @observe

end
