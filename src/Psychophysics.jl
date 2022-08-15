module Psychophysics

using Base: @kwdef
using Parameters
using Random, Distributions
using StatsFuns
using DataFrames
using Turing

export MixtureModelParams, bernoulli_mixture, simulate 
export StaircaseMethod, PestMethod, QuestMethod
export PsiMethod, MDPMethod

include("generate-data.jl")
include("turing-utils.jl")
include("turing-models.jl")
include("adaptive-methods.jl")

end
