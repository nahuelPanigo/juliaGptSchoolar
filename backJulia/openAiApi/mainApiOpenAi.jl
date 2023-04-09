include("./requestOpenAiApi.jl")

using ArgParse,.ApiOpenAi


function parse_commandline()
    s = ArgParseSettings()
    @add_arg_table! s begin
        "--api_key"
            help = "api Key for connect openai more information in https://platform.openai.com/overview"
            required = true
         #Arguments for Completition Chat GPT api
         "--prompt"
            help = "te input to send to de completition could be encoded as a string, array of strings, array of tokens, or array of token arrays."
            required = true
        "--model"
            help = "ID of the model to use for example text-davinci-003. For more information, see documentation https://platform.openai.com/overview"
            required = true
        "--suffix"
            help = "The suffix that comes after a completion of inserted text."
        "--top_p"
            help = "number between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. recommend altering this or temperature but not both"
        "--temperature"
            help = "An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.            "
        "--max_tokens"
            help = "The maximum number of tokens to generate in the completion."
            arg_type=Int
        "-n"
            help = "How many completions to generate for each prompt."
    end
    return parse_args(s)
end

function main()
        
    args = parse_commandline()
    filter!(x -> x[2] !== nothing, args)
    println(request_api_openai(args))
end

main()