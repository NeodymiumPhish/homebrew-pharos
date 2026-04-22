cask "pharos" do
  version "2.4.82"
  sha256 "84bcfb39c2813a36b8c46ca28793baa52eba4b5343e4270e13dc58fca1c76c36"

  url "https://github.com/NeodymiumPhish/Pharos/releases/download/v#{version}/Pharos-v#{version}.dmg"
  name "Pharos"
  desc "High-performance PostgreSQL client for macOS"
  homepage "https://github.com/NeodymiumPhish/Pharos"

  app "Pharos.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-c", "-r", "#{appdir}/Pharos.app"],
                   sudo: false
  end

  caveats <<~EOS
    This app is not signed with a Developer ID.
    If macOS blocks it, run:
      xattr -d com.apple.quarantine /Applications/Pharos.app
  EOS

  zap trash: [
    "~/Library/Application Support/com.pharos.client",
    "~/Library/Caches/com.pharos.client",
  ]
end
