Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:42141 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965401AbcKDSju (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Nov 2016 14:39:50 -0400
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 3/3] x86/kexec: add -fno-PIE
Date: Fri,  4 Nov 2016 19:39:40 +0100
Message-Id: <20161104183940.30692-4-bigeasy@linutronix.de>
In-Reply-To: <20161104183940.30692-1-bigeasy@linutronix.de>
References: <20161104183940.30692-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, x86@kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, Ben Hutchings <ben@decadent.org.uk>, Sven Joachim <svenjoac@gmx.de>, "Austin S. Hemmelgarn" <ahferroin7@gmail.com>, Borislav Petkov <bp@alien8.de>

If the gcc is configured to do -fPIE by default then the build aborts
later with:
| Unsupported relocation type: unknown type rel type name (29)

Tagging it stable so it is possible to compile recent stable kernels as
well.

Cc: stable@vger.kernel.org
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/x86/purgatory/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/purgatory/Makefile b/arch/x86/purgatory/Makefile
index ac58c1616408..555b9fa0ad43 100644
--- a/arch/x86/purgatory/Makefile
+++ b/arch/x86/purgatory/Makefile
@@ -16,6 +16,7 @@ KCOV_INSTRUMENT :=3D n
=20
 KBUILD_CFLAGS :=3D -fno-strict-aliasing -Wall -Wstrict-prototypes -fno-zer=
o-initialized-in-bss -fno-builtin -ffreestanding -c -MD -Os -mcmodel=3Dlarge
 KBUILD_CFLAGS +=3D -m$(BITS)
+KBUILD_CFLAGS +=3D $(call cc-option,-fno-PIE)
=20
 $(obj)/purgatory.ro: $(PURGATORY_OBJS) FORCE
 		$(call if_changed,ld)
--=20
2.10.2

