cask "pharos" do
  arch arm: "arm64", intel: "x64"

  version "1.5.1"

  on_arm do
    sha256 "0019e70bb20f432248e6c4034c99f58869dfbf145c75eea083432bc42e40ac1b"
  end
  on_intel do
    sha256 "374d9f5a0b9ab088bf2130c23f9b44b048a0cca38367708dc35a1b044f851a45"
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
