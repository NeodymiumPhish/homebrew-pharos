cask "pharos" do
  version "2.5.601"
  sha256 "be78f681da2c32bc04ab4bf5b3a5fd876c9b07a964c652e35bb5141e6b415958"

  url "https://github.com/NeodymiumPhish/Pharos/releases/download/v#{version}/Pharos-v#{version}.dmg"
  name "Pharos"
  desc "High-performance PostgreSQL client for macOS"
  homepage "https://github.com/NeodymiumPhish/Pharos"

  app "Pharos.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-c", "-r", "#{appdir}/Pharos.app"],
                   sudo: false
  end

  caveats <<~EOS
    This app is not signed with a Developer ID.
    If macOS blocks it, run:
      xattr -d com.apple.quarantine /Applications/Pharos.app
  EOS

  zap trash: [
    "~/Library/Application Support/com.pharos.client",
    "~/Library/Caches/com.pharos.client",
  ]
end
