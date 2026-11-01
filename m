Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793563717;
	b=XuhUEw/ICMhVxPFwjVO78BD7LsBHCjXp6BtADBreHSVayFtvqB9yOdx7uxbZ9afpn7uk
	 z7vb78CqIeRdLRfcEW4GLA6E8CP/l5DSA0UAdd8gjzrUpmgcE1U2dSR6HHW9qvllUtAz/
	 p5bU0+d7GXVXH4ZRss9v52Zhq+SY2N7nF3ckB7g/f0oAIJPtemvAa1bbUqYDpjjwEwiIi
	 UvTj7ekqlP3iHNm6ZD1fgrTpHboBxjcseToZqelQgLPJQdhHuy5EQrKaRd73N+Pco9PBE
	 Or21iEROnG01HYOo1kuhPCsb0etsdfs2qe8ilPzuH7VE5HSwhfygMrHJKm6SXY2u0eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793563717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=8JMek6FeAuCzJafKmKqSMREjjRsifgf5mY5Tm4bK6cs=;
	b=FHIyxNg/d4Mvl4AvDmP2ho7ma5RRZ5QM+YMLQGH+Q/huFIvRhBaeVEDW1qUKQyHeOmC6
	 Yjz7kcM1v4l1aEKo94DX1VDvqQz284NlfNAXcHQu/ydTqGWCF8f8fbTK6386YU2dB8LDU
	 sVcvC34Tu2deRmujlIKuh2appc3AYsHPNAwznugLc2l2+7VyV1ocLoENdZaewyKbcCvEK
	 Wm5fixQ2lk0ocAtz6iAyLcJEoqUGRWOBzSlK6c3KOB0UivtdB2W/8WcU3CsSa9uCowh5U
	 EMJK3ihmrCmErU4IVv6DGSXDSFRT1ffp/f0Yd/4Y5mv7or62bXOYcnb40mICM9gPrUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=DLnXQk6X;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEE4606A324
	for <linux-kbuild@vger.kernel.org>; Sun,  1 Nov 2026 20:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EEE4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=DLnXQk6X
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c445c95d553so305113566b.1
        for <linux-kbuild@vger.kernel.org>; Sun, 01 Nov 2026 12:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793563714; x=1794168514; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8JMek6FeAuCzJafKmKqSMREjjRsifgf5mY5Tm4bK6cs=;
        b=DLnXQk6XKZ64IABAAoSw9d1BlXAckM9SQ24EFduZQcitlL+KFnGTjwZ2FGBuTR/TzH
         uIqJ7o3yaKrc2ox3IyZmJ+AuLaVuATen4B3e1Zw4JNMUmr5VMRoeh06oFsTrryjcB73C
         o88ClbBATw/RzDRixy9VuFLG0TN7zsvLZB8Zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793563714; x=1794168514;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8JMek6FeAuCzJafKmKqSMREjjRsifgf5mY5Tm4bK6cs=;
        b=cvhZRZ/iVgPT3c2YpBe9mcOLYZwvxYSWE+v3wEXSYepL+CAGwizbnPRua9ZvEV9E9q
         9xjNSN5J3/bwnyyjWMLJx4+nTiUntm5bnwYw47LAXa4t31t2ES8WHS5QTJntRBUAlNDy
         hg7DrF+V7z9IKjwbBToAujRFh8sOfTCq9229+vpWztz1KOH/ETL34HXldK1lmRkrgCBL
         LL8nETliCp33sGhnPzy1owoID4u6bGg0W+FP08BufZvi3kdX37bowbLmz4rVCrtoY9Cf
         4wjmMeTs6CnAoowIBU+unrfy10ws07izQ0UtALbSULZyqzIaE35EPDiPjhw/mDaovjZE
         Bgfw==
X-Gm-Message-State: AFq9FYJN8AWD+mBHNqoXiVhJEtfCssinQLDelBee+Ro5reMxplZdo0qn
	d/8TuqK/jCDL9wTyaxTj8uQOMQ7SZPlgldV7wFJozrYilRu4ELOfJpzoZfPvbnf8L8Kr+bvGFfe
	YVp2YOL8=
X-Gm-Gg: AYBFou2GNqfgrCzWaZUAhVCmpPT4G491oYqho8G+hZpSV8PQsm1In5HR3s6IUJ5NPYb
	Yr4ii/D6ylmbkBU58y69czqVeEIFWUfcMEjepZGeFOYVK2qMQUiuK6tdfaMfCAwu5AtO0SnZ545
	vngpq+KvAO5rowAxy1c7/2XDeHP0Gp22r1HSLD1wVKUMkfoFBFIxjOoG38IWRaRlKQW6mTxkwgS
	r7XSrco7WLTBUhairv45V6yDOatE2P92XpR5+6zRIMolLGBdCjPS6y06eRgbfYjG3vxNqo0/6i7
	CIpZnlDSQj2fBs/aelW4gqcvynX9aKL9L6es8fW9XW4sodCe76o7EIGuiFxcY3/V6MtA9ST1fMj
	jZKdYIvwWJfaQLvQmfT5AXjxpkU2/Kh68fVmnjxhVrtWuDo9M/tNzunQFPwrun/eeMfnFSOUUsN
	M85KcjsnBopKktTiKJ13wXFkuKtlBt+p2H/5boiAm5DF0D1Duov8AIGFxR/bIsHj7lk//uLnan1
	fZOhRaa/aOLs30DL20wxuBp/yQf+UFf2t9zgoky5GiVglECtU+ZyD0mKX2M6qPNhNkq1UnRie/W
	ASiTm1rflmWNCqoubqoZpL9si4FXheaZxhrMxN8ySrLImdM2LLjPu99ITKnfWpuXqgEQ9BgSQHm
	kJQ==
X-Received: by 2002:a17:906:4788:b0:c48:a838:c16d with SMTP id a640c23a62f3a-c4ca7ab3286mr651298166b.30.1793563713501;
        Sun, 01 Nov 2026 12:08:33 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cb092c042sm279054666b.82.2026.11.01.12.08.32
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 12:08:32 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so2982034a12.1
        for <linux-kbuild@vger.kernel.org>; Sun, 01 Nov 2026 12:08:32 -0800 (PST)
X-Received: by 2002:a05:6402:1bc1:b0:6b4:5f9a:528b with SMTP id
 4fb4d7f45d1cf-6b4d5ce83f4mr4075395a12.36.1793563712541; Sun, 01 Nov 2026
 12:08:32 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 1 Nov 2026 12:08:15 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi_GuySe0L-uCAM2+nScCLYGBp5BLi6UUPR1gALmNM_3w@mail.gmail.com>
X-Gm-Features: AclHuK8ONZxEYl50IOYsDjuY-ouTirbn0Imtlr8QIkehP_x1qvA-yrP0t0sfR2g
Message-ID: <CAHk-=wi_GuySe0L-uCAM2+nScCLYGBp5BLi6UUPR1gALmNM_3w@mail.gmail.com>
Subject: Speed up KConfig - fix hashtable confusion
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Julian Braha <julianbraha@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000f84be3065f3c97cd"

--000000000000f84be3065f3c97cd
Content-Type: text/plain; charset="UTF-8"

So the Kconfig 'expr_lookup()' function is criminally slow and takes
over 10% of the time of "make oldconfig".

The reason is that it's called just a lot, but it *really* doesn't
help that the scripting versions of the hashtable functions has not
understood the subtler issues of the hashing code that it took from
the kernel side, and in the process got things very very wrong.

The "hash_32()" function is a perfectly fine hashing function - there
are better ones around, but it's fast and "good enough". But when you
use it, you need to understand that it puts the significant bits in
the *high* bits of the result.

The kernel uses a model where you give it the number of bits you want,
and it will pick out those high bits, which makes it all work right.

But the simplified hashtable code for the host code didn't use those
high bits of the key. It just did

    (key) % HASH_SIZE(table)

to pick the hash table entry, and that's basically pessimal. When
hashing an address that typically has the low bits clear, the low bits
of "hash_32()" will *also* be clear. So the hash table ended up being
mostly empty! So even though the hash table was sized appropriately,
it wasn't being very efficient. And while making the hash table larger
mostly hides the problem, it's the wrong solution, because the cache
footprint gets worse.

Teach "hash_head()" to use the high bits of the key. Because the users
don't pass in the number of bits they want, this is pretty hacky:

    #define HASH_KEY(key,size) \
        (unsigned int)((unsigned int)(key)/(0x100000000ull/(size)))

but at least this improves on things.

I also stopped the expr_lookup() key generation from using XOR of two
pointers, which I suspect just ended up clearing most of the shared
bits. I doubt that makes a difference, but XOR of thigns that may have
shared bits really isn't great.

The cost of 'expr_lookup()' drops by a about factor of four on my
machine, and it's no longer the hottest function in all of 'make
oldconfig'.

No, "make oldconfig" still isn't the fastest thing around, but at
least this removes on particularly stupid reason for it being slower
than it needs to be.

Somebody needs to double-check this. I don't love my HASH_KEY() macro,
but it should work for power-of-2 sizes. And as far as I can tell, all
the hash tables are powers of two.

Comments?

                Linus

--000000000000f84be3065f3c97cd
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_mvy9gli10>
X-Attachment-Id: f_mvy9gli10

IHNjcmlwdHMvaW5jbHVkZS9oYXNodGFibGUuaCB8IDQgKysrLQogc2NyaXB0cy9rY29uZmlnL2V4
cHIuYyAgICAgIHwgNSArKystLQogc2NyaXB0cy9rY29uZmlnL2ludGVybmFsLmggIHwgNCAtLS0t
CiAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9zY3JpcHRzL2luY2x1ZGUvaGFzaHRhYmxlLmggYi9zY3JpcHRzL2luY2x1ZGUvaGFz
aHRhYmxlLmgKaW5kZXggNDVhYmNiMTJiZmNlLi5hNjkzMzJjY2ZmY2QgMTAwNjQ0Ci0tLSBhL3Nj
cmlwdHMvaW5jbHVkZS9oYXNodGFibGUuaAorKysgYi9zY3JpcHRzL2luY2x1ZGUvaGFzaHRhYmxl
LmgKQEAgLTEzLDcgKzEzLDkgQEAKIAlIQVNIVEFCTEVfREVDTEFSRShuYW1lLCBzaXplKSA9CQkJ
CQkJXAogCQkJeyBbMCAuLi4gKChzaXplKSAtIDEpXSA9IEhMSVNUX0hFQURfSU5JVCB9CiAKLSNk
ZWZpbmUgaGFzaF9oZWFkKHRhYmxlLCBrZXkpCQkoJih0YWJsZSlbKGtleSkgJSBIQVNIX1NJWkUo
dGFibGUpXSkKKyNkZWZpbmUgSEFTSF9LRVkoa2V5LHNpemUpICh1bnNpZ25lZCBpbnQpKCh1bnNp
Z25lZCBpbnQpKGtleSkvKDB4MTAwMDAwMDAwdWxsLyhzaXplKSkpCisKKyNkZWZpbmUgaGFzaF9o
ZWFkKHRhYmxlLCBrZXkpCQkoJih0YWJsZSlbSEFTSF9LRVkoa2V5LEhBU0hfU0laRSh0YWJsZSkp
XSkKIAogc3RhdGljIGlubGluZSB2b2lkIF9faGFzaF9pbml0KHN0cnVjdCBobGlzdF9oZWFkICpo
dCwgdW5zaWduZWQgaW50IHN6KQogewpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9rY29uZmlnL2V4cHIu
YyBiL3NjcmlwdHMva2NvbmZpZy9leHByLmMKaW5kZXggMmI5MWQxNmJmMTRmLi4xOWNhMmFkMTA0
MjUgMTAwNjQ0Ci0tLSBhL3NjcmlwdHMva2NvbmZpZy9leHByLmMKKysrIGIvc2NyaXB0cy9rY29u
ZmlnL2V4cHIuYwpAQCAtMTYsNyArMTYsOCBAQAogCiAjZGVmaW5lIERFQlVHX0VYUFIJMAogCi1I
QVNIVEFCTEVfREVGSU5FKGV4cHJfaGFzaHRhYmxlLCBFWFBSX0hBU0hTSVpFKTsKKyNkZWZpbmUg
RVhQUl9IQVNIU0laRQkJKDFVIDw8IDE0KQorc3RhdGljIEhBU0hUQUJMRV9ERUZJTkUoZXhwcl9o
YXNodGFibGUsIEVYUFJfSEFTSFNJWkUpOwogCiBzdGF0aWMgc3RydWN0IGV4cHIgKmV4cHJfZWxp
bWluYXRlX3luKHN0cnVjdCBleHByICplKTsKIApAQCAtMzUsNyArMzYsNyBAQCBzdGF0aWMgc3Ry
dWN0IGV4cHIgKmV4cHJfbG9va3VwKGVudW0gZXhwcl90eXBlIHR5cGUsIHZvaWQgKmwsIHZvaWQg
KnIpCiAJc3RydWN0IGV4cHIgKmU7CiAJaW50IGhhc2g7CiAKLQloYXNoID0gaGFzaF8zMigodW5z
aWduZWQgaW50KXR5cGUgXiBoYXNoX3B0cihsKSBeIGhhc2hfcHRyKHIpKTsKKwloYXNoID0gaGFz
aF8zMigodW5zaWduZWQgaW50KXR5cGUgKyBoYXNoX3B0cihsKSArIGhhc2hfcHRyKHIpKTsKIAog
CWhhc2hfZm9yX2VhY2hfcG9zc2libGUoZXhwcl9oYXNodGFibGUsIGUsIG5vZGUsIGhhc2gpIHsK
IAkJaWYgKGUtPnR5cGUgPT0gdHlwZSAmJiBlLT5sZWZ0Ll9pbml0ZGF0YSA9PSBsICYmCmRpZmYg
LS1naXQgYS9zY3JpcHRzL2tjb25maWcvaW50ZXJuYWwuaCBiL3NjcmlwdHMva2NvbmZpZy9pbnRl
cm5hbC5oCmluZGV4IGQwZmZjZTJkZmJiYS4uZjI0NDk1MjQ5NmViIDEwMDY0NAotLS0gYS9zY3Jp
cHRzL2tjb25maWcvaW50ZXJuYWwuaAorKysgYi9zY3JpcHRzL2tjb25maWcvaW50ZXJuYWwuaApA
QCAtMTEsMTAgKzExLDYgQEAgZXh0ZXJuIEhBU0hUQUJMRV9ERUNMQVJFKHN5bV9oYXNodGFibGUs
IFNZTUJPTF9IQVNIU0laRSk7CiAjZGVmaW5lIGZvcl9hbGxfc3ltYm9scyhzeW0pIFwKIAloYXNo
X2Zvcl9lYWNoKHN5bV9oYXNodGFibGUsIHN5bSwgbm9kZSkKIAotI2RlZmluZSBFWFBSX0hBU0hT
SVpFCQkoMVUgPDwgMTQpCi0KLWV4dGVybiBIQVNIVEFCTEVfREVDTEFSRShleHByX2hhc2h0YWJs
ZSwgRVhQUl9IQVNIU0laRSk7Ci0KIHZvaWQgZXhwcl9pbnZhbGlkYXRlX2FsbCh2b2lkKTsKIAog
c3RydWN0IG1lbnU7Cg==
--000000000000f84be3065f3c97cd--
