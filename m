Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795737628;
	b=e6q2+XQVkCUDhya+MlaCkKrhUcktFO6N+UjlokGx+zijrx3rcdAP6xeAyMO8ya1Jhe1p
	 DgNzw8cCvHZct4m/HYJBvP7EZcSn40Z2tK2hZzTAeoFXKpcShUmF6LLHFAslQuyxLjuys
	 NGJmFK63qZQrEU/4VaOj5+/7gHnhI9KAm3+T4axkLA9/8hXw3AWndllQWN9dFTFkzWbwr
	 tV2eUs0MfE1fNR6rlw4ctOqELyBWq/mnUELnCLh53MDdot2Fk7kSxsGwvIFNbvco7uf+h
	 3cmiKYdQH3aWjoTSpwALqk4ePo18XKiLrpaaMgH81GdC4uwofotOF1XWVGaOutW5tRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795737628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=grCsO3t7RryGcMPafQtIp1Wlmc4uzvXZdwkseXZWrL0=;
	b=oZqg5sD9Xj8+NZYFhCWYme6iZ8eyYOL0TxL3HgORW4BvXaBK1cfKV5JGeT8MZtAp+/6o
	 OqYLLcLEz+mLzlT/spzO8H9ydZBTrKaT2s9OHHiYbtnyeF3mRg5tBVjQm2pn7WXxz48uY
	 RlEFTIYBK4JBUKCX1Q0QZlDA6SP7Ow7V7qlYWpUvB9Yee77KaJpefBSyT3Ngsf5v2Q524
	 zQMLg4zXyrEUwJtRVxRevnPfwMPe9NsD+w1CSW3biSrSbW1lLCBl6AQIHiwCSL7lUFpc5
	 RYx6uPPEms6hQFRnnM2/CMzOoro4h145lAVH0/6FFapQBhzgdmZ0z0TZrt8Uo23yzAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MSrGWmtl;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F58606A334
	for <linux-kbuild@vger.kernel.org>; Fri, 27 Nov 2026 00:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6F58606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MSrGWmtl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so68415515e9.2
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Nov 2026 16:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795737626; x=1796342426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=grCsO3t7RryGcMPafQtIp1Wlmc4uzvXZdwkseXZWrL0=;
        b=MSrGWmtlhNLglpMFRWJl/dqQlIErt6p1MGUFWUMmrsXndLcPAgmxiS+8kNJjPo4ac3
         7QN7ZlxF+2o+5K/N1d7m1RQOY8zmMbfvw+mkoGuVOEJsmrH5EAIAWWh8dxrELztM6abx
         WuZmBMt6dvWcClGKKt47oB7oKTgmS0Mdv64A2UcnunLj7aS/jA0bnXweEcqpskaHkAv+
         4Rce/UZer4QSscJvlmxu5ldP3bmkpL3Axo4u45YfPkFfSPKb4+pvDdVyctlvy0A8slEM
         H6z/42yIMcL1xquwdVCcJ4SpQDq9zdlklDP1k8uLBlJ4W0Fz4GNdSCF5i/YQ/QdO6hYS
         yMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795737626; x=1796342426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=grCsO3t7RryGcMPafQtIp1Wlmc4uzvXZdwkseXZWrL0=;
        b=JMSLd8UWOdftXQ2R4gwFJmbuz2y9xIwGQ+1YskjpP2CqbieMR6jEzJPVAoLuBdQm64
         i8PSGemGDYXydnqb99ZksQfqZMdnj1NDiWQw/yLkmBLzRyi5Qa5KEhqCwfF7yKcm/rzT
         Rz3VEBL7BNcCICnorBI+tiiwOvWvi/8yYKqnlOYClZbN961qE9oOjAcxUxm2I6a5UT4r
         CPw10pjhdZonVpWqVGPK/2xVaZnZW+qcFlgDEuoOM87dMQXlu5IhoA9AK2CAlghTxi5+
         bTv5Ok4iw5zHahe3ZJRt/dqxdv3aG3uay/ABzBbtKp6HA3QSOhjNYRvyUHO8OiMTjJ9U
         mzog==
X-Forwarded-Encrypted: i=1; AL+hErH6z4zfkTuZT+QLfGBjpRj6dRGRfMOqouTsOqqTfqrvYbiQd5MQ2ltGWStC+eqAj8IX7kb5ZTEOJnfPQnM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bIUquh/xNTVZlb1Rl0URfrGBrIlts9KoJdyIFDd+FZ7tMB5/e
	Iu8trz9LMOmTcn340LfbPsk2rLnEkhsSptzN2hLAqsyA89WvojksP8YX
X-Gm-Gg: AZFdTZe7tsxHog7ZKDJmJCV1MA1aCy4NZGkYEVUjb9kZ2FlRh22FjkHSvMO76xfUuMu
	XTBbp36JDU8GR8PnPXWURDZp4ifn9r0a04FQy3Qnl4mKxqW4ytEOl4fZZ8JjkPATsldfEbMlcgz
	TQ1o9qhk0DoboxEvox4ucRYOlcPBlt1d26555hc0wcM21eYvivAjFYLOZgKazAjPKJ6Sr0iHoQv
	GrsbJf7q3gplh+Ep2AwhtfsXkGk/rQShIAIeM15vN7WhpDNWc14niRWD7tlXI5JGf7Re54Zc4vB
	P510XPtgQXu46Fui+GQiJ9UjQklaEkAWuhr3xM1w0mNA1lgjbH38NSQjaGE9tEGgOqJwGckjOUc
	2Y1yAsSU878C1diR2/jgEyazbyd8R8FEE6mymh93y1QEuVRD2xDdDQ3Ms69NfupwAuCm4pv/21k
	Zhp/LC/h/J1ELK/dzENvqyaBTLJeLkaAiNkDVPm0beuh6jKIkrMQKQVCChgF/8LjKZbQnnBsNOo
	ZbK2LEf+0B4Kh8roFFlW7Z2q0GSXrmPj6/gWfPxwo7CpHRlucANOUt8hn/rSHNCxLjkequH+Dc6
	Qv1f23FVC39mWEKTL/6kW1slwdWZCRvJgDTsF0xgKJMTlEodwn+6nxi6FR1YKGySsdUfqyAAvya
	C/Jc/u9r+f05yjhCizA==
X-Received: by 2002:a05:600c:64c8:b0:4bb:6848:d433 with SMTP id 5b1f17b1804b1-4bb8881d141mr439906585e9.26.1795737626227;
        Thu, 26 Nov 2026 16:00:26 -0800 (PST)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a68048esm45536616f8f.29.2026.11.26.16.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:00:25 -0800 (PST)
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
Subject: [PATCH 1/5] scripts: add bit count parameter back to host hash functions
Date: Fri, 27 Nov 2026 00:00:11 +0000
Message-ID: <20261127000015.3662267-2-julianbraha@gmail.com>
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

This partially reverts commit f93d6bfbd2f7 ("kconfig: use hash table to
reuse expressions").

As reported by Linus [1], when the kernel's internal hash and hash table
implementations were copied over for Kconfig to use, several functions
were simplified to remove their second 'bits' parameter. But the usage of
this simplified implementation led to poor hash table performance due to
using the lower bits despite hash_32() putting the significant bits in the
high bits of the result.

Let's revert the parameter simplification: the host versions of hash_32()
and hash_ptr() will take the number of high bits, as is done in the
kernel's internal implementation.

Accordingly, adjust the callers of 'hash_32()' and 'hash_ptr()' to use
the additional parameter. This is a pure refactor (no functional changes),
so pass 32 to preserve the existing behavior.

Link: https://lore.kernel.org/all/CAHk-=wi_GuySe0L-uCAM2+nScCLYGBp5BLi6UUPR1gALmNM_3w@mail.gmail.com/ [1]
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/gendwarfksyms/cache.c         | 4 ++--
 scripts/gendwarfksyms/die.c           | 2 +-
 scripts/gendwarfksyms/gendwarfksyms.h | 2 +-
 scripts/gendwarfksyms/kabi.c          | 2 +-
 scripts/gendwarfksyms/symbols.c       | 2 +-
 scripts/include/hash.h                | 8 ++++----
 scripts/kconfig/expr.c                | 2 +-
 7 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/scripts/gendwarfksyms/cache.c b/scripts/gendwarfksyms/cache.c
index 1c640db93db3..a4d18a9489e3 100644
--- a/scripts/gendwarfksyms/cache.c
+++ b/scripts/gendwarfksyms/cache.c
@@ -18,14 +18,14 @@ void cache_set(struct cache *cache, unsigned long key, int value)
 	ci = xmalloc(sizeof(*ci));
 	ci->key = key;
 	ci->value = value;
-	hash_add(cache->cache, &ci->hash, hash_32(key));
+	hash_add(cache->cache, &ci->hash, hash_32(key, 32));
 }
 
 int cache_get(struct cache *cache, unsigned long key)
 {
 	struct cache_item *ci;
 
-	hash_for_each_possible(cache->cache, ci, hash, hash_32(key)) {
+	hash_for_each_possible(cache->cache, ci, hash, hash_32(key, 32)) {
 		if (ci->key == key)
 			return ci->value;
 	}
diff --git a/scripts/gendwarfksyms/die.c b/scripts/gendwarfksyms/die.c
index 052f7a3f975a..4e390a6295a3 100644
--- a/scripts/gendwarfksyms/die.c
+++ b/scripts/gendwarfksyms/die.c
@@ -16,7 +16,7 @@ static unsigned int map_misses;
 
 static inline unsigned int die_hash(uintptr_t addr, enum die_state state)
 {
-	return hash_32(addr_hash(addr) ^ (unsigned int)state);
+	return hash_32(addr_hash(addr) ^ (unsigned int)state, 32);
 }
 
 static void init_die(struct die *cd)
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index 32cec8f7695a..f4f21d6090e7 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -95,7 +95,7 @@ extern int symtypes;
 
 static inline unsigned int addr_hash(uintptr_t addr)
 {
-	return hash_ptr((const void *)addr);
+	return hash_ptr((const void *)addr, 32);
 }
 
 enum symbol_state {
diff --git a/scripts/gendwarfksyms/kabi.c b/scripts/gendwarfksyms/kabi.c
index e3c2a3ccf51a..2d941ee13c9b 100644
--- a/scripts/gendwarfksyms/kabi.c
+++ b/scripts/gendwarfksyms/kabi.c
@@ -92,7 +92,7 @@ static HASHTABLE_DEFINE(rules, 1 << RULE_HASH_BITS);
 static inline unsigned int rule_values_hash(enum kabi_rule_type type,
 					    const char *target)
 {
-	return hash_32(type) ^ hash_str(target);
+	return hash_32(type, 32) ^ hash_str(target);
 }
 
 static inline unsigned int rule_hash(const struct rule *rule)
diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
index 42cd27c9cec4..b4110b0e12ce 100644
--- a/scripts/gendwarfksyms/symbols.c
+++ b/scripts/gendwarfksyms/symbols.c
@@ -15,7 +15,7 @@ static HASHTABLE_DEFINE(symbol_names, 1 << SYMBOL_HASH_BITS);
 
 static inline unsigned int symbol_addr_hash(const struct symbol_addr *addr)
 {
-	return hash_32(addr->section ^ addr_hash(addr->address));
+	return hash_32(addr->section ^ addr_hash(addr->address), 32);
 }
 
 static unsigned int __for_each_addr(struct symbol *sym, symbol_callback_t func,
diff --git a/scripts/include/hash.h b/scripts/include/hash.h
index efa904368a62..ae0d3fc8d470 100644
--- a/scripts/include/hash.h
+++ b/scripts/include/hash.h
@@ -15,14 +15,14 @@ static inline unsigned int hash_str(const char *s)
 /* simplified version of functions from include/linux/hash.h */
 #define GOLDEN_RATIO_32 0x61C88647
 
-static inline unsigned int hash_32(unsigned int val)
+static inline unsigned int hash_32(unsigned int val, unsigned int bits)
 {
-	return 0x61C88647 * val;
+	return bits ? (val * GOLDEN_RATIO_32) >> (32 - bits) : 0;
 }
 
-static inline unsigned int hash_ptr(const void *ptr)
+static inline unsigned int hash_ptr(const void *ptr, unsigned int bits)
 {
-	return hash_32((unsigned int)(unsigned long)ptr);
+	return hash_32((unsigned int)(unsigned long)ptr, bits);
 }
 
 #endif /* HASH_H */
diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 2b91d16bf14f..ea93016b68d4 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -35,7 +35,7 @@ static struct expr *expr_lookup(enum expr_type type, void *l, void *r)
 	struct expr *e;
 	int hash;
 
-	hash = hash_32((unsigned int)type ^ hash_ptr(l) ^ hash_ptr(r));
+	hash = hash_32((unsigned int)type ^ hash_ptr(l, 32) ^ hash_ptr(r, 32), 32);
 
 	hash_for_each_possible(expr_hashtable, e, node, hash) {
 		if (e->type == type && e->left._initdata == l &&
-- 
2.56.0

