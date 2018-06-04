function getclass(T::Bulma, arg, typ...)
    length(typ) > 0 && last(typ) == "fullwidth" && return "is-fullwidth"
    length(typ) > 0 && last(typ) == "label" && return ""
    if arg == :input
        typ==("checkbox",) && return "interactbulma is-checkradio"
        typ==("toggle",) && return "interactbulma switch"
        typ==("range",) && return "interactbulma slider"

        return "interactbulma input"
    elseif arg == :button
        typ==("primary",) && return "is-primary"
        return "interactbulma button"
    elseif arg == :textarea
        return "interactbulma textarea"
    elseif arg==:wdglabel
        return "interactbulma"
    elseif arg==:div
        return "interactbulma field"
    else
        return "interactbulma input"
    end
end
