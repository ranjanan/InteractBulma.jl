__precompile__()

module InteractBulma

using AssetRegistry
using Reexport
@reexport using InteractBase
using WebIO, Vue, DataStructures, CSSUtil
import InteractBase:
    filepicker,
    autocomplete,
    input, dropdown,
    checkbox,
    toggle,
    textbox,
    button,
    slider,
    togglebuttons,
    tabs,
    radiobuttons,
    radio,
    wrap,
    wdglabel,
    entry,
    NativeHTML,
    scope,
    getclass

import InteractBase: textarea

export Bulma

struct Bulma<:InteractBase.WidgetTheme; end

const main_css = joinpath(@__DIR__, "..", "assets", "main.css")
const bulma_min_css = joinpath(@__DIR__, "..", "assets", "bulma.min.css")
const bulma_slider_min_css = joinpath(@__DIR__, "..", "assets", "bulma-slider.min.css")
const bulma_switch_min_css = joinpath(@__DIR__, "..", "assets", "bulma-switch.min.css")
const bulma_checkradio_min_css = joinpath(@__DIR__, "..", "assets", "bulma-checkradio.min.css")
const all_js = joinpath(Pkg.dir("InteractBase"), "assets", "all.js")

function InteractBase.libraries(::Bulma)
    bulmalibs = InteractBase.isijulia() ?
        [AssetRegistry.register(main_css)] :
        [
            AssetRegistry.register(bulma_min_css),
            AssetRegistry.register(bulma_slider_min_css),
            AssetRegistry.register(bulma_switch_min_css),
            AssetRegistry.register(bulma_checkradio_min_css),
        ]
    vcat(AssetRegistry.register(all_js), bulmalibs)
end

function __init__()
    InteractBase.settheme!(Bulma())
    nothing
end

function InteractBase.manipulateoutercontainer(::Bulma, args...)
    Node(:div,
        args...,
        className = "interactbulma"
    )
end

include("classes.jl")
include("widgets.jl")

end # module
