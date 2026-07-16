class Frick < Formula
  desc "Lightning-fast command-line corrector powered by Gemini/Groq APIs"
  homepage "https://github.com/BriskAM/frick"
  version "0.2.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/BriskAM/frick/releases/download/v#{version}/frick-darwin-amd64"
      sha256 "c7b93a00a82ec2b64ea6e09d8cbd2b11d9c28c36aae1887299f841f1335849a0"
    elsif Hardware::CPU.arm?
      url "https://github.com/BriskAM/frick/releases/download/v#{version}/frick-darwin-arm64"
      sha256 "3f79a28cd1c4b88963fc3cd56d5c83d24ad09ee4e39db62d512a15218c7a9d33"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/BriskAM/frick/releases/download/v#{version}/frick-linux-amd64"
      sha256 "b55a0fe3b97017ba981e4a8b4d9e6e2859bf752561df13980796b26dd44bfb90"
    elsif Hardware::CPU.arm?
      url "https://github.com/BriskAM/frick/releases/download/v#{version}/frick-linux-arm64"
      sha256 "c0551b3a12b50e5edff6076b1d02676a8fe2305b5cc8ad6444813a0eaba71b06"
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
