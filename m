Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xes-mad.com ([216.165.139.218]:46849 "EHLO xes-mad.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751430AbZLVBuw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 21 Dec 2009 20:50:52 -0500
From: Peter Tyser <ptyser@xes-inc.com>
Subject: [PATCH v2 0/3] powerpc: Add support for FIT uImages
Date: Mon, 21 Dec 2009 19:50:40 -0600
Message-Id: <1261446643-21714-1-git-send-email-ptyser@xes-inc.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linuxppc-dev@ozlabs.org
Cc: linux-kbuild@vger.kernel.org, Peter Tyser <ptyser@xes-inc.com>

These patches add support for creating the "new" FIT uImage type
that U-Boot can use.  Additional info about FIT images can be
found in the doc/uImage.FIT/ directory of the U-Boot source.
Here's a link to a howto which gives an overview of the format:
http://git.denx.de/cgi-bin/gitweb.cgi?p=u-boot.git;a=blob;f=doc/uImage.FIT/howto.txt;h=8065e9e1d8d4d65a9b5fe0fce08d3709183d0ee4;hb=HEAD

I've only added support for PowerPC, but the arm, avr32, blackfin,
and sh arches could use the same framework in theory.  The change
is especially useful on PowerPC since it creates 1 FIT uImage that
combines the functionality of an "old" uImage format, a device
tree blob, and possibly a ramdisk.

Changes since v1:
- Add 'dts-v1' header to scripts/mkits.sh output
- Don't strip leading 0x from dts addresses
- Default to using kernel dtc if the user doesn't have it in their path

Peter Tyser (3):
  powerpc: Use scripts/mkuboot.sh instead of 'mkimage'
  powerpc: Add support for creating FIT uImages
  powerpc: Add support for ram filesystems in FIT uImages

 arch/powerpc/Makefile        |    4 +-
 arch/powerpc/boot/.gitignore |    1 +
 arch/powerpc/boot/Makefile   |    8 ++-
 arch/powerpc/boot/wrapper    |   43 +++++++++++--
 scripts/mkits.sh             |  141 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 190 insertions(+), 7 deletions(-)
 create mode 100755 scripts/mkits.sh

