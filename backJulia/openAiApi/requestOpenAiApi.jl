module ApiOpenAi

using HTTP,JSON


export request_api_openai,dictionary_for_request_openai

dictionary_for_request_openai = Dict("api_key" => "<yourapikey>", "prompt" => "prompt you want", 
"model" => "text-davinci-003", "suffix" => nothing,"top" => nothing, "temperature" => nothing,"max_tokens" => 150, "n" => nothing )


function request_api_openai(args)
    url="https://api.openai.com/v1/completions"
    headers= ["Authorization" => "Bearer " * args["api_key"], "Content-Type" => "application/json"] 
    data =  delete!(args, "api_key")
    filter!(x -> x[2] !== nothing, data)
    resp=HTTP.request("POST",url;headers=headers,body=JSON.json(data))
    return(String(resp.body))
end


end #end of module