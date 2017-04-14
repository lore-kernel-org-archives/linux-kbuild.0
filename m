Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f49.google.com ([74.125.83.49]:33252 "EHLO
        mail-pg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752573AbdDNVyz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Apr 2017 17:54:55 -0400
Received: by mail-pg0-f49.google.com with SMTP id x125so47954752pgb.0
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Apr 2017 14:54:55 -0700 (PDT)
From: Stephen Hemminger <stephen@networkplumber.org>
Subject: [PATCH 1/2] kbuild: cleanup signing keys with mrproper
Date: Fri, 14 Apr 2017 14:54:49 -0700
Message-Id: <20170414215450.18307-2-sthemmin@microsoft.com>
In-Reply-To: <20170414215450.18307-1-sthemmin@microsoft.com>
References: <20170414215450.18307-1-sthemmin@microsoft.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, mmarek@suse.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>

When 'make mrproper' is run it was supposed to remove the signing
keys in the certs directory, but only the filename is given
rather than the pathanme which is necessary to cause cleanup.

Signed-off-by: Stephen Hemminger <sthemmin@microsoft.com>
---
 Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index efa267a92ba6..04ca211552f7 100644
--- a/Makefile
+++ b/Makefile
@@ -1274,9 +1274,9 @@ MRPROPER_DIRS  += include/config usr/include include/generated          \
 		  arch/*/include/generated .tmp_objdiff
 MRPROPER_FILES += .config .config.old .version .old_version \
 		  Module.symvers tags TAGS cscope* GPATH GTAGS GRTAGS GSYMS \
-		  signing_key.pem signing_key.priv signing_key.x509	\
-		  x509.genkey extra_certificates signing_key.x509.keyid	\
-		  signing_key.x509.signer vmlinux-gdb.py
+		  certs/signing_key.pem certs/signing_key.priv certs/signing_key.x509	\
+		  certs/x509.genkey certs/extra_certificates certs/signing_key.x509.keyid \
+		  certs/signing_key.x509.signer vmlinux-gdb.py
 
 # clean - Delete most, but leave enough to build external modules
 #
-- 
2.11.0

