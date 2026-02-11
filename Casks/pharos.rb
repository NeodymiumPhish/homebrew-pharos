cask "pharos" do
  arch arm: "arm64", intel: "x64"

  version "1.5.12"

  on_arm do
    sha256 "d8136baea6a462deaea703eef218edd58049c6a81521b5ec8296f79bfd2ced89"
  end
  on_intel do
    sha256 "896941a6338676c12ccb6aaa2cc0a91b9119e5f75e5fb2b48bcbc5b24916874b"
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
