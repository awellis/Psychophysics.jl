@kwdef struct FittedModel
    fit::Chains
    model::DynamicPPL.Model
end

function fit_model(model::Function, d::DataFrame; alg=NUTS())
	m = model(d.x, d.y)
	fit = Turing.sample(m, alg, MCMCThreads(), 1000, 4)
    FittedModel(fit, m)
end



predict(fit::FittedModel) = predict(fit.model, fit.fit)
