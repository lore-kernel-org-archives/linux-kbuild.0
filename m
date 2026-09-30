Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D144F30ED
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Sep 2026 13:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774485; cv=none; b=Dl6eWWzUtKoEW2oPMqfGrJFar9BOOnzGFwIcS7JzMFZOfsMCqMFzcaU8MqEJLPxhdOFu51BzK71buqKSqVfiv8PBOw6sps7mjduziU538JTHgWc4QbYFg5bMf0PWX898bK4sOcPIiWbUpMue9Zi4cSaMLLcOEcF/0vRcagjumo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774485; c=relaxed/simple;
	bh=9w7RU5zcujV+KSe7J6OW/8YyFKXnIOzIBtcy+k5du9A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YOjnRsfePv00d6dUQc5fmHH4za5XL+mo889sDIrECUcfNwLTQi6pRAIrnNDYRsx8GGE4usJWM/AcPsEny9Zk0jJNQtL/1UPujspL6EENXMdof0h4okSfMCco4JQJ1ERdVG1hauuYIC2wh0CcpkfUWWY3WXGORQLAJBrRFFW4k1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8f1QJW+; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8f1QJW+"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48affb828f1so782887f8f.0
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Sep 2026 06:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790774474; x=1791379274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fP6dHKs+XEgtmnRzI+NAxjgMH9T3XFvRmKv/GSHjTzw=;
        b=T8f1QJW+hBGBIC4/uBQJ2Tq0Or/Q/G0nvJ5jvtHCajP8MyOMZOBeKMHevPb9OkE3aK
         0JesZQVP2AKaoAClL2KBmZvm3xlLNICkuR8P7pKPRCC3B9YPQRnkCGg+VpyOpE43W81V
         pCbB16vAhAM70pFVRp+JGulEkg10SVvGu/+Rqnma4QDhjMINNz/6SgeToIk1gUadi7Q8
         2GxLN1XCC64WJh/rJhx/DkMhtsS3pKceKS/3NSnCnP7c0LROBqKaOIjbCRvHZ+CdmrKt
         /MqTp+PWsbdM0lx1qPssIFnyr/gOUAy5J2e03JTfFH7JwjcswPNXYgPXoAWo9rS33T5q
         EpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790774474; x=1791379274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fP6dHKs+XEgtmnRzI+NAxjgMH9T3XFvRmKv/GSHjTzw=;
        b=ohpqw0Ff3kA7vuIb4nMdv8dxguZVJzDwQ7NYAAm20kyNUuZEgWpUxmdiAXOSOKIX/L
         LaB6V12gFta8aAYzVHOJgQgumgbbsP5WsjN1zh3Cwa11GEbT2VrNVIP2OTNcx0vChP5V
         RNs3aJ/Za3rg/8GoaTfFMZ0taoSxVpC1qKo0CtGb84wS7En9b/6pmIT1ECCJYKVlOQFQ
         Cm7HbB/AM6RuQAFKH0EuY3BHwO4R+3OPGdkaSvz1/0syeoPy3KNRT94ojBR5VHAZ7igx
         +bLuVKhvTZohQuBezx6Vj4IcBuYc174n4CdS3T2YrU1bXhvF3EfzlitWLnIjT/3/y5OS
         ywNA==
X-Forwarded-Encrypted: i=1; AKwUvBwg/0Z3wz9R0D9z+/V6kF4wXLdbPRvz98UCdh4R3cuG0XB8OL3il7s12sZ8ykKWHsaJ4hhPZPX6d90cLfc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVT9vxzfurcdoLFFA6fXUG9sBXvjlTiFqBC7+8g6BI+VUInMXU
	1VdO4LnyQzpXWFjhU7hm3eyUQeqfB7YlXb/ffSLAbOl7A3Z2cA+QCtR+
X-Gm-Gg: AYBFou1T4s+P6WBokUHdqgojh7COX13NJDWuxpOGzdPBSfbLhbVEyEs8FcdpwJyIVW8
	gPvObeQIG2DoIuqEwyLakETV+FgNA/5Ll6Cnkd3MQRtt9x8mxqFkXiofE/kkK1rMT/+whxT2BPp
	+af5i5F0AQwGwRIO+5kgi/t5eogrCK6pp0fYt3npsFSBDHKxmcM3DCHdlIhyrcao61SirZfW7Oh
	WQJ1y2bzSeKIilfCUfUkKv3z70xTBHcMxMTeR8Q+1BdDLBTzhCe7wpzCJ08frSsN9GSQxcvQ6ok
	i4W3V+TJiBeR/E63pVTAUpI5AZYUqKlkHrYIQbdusp3bu5X1AnkhA0NdBsH1CtWDyJp3A4u2Vdh
	m/pbINBcSFMP6A7RrGm14weczUwrz5uC0HeoSuk3hVUYkqFmohJPYEeNfsKNvNp6FMw6LOtQkF6
	WjvTBjK/KF1Q7CU7vgwrMInT/q8dBBAh9PWQGWqLzyl9GwlVAtJGs5V6rvApTfTEZOl7eHrHZ5f
	jOmv8oij2haU5lEyQMF/oUlRdQHmJv97JwrnbzoXcPvapKRo6cftiI=
X-Received: by 2002:a05:6000:2401:b0:48a:f404:6960 with SMTP id ffacd0b85a97d-48b024c5c7amr3123964f8f.9.1790774473825;
        Wed, 30 Sep 2026 06:21:13 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029bef64sm5047284f8f.10.2026.09.30.06.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:21:13 -0700 (PDT)
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Kees Cook <kees@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	bpf@vger.kernel.org,
	Jim Cromie <jim.cromie@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Zhen Lei <thunder.leizhen@huawei.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 1/2] kallsyms: Match compressed tokens on the fly during binary search
Date: Wed, 30 Sep 2026 14:21:07 +0100
Message-Id: <20260930132109.260597-2-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260930132109.260597-1-david.laight.linux@gmail.com>
References: <20260930132109.260597-1-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jim Cromie <jim.cromie@gmail.com>

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
Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 kernel/kallsyms.c | 94 +++++++++++++++++++++++++++++------------------
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
2.39.5

