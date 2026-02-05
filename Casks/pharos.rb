cask "pharos" do
  version "1.2.0"
  sha256 "4425ae6dc9d9dc40126d7bffd84dc821303572fe590e998fccc6bcf09a3e70e0"

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
