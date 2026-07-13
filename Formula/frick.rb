class Frick < Formula
  desc "Lightning-fast command-line corrector powered by Gemini/Groq APIs"
  homepage "https://github.com/BriskAM/frick"
  version "0.0.9"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/BriskAM/frick/releases/download/v#{version}/frick-darwin-amd64"
      sha256 "8427f992b464fd1b6c1345d10010da98007a27627b24de11894167501e3b7993"
    elsif Hardware::CPU.arm?
      url "https://github.com/BriskAM/frick/releases/download/v#{version}/frick-darwin-arm64"
      sha256 "d8e3363bf2efde017de30d090ffd774ae2ea99b5d5e25ce98feb054cb7359c4e"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/BriskAM/frick/releases/download/v#{version}/frick-linux-amd64"
      sha256 "2439d7de2419cf404712e371ef189e72533b39c972ae2dd78bf7f0634587277f"
    elsif Hardware::CPU.arm?
      url "https://github.com/BriskAM/frick/releases/download/v#{version}/frick-linux-arm64"
      sha256 "920bba3ece5c64d6646207cce108d9eff15889500ce9b2cafdc02baca7b2fb6f"
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
