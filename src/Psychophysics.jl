module Psychophysics

using Base: @kwdef
using Random, Distributions

export StaircaseMethod, PestMethod, QuestMethod
export PsiMethod, MDPMethod

include("adaptive-methods.jl")

end
