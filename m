Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:60611 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725952AbeLCHv6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Dec 2018 02:51:58 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/7] microblaze: fix various problems in building boot images
Date: Mon,  3 Dec 2018 16:50:50 +0900
Message-Id: <1543823457-32478-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Simek <monstr@monstr.eu>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>

This patch set fixes various issues in microblaze Makefiles.

BTW, "simpleImage.<dt>" works like a phony target to generate the
following four images, where the first three are just aliases.

 - arch/microblaze/boot/simpleImage.<dt>:
         identical to arch/microblaze/boot/linux.bin

 - arch/microblaze/boot/simpleImage.<dt>.unstrip:
         identical to vmlinux

 - arch/microblaze/boot/simpleImage.<dt>.ub:
         identical to arch/microblaze/boot/linux.bin.ub

 - arch/microblaze/boot/simpleImage.<dt>.strip:
         stripped vmlinux

I am not sure how much useful those copies are,
but, I tried my best to keep the same behavior.

IMHO, I guess DTB=<dt> would be more sensible,
but it is up to Michal.



Masahiro Yamada (7):
  microblaze: fix cleaning of boot images
  microblaze: adjust the help to the real behavior
  microblaze: move "... is ready" message to arch/microblaze/Makefile
  microblaze: fix multiple bugs in arch/microblaze/boot/Makefile
  microblaze: add linux.bin* and simpleImage.* to PHONY
  microblaze: fix race condition in building boot images
  microblaze: remove the unneeded code just in case file copy fails

 arch/microblaze/Makefile          | 14 +++++++++-----
 arch/microblaze/boot/Makefile     | 33 +++++++++++++++++----------------
 arch/microblaze/boot/dts/Makefile |  5 +----
 3 files changed, 27 insertions(+), 25 deletions(-)

-- 
2.7.4
