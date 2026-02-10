cask "pharos" do
  arch arm: "arm64", intel: "x64"

  version "1.5.0"

  on_arm do
    sha256 "687afa01d460829fb6825f18cc7d8b6a3dc44c5bdfd1073f276e0a00ce914874"
  end
  on_intel do
    sha256 "fd51fc0aff369fdd29790b0e950fa333195c08c4f34e50466a0c20931a1d9ad0"
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
