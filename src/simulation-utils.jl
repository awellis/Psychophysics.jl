@kwdef mutable struct Simulation
  model::DynamicPPL.Model
  param::ModelParams
  data::DataFrame
  fit::Chains
end

