@kwdef struct FittedModel
  fit::Chains
  model::DynamicPPL.Model
end

function fit_model(; model::Function, d::DataFrame, alg=NUTS())
  m = model(d.x, d.y)
  fit = Turing.sample(m, alg, MCMCThreads(), 1000, 4)
  FittedModel(fit, m)
end

predict(fit::FittedModel) = predict(fit.model, fit.fit)

function plot_fit(fit, data)
  # model parameters
  Α = fit[:α]
  Β = fit[:β]
  Λ = fit[:λ]
  Γ = fit[:γ]
  α = mean(Α)
  β = mean(Β)
  λ = mean(Λ)
  γ = mean(Γ)
  # fit data
  d_plot = DataFrame(x = minimum(data.x):0.01:maximum(data.x))
  d_plot.linpred = α .+ β .* d_plot.x
  d_plot.y = γ .+ (1-γ-λ) .* logistic.(d_plot.linpred)
  d_plot.ymin = d_plot.y .- 0.1
  d_plot.ymax = d_plot.y .+ 0.1
  # explorative data
  d_exp = combine(groupby(data, :x), :y=>mean=>:y)
  # plot
  Gadfly.plot(
              layer(d_exp,
                    x = :x,
                    y = :y,
                    Geom.point),
              layer(d_plot,
                    x = :x,
                    y = :y,
                    ymin = :ymin,
                    ymax = :ymax,
                    Geom.line,
                    Geom.ribbon)
             )
end

function param_recov_table(fit::FittedModel, params::ModelParams) 
  @unpack b₀, bₓ, λ, γ, f = params

  Table(_ = ["b₀", "bₓ", "λ", "γ"],
        sim = [b₀, bₓ, λ, γ],
        fit = [mean(fit.fit[:α]), mean(fit.fit[:β]), mean(fit.fit[:λ]), mean(fit.fit[:γ])]) 
end

