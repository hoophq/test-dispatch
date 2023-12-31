# typed: false
# frozen_string_literal: true

# This file is autogenerated. DO NOT EDIT.
class Hoop < Formula
  desc "Hoop allows acessing any infra-structure resource easily and secure."
  homepage "https://github.com/hoophq/hoopcli"
  version "1.12.24-cihotfix2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://releases.hoop.dev/release/1.12.24-cihotfix2/hoop_1.12.24-cihotfix2_Darwin_amd64.tar.gz"
      sha256 "9d3de8a1d584d524b3551dcb8923e153ee523cb53025d898a53788d1eb42c065"

      def install
        bin.install "hoop"
      end
    end
    if Hardware::CPU.arm?
      url "https://releases.hoop.dev/release/1.12.24-cihotfix2/hoop_1.12.24-cihotfix2_Darwin_arm64.tar.gz"
      sha256 "11bd380958f864b1990d11d3b48f174add1d264802d080bec7ef45096644b915"

      def install
        bin.install "hoop"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://releases.hoop.dev/release/1.12.24-cihotfix2/hoop_1.12.24-cihotfix2_Linux_arm64.tar.gz"
      sha256 "1258cb079e77b8b340f94b0defe75b32b69a8761bfa032dbfbd60bd93c943902"

      def install
        bin.install "hoop"
      end
    end
    if Hardware::CPU.intel?
      url "https://releases.hoop.dev/release/1.12.24-cihotfix2/hoop_1.12.24-cihotfix2_Linux_amd64.tar.gz"
      sha256 "12abf9144638cf684ee723d53a2b7fcd436c4bc78953b4f19c9958be6c413ad9"

      def install
        bin.install "hoop"
      end
    end
  end
end
