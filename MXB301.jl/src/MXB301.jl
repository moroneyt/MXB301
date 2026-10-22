module MXB301

using About
using CairoMakie
using DifferentiationInterface
using LaTeXStrings
using LinearAlgebra
using PythonCall
using Random
using SpecialFunctions
using Statistics

using ComponentArrays: ComponentArrays, ComponentArray, ComponentVector
using Distributions: Distributions, Normal, Exponential
using Downloads: Downloads
using ForwardDiff: ForwardDiff, Dual, partials
using JLD2: JLD2, jldopen
using MLUtils: MLUtils, DataLoader, rand_like, randn_like
using NLSolversBase: NLSolversBase, only_fg
using NNlib: NNlib, softmax, sigmoid, scatter as scattergrad, conv, ∇conv_filter, ∇conv_data, DenseConvDims, batched_mul, batched_transpose, ⊠
using OneHotArrays: OneHotArrays, onehot, onehotbatch, onecold
using StatsBase: StatsBase, crossentropy, sample, Weights
using ToeplitzMatrices: ToeplitzMatrices, Toeplitz, Hankel
using QuadGK: QuadGK, quadgk

import CodecZlib
import ColorSchemes
import FiniteDiff
import HTTP
import MKL
import Optim
import Zygote

# Packages that were `using`'d without a restriction list get all of their
# exported names re-exported here, exactly as a plain `using Pkg` would have
# put them into Main.
for m in (About, CairoMakie, DifferentiationInterface, LaTeXStrings, LinearAlgebra,
          PythonCall, Random, SpecialFunctions, Statistics)
    for n in names(m)
        @eval export $n
    end
end

# Packages that were `using`'d with an explicit `: a, b, ...` list only get
# those specific names (plus the package name itself) re-exported.
export ComponentArrays, ComponentArray, ComponentVector
export Distributions, Normal, Exponential
export Downloads
export ForwardDiff, Dual, partials
export JLD2, jldopen
export MLUtils, DataLoader, rand_like, randn_like
export NLSolversBase, only_fg
export NNlib, softmax, sigmoid, scattergrad, conv, ∇conv_filter, ∇conv_data,
       DenseConvDims, batched_mul, batched_transpose, ⊠
export OneHotArrays, onehot, onehotbatch, onecold
export StatsBase, crossentropy, sample, Weights
export ToeplitzMatrices, Toeplitz, Hankel
export QuadGK, quadgk

# Packages that were only `import`'d get just their module name re-exported,
# so `Pkg.thing(...)` works but `thing(...)` does not.
export CodecZlib, ColorSchemes, FiniteDiff, HTTP, MKL, Optim, Zygote

end # module MXB301
