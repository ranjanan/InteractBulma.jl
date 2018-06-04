wrapclass(ui) = wrap(ui, dom"div.interactbulma")

function filepicker(::Bulma, lbl = "Choose a file..."; label=lbl, class="", kwargs...)
    fp = filepicker(NativeHTML(), label; class="interactbulma file-input $class", kwargs...)
    scope(fp).dom =
        dom"div.file"(
            dom"label.file-label"(
                scope(fp).dom,
                dom"span.file-cta"(
                    dom"span.file-icon"(
                        dom"i.fas.fa-upload"()
                    ),
                    dom"span.file-label"(
                        label
                    )
                ),
                dom"span.file-name"("{{filename == '' ? 'No file chosen' : filename}}")
            )
        )
    wrapfield(fp)
end

function togglebuttons(::Bulma, options::Associative;
    class="is-fullwidth", outer = identity, outer_attributes = Dict(), activeclass = "is-primary is-selected", kwargs...)

    togglebuttons(NativeHTML(), options;
        outer = outer∘Node(
            :div, className = "interactbulma field is-grouped has-addons is-oneline is-centered", attributes = outer_attributes
        ), class = "button $class", activeclass = activeclass, tag = :span, kwargs...) |> wrapclass
end

tabs(::Bulma, options::Associative; class="", outer = identity, outer_attributes = Dict(), activeclass = "is-active", kwargs...) =
    tabs(NativeHTML(), options;
        outer = outer∘Node(:ul, className = "interactbulma tabs", attributes = outer_attributes),
        class = class, activeclass = activeclass, kwargs...) |> wrapclass


function radiobuttons(T::Bulma, options::Associative; outer = identity, outer_attributes = Dict(), kwargs...)
    outerfunction = function (args...)
        outer(Node(:div, className = "field", attributes = outer_attributes))(Iterators.flatten(args)...)
    end
    radiobuttons(NativeHTML(), options::Associative; outer = outerfunction, kwargs...)
end


function radio(T::Bulma, s, key, val, vmodel; class = "", kwargs...)
    id = string(gensym())
    (Node(:input, className = "is-checkradio $class", attributes = Dict(:id => id, :name=>s, :type=>"radio", vmodel=>"value", :value=>val)),
        Node(:label, key, className = "form-radio", attributes = merge(Dict(:for => id), Dict(kwargs))))
end
