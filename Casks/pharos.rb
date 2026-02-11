cask "pharos" do
  arch arm: "arm64", intel: "x64"

  version "1.5.13"

  on_arm do
    sha256 "2e66bb077b46cc8e8c4dd7e8505e39810c6a86d936625093148b48b3589c84b0"
  end
  on_intel do
    sha256 "6fc3eda458e87021b1acdb6967af16b5edf56845231394daefcb0d1c577cc9c6"
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
