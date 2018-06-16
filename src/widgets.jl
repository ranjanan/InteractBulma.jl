function radio(T::Bulma, s, key, val, vmodel; class = nothing, className = InteractBase._replace_className(class), kwargs...)
    id = string(gensym())
    (Node(:input, className = "is-checkradio $className", attributes = Dict(:id => id, :name=>s, :type=>"radio", vmodel=>"value", :value=>val)),
        Node(:label, key, className = "form-radio", attributes = merge(Dict(:for => id), Dict(kwargs))))
end
