Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795737632;
	b=3wM6cStj8e7w8b/Pq1Ug0BH6lIP/ZRgsakUuEfQ+IhUVoVkW5+lqq+S6aPgkPEA6ZFu7
	 0CjTb78vFm+ta3/J8MQUi02FLLPvXgT+gEeT+ydocwEdXPyFbElMdWWt5fjPopCBM35Yj
	 j/WGQKvVsb/ixt2FqQY4Sh7+b99KptaPOEL4+SZATefdZzdWcvkkDPeCyx/QJeufiEz4p
	 m0TUS+qkBL9TzkHkB5Lteyyuw/h6ps/smZkedEbRwEQrMBY5ZyAFa2p5jv1/zFXfgBzHI
	 SFS0f7LLi4jVw7CWUbClXv4Qf3sfgk8XPku+u0giq/vu6PupiF00nYNtlqImrS+FjUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795737632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=zjADcQv0PXPBr760/0GxdOlxk/gXmgkzyQ+Htt+oaJE=;
	b=XCbXOGglCb69EgSpKhoNwgFQVaTU14/LjnxgfOa/bI7SbV9Sa8ltcA3yy/58+A9b2yjV
	 2wdn+UINOIl0OYTtrUTHLHrkSw8N2XuADkKd3/ADFqTcKcxqwYq+LTPHOj2s5Zzf3/siQ
	 ObFA/2kRN+JeJ5JU0wlG7Q89vxixdfjowu/IKfGEF/N3VWLo0JwLJOOK+2BYs3qJ2vwk7
	 G0zMnZJ4dzQjt/ERmWKWQ66/s9q8POFSxxdPxfCTbGanum+rM5vwhRsiCfedakJJ8uhd/
	 CQQCE4AtbS48vqF1j2hNFJhot9OuJMk2B6RcLfNcm9EBkB9InvjdSaQdInst5FqN0bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MRhZsKxa;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168E0606A33B
	for <linux-kbuild@vger.kernel.org>; Fri, 27 Nov 2026 00:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 168E0606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MRhZsKxa
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a42b34e930so6600410f8f.2
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Nov 2026 16:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795737630; x=1796342430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjADcQv0PXPBr760/0GxdOlxk/gXmgkzyQ+Htt+oaJE=;
        b=MRhZsKxa+FIEQlod2OKgOuAGi/6Umf4nzxemGlio1KVqZfhrV2vABs9dht7AgcA/c+
         wa91zzXWNaT7m1RtRk47z1JhnXEHkp4wIfpLcK2yn1hKDGYTnIlNbyup/JyYot3My2/l
         vUEY4+2Ddr9G1idu+pKQPKYOVjgCx66UxhdIdczj51wVzcx74hOma4Iq4iZ4RpZdvI7J
         BE3/xFCMg2kRnLKEq4Egl/EkyJ1tbGGMZiCgOwbOSnGCWiRLeyD1C7FtfaaSTvseSVFs
         eoqrQ4CKAzZLPF11LcRWYUGe9WsJcArH5xIIthdOgLf2LwTanh+33v00Fcb1nXRkK8YA
         t8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795737630; x=1796342430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zjADcQv0PXPBr760/0GxdOlxk/gXmgkzyQ+Htt+oaJE=;
        b=MS48iNKBWgu3PTYXqKDN1JZBPBENXwhTBvkM1xRuYV4+mK91rKOVLJ2Gj6VaS5wvhE
         Hoi4xiW9qu7pZ0QBpHInszbltQlVVNwzu0SMgzF59Jt/lh2TleB15/7XiqiSkfVLQyKh
         gC2K+lRa6lT5q8kDfRudtjw6e/Tdy2ix4VNMAO+6vbru3GYrEOKQqzR5UBj2hka9wF3r
         kHdxHqj5Cni1hAultwARZBtqaii3b/5z7K+2gC59CZjBH+u6L4NVoRSMfP/JhxnjUpCK
         2CSznCApj5qVDhnDf+jTaE72HZO3BpFYlNUl+xsUf8CdpjeO/3XtcOCgbgMOduqrdGoo
         Buew==
X-Forwarded-Encrypted: i=1; AL+hErH0zivPniK5cYCEWp1FsmJHHuaDzVEmx8JPxJM82vCPhlQYrK8u3K3uMcDFlT3bbHrCcgK/hSNU85KtMlE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8OrEtAFkQJvTO8re8QFJOOMxeu/8GnFRaS08lzb4JJcT7CBfP
	J2fDS7CLKBDS7NNINMUX04w1MbX8b2guXXxPjiKkDfPZ5LVbZtRSv3sp
X-Gm-Gg: AZFdTZdnREHmqZC/xazqY4aQjBy1ur5AydoCeumj7PwM7M08YabHR/uyuOkv0q1/J7L
	rHj8kSqU+mNNm4DL0zyMECUz8vGuYQahLRUYdk6DMrZPw8rHEBUWKaIFF8zarqDTJKEVa4xayh9
	OeUIaIECRvQjgFdlKG04Cv4gm4qUm0cf2ULCyCFPIcx/ZlTa6hUK4tRqxjcGXX8e8Ke13s9kTVe
	uiiov2DeHCV6xJbsIDnaUaQQiHEhHbn3iqsDgOriJr0XdYR6ul0UMMzZuN1qPkBGlJUZUErTpld
	ZIsF1gKgOW2wduIOSzp1yljduyMjm5TXfTaofKlU/sx7XtGRgdViEvkHpqCy97ak8Yi3abuEiFG
	gt5V2uGl0YdaMLXTq1kPEmsVGRE53xqowuy0LXsEljhMtEzVOULAU93qrllHHm6GMfP+xTLFOBN
	VmYQoUIasz/1vnePwVHdVcQQzlknCuJgx+B2ty2r4RPr9VTnnYRHfjjWGOIBJuC+04jbmbLPYCX
	hX+h6U5Xy/Wa1IY3/Aw12PtVCTxIaqkIH6g8adhQd6K+6WC3rUFFMTrxse78ePI5uruQDUdK6LE
	H+ZTgbFtUuqfyTRcBAs01SUOnwi0bYezaGv3xpO0/rsjcyRuTmeOU39Gfzkdv3I1gzXWvnaO08N
	nw/Uq/HCm7lzfIv/UYXlzsxk/iILDAVV6xI5lYL8=
X-Received: by 2002:a05:6000:29d5:b0:4aa:5833:c0fd with SMTP id ffacd0b85a97d-4abb58ec23cmr26232284f8f.52.1795737630321;
        Thu, 26 Nov 2026 16:00:30 -0800 (PST)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a68048esm45536616f8f.29.2026.11.26.16.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:00:29 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: samitolvanen@google.com,
	torvalds@linux-foundation.org,
	ljs@kernel.org,
	david.laight.linux@gmail.com,
	sashal@kernel.org,
	lzsx618@gmail.com,
	zuoan.penguin@gmail.com,
	petr.pavlu@suse.com,
	jani.nikula@intel.com,
	xur@google.com,
	sidnayyar@google.com,
	robertusdchris@gmail.com,
	acourbot@nvidia.com,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH 3/5] scripts: restore host hash table macro names
Date: Fri, 27 Nov 2026 00:00:13 +0000
Message-ID: <20261127000015.3662267-4-julianbraha@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127000015.3662267-1-julianbraha@gmail.com>
References: <20261127000015.3662267-1-julianbraha@gmail.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This partially reverts commit 0a3128e75108 ("kconfig: add macros useful
for hashtable").

Rename HASHTABLE_DECLARE() to DECLARE_HASHTABLE() and HASHTABLE_DEFINE()
to DEFINE_HASHTABLE() in the host scripts/include/hashtable.h, bringing
the signatures closer to the original in-kernel implementation, and update
the callers, accordingly.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
This patch isn't really necessary to fix the issue, but it does make
maintenance a tad easier when you're looking at the two implementations
side-by-side.
---
 scripts/gendwarfksyms/die.c           | 2 +-
 scripts/gendwarfksyms/gendwarfksyms.h | 2 +-
 scripts/gendwarfksyms/kabi.c          | 2 +-
 scripts/gendwarfksyms/symbols.c       | 4 ++--
 scripts/gendwarfksyms/types.c         | 2 +-
 scripts/genksyms/genksyms.c           | 2 +-
 scripts/include/hashtable.h           | 6 +++---
 scripts/kconfig/expr.c                | 2 +-
 scripts/kconfig/internal.h            | 4 ++--
 scripts/kconfig/symbol.c              | 2 +-
 scripts/kconfig/util.c                | 2 +-
 scripts/mod/modpost.c                 | 2 +-
 12 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/scripts/gendwarfksyms/die.c b/scripts/gendwarfksyms/die.c
index 4e390a6295a3..79d738e69ce5 100644
--- a/scripts/gendwarfksyms/die.c
+++ b/scripts/gendwarfksyms/die.c
@@ -9,7 +9,7 @@
 #define DIE_HASH_BITS 16
 
 /* {die->addr, state} -> struct die * */
-static HASHTABLE_DEFINE(die_map, 1 << DIE_HASH_BITS);
+static DEFINE_HASHTABLE(die_map, 1 << DIE_HASH_BITS);
 
 static unsigned int map_hits;
 static unsigned int map_misses;
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index f4f21d6090e7..c987acbbf1ef 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -208,7 +208,7 @@ void die_map_free(void);
 
 /* A cache for addresses we've already seen. */
 struct cache {
-	HASHTABLE_DECLARE(cache, 1 << CACHE_HASH_BITS);
+	DECLARE_HASHTABLE(cache, 1 << CACHE_HASH_BITS);
 };
 
 void cache_set(struct cache *cache, unsigned long key, int value);
diff --git a/scripts/gendwarfksyms/kabi.c b/scripts/gendwarfksyms/kabi.c
index 2d941ee13c9b..35c70a6230d9 100644
--- a/scripts/gendwarfksyms/kabi.c
+++ b/scripts/gendwarfksyms/kabi.c
@@ -87,7 +87,7 @@ struct rule {
 };
 
 /* { type, target } -> struct rule */
-static HASHTABLE_DEFINE(rules, 1 << RULE_HASH_BITS);
+static DEFINE_HASHTABLE(rules, 1 << RULE_HASH_BITS);
 
 static inline unsigned int rule_values_hash(enum kabi_rule_type type,
 					    const char *target)
diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
index b4110b0e12ce..a87444611bbd 100644
--- a/scripts/gendwarfksyms/symbols.c
+++ b/scripts/gendwarfksyms/symbols.c
@@ -9,9 +9,9 @@
 #define SYMBOL_HASH_BITS 12
 
 /* struct symbol_addr -> struct symbol */
-static HASHTABLE_DEFINE(symbol_addrs, 1 << SYMBOL_HASH_BITS);
+static DEFINE_HASHTABLE(symbol_addrs, 1 << SYMBOL_HASH_BITS);
 /* name -> struct symbol */
-static HASHTABLE_DEFINE(symbol_names, 1 << SYMBOL_HASH_BITS);
+static DEFINE_HASHTABLE(symbol_names, 1 << SYMBOL_HASH_BITS);
 
 static inline unsigned int symbol_addr_hash(const struct symbol_addr *addr)
 {
diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/types.c
index 9c3b053bf061..db55c8ae57f8 100644
--- a/scripts/gendwarfksyms/types.c
+++ b/scripts/gendwarfksyms/types.c
@@ -100,7 +100,7 @@ static void type_expansion_append(struct type_expansion *type, const char *s,
  * const char *name -> struct type_expansion *
  */
 #define TYPE_HASH_BITS 12
-static HASHTABLE_DEFINE(type_map, 1 << TYPE_HASH_BITS);
+static DEFINE_HASHTABLE(type_map, 1 << TYPE_HASH_BITS);
 
 static int __type_map_get(const char *name, struct type_expansion **res)
 {
diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
index 83e48670c2fc..01bea2d91d7a 100644
--- a/scripts/genksyms/genksyms.c
+++ b/scripts/genksyms/genksyms.c
@@ -24,7 +24,7 @@
 #include "genksyms.h"
 /*----------------------------------------------------------------------*/
 
-static HASHTABLE_DEFINE(symbol_hashtable, 1U << 12);
+static DEFINE_HASHTABLE(symbol_hashtable, 1U << 12);
 static FILE *debugfile;
 
 int cur_line = 1;
diff --git a/scripts/include/hashtable.h b/scripts/include/hashtable.h
index 45abcb12bfce..fa60976eae37 100644
--- a/scripts/include/hashtable.h
+++ b/scripts/include/hashtable.h
@@ -7,10 +7,10 @@
 
 #define HASH_SIZE(name) (ARRAY_SIZE(name))
 
-#define HASHTABLE_DECLARE(name, size)		struct hlist_head name[size]
+#define DECLARE_HASHTABLE(name, size)		struct hlist_head name[size]
 
-#define HASHTABLE_DEFINE(name, size)						\
-	HASHTABLE_DECLARE(name, size) =						\
+#define DEFINE_HASHTABLE(name, size)						\
+	DECLARE_HASHTABLE(name, size) =						\
 			{ [0 ... ((size) - 1)] = HLIST_HEAD_INIT }
 
 #define hash_head(table, key)		(&(table)[(key) % HASH_SIZE(table)])
diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index ea93016b68d4..5938b775a3fc 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -16,7 +16,7 @@
 
 #define DEBUG_EXPR	0
 
-HASHTABLE_DEFINE(expr_hashtable, EXPR_HASHSIZE);
+DEFINE_HASHTABLE(expr_hashtable, EXPR_HASHSIZE);
 
 static struct expr *expr_eliminate_yn(struct expr *e);
 
diff --git a/scripts/kconfig/internal.h b/scripts/kconfig/internal.h
index d0ffce2dfbba..f7e660dbd299 100644
--- a/scripts/kconfig/internal.h
+++ b/scripts/kconfig/internal.h
@@ -6,14 +6,14 @@
 
 #define SYMBOL_HASHSIZE		(1U << 14)
 
-extern HASHTABLE_DECLARE(sym_hashtable, SYMBOL_HASHSIZE);
+extern DECLARE_HASHTABLE(sym_hashtable, SYMBOL_HASHSIZE);
 
 #define for_all_symbols(sym) \
 	hash_for_each(sym_hashtable, sym, node)
 
 #define EXPR_HASHSIZE		(1U << 14)
 
-extern HASHTABLE_DECLARE(expr_hashtable, EXPR_HASHSIZE);
+extern DECLARE_HASHTABLE(expr_hashtable, EXPR_HASHSIZE);
 
 void expr_invalidate_all(void);
 
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 27138252c667..e46228d6348e 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -971,7 +971,7 @@ bool sym_is_choice_value(const struct symbol *sym)
 	return !list_empty(&sym->choice_link);
 }
 
-HASHTABLE_DEFINE(sym_hashtable, SYMBOL_HASHSIZE);
+DEFINE_HASHTABLE(sym_hashtable, SYMBOL_HASHSIZE);
 
 struct symbol *sym_lookup(const char *name, int flags)
 {
diff --git a/scripts/kconfig/util.c b/scripts/kconfig/util.c
index 0809aa061b6a..d2d17d9d37b9 100644
--- a/scripts/kconfig/util.c
+++ b/scripts/kconfig/util.c
@@ -14,7 +14,7 @@
 #include "lkc.h"
 
 /* hash table of all parsed Kconfig files */
-static HASHTABLE_DEFINE(file_hashtable, 1U << 11);
+static DEFINE_HASHTABLE(file_hashtable, 1U << 11);
 
 struct file {
 	struct hlist_node node;
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 75374c64b8cc..92bcd2b3a08e 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -234,7 +234,7 @@ struct symbol {
 	char name[];
 };
 
-static HASHTABLE_DEFINE(symbol_hashtable, 1U << 10);
+static DEFINE_HASHTABLE(symbol_hashtable, 1U << 10);
 
 /**
  * Allocate a new symbols for use in the hash of exported symbols or
-- 
2.56.0

