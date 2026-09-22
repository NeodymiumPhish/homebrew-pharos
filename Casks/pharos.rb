cask "pharos" do
  version "2.6.204"
  sha256 "6dc60507c2524f4ac682f79bc8262003bcb8779fbffe367cd72ed06fee8fbad8"

  url "https://github.com/NeodymiumPhish/Pharos/releases/download/v#{version}/Pharos-v#{version}.dmg"
  name "Pharos"
  desc "High-performance PostgreSQL client"
  homepage "https://github.com/NeodymiumPhish/Pharos"

  depends_on :macos

  app "Pharos.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-c", "-r", "{{appdir}}/Pharos.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.pharos.client",
    "~/Library/Caches/com.pharos.client",
  ]

  caveats <<~EOS
    This app is not signed with a Developer ID.
    If macOS blocks it, run:
      xattr -d com.apple.quarantine /Applications/Pharos.app
  EOS
end
