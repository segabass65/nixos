{ ... }: {
  programs.librewolf.policies = {
    AppUpdateURL = "https://localhost";
    DisableAppUpdate = true;
    OverrideFirstRunPage = "";
    OverridePostUpdatePage = "";
    DisableSystemAddonUpdate = true;
    DisableProfileImport = false;
    DisableFirefoxStudies = true;
    DisableTelemetry = true;
    DisableFeedbackCommands = true;
    DisablePocket = true;
    DisableSetDesktopBackground = false;
    DisableDeveloperTools = false;
    NoDefaultBookmarks = true;
    WebsiteFilter = {
      Block = [
        "https://localhost/*"
      ];
      Exceptions = [
        "https://localhost/*"
      ];
    };
    ExtensionSettings = {
      "{036a55b4-5e72-4d05-a06c-cba2dfcc134a}" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/{036a55b4-5e72-4d05-a06c-cba2dfcc134a}/latest.xpi";
        installation_mode = "normal_installed";
        private_browsing = true;
        default_area = "menupanel";
      };
      "{bbb880ce-43c9-47ae-b746-c3e0096c5b76}" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/{bbb880ce-43c9-47ae-b746-c3e0096c5b76}/latest.xpi";
        installation_mode = "normal_installed";
        private_browsing = true;
        default_area = "menupanel";
      };
      "addon@darkreader.org" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/addon@darkreader.org/latest.xpi";
        installation_mode = "normal_installed";
        private_browsing = true;
        default_area = "menupanel";
      };
      "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}/latest.xpi";
        installation_mode = "normal_installed";
        private_browsing = true;
        default_area = "menupanel";
      };
      "tridactyl.vim@cmcaine.co.uk" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/tridactyl.vim@cmcaine.co.uk/latest.xpi";
        installation_mode = "normal_installed";
        private_browsing = true;
        default_area = "menupanel";
      };
      "uBlock0@raymondhill.net" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/uBlock0@raymondhill.net/latest.xpi";
        installation_mode = "normal_installed";
        private_browsing = true;
        default_area = "menupanel";
      };
      "google@search.mozilla.org".installation_mode = "blocked";
      "bing@search.mozilla.org".installation_mode = "blocked";
      "amazondotcom@search.mozilla.org".installation_mode = "blocked";
      "ebay@search.mozilla.org".installation_mode = "blocked";
      "twitter@search.mozilla.org".installation_mode = "blocked";
    };
    SearchEngines = {
      PreventInstalls = false;
      Remove = [
        "Wikipedia (en)"
        "Google"
        "Bing"
        "Amazon.com"
        "eBay"
        "Twitter"
        "Perplexity"
      ];
      Default = "DuckDuckGo";
    };
    SkipTermsOfUse = true;
    SupportMenu = {
      Title = "LibreWolf Issue Tracker";
      URL = "https://codeberg.org/librewolf/issues";
    };
  };
}
