Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f49.google.com ([74.125.83.49]:35014 "EHLO
        mail-pg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755186AbdDNVy4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Apr 2017 17:54:56 -0400
Received: by mail-pg0-f49.google.com with SMTP id 72so39489761pge.2
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Apr 2017 14:54:56 -0700 (PDT)
From: Stephen Hemminger <stephen@networkplumber.org>
Subject: [PATCH 2/2] kbuild: remove initramfs cpio with mrproper
Date: Fri, 14 Apr 2017 14:54:50 -0700
Message-Id: <20170414215450.18307-3-sthemmin@microsoft.com>
In-Reply-To: <20170414215450.18307-1-sthemmin@microsoft.com>
References: <20170414215450.18307-1-sthemmin@microsoft.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, mmarek@suse.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>

When 'make mrproper' is done, it should also remove the initramfs cpio
file. I ran into this while doing test build on one machine, followed
by make mrproper and rsync to a target machine. The build on the target
machine would succeed but be unbootable because of the bad initramfs.

Signed-off-by: Stephen Hemminger <sthemmin@microsoft.com>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 04ca211552f7..954292695bf6 100644
--- a/Makefile
+++ b/Makefile
@@ -1276,7 +1276,8 @@ MRPROPER_FILES += .config .config.old .version .old_version \
 		  Module.symvers tags TAGS cscope* GPATH GTAGS GRTAGS GSYMS \
 		  certs/signing_key.pem certs/signing_key.priv certs/signing_key.x509	\
 		  certs/x509.genkey certs/extra_certificates certs/signing_key.x509.keyid \
-		  certs/signing_key.x509.signer vmlinux-gdb.py
+		  certs/signing_key.x509.signer vmlinux-gdb.py \
+		  usr/initramfs_data.cpio.gz
 
 # clean - Delete most, but leave enough to build external modules
 #
-- 
2.11.0

