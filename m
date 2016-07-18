Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.73]:63670 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751370AbcGRMBv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Jul 2016 08:01:51 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: running "make dtbs" for test builds
Date: Mon, 18 Jul 2016 14:01:17 +0200
Message-ID: <8924490.SntxSU2FOC@wuerfel>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Fengguang Wu <lkp@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Fengguang Wu <fengguang.wu@intel.com>, Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi Fengguang,

I've recently run into a number of cases in which I pulled a branch that
was building fine with "make vmlinux", but that failed for "make dtbs",
and I wonder if this is something that could be checked by the kbuild
test robot so we catch it earlier.

There are parts of this:

- running "make" without a target will build the default image file
  and also do the "dtbs" target on ARM and other architectures. I
  don't know if this is what you do, or if you always build
  "make vmlinux ; make modules", which doesn't include it.
  The dtbs makefile target is available on arc, arm, arm64, h8300,
  metag, mips, nios2, and xtensa but not the others, so if you
  call it explicitly, that has to be in an architecture specific
  way.

- setting CONFIG_OF_ALL_DTBS will catch all files, not just the
  ones that are built by default for the set of configurations you
  have. It's possible to simply override this on the command line,
  using "make CONFIG_OF_ALL_DTBS=y", it doesn't actually have to
  be part of the configuration. The result is independent of the
  actual configuration, so it should be enough to do this once
  per architecture and source revision.

Is this something you can add?

	Arnd
