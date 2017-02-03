Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from prv-mh.provo.novell.com ([137.65.248.74]:47798 "EHLO
        prv-mh.provo.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751878AbdBCIzL (ORCPT
        <rfc822;groupwise-linux-kbuild@vger.kernel.org:2:1>);
        Fri, 3 Feb 2017 03:55:11 -0500
Message-Id: <5894537A02000078001366B3@prv-mh.provo.novell.com>
Date: Fri, 03 Feb 2017 01:55:06 -0700
From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2] modpost: treat undefined CRC symbols as absent
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.de>
Cc: linux-kbuild@vger.kernel.org

Apparently dependent on binutils version, undefined CRC symbols may or
may not make it into the final binary's symbol table. Treat undefined
ones as absent instead of as having value zero.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-base.
---
 scripts/mod/modpost.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- 4.10-rc6/scripts/mod/modpost.c
+++ 4.10-rc6-ignore-undef-CRC/scripts/mod/modpost.c
@@ -618,7 +618,8 @@ static void handle_modversions(struct mo
 		export = export_from_sec(info, get_secindex(info, sym));
 
 	/* CRC'd symbol */
-	if (strncmp(symname, CRC_PFX, strlen(CRC_PFX)) == 0) {
+	if (sym->st_shndx != SHN_UNDEF &&
+	    strncmp(symname, CRC_PFX, strlen(CRC_PFX)) == 0) {
 		is_crc = true;
 		crc = (unsigned int) sym->st_value;
 		sym_update_crc(symname + strlen(CRC_PFX), mod, crc,



