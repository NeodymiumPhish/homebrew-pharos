cask "pharos" do
  version "1.0.1"
  sha256 "32d91fd0408e330986c89df7fab18b59418cee246e4dcd0a9a7a8d22d76595d5"  # SHA256 of your DMG

  url "https://github.com/NeodymiumPhish/Pharos/releases/download/v#{version}/Pharos_#{version}_aarch64.dmg"
  name "Pharos"
  desc "High-performance PostgreSQL client with modern UI"
  homepage "https://github.com/NeodymiumPhish/Pharos"

  app "Pharos.app"

  zap trash: [
    "~/Library/Application Support/com.pharos.client",
    "~/Library/Caches/com.pharos.client",
  ]
end
