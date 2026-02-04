cask "pharos" do
  version "1.1.6"
  sha256 "0afd7ddf5547f8e4d09ea9b2b3d794c9d0f203021cacf36b2abd72498849ceee"

  url "https://github.com/NeodymiumPhish/Pharos/releases/download/v#{version}/Pharos_#{version}_aarch64.dmg"
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
