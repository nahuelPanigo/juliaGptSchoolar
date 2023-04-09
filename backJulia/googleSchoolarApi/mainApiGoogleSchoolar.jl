include("./requestGoogleSchoolarApi.jl")
using ArgParse
using .ApiGoogleSchoolar

function parse_primary_args()
    s = ArgParseSettings()
    @add_arg_table! s begin
        "--api_key"
            help = "api Key for connect to https://serpapi.com/dashboard"
            required = true
         "--general"
            help = "this option select the general api can not be use with other selection api"
            action = :store_true
        "--author"
            help = "this option select the author api can not be use with other selection api"
            action = :store_true
        "--cite"
            help = "this option select the author api can not be use with other selection api."
            action = :store_true
        "--author_id"
            help = "Parameter defines the ID of an author. You can find the ID either by using our Google Scholar Profiles API or by going to the Google Scholar user profile page and getting it from there"
        "--hl"
            help = "Parameter defines the language to use for the Google Scholar search. It's a two-letter language code."
        "--num"
            help="Parameter defines the maximum number of results to return, limited to 20"
        "-q"
            help = "Parameter defines the query you want to search. You"
        "--as_ylo"
            help = "Parameter defines the year from which you want the results to be included."
        "--as_yhi"
            help = "Parameter defines the year until which you want the results to be included"
        "--scisbd"
            help = " Parameter defines articles added in the last year, sorted by date. It can be set to 1 to include only abstracts, or 2 to include everything. The default value is 0 which means that the articles are sorted by relevance."       
    end
    return parse_args(s)
end


function args_for_author_api()
    s = ArgParseSettings()
    @add_arg_table! s begin
        "--api_key"
        help = "api Key for connect to https://serpapi.com/dashboard"
        required = true
        "--author"
            help = "this option select the general api can not be use with other selection api"
            action = :store_true
        "--author_id"
            help = "
            Parameter defines the ID of an author. You can find the ID either by using our Google Scholar Profiles API or by going to the Google Scholar user profile page and getting it from there"
            required = true
        "--hl"
            help = "Parameter defines the language to use for the Google Scholar search. It's a two-letter language code."
        "--num"
            help="Parameter defines the maximum number of results to return, limited to 20"
    end
    params=parse_args(s)
    params["engine"]="google_scholar_author"
    return params
end



function args_for_general_api()
    s = ArgParseSettings()
    @add_arg_table! s begin
        "--api_key"
                help = "api Key for connect to https://serpapi.com/dashboard"
                required = true
        "--general"
                help = "this option select the general api can not be use with other selection api"
                action = :store_true
        "-q"
            help = "Parameter defines the query you want to search. You"
            required = true
        "--as_ylo"
            help = "Parameter defines the year from which you want the results to be included."
        "--as_yhi"
            help = "Parameter defines the year until which you want the results to be included"
        "--scisbd"
            help = " Parameter defines articles added in the last year, sorted by date. It can be set to 1 to include only abstracts, or 2 to include everything. The default value is 0 which means that the articles are sorted by relevance."
        "--hl"
            help = "Parameter defines the language to use for the Google Scholar search. It's a two-letter language code."
        "--num"
            help="Parameter defines the maximum number of results to return, limited to 20"
    end
    params=parse_args(s)
    params["engine"]="google_scholar"
    return params
end

function args_for_cite_api()
    s = ArgParseSettings()
    @add_arg_table! s begin
        "--api_key"
            help = "api Key for connect to https://serpapi.com/dashboard"
        "--cite"
            help = "this option select the general api can not be use with other selection api"
            action = :store_true
        "-q"
            help = "Parameter defines the ID of an individual Google Scholar organic search result. You can find the ID inside the result_id "
            required = true
           
    end
    params=parse_args(s)
    params["engine"]="google_scholar_cites"
    return params
end


function main()
    primary_args = parse_primary_args()
    println(primary_args)
    if (count(x->(x)==true ,values(primary_args)) != 1)
        println("you have to choose exactly one api. Could be general/author/cites ej --general")
        exit()
    end
    if(primary_args["general"])
        params=args_for_general_api()
    elseif(primary_args["author"])
        params=args_for_author_api()
    else    
        params=args_for_cite_api()
    end
    data =  delete!(params, "general")
    data =  delete!(params, "author")
    data =  delete!(params, "cite")
    println(request_api_google_schoolar(data))
end

main()