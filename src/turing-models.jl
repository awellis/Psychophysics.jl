@model function mixture_model(x, y)
    α ~ Normal(0, 1)
    β ~ truncated(Normal(0, 1), lower=0, upper=Inf)
    linpred = α .+ β .* x
    θ ~ Beta(1, 10)
    γ ~ Beta(10, 10)

    y .~ Bernoulli.(θ * γ .+ (1-θ) .* logistic.(linpred))
end

@model function psychophysics_model(x, y)
    α ~ Normal(0, 1)
    β ~ truncated(Normal(0, 1), lower=0, upper=Inf)
    linpred = α .+ β .* x
    λ ~ Beta(1, 10)
    γ ~ Beta(1, 10)
		
    y .~ Bernoulli.(γ .+ (1-γ-λ) .* logistic.(linpred))
end

@model function logistic_regression(x, y)
    α ~ Normal(0, 1)
    β ~ truncated(Normal(0, 1), lower=0, upper=Inf)
    linpred = α .+ β .* x

    y .~ Bernoulli.(logistic.(linpred))
end



@model function mixture_model_2(x, y)
    α ~ Normal(0, 1)
    β ~ truncated(Normal(0, 1), lower=0, upper=Inf)
    linpred = α .+ β .* x
    θ ~ Beta(1, 10)
    # γ ~ Beta(10, 10)
    γ ~ Normal(0, 1)

    y .~ Bernoulli.(θ .* logistic(γ).+ (1-θ) .* logistic.(linpred))
end


@model function mixture_model_discrete(x, y)
    α ~ Normal(0, 1)
    β ~ truncated(Normal(0, 1), lower=0, upper=Inf)
    linpred = α .+ β .* x
    θ ~ Beta(1, 10)
    # γ ~ Beta(10, 10)
    γ ~ Normal(0, 1)

    y .~ Bernoulli.(θ .* logistic(γ).+ (1-θ) .* logistic.(linpred))
end

