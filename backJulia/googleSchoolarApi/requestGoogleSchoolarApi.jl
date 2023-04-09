module ApiGoogleSchoolar

using HTTP,JSON

export request_api_google_schoolar


function build_url(url,params)
    map_fn = (keyval) -> "$(keyval[1])=$(keyval[2])"
    str_list = [map_fn(kv) for kv in pairs(params)]
    return url * "?" * join(str_list, "&")
end



function request_api_google_schoolar(params)
    url="https://serpapi.com/search"
    filter!(x -> x[2] !== nothing, params)
    finalUrl=build_url(url,params)
    resp=HTTP.request("GET",finalUrl)
    return(String(resp.body))
end



end #end of module