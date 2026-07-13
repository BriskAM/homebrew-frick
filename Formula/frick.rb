class Frick < Formula
  desc "Lightning-fast command-line corrector powered by Gemini/Groq APIs"
  homepage "https://github.com/BriskAM/frick"
  version "0.0.5"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/BriskAM/frick/releases/download/v#{version}/frick-darwin-amd64"
      sha256 "685d74ea8a04adbac1e229e9a3e50916d825843d0087b0ef38e281a3cd366435"
    elsif Hardware::CPU.arm?
      url "https://github.com/BriskAM/frick/releases/download/v#{version}/frick-darwin-arm64"
      sha256 "3416a66c68ab787c6264710f9ffb8eb15c04e070e5b818cf4cd6861cca4970ae"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/BriskAM/frick/releases/download/v#{version}/frick-linux-amd64"
      sha256 "39c3bd2485a313b662711cfa30f9eb620eb515ad9164f80be7255dd9094618f8"
    elsif Hardware::CPU.arm?
      url "https://github.com/BriskAM/frick/releases/download/v#{version}/frick-linux-arm64"
      sha256 "276ddb7ab11fb68e407731ac2a545a95e44740ced5adff26ac4bf30388bb1be8"
    end
  end

  def install
    # Binary is downloaded directly; rename to "frick" and install
    binary_name = if OS.mac?
      Hardware::CPU.intel? ? "frick-darwin-amd64" : "frick-darwin-arm64"
    elsif OS.linux?
      Hardware::CPU.intel? ? "frick-linux-amd64" : "frick-linux-arm64"
    end

    bin.install binary_name => "frick"
  end

  def caveats
    <<~EOS
      Add the following line to your ~/.zshrc or ~/.bashrc to enable shell integration:
        eval "$(frick init)"
    EOS
  end

  test do
    system "#{bin}/frick", "--help"
  end
end
