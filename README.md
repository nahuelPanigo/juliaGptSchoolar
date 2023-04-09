# Install requirements config vars and exec

## Install packages

To excecute **backJulia/gptSchoolarIntegration** first you have to install dependencies:
> JSON, DotEnv, HTTP

For execute from terminal mains from apis (**gbackJulia/oogleSchoolarApi and backJulia/openAiApi**) also need to install
> ArgParse

## Generate and config vars

**Inside backJulia** folder create a env file named: **ConfigEnv.env** and declare the api-keys you need to consume the services:
GOOGLESCHOOLAR_API_KEY, OPENAI_API_KEY


## Excecute code

After the above steps are done you can execute by simply calling the file: 
> julia gptSchoolarIntegration

To directly call the mains of the api modules, execute the mains that are in each folder, which will indicate the necessary parameters to perform the query.


