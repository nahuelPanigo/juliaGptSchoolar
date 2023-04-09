include("./googleSchoolarApi/requestGoogleSchoolarApi.jl")
include("./openAiApi/requestOpenAiApi.jl")

using .ApiGoogleSchoolar,.ApiOpenAi
using JSON,DotEnv


cfg = DotEnv.parse(read("ConfigEnv.env"))




const GOOGLESCHOOLAR_API_KEY = cfg["GOOGLESCHOOLAR_API_KEY"]
const OPENAI_API_KEY = cfg["OPENAI_API_KEY"]
const MAX_TOKEN_X_REQUEST =4097
const RELATION_LETTER_TOKEN = 1.35 #a letter is equivalent to 1.35 token aprox


function generate_dict_openai(prompt)
   dictionary_for_request_openai["prompt"] = prompt
   dictionary_for_request_openai["api_key"] = OPENAI_API_KEY
   dictionary_for_request_openai["max_tokens"] = trunc(Int ,(MAX_TOKEN_X_REQUEST-(length(prompt)*RELATION_LETTER_TOKEN)))
   return dictionary_for_request_openai
end

#function get_data_from_google_schoolar_general()
#    request_api_google_schoolar()


function get_data_from_openai(prompt)
    response =request_api_openai(generate_dict_openai(prompt))
    return first(JSON.parse(response)["choices"])["text"]
end

function main()
    #example of 2 abstract that i want to get a summary
    text1="The architectural style of microservices has been gaining popularity in recent years. In this architectural style, small and loosely coupled modules are deployed and scaled independently to compose cloud-native applications. Carrier-grade service providers are migrating their legacy applications to a microservice based architecture running on Kubernetes which is an open source platform for orchestrating containerized microservice based applications. However, in this migration, service availability remains a concern. Service availability is measured as the percentage of time the service is provisioned. High Availability (HA) is achieved when the service is available at least 99.999% of the time. In this paper, we identify possible architectures for deploying stateful microservice based applications with Kubernetes and evaluate Kubernetes from the perspective of availability it provides for its managed applications. The results of our experiments show that the repair actions of Kubernetes cannot satisfy HA requirements, and in some cases cannot guarantee service recovery. Therefore, we propose an HA State Controller which integrates with Kubernetes and allows for application state replication and automatic service redirection to the healthy microservice instances by enabling service recovery in addition to the repair actions of Kubernetes. Based on experiments we evaluate our solution and compare the different architectures from the perspective of availability and scaling overhead. The results of our investigations show that our solution can improve the recovery time of stateful microservice based applications by 50%."
    text2="A key challenge for supporting elastic behaviour in cloud systems is to achieve a good performance in automated (de-)provisioning and scheduling of computing resources. One of the key aspects that can be significant is the overheads associated with deploying, terminating and maintaining resources. Therefore, due to their lower start up and termination overhead, containers are rapidly replacing Virtual Machines (VMs) in many cloud deployments, as the computation instance of choice. In this paper, we analyse the performance of Kubernetes achieved through a Petri net-based performance model. Kubernetes is a container management system for a distributed cluster environment. Our model can be characterised using data from a Kubernetes deployment, and can be exploited for supporting capacity planning and designing Kubernetes-based elastic applications."
    finalPrompt="what is common in the 2 texts below: \n" * text1 * "\n second text: \n" *text2
    print(get_data_from_openai(finalPrompt))
end


main()



