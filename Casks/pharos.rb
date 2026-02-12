cask "pharos" do
  arch arm: "arm64", intel: "x64"

  version "1.5.2"

  on_arm do
    sha256 "8ec0768420ab5f328e5a34c0a24daffffd478afd52c45dca09cd625c57869497"
  end
  on_intel do
    sha256 "bdffa1767a847155dcd3291203a957958178f364c2801a0ee5f11ac6e5402f8e"
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
