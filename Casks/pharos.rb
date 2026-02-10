cask "pharos" do
  arch arm: "arm64", intel: "x64"

  version "1.3.41"

  on_arm do
    sha256 "377d57d696148ef91a77785a43b532ba4d7f1ed56584beaa7ec7ee15a25f9e9c"
  end
  on_intel do
    sha256 "8eeeffefe9e36e91f7d6052d5eedf1afb8ffb5ab5bb3d463eab648e43fb59151"
  end

  url "https://github.com/NeodymiumPhish/Pharos/releases/download/v#{version}/Pharos_#{version}_#{arch}.dmg"
  name "Pharos"
  desc "High-performance PostgreSQL client with modern UI"
  homepage "https://github.com/NeodymiumPhish/Pharos"

  app "Pharos.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-c", "-r", "#{appdir}/Pharos.app"],
                   sudo: false
  end

  caveats <<~EOS
    This app is not signed. If macOS blocks it, run:
      xattr -d com.apple.quarantine /Applications/Pharos.app
  EOS

  zap trash: [
    "~/Library/Application Support/com.pharos.client",
    "~/Library/Caches/com.pharos.client",
  ]
end
