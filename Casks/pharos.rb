cask "pharos" do
  arch arm: "arm64", intel: "x64"

  version "1.5.3"

  on_arm do
    sha256 "7098face450e3b644b6f2f7d69b72fc6537605af3c3e661c692989ac5c448748"
  end
  on_intel do
    sha256 "cf7243654f742a62492e881191fbb8256aad72a26adba5bf489e154defb37645"
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
