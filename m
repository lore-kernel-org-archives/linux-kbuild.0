Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:14312 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751931AbaBHRqs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 8 Feb 2014 12:46:48 -0500
Date: Sat, 8 Feb 2014 09:46:45 -0800
From: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH 4/6] kbuild: Support padding in kallsyms tables
Message-ID: <20140208174645.GH12219@tassilo.jf.intel.com>
References: <1391845840-28514-1-git-send-email-ak@linux.intel.com>
 <1391845840-28514-4-git-send-email-ak@linux.intel.com>
 <20140208121241.GA401@x4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140208121241.GA401@x4>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Markus Trippelsdorf <markus@trippelsdorf.de>
Cc: mmarek@suse.cz, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

> With attached config I get:
> 
>   KSYM    .tmp_kallsyms2.o
> kallsyms: address pointers padding too short: 24495 missing
>   OBJCOPY .tmp_kallsyms2.bin
>   PATCHFILE vmlinux
> Not enough padding in vmlinux for new kallsyms, missing 192120
> Makefile:840: recipe for target 'vmlinux' failed

Nice test case thanks.  This should fix it.

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index e479076..fb6898f 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -197,15 +197,19 @@ static int symbol_valid_tr(struct sym_entry *s)
 {
 	size_t i;
 	struct text_range *tr;
+	int valid = 0;
 
 	for (i = 0; i < ARRAY_SIZE(text_ranges); ++i) {
 		tr = &text_ranges[i];
 
+		if (tr->start && tr->end)
+		    valid++;
+
 		if (s->addr >= tr->start && s->addr <= tr->end)
 			return 1;
 	}
 
-	return 0;
+	return valid ? 0 : 1;
 }
 
 static int symbol_valid(struct sym_entry *s)
