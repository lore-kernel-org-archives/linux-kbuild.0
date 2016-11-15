Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from prv-mh.provo.novell.com ([137.65.248.74]:58797 "EHLO
        prv-mh.provo.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755689AbcKOPqA (ORCPT
        <rfc822;groupwise-linux-kbuild@vger.kernel.org:2:1>);
        Tue, 15 Nov 2016 10:46:00 -0500
Message-Id: <582B3BC5020000780011EF53@prv-mh.provo.novell.com>
Date: Tue, 15 Nov 2016 08:45:57 -0700
From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] modpost: treat undefined CRC symbols as absent
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
I've only noticed this with the recent switch to exporting symbols
defined in assembly files from their source files, as that has caused
a number of such symbols to appear.
---
 scripts/mod/modpost.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- 4.9-rc5/scripts/mod/modpost.c
+++ 4.9-rc5-ignore-undef-CRC/scripts/mod/modpost.c
@@ -617,7 +617,8 @@ static void handle_modversions(struct mo
 		export = export_from_sec(info, get_secindex(info, sym));
 
 	/* CRC'd symbol */
-	if (strncmp(symname, CRC_PFX, strlen(CRC_PFX)) == 0) {
+	if (sym->st_shndx != SHN_UNDEF &&
+	    strncmp(symname, CRC_PFX, strlen(CRC_PFX)) == 0) {
 		crc = (unsigned int) sym->st_value;
 		sym_update_crc(symname + strlen(CRC_PFX), mod, crc,
 				export);



