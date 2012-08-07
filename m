Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:33323 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752652Ab2HGJIb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 7 Aug 2012 05:08:31 -0400
Received: by eeil10 with SMTP id l10so1096206eei.19
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Aug 2012 02:08:30 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 7 Aug 2012 19:08:29 +1000
Message-ID: <CA+Y=x3k4eMMamEANrSFGcopAesMqrbQP-gcxvyXpV7SEee4hOw@mail.gmail.com>
Subject: [Patch] scripts: fix "make install" when a directory or file named
 install exists
From: Andrew Worsley <amworsley@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Allow "make install" to work even if a file or directory called install exists
Signed-off-by: Andrew Worsley <amworsley@gmail.com>
---
This is based on mainline  v3.5 version. It's almost trivial except I
spent about an hour trying to install the kernel output into a
directory install/<architecture> as per other packages I build before
I realised the obvious problem! So I thought it
was worth submitting to avoid other people hitting this problem: The
target install is not marked as PHONY anywhere.

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index ff1720d..cf4b970 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -434,6 +434,7 @@ $(multi-used-m) : %.o: $(multi-objs-m) FORCE

 targets += $(multi-used-y) $(multi-used-m)

+PHONY += install

 # Descending
 # ---------------------------------------------------------------------------
