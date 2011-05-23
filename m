Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:45855 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752713Ab1EWILG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 May 2011 04:11:06 -0400
Received: by mail-iy0-f174.google.com with SMTP id 14so4457027iyb.19
        for <linux-kbuild@vger.kernel.org>; Mon, 23 May 2011 01:11:06 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFCv2 03/13] genksyms: pass hash and lookup functions name and target language though the input file
Date: Mon, 23 May 2011 04:10:29 -0400
Message-Id: <1306138239-13440-4-git-send-email-lacombar@gmail.com>
In-Reply-To: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
References: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

Renaming hash and lookup functions on the command line would reduces its
genericity. Use the .gperf file to pass this information. Do the same for the
target language.
---
 scripts/genksyms/keywords.gperf |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/scripts/genksyms/keywords.gperf b/scripts/genksyms/keywords.gperf
index e6349ac..3e77a94 100644
--- a/scripts/genksyms/keywords.gperf
+++ b/scripts/genksyms/keywords.gperf
@@ -1,3 +1,6 @@
+%language=ANSI-C
+%define hash-function-name is_reserved_hash
+%define lookup-function-name is_reserved_word
 %{
 struct resword;
 static const struct resword *is_reserved_word(register const char *str, register unsigned int len);
-- 
1.7.3.4.574.g608b.dirty

