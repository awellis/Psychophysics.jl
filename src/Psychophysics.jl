module Psychophysics

using Base: @kwdef
using Parameters
using Random, Distributions
using StatsFuns
using DataFrames
using Turing
using Gadfly

export MixtureModelParams, bernoulli_mixture, simulate 
export StaircaseMethod, PestMethod, QuestMethod
export PsiMethod, MDPMethod
# utils
export FittedModel, fit_model, plot_fit
# turing models
export mixture_model, psychophysics_model, logistic_regression, mixture_model_2, mixture_model_discrete

include("generate-data.jl")
include("turing-utils.jl")
include("turing-models.jl")
include("adaptive-methods.jl")

end
