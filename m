Received: from mail-oa2-f35.google.com (mail-oa2-f35.google.com [74.125.231.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FCA383C92
	for <linux-kbuild@vger.kernel.org>; Sat, 26 Sep 2026 19:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790451624; cv=none; b=kICZauif4aDl9Ux0JsxGTOzaRaQDbeaqR61/uyPQkQ09v6XA0F6w0J3ThNLZHg5aZQ6tP0ysKBcDfdMFPFmOFTj2HkOCt8d6XfuTj/m4rCDn4IpdN+8RxZRfKzq8VN/BNvjQ4VDjBw0oYtAQiD0rSfM2xWlpkXoRMvotvOq/A5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790451624; c=relaxed/simple;
	bh=L4+N7wtX63R4ON7KHqWeibK8O6baOU4ILoweuWjUQVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J2/epbvND14m+95XzwaiwM4TE6K4eZVKj2cb2vi+oUtnrjzPRXCB9x2g5CyFG2gUffQKP7rTWMZYlqDiiLqdBhwRBq6Mctcwlpdyun3oGHHKwZDqcfCflDVYfV0VZy4EVOR6j9OCItzbW3aa//QfdEhUF5NYgiF5OCZ0ffDTn2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+UjYwgs; arc=none smtp.client-ip=74.125.231.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+UjYwgs"
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-492d8c4add0so1023617fac.0
        for <linux-kbuild@vger.kernel.org>; Sat, 26 Sep 2026 12:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790451620; x=1791056420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FDnXU1aO4Q0AX1bN544mobwJFKMRqwp3H787nn3otho=;
        b=H+UjYwgs+ZyH6L6DYyvI3YKrOUci3x4rWsH0I9Sg9LoW3nKDMAsa0hVPdUWJ1uxkP0
         yeUBPfAPTvWVbd8fI58tJ5AkDwxzEti0OjmWuA2uCnmRdHHEsputyvWVJ9YCOUBP3s4m
         0NiYkgBZ3lACHzQrNrrzlx9M9olIFcc3YTgBK1MYMwHCueQzJRr4y55Zi1L6XtsIQXE/
         2jf8Hb/XkE+n2zpY2h3iSJ0wb+uUxic8nYQRNNkZzAkkbh2YHhZMzXLDCxrX++Dhrxy4
         HaQS6xty8QzSJGSyNBeAYsbjLoaik/xjJfQbL1OOnjVbr90oNrx1rRZI5rg3pPkgCrFQ
         UUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790451620; x=1791056420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FDnXU1aO4Q0AX1bN544mobwJFKMRqwp3H787nn3otho=;
        b=L77ZpDdPdhY8/VXn9igPMEImBxU8C+DlQfwir3VPYeVahdDJCfuAyG6FyjvaB9yP0U
         I+9QXBWUJXb5VK5RTqw1c84NLfNw+mGYIEKjCxpQiwLZDUX+WkSMnw0xgRFDJP7gf7vS
         FZdhYKi17OZVeEeqlJol1QZR3gJ+1o7X6fH4N5hF0Nck81eYrdUADBk0AXd9F3w8sn2n
         exoRRs+uLa8pevvoN3vFE6kZ6PXjwxC+4Lao4HMUVOtOzA7ufc7qprCCaB/+8e6csyjE
         dE+D8BkPcv8YhaYBvFkRSyu4zFn6EYW/RXJ923V4KXobH6mWh3hUknLQT7jE77+BSsHh
         cbvw==
X-Forwarded-Encrypted: i=1; AKwUvByPIvyUrVtfmPhiJ+epLvK0qYpxi6wNCFDV/Jutngxz3Q8Hioj1sT5pUidtXdJvu8fHNNCIBYkDGf9VbHY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtLRyIyI5h8VjE13z1h9fv1VUF5gx+iEA9VpmAYCpEqk76St6S
	LjFIEVxtTYWnijKokLSITRawDitKc8fBT4745ywL/dNa6pX0It9AeHXj
X-Gm-Gg: AYBFou0RpPzIArx4cHHxqW8dTosPcOQDPOc5Hg9Nxa3h4i0N4QCD/+SGbxO7HCHznyi
	ynSiepB50aYnKzhQjZ8YepBJ7LSQdZ+fSR1WttxIqfXNQgSMLQTNwAkttcSPtOma63Xg3rbCwDy
	+5ObPVxYv7Pv2uLvQ9XKy6AQmFhOOESfsTzOKFHxhUMB8m0WJE26uPtbE/ujg2a/7etg9aKZ0y3
	tiRW3JdJfYwiCKqSmI2fRucib4M3Ooor7mmqcnSeVrQkYyZNUZAkofxWrMJCMXQHennnHwF/GuL
	WW1i4IrUgbKPpCMzqO8kxtCvGQEYbhSCoAPv9gNkAJOsYq9COId4TDCPsHYrS2nM15crpOXtubO
	U6KZhUXgdeyb4ASSYtnS3Y5+zrw+Ijwn9wW2cuvBGT4HBwquK+xWzA4HO1HUkQqDzWW0EjwBD6o
	+xP3kIHGSa9dkJHOM6brXWpWkGkEGqsCC68yCWBQe3qyOyUmdQLf4J2mjiurcXJTxqiG3br5xzU
	4eTeINhfkldZ5iP/u5piKzGaG8955uZ055QmK/6pDMQnuj6+axIDgA+jumF0aMShD1Lvxezqh+r
	11XvEmjdWQ1w4QGmYA/fLrX1zPB+Qg==
X-Received: by 2002:a05:6870:e456:20b0:493:bd68:526b with SMTP id 586e51a60fabf-493bd68551cmr3085177fac.51.1790451620516;
        Sat, 26 Sep 2026 12:40:20 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-49335011458sm5955595fac.4.2026.09.26.12.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 12:40:19 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Sat, 26 Sep 2026 13:40:13 -0600
Subject: [PATCH v6 2/3] kallsyms: Increase marker density to 16:1 to
 accelerate lookups
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-ksyms-tune-v6-2-236620c65e98@gmail.com>
References: <20260926-ksyms-tune-v6-0-236620c65e98@gmail.com>
In-Reply-To: <20260926-ksyms-tune-v6-0-236620c65e98@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Kees Cook <kees@kernel.org>, 
 David Laight <david.laight.linux@gmail.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Jiri Olsa <olsajiri@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 bpf@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790451613; l=5688;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=L4+N7wtX63R4ON7KHqWeibK8O6baOU4ILoweuWjUQVg=;
 b=paFwGAOnmyEIWfsGb5cmDfw+Xn8Ec9XFPWYmC6peeoMl1lUrvQLMv/c7llRNPmqMxxGGCI2Lv
 xUIoavikWQ4DzH8K3lUnj950UGG4wdv5HFgDU7KSCUovVz3LCAgvvHH
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

kallsyms stores symbols with remarkably efficient packing, and simple
streaming unpacking, laid out sequentially in address order.  That said,
variable-length records make arbitrary access inherently linear.
kallsyms_markers[] addressed this by marking stream offsets every 256
symbols, reducing the scan distance by 256x down to an average of
127.5 sequential steps.

While 127.5 hops was negligible for rare, single-shot oops backtraces,
both table size (~184k symbols) and lookup traffic have expanded
substantially.  In alphabetical binary search (kallsyms_lookup_names),
each of the ~17 comparison probes must locate candidate symbols via
get_symbol_offset(), compounding into ~2,170 sequential symbol hops
per lookup.  In bulk tracing workloads (such as BPF multi-kprobe
attach), this penalty compounds into multi-second latency.

Without altering the underlying storage layout, we can retune this
trade-off directly by increasing marker density from 256:1 down to
16:1 (KALLSYMS_MARKER_SHIFT 4) in kernel/kallsyms_internal.h, shared
between scripts/kallsyms.c and kernel/kallsyms.c.

This caps the remainder scan at 15 symbols and cuts average scan distance
from 127.5 down to 7.5 hops (a 17x reduction).  Across a 17-step binary
search, total hops collapse from ~2,170 down to ~127.  For a kernel with
~184,000 symbols, this adds ~10,800 u32 marker entries (+42 KiB) to
write-protected .rodata.

In-tree CONFIG_KALLSYMS_SELFTEST measurements across all ~184k symbols
show average lookup latency dropping from 6,102 ns down to 866 ns (a
7.0x speedup).

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
Changes in v6:
- Recast intro around the kallsyms storage/marker trade-off (efficient
  address packing vs linear search hops).
- Drop hunk-by-hunk numbered list from commit body (addresses BPF CI
  review).
- Drop 0.002% percentage claim and state absolute .rodata cost (+42 KiB
  for ~184k symbols).
- Drop ephemeral benchmark comment from kernel/kallsyms_internal.h.
  replace with scripts/kallsyms.c include ref and __KERNEL__ wrap

Changes in v5:
- Replace dynamic 1:1 batch lookup index (kvmalloc, mutexes, RCU) with
  static 16:1 marker density (KALLSYMS_MARKER_SHIFT 4) in .rodata
  (addresses Kees Cook review).
- Eliminate all dynamic RAM allocations, setup/teardown costs, and
  external batch APIs.

fx2
---
 kernel/kallsyms.c          |  8 ++++----
 kernel/kallsyms_internal.h | 11 +++++++++++
 scripts/kallsyms.c         | 14 +++++++++-----
 3 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index d18d78e626db..91ced7aa797e 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -150,10 +150,10 @@ static unsigned int get_symbol_offset(unsigned long pos)
 	int i, len;
 
 	/*
-	 * Use the closest marker we have. We have markers every 256 positions,
-	 * so that should be close enough.
+	 * Use the closest marker we have. We have markers every
+	 * (1 << KALLSYMS_MARKER_SHIFT) positions, so that should be close enough.
 	 */
-	name = &kallsyms_names[kallsyms_markers[pos >> 8]];
+	name = &kallsyms_names[kallsyms_markers[pos >> KALLSYMS_MARKER_SHIFT]];
 
 	/*
 	 * Sequentially scan all the symbols up to the point we're searching
@@ -161,7 +161,7 @@ static unsigned int get_symbol_offset(unsigned long pos)
 	 * so we just need to add the len to the current pointer for every
 	 * symbol we wish to skip.
 	 */
-	for (i = 0; i < (pos & 0xFF); i++) {
+	for (i = 0; i < (pos & KALLSYMS_MARKER_MASK); i++) {
 		len = *name;
 
 		/*
diff --git a/kernel/kallsyms_internal.h b/kernel/kallsyms_internal.h
index 81a867dbe57d..6a781e4cc77f 100644
--- a/kernel/kallsyms_internal.h
+++ b/kernel/kallsyms_internal.h
@@ -2,6 +2,16 @@
 #ifndef LINUX_KALLSYMS_INTERNAL_H_
 #define LINUX_KALLSYMS_INTERNAL_H_
 
+/*
+ * Provide compile-constants for scripts/kallsyms.c
+ * so it can build the corresponding kallsyms_marker[] table.
+ * and wrap the rest in __KERNEL__
+ */
+#define KALLSYMS_MARKER_SHIFT 4
+#define KALLSYMS_MARKER_SIZE  (1U << KALLSYMS_MARKER_SHIFT)
+#define KALLSYMS_MARKER_MASK  (KALLSYMS_MARKER_SIZE - 1U)
+
+#ifdef __KERNEL__
 #include <linux/types.h>
 
 extern const int kallsyms_offsets[];
@@ -14,5 +24,6 @@ extern const u16 kallsyms_token_index[];
 
 extern const unsigned int kallsyms_markers[];
 extern const u8 kallsyms_seqs_of_names[];
+#endif /* __KERNEL__ */
 
 #endif // LINUX_KALLSYMS_INTERNAL_H_
diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 494852ade6d8..be42a9111350 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -29,6 +29,8 @@
 
 #include <xalloc.h>
 
+#include "../kernel/kallsyms_internal.h"
+
 #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof(arr[0]))
 
 #define KSYM_NAME_LEN		512
@@ -349,16 +351,18 @@ static void write_src(void)
 	printf("\t.long\t%u\n", table_cnt);
 	printf("\n");
 
-	/* table of offset markers, that give the offset in the compressed stream
-	 * every 256 symbols */
-	markers_cnt = (table_cnt + 255) / 256;
+	/*
+	 * Table of offset markers, giving the offset in the compressed stream
+	 * every (1 << KALLSYMS_MARKER_SHIFT) symbols.
+	 */
+	markers_cnt = (table_cnt + KALLSYMS_MARKER_MASK) >> KALLSYMS_MARKER_SHIFT;
 	markers = xmalloc(sizeof(*markers) * markers_cnt);
 
 	output_label("kallsyms_names");
 	off = 0;
 	for (i = 0; i < table_cnt; i++) {
-		if ((i & 0xFF) == 0)
-			markers[i >> 8] = off;
+		if ((i & KALLSYMS_MARKER_MASK) == 0)
+			markers[i >> KALLSYMS_MARKER_SHIFT] = off;
 		table[i]->seq = i;
 
 		/* There cannot be any symbol of length zero. */

-- 
2.55.0

