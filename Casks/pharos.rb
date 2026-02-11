cask "pharos" do
  arch arm: "arm64", intel: "x64"

  version "1.5.11"

  on_arm do
    sha256 "85cbc012da596fcc3608109253b8d23f107d37bba8620e0ac697d2af6fbc30bb"
  end
  on_intel do
    sha256 "998679c31693bc6abe5ccecf202fe657399a1c366aeed24c7d967fdb6a5f6e90"
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
