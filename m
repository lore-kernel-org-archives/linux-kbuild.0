Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:35353 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752472AbbC3NUm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Mar 2015 09:20:42 -0400
Received: by wgdm6 with SMTP id m6so174655177wgd.2
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2015 06:20:40 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: [PATCH 0/2] Kbuild: kallsyms: update suffix ignore logic
Date: Mon, 30 Mar 2015 15:20:30 +0200
Message-Id: <1427721632-11665-1-git-send-email-ard.biesheuvel@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de, mmarek@suse.cz, linux@arm.linux.org.uk
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>

Two patches that update the kallsyms ignore logic.

Patch #1 adds logic to introduce symbols whose names end in (or equal)
"_veneer". This prevent kallsyms generation errors on large ARM kernels
where the emitted veneers will be different between the first and second
pass, due to the fact that the size of the kallsyms region itself pushes
the .text and .init.text sections further apart during the second pass.

Patch #2 removes the handling of the "gcc[0-9]_compiled." symbol. It was
only ever emitted by GCC v2.x which we don't support anymore anyway.

This series is a followup to ' [RFC PATCH 0/2] ARM large kernels'
(http://thread.gmane.org/gmane.linux.kbuild.devel/13065), but the
other issue addressed by patch #2 of that series will be deferred
for now.

Ard Biesheuvel (2):
  Kbuild: kallsyms: ignore veneers emitted by the ARM linker
  Kbuild: kallsyms: drop special handling of pre-3.0 GCC symbols

 scripts/kallsyms.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

-- 
1.8.3.2

