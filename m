Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AE13FD14F
	for <linux-kbuild@vger.kernel.org>; Tue, 22 Sep 2026 18:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102776; cv=none; b=QzeNfp6EVkrpYPEvkCioJ73z8uIXO0CM0wKcPuyHKUhr2vGJuJPSXeEEYL1Clmc79+YNWJX6tHV9YwbnuK/r7/OSph7xreXrmV1EKGA3Ptz861Njat+rnhWQw446/KXANUBC+XwsnJhbpRVKrpMzUkfnuysQVNXl5LBKJXLkc4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102776; c=relaxed/simple;
	bh=uSwF8oSlv0A6TNXHp0b7ZlXImXaVRQqeD6cloMWgLIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nV2hJ+GsmfSSTsCd+mKXbewsNQs7i74igI9pXqyuZ2JiR2r99RT0b5y0B2j6mccM4I9t3Ot4nw9ESxh6xsz3LHLgts8QfXJZfz0QOwc2jxG7aBvAbzMHHAwxLjstbbT8l1OrPnsT9NktzqC/9ExMgIUjHBtA87PUFWo1MBno6vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FGkzARcJ; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGkzARcJ"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c0766cbe64so145006b6e.3
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Sep 2026 11:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790102766; x=1790707566; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hU8R4H4DyIVzYPzLtsXcibjq0wK/EbWMtmm1iMO2MGU=;
        b=FGkzARcJ8Tqf/wCPRmmnR6Ml81XhGhSv5nJEtw9hyNcOh8TVyWfA1Q6UzAmxwGRl1T
         Tm36kXbT24iJMGIbBy1Ppylyvs8wiJBzY8cHNRbj88DrD8pAvyR6RRFRIImTDKdRT+4G
         0/vW84IMPKrQgScWdue6NzP1MQbpOWy1BduPvuypyyofRSUEPlaly56kRJ1Y6dM7Rbeh
         Y1are+of/VqjrRP19gtVaodW+Fba3+LAxoi4f6gTzTM8kgEi8TW8GacnbjWfgyd7yah5
         Mvj9AJ6k1YBOhL7/Ch8X69Gv8putfUo2q2zgj7NABHnjOlYpDHW30uP4merB/bGGX7nf
         A16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102766; x=1790707566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hU8R4H4DyIVzYPzLtsXcibjq0wK/EbWMtmm1iMO2MGU=;
        b=Cv7uOO5mlQSfe0lk2/F+dDLMbJxTI1V5oAlbde2iiWRrOV5me/NIQy3URHzZavXkgD
         oo8aGLfhpSDlikrPNxEAPrZQF9iUBYSIIhUJLAme+CANZsXPqdcI7uVF2n5aNkJB/wNK
         uRzjKSv40w6e4rBeLe2jaRcS1Y7djFJw0A8FJJWWij4W7wtT3IO8kJ+uf2mgUHfzQtdn
         HZmvi0wP+1dCPadLZthuI5YKsxkBAUc6yEvYgqvOj71pGqU7bX8mg2Tf1sjwp80Yplin
         V9XmpHNnbJbTmiRT4PA3QAKdgwDQbRbPKZGxbtsHDdwVjqWg9/XaYnE6E4m/NKQwm9rK
         rJHQ==
X-Forwarded-Encrypted: i=1; AKwUvBypUHo6bk7vVO6ZYCw6TOYNFxZAlHXzOhKfzwfnJtTf2ku5S1sWxrU3nK8y2DSCAbdYTsItJqhNDbVJbUY=@vger.kernel.org
X-Gm-Message-State: AFuF++mok55cUF4g8k+MzlelGoEaSJb0O2hPaQxKp/pHGMDLvihU6X+Z
	WMFGcBARA5aGvNFWOlJT9B5JJLeugb1YlkZVxv0gki/qFyXkKz3Dtz6D
X-Gm-Gg: AYBFou2oXABpyRtqsZNoIDhzwbjiGC3aw+cL6P3JElYTOX2dDkeXV0s4WRY5MkhT5xG
	BKaY4UDXZagkwoGYNBx0QVNhUGN1yKp7zc5QkgtTPyLoBXvI+I3KGeoAA5cNE9RPdnu7WKWl0UD
	EiGRPkkw+Mq+4FkSeX0k+A2H1GVLL2Lt4gtoAdHq5jn/R6UmdCpGZMgKJM7pczCoyVUfrtZdCtl
	8xlxDORYjV2TOYb5xHxEicBMD81HsP7zJJ4gUnz1xg334VWxRj735OZYgW4QRx7XmnqIdRUP74u
	1aL/MZDc5UUpOndmhB2jFs39mIrcWvc8Z/jkzftKwx94pTdWVA8FwzreLzXlQYfUzO9ZSS5bvb0
	WaCq8kPrq3tqUvKwEhrKUw6/KBYNEW91OQSkYpoKpPiR5B1kKc9TOHYAVvojryxKdCWFYHMk/b4
	KSq3GhWF9dq2qlPqf8RBXUpCLv8BJgXEV4Ref96QOVBwAANZQ4AF9sfanKmrxa7KsIQPoWOqHC8
	cNzm1AE11WKGb/EKRx1nc2AWQvtHOlXDtsZepTyqvZnIu7imACOEyiDp7UG669eUynoCgRQQD14
	ob/N1CYNSbbN9JvFysA=
X-Received: by 2002:a05:6808:2e4b:b0:4c5:a75f:c5e1 with SMTP id 5614622812f47-4d5b741218emr319290b6e.13.1790102765762;
        Tue, 22 Sep 2026 11:46:05 -0700 (PDT)
Received: from [100.82.231.29] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-4d5c43a24bbsm147545b6e.7.2026.09.22.11.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:46:05 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 22 Sep 2026 12:45:56 -0600
Subject: [PATCH v3 2/4] kallsyms: Match compressed tokens on the fly during
 binary search
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-ksyms-tune-v3-2-681a34ea05d9@gmail.com>
References: <20260922-ksyms-tune-v3-0-681a34ea05d9@gmail.com>
In-Reply-To: <20260922-ksyms-tune-v3-0-681a34ea05d9@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Kees Cook <kees@kernel.org>, 
 David Laight <david.laight.linux@gmail.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790102761; l=6596;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=uSwF8oSlv0A6TNXHp0b7ZlXImXaVRQqeD6cloMWgLIg=;
 b=L+IqEDuVTiikfaFvoXKwSVD7EFUwRep8RiTSWjPH8o+efOSG3jXM2WysT+Om/XLuhiJpe+cDv
 ggBPtOgTLFyCKx3ETfwCUXH3c4A2qnvP2Ai2OGj+sETPWjJLSOl60/2
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

kallsyms_lookup_names() runs a binary search across kallsyms_names[],
a packed array of ~130k encoded kernel symbols.  For each of the ~17
comparisons in the search, it currently decompresses the candidate
symbol into a temporary buffer on the stack before calling strcmp().

Comparing raw tokens directly in compressed space is impossible.  The
BPE token table assigns values by frequency, not alphabetical order
(e.g. token 0x05 might expand to "zebra" while 0x42 expands to "apple"),
so comparing raw token values scrambles lexicographical order.

However, full string expansion is equally wasteful: roughly 16 of the
17 binary search steps fail within the first two characters.

Introduce kallsyms_strcmp_symbol() to compare ASCII queries against
compressed tokens on the fly.  It walks kallsyms_token_index and
kallsyms_token_table incrementally, matching characters directly and
bailing out on the first character mismatch without expanding subsequent
tokens.

This optimization:

0. Avoids decompressing non-matching tokens, short-circuiting ~94% of
   binary search character expansions without adding any tables in
   .rodata.

1. Drops the 512-byte namebuf buffer from the kernel stack in
   kallsyms_lookup_names().

2. Cuts unindexed lookup latency by ~530 ns (~14% faster) while leaving
   sequential address ordering and kallsyms_expand_symbol() streaming
   invariants intact for /proc/kallsyms and table walks.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
Changes in v3:
- Reorder patch ahead of dynamic batch index in series, establishing an
  active proof of string matching savings on unindexed baseline
  (addresses David Laight review).
- Optimize kallsyms_strcmp_symbol(): drop skipped_first tracking and
  test len at loop bottom (addresses David Laight review).
- Guard first token with while (*tptr) to handle 1-byte type tokens.
- Introduce get_symbol_data() helper in this patch for reuse in later
  subsystems.

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

