cask "pharos" do
  arch arm: "arm64", intel: "x64"

  version "1.5.4"

  on_arm do
    sha256 "8bf9bf3ce582723e3b98fe4f49806cc18a68c098e1daa730fae4839dc3ce8fa9"
  end
  on_intel do
    sha256 "d6a6dd461a28a42b7fb6fc42a952608fa806741fb282c17466a28bc8899e9a77"
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
