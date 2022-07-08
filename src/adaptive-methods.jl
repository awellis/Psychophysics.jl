abstract type AbstractMethod end

@kwdef struct StaircaseMethod <: AbstractMethod
    a::Real = 0
end

@kwdef struct PestMethod <: AbstractMethod
    a::Real = 0
end

@kwdef struct QuestMethod <: AbstractMethod
    a::Real = 0
end

@kwdef struct PsiMethod <: AbstractMethod
    a::Real = 0
end

@kwdef struct MDPMethod <: AbstractMethod
    a::Real = 0
end