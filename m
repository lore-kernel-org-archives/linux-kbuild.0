Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795743272;
	b=r5kPta1SnH9RzfSkUWIzoi15h8+gP2uvs9cFedMZNAmS2xpCXhApY3d/T8Da+RBgdqKh
	 Hu5WvLnztfzmqUxr0ewBxhw29LoednBtuH4JyJin5uvGaGnjLuzixehyLA+Oai7dMYmHn
	 7D46IL2aLSWhsU4CRwgPQ7alCV00mTNq84pDRE4t3Fa8jYtwMhvEfqQAhh3LoN8RiSStd
	 Iwc9EtVSNrRsRQfUV2QW9qZuT14aSKqlw04QsFnD7lndQ2c5mHuWNBdPihd0uBAWch5ak
	 1vEQeef2zkV2+3DDHfyaz58akvzdexhuBrWpyYYaNnITVQApJfOVBCnFTetYGCGTo2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795743272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:Received:From:In-Reply-To:
	 References:MIME-Version:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=l7RO/X9hrpGm7U7ZvUyWBLz5rvKWH6VnYdq6Izp1zz4=;
	b=Fn7X7Nfen5A/iJyf0QzWtmRK3nQAXs3E5z+ofbtnQj8UzrvU74LKiGHJFWbEkd+qKRmO
	 Ft611xFqINAk+9X4aVUrBHkII2gFR7KEqnFaWEyCiBv3N1ArEJncIv6+C48BjSAckavow
	 lx1N/YVCZa5vPpNDGpsapOa4DFI0FBCSxeUAJi8Qjx9JKOl4YsadWGbWQ9FgNOLEiDtOz
	 dneBueAhMNn2DJBNnJ3xWQAHlpkVwWpRvJNx2AQxpuB3VNKIPNF3AW8xxN183pTcUSFRD
	 eB/kYE5nUp7u8ZFI1QXLQH236rEJnVyfPjT6EX31xuWn5JdoGpKRNdH7UO1TosMXwdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=eOqIMfC9;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDBC606A31E
	for <linux-kbuild@vger.kernel.org>; Fri, 27 Nov 2026 01:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EDBC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=eOqIMfC9
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so8859132a12.1
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Nov 2026 17:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795743269; x=1796348069; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7RO/X9hrpGm7U7ZvUyWBLz5rvKWH6VnYdq6Izp1zz4=;
        b=eOqIMfC9wrhBH24wtxRU5QJCk3tNQjYHjeoTSxta7NhXULS1hi5AA7FJCYX6rbpOUD
         yQCBNwinDH8LJ1FrCIFnd6hiD72+EVQ+61O2+q9HfYYN7AAtDjUhKKl3GmbOBmXvL/5I
         k3TE/Dmi/v4i0PwEBkjF05Hr6XOYWyxw8QkEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795743269; x=1796348069;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l7RO/X9hrpGm7U7ZvUyWBLz5rvKWH6VnYdq6Izp1zz4=;
        b=WuM2dFIc4ErFvQra6vEMGkXjQTtK23TaV/WIpWsrXmaiZlP5KSs5S83n+aK50sXWzx
         /xxSKW8QGkk4RhXFxcIR0O3CV6fZZHpDWNn2Edb5KrRzDy+ZT2DMr3OF5LjJ9bh/s/0+
         FuRq86IkNHXBHZLcDdomv2Y/JHwFky/8kPY2eEQJXO8Kb/ra2X/rogohR0he9FhNXxc2
         7PEf7wsR8UUvYeJM2FI5exOysbyoUA+JRYgAounPeSTkLrO7itZEJbZauI3gE6lz4/qO
         2oSHc6GQlVY0FWP3CCbEkGy1hR12UOGkAPC8/PJVRB7CZY1ZHQoe3WLtOspawYi+jd1v
         1Gjg==
X-Forwarded-Encrypted: i=1; AL+hErE6a+Lm9bK43SMXLSratvNS9N6qltiXL3jUjDTa5pVmLIjWeikhJVo4QGONmYb0C5F/BpgGeflypB67jdw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LrqZ58YqxFAxxk70X6fVklYeghxUQeA/ojjpQi+26YtEBKnu1
	8QpOz3F89+nEDJmM7yb5zDkGRm7UEUCoHQ8D6zCKGDp8gYp/nHw0NETuRNp9/XxeKaFb7fQwQ09
	n85ZveFmezw==
X-Gm-Gg: AZFdTZdOwU6HCMNTOZ1l0meD/lxEMDtxIVEvxBBvN2MZNyPpu16gxJV4Phyi8mOhtpP
	78ieoWeUVOy1R3WWH7PVVl+N7kOxWWq81NeI9Kdsprl25zDLeC/S/DzZAkbr5dxd2xM2DarvF8O
	GNOyAmVKIQzrXRejdGGrRXC5tu4ANAZ4RSwRanVn5Xc/oJCY6ZupU5rcB99QGsEl3jMhDAaP9sn
	Z+6H/NOmSdehcHwJrZZZtqn2bN6smueFRwta3nVo/ywMu6YjS/QkPDQNqvniL3tLzxQuUbihxCP
	hhJw3q4LpPtlrt0pQGidUYAkOmHIbD2eE0xJxPbdEbEWMf7fyD5Wf2riwMOsqfyfSRkEK1TZ+YQ
	m/U9FJQhpjvPn8RhUbE5gdmNZizTw93WNj9r7t7LyilnVzMC7OO43x2atktqL7Uj5VoEOHFE009
	mc7IQUCquEhT4MPGwxVUYHJzp5h27I665D5xf3eC6QUgfnyr157apGHDDtW6uU4biK1TaInyGWy
	ZKotLb/SgPQIkBFf7S1oUMSihucdvZvnxC+HQZO6O4wdH2L9+ozgnkSptV0ZWB/Sa8jYiIGQ6x2
	kxh1ZHp4OHE7eokKAjff9HdjZ4Taydf5pKcQRyiVpKarGmpBM6NPmHLzn2NySJK/SC9xoMsg8v6
	J+D0=
X-Received: by 2002:a05:6402:2807:b0:6ba:b1fd:6e7c with SMTP id 4fb4d7f45d1cf-6bab1fd717dmr11116165a12.1.1795743269513;
        Thu, 26 Nov 2026 17:34:29 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e362bdsm10509071a12.5.2026.11.26.17.34.29
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 17:34:29 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b8b20b2538so8773727a12.3
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Nov 2026 17:34:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHXtUVKZY9/gdc+vuMrU/4hGb3nbAej+0rEgovyQqnnqShNWfH3jpY22ZUy4f2SOijvenyv3g19cu6NyZM=@vger.kernel.org
X-Received: by 2002:a17:907:c491:b0:c25:91bc:ff55 with SMTP id
 a640c23a62f3a-c513ab0c6b4mr1782417166b.23.1795743268984; Thu, 26 Nov 2026
 17:34:28 -0800 (PST)
Received: from 425495914135 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Nov 2026 20:34:27 -0500
From: Linus Torvalds <torvalds@linux-foundation.org>
In-Reply-To: <CAHk-=wjcmmgrJy6rknMOTJ76O92QSAMSUaUPKC6N=pASPsxPmA@mail.gmail.com>
References: <20261127000015.3662267-1-julianbraha@gmail.com>
 <20261127000015.3662267-2-julianbraha@gmail.com> <CAHk-=wjcmmgrJy6rknMOTJ76O92QSAMSUaUPKC6N=pASPsxPmA@mail.gmail.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 26 Nov 2026 20:34:26 -0500
X-Gmail-Original-Message-ID: <CAHk-=wif1CNqxe19O=oCy87TZ_KQoGcoCaOchn-dk11hKoGbOQ@mail.gmail.com>
X-Gm-Features: Aa3M54polP77YZQv9cchX6_j00EPygNp2BPE71doDMsazM4Dd6ppL9CR6_Xn25s
Message-ID: <CAHk-=wif1CNqxe19O=oCy87TZ_KQoGcoCaOchn-dk11hKoGbOQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] scripts: add bit count parameter back to host hash functions
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, samitolvanen@google.com, ljs@kernel.org, 
	david.laight.linux@gmail.com, sashal@kernel.org, lzsx618@gmail.com, 
	zuoan.penguin@gmail.com, petr.pavlu@suse.com, jani.nikula@intel.com, 
	xur@google.com, sidnayyar@google.com, robertusdchris@gmail.com, 
	acourbot@nvidia.com, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Nov 2026 at 17:16, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> NOTE NOTE NOTE! This is untested crap.  It shows the *concept*.  It
> might even work.  But it might also do unspeakable things to your pets.
> Don't trust my word for it.  Look at the code and test it.

Some more testing shows that it needs at least something like this on
top..

With this it *might* actually work.  But when I say "some more testing",
that "some" is still carrying a lot of weight.  Not a lot of, IOW.

I did say it was untested crap.  I guess I'm more of a "high-level
concepts guy" than detail-oriented.

Users? I like to call them "Test subjects" or "Victims".

              Linus

---


diff --git a/scripts/include/hashtable.h b/scripts/include/hashtable.h
index 0d8bb8eb178c..78d63eb96fc4 100644
--- a/scripts/include/hashtable.h
+++ b/scripts/include/hashtable.h
@@ -12,10 +12,14 @@
 	} name

 #define HASHTABLE_DEFINE(name, bits) \
-	HASHTABLE_DECLARE(name, bits) =	{ { [0 ... ((1 << (bits)) - 1)] =
HLIST_HEAD_INIT } }
+	HASHTABLE_DECLARE(name, bits) = { { [0 ... ((1 << (bits)) - 1)] =
HLIST_HEAD_INIT } }
+
+/* Define a table already declared extern with HASHTABLE_DECLARE() */
+#define HASHTABLE_DEFINE_EXTERN(name) \
+	typeof(name) name = { { [0 ... HASH_SIZE(name) - 1] = HLIST_HEAD_INIT } }

 #define HASH_BITS(name) (sizeof((name).hash_bits))
-#define HASH_SIZE(name) (1ul << HASH_BITS(name))
+#define HASH_SIZE(name) ARRAY_SIZE((name).hlist)

 #define hash_head(table, key)	(&(table).hlist[(unsigned)(key) >>
(32-HASH_BITS(table))])

@@ -31,7 +35,7 @@ static inline void __hash_init(struct hlist_head
*ht, unsigned int sz)
  * hash_init - initialize a hash table
  * @table: hashtable to be initialized
  */
-#define hash_init(table) __hash_init(table, HASH_SIZE(table))
+#define hash_init(table) __hash_init((table).hlist, HASH_SIZE(table))

 /**
  * hash_add - add an object to a hashtable
@@ -59,7 +63,7 @@ static inline void hash_del(struct hlist_node *node)
  */
 #define hash_for_each(table, obj, member)				\
 	for (int _bkt = 0; _bkt < HASH_SIZE(table); _bkt++)		\
-		hlist_for_each_entry(obj, &table[_bkt].hlist, member)
+		hlist_for_each_entry(obj, &(table).hlist[_bkt], member)

 /**
  * hash_for_each_safe - iterate over a hashtable safe against removal of
@@ -71,7 +75,7 @@ static inline void hash_del(struct hlist_node *node)
  */
 #define hash_for_each_safe(table, obj, tmp, member)			\
 	for (int _bkt = 0; _bkt < HASH_SIZE(table); _bkt++)		\
-		hlist_for_each_entry_safe(obj, tmp, &table[_bkt].hlist, member)
+		hlist_for_each_entry_safe(obj, tmp, &(table).hlist[_bkt], member)

 /**
  * hash_for_each_possible - iterate over all possible objects hashing to the
diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 27278830de98..26b0a64b5cb5 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -16,7 +16,7 @@

 #define DEBUG_EXPR	0

-HASHTABLE_DEFINE(expr_hashtable, EXPR_HASH_BITS);
+HASHTABLE_DEFINE_EXTERN(expr_hashtable);

 static struct expr *expr_eliminate_yn(struct expr *e);

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index dec65c0d1181..2afe2be78a29 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -971,7 +971,7 @@ bool sym_is_choice_value(const struct symbol *sym)
 	return !list_empty(&sym->choice_link);
 }

-HASHTABLE_DEFINE(sym_hashtable, SYMBOL_HASH_BITS);
+HASHTABLE_DEFINE_EXTERN(sym_hashtable);

 struct symbol *sym_lookup(const char *name, int flags)
 {
