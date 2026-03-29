cask "godot@4.4.1" do
  version "4.4.1"
  sha256 "325be823284ce491487a69b354dbb481875857bee84a0b1d00c2552cea92c0a7"

  url "https://github.com/godotengine/godot/releases/download/#{version}-stable/Godot_v#{version}-stable_mono_macos.universal.zip",
      verified: "github.com/godotengine/godot/"
  name "Godot Engine"
  desc "Game development engine"
  homepage "https://godotengine.org/"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)[._-]stable$/i)
    strategy :github_latest
  end

  app "Godot_mono.app", target: "Godot#{version}_mono.app"
  binary "#{appdir}/Godot#{version}_mono.app/Contents/MacOS/Godot", target: "godot#{version}_mono"

  uninstall quit: "org.godotengine.godot"

  zap trash: [
    "~/Library/Application Support/Godot",
    "~/Library/Caches/Godot",
    "~/Library/Saved Application State/org.godotengine.godot.savedState",
  ]
end
