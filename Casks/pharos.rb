cask "pharos" do
  version "2.5.640"
  sha256 "46d57e77276f739f427ed4ecf305a0d3e149a73196555a03202034e02d408d96"

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
