{ avante-master, pkgs, ... }:
{
  plugins.avante = {
    enable = true;
    package = avante-master;

    settings = {
      provider = "openai";
      auto_suggestions_provider = "gemini";
      cursor_applying_provider = "groq";

      file_selector = {
        provider = "mini.pick";
      };

      disabled_tools = [
        "list_files"
        "search_files"
        "read_file"
        "create_file"
        "rename_file"
        "delete_file"
        "create_dir"
        "rename_dir"
        "delete_dir"
        "bash"
        "web_search"
      ];
      custom_tools.__raw = ''
        function()
          return {
            require("mcphub.extensions.avante").mcp_tool(),
          }
        end 
      '';
      system_prompt.__raw = ''
        function()
          local hub = require("mcphub").get_hub_instance()
          return hub:get_active_servers_prompt() .. [[
            Rely on selected_files always as primary source
            DO NOT COMMIT nor perform git actions unless explicitly asked for with the /commit command
            NEVER EVER USE TOOLS TO READ FILES that you already have in the selected_files context
          ]]
        end
      '';

      claude = {
        max_tokens = 8192;
        thinking = {
          type = "enabled";
          budget_tokens = 5000;
        };
        temperature = 1;
      };

      openai = {
        model = "o4-mini";
        reasoning_effort = "medium";
      };

      gemini = {
        model = "gemini-2.5-pro-preview-05-06";
      };

      vendors = {
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

        lmstudio = {
          __inherited_from = "openai";
          endpoint = "http://127.0.0.1:1234/v1";
          model = "deepseek-coder-v2-lite-instruct-mlx";
          disable_tools = true;
          max_tokens = 4096;
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
        runner = "nix";
      };

      dual_boost = {
        enabled = false;
        first_provider = "openai";
        second_provider = "claude-think";
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
