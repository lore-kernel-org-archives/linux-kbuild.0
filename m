Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:44950 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752605Ab1EECDi (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 May 2011 22:03:38 -0400
Received: by iyb14 with SMTP id 14so1449065iyb.19
        for <linux-kbuild@vger.kernel.org>; Wed, 04 May 2011 19:03:38 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFC 3/9] genksyms: pass hash and lookup functions name and target language though the input file
Date: Wed,  4 May 2011 22:03:18 -0400
Message-Id: <1304561004-2684-4-git-send-email-lacombar@gmail.com>
In-Reply-To: <1304561004-2684-1-git-send-email-lacombar@gmail.com>
References: <1304561004-2684-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

Renaming hash and lookup functions on the command line would reduces its
genericity. Use the .gperf file to pass this information. Do the same for the
target language.
---
 scripts/genksyms/Makefile       |    2 +-
 scripts/genksyms/genksyms.gperf |    3 +++
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/scripts/genksyms/Makefile b/scripts/genksyms/Makefile
index 82bb25f..de6675d 100644
--- a/scripts/genksyms/Makefile
+++ b/scripts/genksyms/Makefile
@@ -29,7 +29,7 @@ lex.%.c: %.l
 	cp $@ $@_shipped
 
 %.hash.c: %.gperf
-	gperf -t --output-file $@ -L ANSI-C -a -C -E -g -H is_reserved_hash -k 1,3,$$ -N is_reserved_word -p -t $<
+	gperf -t --output-file $@ -a -C -E -g -k 1,3,$$ -p -t $<
 	cp $@ $@_shipped
 
 endif
diff --git a/scripts/genksyms/genksyms.gperf b/scripts/genksyms/genksyms.gperf
index e6349ac..3e77a94 100644
--- a/scripts/genksyms/genksyms.gperf
+++ b/scripts/genksyms/genksyms.gperf
@@ -1,3 +1,6 @@
+%language=ANSI-C
+%define hash-function-name is_reserved_hash
+%define lookup-function-name is_reserved_word
 %{
 struct resword;
 static const struct resword *is_reserved_word(register const char *str, register unsigned int len);
-- 
1.7.3.4.574.g608b.dirty

