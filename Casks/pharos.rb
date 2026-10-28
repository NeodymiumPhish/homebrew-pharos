cask "pharos" do
  version "2.7.005"
  sha256 "705cc97001e0771f3b9f2a12aa8808d6dfbacab03a0a978be142e24126aad2eb"

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
