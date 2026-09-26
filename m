Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3353955FB
	for <linux-kbuild@vger.kernel.org>; Sat, 26 Sep 2026 19:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790451621; cv=none; b=lC7loIqjmwRCQq1C04y/9TxfmtPYShFljNMbZOT/43xAPXeoVKsWU6hvdyhZvS32AWnOqRo2WsJn/6S3cqnGOKIQxmiPZrwyM3PO/8qJWKpkVnqOX9CH61yZkY0ruAXvjVt9S38TQuetWMOuU9D3iSb44veNzOS9cSbIh2/PCXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790451621; c=relaxed/simple;
	bh=x418C0Z26mQamkJXbHqPXO271fxdJW9S7nrWDjCs7VE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QpUodVX7ClqL1u+SNrHSzllxnaZFpjlS9NJT9c3fc6MbNGHz1Mi+CNd8CZLYO19VVw9lDrdWJngwMGMGplfziVZIVAg3c2U/5/lGPHI6HegKm197ilAFPfeJPb1RbYNTxdZTST7G7AOVA9vYZsjAV7DQP2a/k3TE0zTP1U26GLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McnliiK0; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McnliiK0"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-478cbd5b48aso1259212fac.2
        for <linux-kbuild@vger.kernel.org>; Sat, 26 Sep 2026 12:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790451618; x=1791056418; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h+s4d5VBLC6xRXNbhwyP3CamJ55bTLUrW9UoErJIv9E=;
        b=McnliiK0vdILtRxw4cjUvybBrdCRRtNuEQk+wJl+I90R/77s6kIo8F9mKAuxrNuVq8
         eu2DDjYm3eDR+bTWBdVaKkWnK4Wp3CA4u3Bjpqdsvhx5NHPc7tcjdb3ASOZnSnv8Ita+
         51INcbc0gDuzdxqmOIZAGH2QLdbAn6HKlgvL5KHKdekc77aD7A/YTmc/ohsJ/IuFQIcs
         nOPbJDNxQbAa4BkUhsiRl7RAt0I1CiUL7/XvVr9aanbEAl7MQw0RBUcKr6OX5xlIpFSl
         3M6YB29htqhYGOAGW8sRZT288qIFgusH8l4vBwlnmuPRwwXrcDvoEQiOOIRWIugEKvD5
         tA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790451618; x=1791056418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h+s4d5VBLC6xRXNbhwyP3CamJ55bTLUrW9UoErJIv9E=;
        b=PDn6oWdmR4SWVceNJE+aUsALaYPVghCIFQ69Wn34TvXYRuPtqeHD9pquqHzLxFShe8
         3vXlrqS9o+GYYhlJ6Ui+GImjPL5Hvp6s8WQfRr0bCEyoObsKAaD/7/9bAgha2UzonCy5
         kTpO8t7dpI9gzlCfUjED6NyhiIpfqNByZ7d80HxNIQJbzvKS5YE+Q80xpUlaT2PlynYB
         mdHu4hg2JyUf+DtoZVYOw76/5NT3ThPRYAwmrfUq97xnKRItLKDKFvmpVfydBTxZwaNG
         ppimYVa4KenGHPjSRCUbreCtZMzM9hoTbLEd1QAciC0SzVGigT3oAI1OMo4LY5d9xPE+
         QgSw==
X-Forwarded-Encrypted: i=1; AKwUvBzCS3MJjZN4+NRXPeA5L7P1yj5cd5wmwomUliNGa+dsdIITT313BJzvooLqgASI1IeH962wtTHJtIHbBA4=@vger.kernel.org
X-Gm-Message-State: AFuF++mRzTMDWg7LA6QR/yOvvfIGuNpkehocmqretK/yOpwEfiU5aQDT
	LvAUAsXN5iL4OC/F+xGJ8BaqjTAbksmuX5+ZT2HapBJYeRCh4i9Pj4b99pqyNA==
X-Gm-Gg: AYBFou3m5UNvSA32XbLT6d0/W1cI5mFKj7VZs1LA/fbvMQaPKS1cMnIyIVAKRCwRvDm
	28KZyOMTN8IvRqC+9PZbEs3ap6hwlGk6lAgvPldHl09oOLO/fWRqX1iaS+JFMqWnfvwf83+0PjM
	kxEctqy+83ETQgi1hURzRncAlK52QMvVT/8rjCT/YKhLR0kyBrL0J5xDoWwBpwyNxSNlMh2w+Jt
	so27RvMHW5971BsGH3LwSBUjl+f1AkWQMdYOJjo4YKWJpOSyreOaNnRa/SDi+i3grpz3D+L2T0S
	0dzrmvv6guZgN+DmL5+ZJpSvYQVONk+kXDpll0wDrRKs37nOTn3qfpWP8ZAvb2zm/WycCpG2vwN
	K4AhS67P8xHwtkwaIaINvK4PnLL2Dv2gK+UM0fI8kB4eyt5DB91Xc/YMVvvab+Z7sT9xzessoE7
	v1UZPbhiXR2C3PlODMb6KqZgyXz6GiM9vh3o+cMjtBwk4stnvFQs/3IBpmJ1Iz+XJOgvVdL5fCk
	0Eivk9edFsvRLD7G3qleq/Yqcn+7cycJU0A+jUSIc0Dmcs3TZOPEoZ6oTmqTXVSgiRkDRbD7Moe
	C34RZLCMh9eN/eCWXbQ=
X-Received: by 2002:a05:6870:d288:b0:483:c97d:679f with SMTP id 586e51a60fabf-491e9740b76mr9841946fac.11.1790451618442;
        Sat, 26 Sep 2026 12:40:18 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-49335011458sm5955595fac.4.2026.09.26.12.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 12:40:17 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Sat, 26 Sep 2026 13:40:12 -0600
Subject: [PATCH v6 1/3] kallsyms: Match compressed tokens on the fly during
 binary search
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-ksyms-tune-v6-1-236620c65e98@gmail.com>
References: <20260926-ksyms-tune-v6-0-236620c65e98@gmail.com>
In-Reply-To: <20260926-ksyms-tune-v6-0-236620c65e98@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Kees Cook <kees@kernel.org>, 
 David Laight <david.laight.linux@gmail.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Jiri Olsa <olsajiri@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 bpf@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790451613; l=7334;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=x418C0Z26mQamkJXbHqPXO271fxdJW9S7nrWDjCs7VE=;
 b=mTNLCpv7zx+0W+A+1Q9LPjzegtifZDIAGsuXMSv4KBnhfjdaHL0ZT53AJP1WOFMmmeXAsCVB9
 fylZFC7AYroDqlhL3XMoN6icaXHFHIlplktydx8TV59PFch6IcgGDRA
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

kallsyms_lookup_names() runs a binary search across ~184k tokenized
(compressed) symbols.  For each of the ~17 comparisons in the search, it
currently decompresses the candidate symbol into a temporary buffer on
the stack before calling strcmp().

Comparing tokenized symbols directly in compressed space is
impossible.  The BPE token table assigns values by frequency, not
alphabetical order (e.g. token 0x05 might expand to "zebra" while 0x42
expands to "apple"), so comparing raw token values scrambles
lexicographical order.  Even sorting the token table alphabetically
wouldn't help; "bpf_" and "bpf_foo_" do not *have* a determinative
sorting order, because the suffixes following those tokens would
matter.

However, full string expansion at every step is equally wasteful: of
the ~17 strcmps in the binary search, only the last needs to check
all N chars in both strings, earlier steps will know +/- outcome at
char 0,1,2..N-1.

However, full string expansion at every step is equally wasteful: of
the ~17 strcmp()s in the binary search, only the final matching step
needs to test all characters.  Earlier non-matching steps diverge at
the first differing character (0..N-1), but the baseline expands every
candidate symbol to the stack unconditionally, before comparing.

So we introduce kallsyms_strcmp_symbol() to compare ASCII search_name
against tokenized symbols on the fly.  Like strcmp, it tests the
strings char by char, but when it hits a token in the symbol-string,
it continues the char-test against that token-string, which is in
kallsyms_token_table[].  It returns +- on 1st mismatch.

Measured across all ~184k symbols via CONFIG_KALLSYMS_SELFTEST, this
shaves ~530 ns (~14%) off average kallsyms_lookup_name() latency (from
~3810 ns to ~3280 ns on the default 256:1 baseline) and drops the
512-byte namebuf buffer stack-alloc in kallsyms_lookup_names().

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
Changes in v6:
- Clarify character match mechanics in commit body (no stack expansion,
  short-circuit at first divergent char 0..N-1).
- Cite CONFIG_KALLSYMS_SELFTEST across all ~184k symbols for performance
  measurements.
- Drop stale "unindexed" phrasing and update symbol count to ~184k.

Changes in v3:
- Reorder patch ahead of dynamic batch index in series, establishing an
  active proof of string matching savings on unindexed baseline
  (addresses David Laight review).
- Optimize kallsyms_strcmp_symbol(): drop skipped_first tracking and
  test len at loop bottom (addresses David Laight review).
- Guard first token with while (*tptr) to handle 1-byte type tokens.
- Introduce get_symbol_data() helper in this patch for reuse later

Changes in v2:
- Rebase onto mainline v7.3-rc4, removing external dependencies on
  Lorenzo Stoakes' kbuild series.
---
 kernel/kallsyms.c | 94 ++++++++++++++++++++++++++++++++++---------------------
 1 file changed, 59 insertions(+), 35 deletions(-)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index aec2f06858af..d18d78e626db 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -34,6 +34,21 @@
 
 #include "kallsyms_internal.h"
 
+/*
+ * Get the compressed symbol length and data pointer.
+ */
+static inline const u8 *get_symbol_data(unsigned int off, unsigned int *len)
+{
+	const u8 *p = &kallsyms_names[off];
+	unsigned int l = *p++;
+
+	if (unlikely(l & 0x80))
+		l = (l & 0x7F) | (*p++ << 7);
+	*len = l;
+
+	return p;
+}
+
 /*
  * Expand a compressed symbol data into the resulting uncompressed string,
  * if uncompressed string is too long (>= maxlen), it will be truncated,
@@ -42,28 +57,12 @@
 static unsigned int kallsyms_expand_symbol(unsigned int off,
 					   char *result, size_t maxlen)
 {
-	int len, skipped_first = 0;
+	int skipped_first = 0;
 	const char *tptr;
-	const u8 *data;
+	unsigned int len;
+	const u8 *data = get_symbol_data(off, &len);
 
-	/* Get the compressed symbol length from the first symbol byte. */
-	data = &kallsyms_names[off];
-	len = *data;
-	data++;
-	off++;
-
-	/* If MSB is 1, it is a "big" symbol, so needs an additional byte. */
-	if ((len & 0x80) != 0) {
-		len = (len & 0x7F) | (*data << 7);
-		data++;
-		off++;
-	}
-
-	/*
-	 * Update the offset to return the offset for the next symbol on
-	 * the compressed stream.
-	 */
-	off += len;
+	off = (data - kallsyms_names) + len;
 
 	/*
 	 * For every byte on the compressed symbol data, copy the table
@@ -101,14 +100,43 @@ static unsigned int kallsyms_expand_symbol(unsigned int off,
  */
 static char kallsyms_get_symbol_type(unsigned int off)
 {
-	/*
-	 * Get just the first code, look it up in the token table,
-	 * and return the first char from this token. If MSB of length
-	 * is 1, it is a "big" symbol, so needs an additional byte.
-	 */
-	if (kallsyms_names[off] & 0x80)
-		off++;
-	return kallsyms_token_table[kallsyms_token_index[kallsyms_names[off + 1]]];
+	unsigned int len;
+	const u8 *data = get_symbol_data(off, &len);
+
+	return kallsyms_token_table[kallsyms_token_index[*data]];
+}
+
+/*
+ * Compare an uncompressed ASCII string against a compressed symbol table entry.
+ * Returns negative if name < sym, positive if name > sym, 0 if equal.
+ * Exits immediately on the first mismatched character without decompressing
+ * the rest of the symbol name.
+ */
+static int kallsyms_strcmp_symbol(unsigned int off, const char *name)
+{
+	const char *tptr;
+	unsigned int len;
+	const u8 *data = get_symbol_data(off, &len);
+
+	tptr = &kallsyms_token_table[kallsyms_token_index[*data++]] + 1;
+	while (*tptr) {
+		int diff = (unsigned char)*name++ - (unsigned char)*tptr++;
+
+		if (diff)
+			return diff;
+	}
+
+	while (--len) {
+		tptr = &kallsyms_token_table[kallsyms_token_index[*data++]];
+		do {
+			int diff = (unsigned char)*name++ - (unsigned char)*tptr++;
+
+			if (diff)
+				return diff;
+		} while (*tptr);
+	}
+
+	return (unsigned char)*name;
 }
 
 
@@ -174,7 +202,6 @@ static int kallsyms_lookup_names(const char *name,
 	int ret;
 	int low, mid, high;
 	unsigned int seq, off;
-	char namebuf[KSYM_NAME_LEN];
 
 	low = 0;
 	high = kallsyms_num_syms - 1;
@@ -183,8 +210,7 @@ static int kallsyms_lookup_names(const char *name,
 		mid = low + (high - low) / 2;
 		seq = get_symbol_seq(mid);
 		off = get_symbol_offset(seq);
-		kallsyms_expand_symbol(off, namebuf, ARRAY_SIZE(namebuf));
-		ret = strcmp(name, namebuf);
+		ret = kallsyms_strcmp_symbol(off, name);
 		if (ret > 0)
 			low = mid + 1;
 		else if (ret < 0)
@@ -200,8 +226,7 @@ static int kallsyms_lookup_names(const char *name,
 	while (low) {
 		seq = get_symbol_seq(low - 1);
 		off = get_symbol_offset(seq);
-		kallsyms_expand_symbol(off, namebuf, ARRAY_SIZE(namebuf));
-		if (strcmp(name, namebuf))
+		if (kallsyms_strcmp_symbol(off, name) != 0)
 			break;
 		low--;
 	}
@@ -212,8 +237,7 @@ static int kallsyms_lookup_names(const char *name,
 		while (high < kallsyms_num_syms - 1) {
 			seq = get_symbol_seq(high + 1);
 			off = get_symbol_offset(seq);
-			kallsyms_expand_symbol(off, namebuf, ARRAY_SIZE(namebuf));
-			if (strcmp(name, namebuf))
+			if (kallsyms_strcmp_symbol(off, name) != 0)
 				break;
 			high++;
 		}

-- 
2.55.0

