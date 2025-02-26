{ avante-master, pkgs, ... }:
{
  plugins.avante = {
    enable = true;
    package = avante-master;

    settings = {
      # provider = "anthropic";
      auto_suggestions_provider = "gemini";
      cursor_applying_provider = "groq";
      file_selector = {
        provider = "mini.pick";
      };

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
        anthropic = {
          __inherited_from = "claude";
          max_tokens = 8192;
          thinking = {
            type = "enable";
            budget_tokens = 2048;
          };
          temperature = 1;
        };
        kluster = {
          __inherited_from = "openai";
          endpoint = "https://api.kluster.ai/v1";
          api_key_name = "KLUSTER_API_KEY";
          model = "deepseek-ai/DeepSeek-R1";
          disable_tools = true;
          max_tokens = 28000;
        };

        qwen = {
          __inherited_from = "openai";
          api_key_name = "GROQ_API_KEY";
          endpoint = "https://api.groq.com/openai/v1/";
          model = "qwen-2.5-coder-32b";
          max_tokens = 28000;
        };

        groq = {
          __inherited_from = "openai";
          api_key_name = "GROQ_API_KEY";
          endpoint = "https://api.groq.com/openai/v1/";
          model = "llama-3.3-70b-versatile";
          max_tokens = 28000;
        };
      };

      rag_service = {
        enabled = false;
      };

      dual_boost = {
        enabled = false;
        first_provider = "qwen";
        second_provider = "claude";
        prompt = ''
          You are an expert code synthesizer. You have been given two different solutions to the same problem.

          Analyze both solutions critically, considering:
          1. Correctness and completeness
          2. Performance and efficiency
          3. Readability and maintainability
          4. Best practices and idioms

          Create a refined solution that:
          - Incorporates the strengths of both approaches
          - Avoids the weaknesses of either approach
          - Resolves any conflicts between the approaches
          - Follows language-specific best practices
          - Incorporates your own judgment and unique perspective

          Note that Reference Solution 2 is generally considered to have better coding style and practices,
          but evaluate both solutions on their technical merits. And also contribute yourself

          Reference Solution 1: [{{provider1_output}}]
          Reference Solution 2: [{{provider2_output}}]

          Provide only the final code solution without explanations or commentary.
        '';
        timeout = 600 * 1000;
      };

      suggestion = {
        debounce = 2000;
        throttle = 2000;
      };
    };
  };

  extraPlugins = [pkgs.vimPlugins.img-clip-nvim];
  extraConfigLua = ''
    require("img-clip").setup({
        prompt_for_file_name = false,
        drag_and_drop = { insert_mode = true },
        })
  '';
}
