Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:47322 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727482AbfCWS4M (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Mar 2019 14:56:12 -0400
Date: Sat, 23 Mar 2019 19:46:18 +0100
From: Fredrik Noring <noring@nocrew.org>
Subject: [PATCH] kbuild: modversions: Fix relative CRC byte order interpretion
Message-ID: <20190323184618.GA4916@sx9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, "Maciej W. Rozycki" <macro@linux-mips.org>

Fix commit 56067812d5b0 ("kbuild: modversions: add infrastructure for
emitting relative CRCs") where CRCs are interpreted in host byte order
rather than proper kernel byte order.

For example, when loading BE modules compiled with a LE system, the
error "disagrees about version of symbol module_layout" is produced.
A message such as "Found checksum D7FA6856 vs module 5668FAD7" will be
given with debug enabled, which indicates an obvious endian problem.

The general solution is to use the macro TO_NATIVE, as is done in
similar cases throughout modpost.c. With this correction it has been
verified that BE modules compiled with a LE system load properly into
a BE kernel.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
Fixes: 56067812d5b0 ("kbuild: modversions: add infrastructure for emitting relative CRCs")
Cc: stable@vger.kernel.org
---
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 0b0d1080b1c5..f277e116e0eb 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -639,7 +639,7 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
 			       info->sechdrs[sym->st_shndx].sh_offset -
 			       (info->hdr->e_type != ET_REL ?
 				info->sechdrs[sym->st_shndx].sh_addr : 0);
-			crc = *crcp;
+			crc = TO_NATIVE(*crcp);
 		}
 		sym_update_crc(symname + strlen("__crc_"), mod, crc,
 				export);
