Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0A94EC66A
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Sep 2026 13:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774495; cv=none; b=Wi7uzaTvO5vPHba8HHKuH2J2e9G40ZSUn3XsB1DEcTROQzSGhLA46PCPTN9hrhYoSN2VbSGhFVIvS/qrtdI5VfbgbnVpAKN99YLzXwMpnL4dNsVNiiSob/DT5HuK7rWCqLxFqEi9DXCmlzakUgCa80w9NnW216GgwOY6fbcafsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774495; c=relaxed/simple;
	bh=IxA2jjxBtBn0Fkc0HP3zcazYPujV2mj/2Ddz1Ag0dQo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rPJvT8YVHbq6RKPMux9rS0IHSF/4iARsMDmXK9w9mb4YWOK51KzwgrKsKNtWFZZ3G7Xza/GnVT2DjNRTMxXWm43gKcwx64JEVa7sWkDMThDHCTwVJmMdpz1ESZoF5poKn/wAOREfGELFob41geiNiZQLpP0uzBL/0C7wo86sFxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZOd8cR+e; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZOd8cR+e"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843796e373so3148112f8f.1
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Sep 2026 06:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790774476; x=1791379276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eY6lHduxeQXU07OpP/TmyzvlpbB/rwtfC8G5zNQ+Qew=;
        b=ZOd8cR+eiFXLOsEVECe/rNOPedPHLEdVDAFtKtKEVS0d1m1CFa1Pto0Mpib48njTGo
         EX4LEgfR8TQc1+Q1n9BF3EUN6oGcyR+GRTI6vED7CYG2cd7RfxlqRZ4GZ9RZlhdNCeRa
         dXcE4ZK1f+xCvrXfA/Rytuj/R3FP9n0QDEy7QBzJFE0/A9lnilzk/tAkT0t3P2/ox0Nk
         jKGaGyHpszw9/aP0P30Zrc0zqtRzdVUZ9HtP5lPxS27lNGNCKMcOtpzAxmDPRs7C2Ml9
         g4SJ/Z2Z+KVg+iC7yJ9hqb1+t9VLtS+JIFkNJ74iUL9E1AWcTgdm5J7N/8q4WKzm2JFD
         QrWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790774476; x=1791379276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eY6lHduxeQXU07OpP/TmyzvlpbB/rwtfC8G5zNQ+Qew=;
        b=t5OwI3FnyLES354u6lWFZR3nCgWdPQlvtvRD6gPhs8DeOilRE/BZtnhVRcjnw2aUzq
         DP1roR4Y8XhocgGigkNcmEtvzI+MH5E5HX+/10/Ydcwyo07tU6ac0/Hffv+Aq8ahhkN8
         kXehfINwf/TPXre1X94fpyzXcLG8gQXBozkP0BQNd2x5mGMrI7hEHiMaUosu7eKdO2hg
         fNANkdu91TrlmGEpqv8D1yFt0lX82nzaqmOz0idYsQ+EetHkhZD7uSp2bp+1N/x2Ei3V
         F/Kmr/OSkZa2Dt8UJ5rAWqClZAashOzvm3JTmu/9R4C/yVwjUBZtKwsfSmkqrocg76Mf
         vNFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzICcPNDg7GWOS94Oqokie/uPfy/GA+qWjSr85Wgqc7sKLPmI38wTf4fj7XQB82HuGsctLKOz4Q9z0L0Fc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIleYFY4HylMgj7YrtS975XKJSGjGzYFt2gQdaA9WOEe3eRC5Cs
	sdtYw3iYANnSd3m5JbL720zvz2YZ9GE4ee13NvhHc2oGG8PYnTv0hwIa
X-Gm-Gg: AYBFou3/td8IXpb2FOLm98wlYW+FKly923mBUtq4TASEC4jmXf+8Pu95ExkmurvhL9b
	s1rxQLJ7G99xWV+2dex+oPEpvC8SRRDldy/aGhIbBJOtgcWlaITtSAZ0PpNINkqb1puRLgrjrQD
	kd2fdFMBdKVEKAVKSQU7vA9zlrkiFl2PBtobcmxjzdq/5aoqTGlnLlJs69WKDzfblmGnzvvUuZQ
	v7sP5RJ1lt1HkVD8E2wG2csvkRdvAeL9Vcx9u4u1rroYkn2S919xTYuRnjfGB19iH6phofrfLdM
	d9mESiDB54ZnMurDTxVpu++T2byBR6wMsFoGn++3K56hZnMnJApe+vS5Fb1rb15rdSXzhK3mM1r
	jaJB09C1boCNPOGeTKavEzch2Uviqx2nSJwGK7TKZMpd2XvNF8KbEnXONKoDrExgBjxe4pGFNU0
	2M1MbByg/C+MuLkj0ApSPaFk+46/5jVCvSAy5s10/JHuEJUQ4Irk3xbmYuC/Odtlt7AxBDGIeLJ
	z6tq4RnLjzZieU8Y07fDf9j8VKix34UIZoDgc9roqmsL1QKrLIXooo=
X-Received: by 2002:a05:6000:2c03:b0:48a:f59f:8b70 with SMTP id ffacd0b85a97d-48b0256514dmr3166950f8f.46.1790774476132;
        Wed, 30 Sep 2026 06:21:16 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029bef64sm5047284f8f.10.2026.09.30.06.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:21:15 -0700 (PDT)
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
Subject: [PATCH 2/2] kallsyms: Optimise symbol name search
Date: Wed, 30 Sep 2026 14:21:08 +0100
Message-Id: <20260930132109.260597-3-david.laight.linux@gmail.com>
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

Change the alphabetically ordered lookup table (kallsyms_seqs_of_names)
with one that indexed the table of compressed names rather than the
array of symbol values.
This removes all the linear scans during the binary search for the symbol
name.
Once the name has been found a second binary search of the 'markers' array
followed by a linear scan for the symbols address gives the symbol value.

This linear scan is done once for each address returned, whereas the old
code did the scan for each of the ~17 comparisons in the binary search
(and the binary search is done at least two times for a symbol that appears
once).

For normal kernels the index table stays at 24 bits per symbol (now host
ordered), but a 32 bit table is used if necessary (probably only for
allyesconfig builds - needs 25 bits on x86-64).

Seems to work.
Build for BE kernels will correctly flip the byte order in the index table.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 kernel/kallsyms.c          | 77 ++++++++++++++++++++++++++------------
 kernel/kallsyms_internal.h |  4 +-
 scripts/Makefile           |  1 +
 scripts/kallsyms.c         | 50 ++++++++++++++-----------
 4 files changed, 85 insertions(+), 47 deletions(-)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index d18d78e626db..2f39fa850dea 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -177,6 +177,36 @@ static unsigned int get_symbol_offset(unsigned long pos)
 	return name - kallsyms_names;
 }
 
+/*
+ * Find the value of a symbol givem the offset in the compressed stream.
+ */
+static unsigned long get_name_address(unsigned int name_offset)
+{
+	unsigned int low, pos, high;
+
+	low = 0;
+	high = kallsyms_num_syms >> 8;
+
+	while (high - low > 1) {
+		pos = low + (high - low) / 2;
+		if (name_offset >= kallsyms_markers[pos])
+			low = pos;
+		else
+			high = pos;
+	}
+
+	pos = kallsyms_markers[low];
+	for (low <<= 8; pos < name_offset; low++) {
+		unsigned int len = kallsyms_names[pos];
+		if (len & 0x80)
+			len += (kallsyms_names[pos + 1] << 7) - 0x7f;
+		pos += 1 + len;
+	}
+
+	return kallsyms_sym_address(low);
+}
+
+
 unsigned long kallsyms_sym_address(int idx)
 {
 	/* non-relocatable 32-bit kernels just embed the value directly */
@@ -185,14 +215,11 @@ unsigned long kallsyms_sym_address(int idx)
 	return (unsigned long)offset_to_ptr(kallsyms_offsets + idx);
 }
 
-static unsigned int get_symbol_seq(int index)
+static unsigned int get_symbol_name(int index)
 {
-	unsigned int i, seq = 0;
-
-	for (i = 0; i < 3; i++)
-		seq = (seq << 8) | kallsyms_seqs_of_names[3 * index + i];
-
-	return seq;
+	if (kallsyms_off24_of_names)
+		return kallsyms_off24_of_names[index].v;
+	return kallsyms_off32_of_names[index];
 }
 
 static int kallsyms_lookup_names(const char *name,
@@ -201,15 +228,14 @@ static int kallsyms_lookup_names(const char *name,
 {
 	int ret;
 	int low, mid, high;
-	unsigned int seq, off;
+	unsigned int off;
 
 	low = 0;
 	high = kallsyms_num_syms - 1;
 
 	while (low <= high) {
 		mid = low + (high - low) / 2;
-		seq = get_symbol_seq(mid);
-		off = get_symbol_offset(seq);
+		off = get_symbol_name(mid);
 		ret = kallsyms_strcmp_symbol(off, name);
 		if (ret > 0)
 			low = mid + 1;
@@ -220,23 +246,24 @@ static int kallsyms_lookup_names(const char *name,
 	}
 
 	if (low > high)
-		return -ESRCH;
+		return -1;
+
+	ret = off;
 
 	low = mid;
 	while (low) {
-		seq = get_symbol_seq(low - 1);
-		off = get_symbol_offset(seq);
+		off = get_symbol_name(low - 1);
 		if (kallsyms_strcmp_symbol(off, name) != 0)
 			break;
 		low--;
+		ret = off;
 	}
 	*start = low;
 
 	if (end) {
 		high = mid;
 		while (high < kallsyms_num_syms - 1) {
-			seq = get_symbol_seq(high + 1);
-			off = get_symbol_offset(seq);
+			off = get_symbol_name(high + 1);
 			if (kallsyms_strcmp_symbol(off, name) != 0)
 				break;
 			high++;
@@ -244,7 +271,7 @@ static int kallsyms_lookup_names(const char *name,
 		*end = high;
 	}
 
-	return 0;
+	return ret;
 }
 
 /* Lookup the address for this symbol. Returns 0 if not found. */
@@ -258,8 +285,8 @@ unsigned long kallsyms_lookup_name(const char *name)
 		return 0;
 
 	ret = kallsyms_lookup_names(name, &i, NULL);
-	if (!ret)
-		return kallsyms_sym_address(get_symbol_seq(i));
+	if (ret >= 0)
+		return get_name_address(ret);
 
 	return module_kallsyms_lookup_name(name);
 }
@@ -289,15 +316,17 @@ int kallsyms_on_each_symbol(int (*fn)(void *, const char *, unsigned long),
 int kallsyms_on_each_match_symbol(int (*fn)(void *, unsigned long),
 				  const char *name, void *data)
 {
-	int ret;
-	unsigned int i, start, end;
+	int name_offset, ret;
+	unsigned int sym_number, last;
 
-	ret = kallsyms_lookup_names(name, &start, &end);
-	if (ret)
+	name_offset = kallsyms_lookup_names(name, &sym_number, &last);
+	if (name_offset < 0)
 		return 0;
 
-	for (i = start; !ret && i <= end; i++) {
-		ret = fn(data, kallsyms_sym_address(get_symbol_seq(i)));
+	for (;; name_offset = get_symbol_name(sym_number)) {
+		ret = fn(data, get_name_address(name_offset));
+		if (ret || ++sym_number > last)
+			break;
 		cond_resched();
 	}
 
diff --git a/kernel/kallsyms_internal.h b/kernel/kallsyms_internal.h
index 81a867dbe57d..be503f3f993f 100644
--- a/kernel/kallsyms_internal.h
+++ b/kernel/kallsyms_internal.h
@@ -13,6 +13,8 @@ extern const char kallsyms_token_table[];
 extern const u16 kallsyms_token_index[];
 
 extern const unsigned int kallsyms_markers[];
-extern const u8 kallsyms_seqs_of_names[];
+
+extern struct { unsigned int v:24 __attribute__((packed)); } kallsyms_off24_of_names[] __attribute__((weak));
+extern u32 kallsyms_off32_of_names[] __attribute__((weak));
 
 #endif // LINUX_KALLSYMS_INTERNAL_H_
diff --git a/scripts/Makefile b/scripts/Makefile
index 3434a82a119f..b481c2b291bb 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -29,6 +29,7 @@ generate_rust_target-rust := y
 rustdoc_test_builder-rust := y
 rustdoc_test_gen-rust := y
 
+HOSTCFLAGS_kallsyms.o += $(if $(CONFIG_CPU_BIG_ENDIAN),-DCONFIG_CPU_BIG_ENDIAN)
 HOSTCFLAGS_tracepoint-update.o = -I$(srctree)/tools/include
 HOSTCFLAGS_elf-parse.o = -I$(srctree)/tools/include
 HOSTCFLAGS_sorttable.o = -I$(srctree)/tools/include
diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 494852ade6d8..74264ead1efe 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -338,9 +338,8 @@ static void sort_symbols_by_name(void)
 
 static void write_src(void)
 {
-	unsigned int i, k, off;
+	unsigned int i, k, off, table_size;
 	unsigned int best_idx[256];
-	unsigned int *markers, markers_cnt;
 	char buf[KSYM_NAME_LEN];
 
 	printf("\t.section .rodata, \"a\"\n");
@@ -349,17 +348,10 @@ static void write_src(void)
 	printf("\t.long\t%u\n", table_cnt);
 	printf("\n");
 
-	/* table of offset markers, that give the offset in the compressed stream
-	 * every 256 symbols */
-	markers_cnt = (table_cnt + 255) / 256;
-	markers = xmalloc(sizeof(*markers) * markers_cnt);
-
 	output_label("kallsyms_names");
 	off = 0;
 	for (i = 0; i < table_cnt; i++) {
-		if ((i & 0xFF) == 0)
-			markers[i >> 8] = off;
-		table[i]->seq = i;
+		table[i]->seq = off;
 
 		/* There cannot be any symbol of length zero. */
 		if (table[i]->len == 0) {
@@ -396,19 +388,18 @@ static void write_src(void)
 		 */
 		expand_symbol(table[i]->sym, table[i]->len, buf);
 		strcpy((char *)table[i]->sym, buf);
-		printf("\t/* %s */\n", table[i]->sym);
+		printf("\t/* %d@%d: %s */\n", i, table[i]->seq, table[i]->sym);
 	}
+	table_size = off;
 	printf(".size kallsyms_names, . - kallsyms_names\n");
 	printf("\n");
 
 	output_label("kallsyms_markers");
-	for (i = 0; i < markers_cnt; i++)
-		printf("\t.long\t%u\n", markers[i]);
+	for (i = 0; i < table_cnt; i += 256)
+		printf("\t.long\t%u\n", table[i]->seq);
 	printf(".size kallsyms_markers, . - kallsyms_markers\n");
 	printf("\n");
 
-	free(markers);
-
 	output_label("kallsyms_token_table");
 	off = 0;
 	for (i = 0; i < 256; i++) {
@@ -448,13 +439,28 @@ static void write_src(void)
 	printf("\n");
 
 	sort_symbols_by_name();
-	output_label("kallsyms_seqs_of_names");
-	for (i = 0; i < table_cnt; i++)
-		printf("\t.byte 0x%02x, 0x%02x, 0x%02x\t/* %s */\n",
-			(unsigned char)(table[i]->seq >> 16),
-			(unsigned char)(table[i]->seq >> 8),
-			(unsigned char)(table[i]->seq >> 0),
-		       table[i]->sym);
+	if (table_size < (1u << 24)) {
+		output_label("kallsyms_off24_of_names");
+		for (i = 0; i < table_cnt; i++) {
+			printf("\t.byte 0x%02x, 0x%02x, 0x%02x\t/* %s */\n",
+#ifdef CONFIG_CPU_BIG_ENDIAN
+				(unsigned char)(table[i]->seq >> 16),
+				(unsigned char)(table[i]->seq >> 8),
+				(unsigned char)(table[i]->seq >> 0),
+#else
+				(unsigned char)(table[i]->seq >> 0),
+				(unsigned char)(table[i]->seq >> 8),
+				(unsigned char)(table[i]->seq >> 16),
+#endif
+			       table[i]->sym);
+		}
+	} else {
+		output_label("kallsyms_off32_of_names");
+		for (i = 0; i < table_cnt; i++) {
+			printf("\t.long %#04x\t/* %s */\n",
+				table[i]->seq >> 16, table[i]->sym);
+		}
+	}
 	printf("\n");
 }
 
-- 
2.39.5

