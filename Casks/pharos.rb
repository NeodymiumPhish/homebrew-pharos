cask "pharos" do
  version "2.7.108"
  sha256 "df6a436d3c7c2fa047f4733a4c197eb5153d36c1471a0cb4916a444336e23446"

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
