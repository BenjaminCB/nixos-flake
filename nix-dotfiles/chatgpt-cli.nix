{ secrets }:

{
    api_key = secrets.openai;
    endpoint = "https://api.openai.com/v1";
    prompts = {
        default = "You are ChatGPT, a large language model trained by OpenAI. Answer as concisely as possible.";
    };
    conversation = {
        prompt = "default";
        context_length = 0;
        model = "gpt-3.5-turbo";
        stream = true;
        max_tokens = 1024;
    };
}
