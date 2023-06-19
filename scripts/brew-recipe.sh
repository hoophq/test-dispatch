#!/bin/bash
set -euox pipefail

: "${1:? Missing version! $0 <version> <author-name>}}"
VERSION=$1

mkdir -p ./dist
curl -s https://releases.hoop.dev/release/${VERSION}/checksums.txt > ./dist/checksums.txt

DARWIN_AMD64_CHECKSUM=$(grep hoop_${VERSION}_Darwin_x86_64.tar.gz ./dist/checksums.txt |awk {'print $1'})
DARWIN_ARM64_CHECKSUM=$(grep hoop_${VERSION}_Darwin_arm64.tar.gz ./dist/checksums.txt |awk {'print $1'})
LINUX_AMD64_CHECKSUM=$(grep hoop_${VERSION}_Linux_x86_64.tar.gz ./dist/checksums.txt |awk {'print $1'})
LINUX_ARM64_CHECKSUM=$(grep hoop_${VERSION}_Linux_arm64.tar.gz ./dist/checksums.txt |awk {'print $1'})

cat - > hoop.rb <<EOF
# typed: false
# frozen_string_literal: true

# This file is autogenerated. DO NOT EDIT.
class Hoop < Formula
  desc "Hoop allows acessing any infra-structure resource easily and secure."
  homepage "https://github.com/hoophq/hoopcli"
  version "$VERSION"

  on_macos do
    if Hardware::CPU.intel?
      url "https://releases.hoop.dev/release/$VERSION/hoop_${VERSION}_Darwin_amd64.tar.gz"
      sha256 "$DARWIN_AMD64_CHECKSUM"

      def install
        bin.install "hoop"
      end
    end
    if Hardware::CPU.arm?
      url "https://releases.hoop.dev/release/$VERSION/hoop_${VERSION}_Darwin_arm64.tar.gz"
      sha256 "$DARWIN_ARM64_CHECKSUM"

      def install
        bin.install "hoop"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://releases.hoop.dev/release/$VERSION/hoop_${VERSION}_Linux_arm64.tar.gz"
      sha256 "$LINUX_AMD64_CHECKSUM"

      def install
        bin.install "hoop"
      end
    end
    if Hardware::CPU.intel?
      url "https://releases.hoop.dev/release/$VERSION/hoop_${VERSION}_Linux_amd64.tar.gz"
      sha256 "$LINUX_ARM64_CHECKSUM"

      def install
        bin.install "hoop"
      end
    end
  end
end
EOF