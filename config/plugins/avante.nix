{ avante-master, ... }:
{
  plugins.avante = {
    enable = true;
    package = avante-master;

    settings = {
      provider = "kluster";
      auto_suggestions_provider = "gemini";
      cursor_applying_provider = "groq";

      behaviour = {
        enable_cursor_planning_mode = true;
      };

      openai = {
        model = "gpt-4o";
      };

      gemini = {
        model = "gemini-2.0-flash";
      };

      vendors = {
        kluster = {
          __inherited_from = "openai";
          endpoint = "https://api.kluster.ai/v1";
          api_key_name = "KLUSTER_API_KEY";
          model = "deepseek-ai/DeepSeek-R1";
          disable_tools = true;
          max_tokens = 20000;
        };

        qwen = {
          __inherited_from = "openai";
          api_key_name = "GROQ_API_KEY";
          endpoint = "https://api.groq.com/openai/v1/";
          model = "qwen-2.5-coder-32b";
          max_tokens = 20000;
        };

        groq = {
          __inherited_from = "openai";
          api_key_name = "GROQ_API_KEY";
          endpoint = "https://api.groq.com/openai/v1/";
          model = "llama-3.3-70b-versatile";
          max_tokens = 20000;
        };
      };

      rag_service = {
        enabled = true;
      };

      dual_boost = {
        enabled = true;
        first_provider = "qwen";
        second_provider = "claude";
        # prompt = ''
        #   Based on the two reference outputs below, generate a response that uses
        #   them as base for your reasoning and knowledge base and then build on
        #   top of that to generate a more refined solution, keep in mind that
        #   Reference Output 2 is considered a slightly better codder.
        #
        #   Do not provide any explanation, just give the response directly.
        #
        #   Reference Output 1: [{{provider1_output}}]
        #   Reference Output 2: [{{provider2_output}}]
        # '';
        timeout = 600 * 1000;
      };

      suggestion = {
        debounce = 2000;
        throttle = 2000;
      };
    };
  };
}
