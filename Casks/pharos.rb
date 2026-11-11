cask "pharos" do
  version "2.7.105"
  sha256 "e1a58f9495ebd59cd8e8d67e3a0134133bd8620cda6d0a681437d7ee8ea4c710"

  url "https://github.com/NeodymiumPhish/Pharos/releases/download/v#{version}/Pharos-v#{version}.dmg"
  name "Pharos"
  desc "High-performance PostgreSQL client"
  homepage "https://github.com/NeodymiumPhish/Pharos"

  depends_on :macos

  app "Pharos.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-c", "-r", "{{appdir}}/Pharos.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.pharos.client",
    "~/Library/Caches/com.pharos.client",
  ]

  caveats <<~EOS
    This app is not signed with a Developer ID.
    If macOS blocks it, run:
      xattr -d com.apple.quarantine /Applications/Pharos.app
  EOS
end
