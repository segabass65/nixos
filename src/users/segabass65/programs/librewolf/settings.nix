{ ... }: {
  programs.librewolf.settings = {
    "browser.startup.page" = 3;
    "browser.toolbars.bookmarks.visibility" = "never";
    "browser.translations.enable" = false;
    "dom.event.contextmenu.enabled" = false;
    "full-screen-api.warning.timeout" = 0;
    "gfx.webrender.all" = true;
    "layers.acceleration.force-enabled" = true;
    "layout.css.prefers-color-scheme.content-override" = 0;
    "media.videocontrols.picture-in-picture.enabled" = false;
    "privacy.fingerprintingProtection.overrides" = "+AllTargets,-CSSPrefersColorScheme,-FrameRate";
    "privacy.resistFingerprinting" = false;
    "reader.parse-on-load.enabled" = false;
    "webgl.disabled" = false;
    "webgl.enable-debug-renderer-info" = false;
  };
}
