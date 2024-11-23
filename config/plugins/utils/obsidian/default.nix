{
  mkRegistration,
  mkKeymap,
  ...
}:

{
  imports = [
    ./bridge.nix
    ./markdown.nix
    ./todo.nix
  ];

  plugins.obsidian = {
    enable = true;
    settings = {
      workspaces = [
        {
          name = "SecondBrain";
          path = "~/projects/personal/SecondBrain";
        }
      ];
      notes_subdir = "notes";
      new_notes_location = "notes_subdir";
      attachments.img_folder = "assets";
      templates = {
        subdir = "templates";
        dateFormat = "%Y-%m-%d";
        timeFormat = "%H:%M";
        substitutions = { };
      };

      completion.min_chars = 0;
      log_level = "error";

      dailyNotes = {
        folder = "0_Daily_Notes";
        dateFormat = "%Y-%m-%d";
        aliasFormat = "%B %-d, %Y";
      };
      note_id_func =
        # lua
        ''
          function(title)
            local name = ""
            if title ~= nil then
              name = title:gsub(" ", "-"):lower():gsub("[^a-z0-9-æøå]", "")
            else
              for _ = 1, 4 do
                name = name .. string.char(math.random(65, 90))
              end
            end
            return name
          end
        '';
      # prefix for images
      image_name_func =
        # lua
        ''
          function()
            return tostring(os.date("!%Y%m%dT%H%M")) .. "-"
          end
        '';

    };
  };

  plugins.which-key.settings.spec = [
    (mkRegistration "<leader>o" " Obsidian")
  ];

  keymaps = [
    (mkKeymap "n" "<leader>on" "<cmd>ObsidianNew<cr>" " New note")
    (mkKeymap "n" "<leader>op" "<cmd>ObsidianOpen<cr>" " Open")
    (mkKeymap "n" "<leader>or" "<cmd>ObsidianRename<cr>" "󱇨 Rename")
    (mkKeymap "x" "<leader>oe" "<cmd>ObsidianExtractNote<cr>" "󰩭 Extract note")
    (mkKeymap "n" "<leader>ob" "<cmd>ObsidianBacklinks<cr>" " Backlinks")
    (mkKeymap "n" "<leader>of" "<cmd>ObsidianQuickSwitch<cr>" " Find")
    (mkKeymap "n" "<leader>os" "<cmd>ObsidianSearch<cr>" " Search")
    (mkKeymap "n" "<leader>od" "<cmd>ObsidianDailies<cr>" " Dailies")
    (mkKeymap "n" "<leader>ot" "<cmd>ObsidianToday<cr>" " Today")
    (mkKeymap "n" "<leader>oi" "<cmd>ObsidianPasteImg<cr>" " Paste img")
    (mkKeymap "n" "<leader>oa" "<cmd>ObsidianTags<cr>" " Tags")
  ];
}
