Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:35128 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752679AbbC3Lth (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Mar 2015 07:49:37 -0400
Received: by wgdm6 with SMTP id m6so171491949wgd.2
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2015 04:49:36 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: [RFC PATCH 0/2] ARM large kernels
Date: Mon, 30 Mar 2015 13:49:25 +0200
Message-Id: <1427716167-25078-1-git-send-email-ard.biesheuvel@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de, mmarek@suse.cz, linux@arm.linux.org.uk
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>

Hello all,

After Russell has pulled most of the large kernel fixes that are
specific to the ARM tree, these two patches are the remaining ones
that are required to successfully build 'allyesconfig' on ARM (*)

The first one updates scripts/kallsyms.c to ignore _veneer symbols.
These are emitted by the linker, and due to the fact that the kallsyms
region is empty in the first pass, and populated in the second, the
number of emitted veneers changes, which changes the contents of
the symbol table etc etc

The second patch keeps the contents of drivers/built-in.o into as
separate inputs into the final link stage. This ensures that the
linker can emit the veneers against out-of-range functions in a
location that is not out of range itself.

(*) It produces a ~75 MB zImage; whether it runs is another question

Ard Biesheuvel (2):
  Kbuild: kallsyms: ignore veneers emitted by the ARM linker
  Kbuild: avoid partial linking of drivers/built-in.o

 Makefile           | 12 +++++++++++-
 scripts/kallsyms.c | 17 ++++++++++++++---
 2 files changed, 25 insertions(+), 4 deletions(-)

-- 
1.8.3.2

