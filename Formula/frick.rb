class Frick < Formula
  desc "Lightning-fast command-line corrector powered by Gemini/Groq APIs"
  homepage "https://github.com/BriskAM/frick"
  version "0.1.2"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/BriskAM/frick/releases/download/v#{version}/frick-darwin-amd64"
      sha256 "ea4ab6c55f5eb1451848a9d484310698b409d887d6cef9c2ae12a64d2c01ba5e"
    elsif Hardware::CPU.arm?
      url "https://github.com/BriskAM/frick/releases/download/v#{version}/frick-darwin-arm64"
      sha256 "afbdd0ec277724d9c95843c59ee27ad74e77824a4bdb7e71437f2da7a3a1297d"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/BriskAM/frick/releases/download/v#{version}/frick-linux-amd64"
      sha256 "71ad32fe092e3766286b536a536f39adf816b12d6c5364db38960f43ddb4ea56"
    elsif Hardware::CPU.arm?
      url "https://github.com/BriskAM/frick/releases/download/v#{version}/frick-linux-arm64"
      sha256 "f1bc8a05bea85b9870a702b2e66e8b84515dc306f0f25bb1552c4e42a29ae34c"
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
