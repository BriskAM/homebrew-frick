class Frick < Formula
  desc "Lightning-fast command-line corrector powered by Gemini/Groq APIs"
  homepage "https://github.com/BriskAM/frick"
  version "0.1.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/BriskAM/frick/releases/download/v#{version}/frick-darwin-amd64"
      sha256 "67f6132406776b4caa2299b6cbf004919d88c7bac8a4f3b4432ca8e76f508cb1"
    elsif Hardware::CPU.arm?
      url "https://github.com/BriskAM/frick/releases/download/v#{version}/frick-darwin-arm64"
      sha256 "6f7d8bb5fe590892a6a9cc5fc3d24b6206c359c259bca6cc5b0455f7bb32d900"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/BriskAM/frick/releases/download/v#{version}/frick-linux-amd64"
      sha256 "77c90d03078b172fd1ad0b023a4acb9ba49bff2caea82b1f15cf9fad7730e261"
    elsif Hardware::CPU.arm?
      url "https://github.com/BriskAM/frick/releases/download/v#{version}/frick-linux-arm64"
      sha256 "66a4781ef63171936e0bf23c4ee8124fbc2e5cfff5cf735e300c2a9458d1d75b"
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
