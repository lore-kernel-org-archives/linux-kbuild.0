Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268867;
	b=gzYSahY3nxpMgkbVJg9rvOwUqaqnVPkn3LD6CF3jXS8VEu//wNjLl/SUNI/2XGj3MSft
	 Qw5R5ArkT661Ja9n81PDApHJiVtiiX7kexMPbPGTqx/EvXzugvDjNUtxcymXuyl9StdrD
	 gRcJYax2VWF8Qwon5pnDcJzhGPxn2f/vWmCFB8ikv6NjfkRTvIVsDBLTn80Ht1wPnl+nQ
	 f9MxAzR3BU9yA8xpNyJJ5nWOuvRyFf/fBOTuTxlkh3rlJyHz4nZ/bvhbYIcPtF/X50WQ5
	 SEOXxarF7VpOBVYZURfNYH5PraDTH9/ouTTCSraAbkv3z+3U/HfQNdnIa9k+Jw2q0KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AMaxqg7mFW30l8DXrD6/F4a8xmqD4FuJt5pJtPbHk5M=;
	b=sDaTHLvjaP5nIblIHz6rj5bim4MYnngKFB0Soe8USKeNS8Ryz1+t9Xpeyh7U+hdd6vgA
	 naHP7hO8S8LGDc/UiLIqQJM6oEx0A8TE2zI5eCaZUAf0Bu8p3P/Ba4GUWxLzSaRS4NTtp
	 izidzWTOQd5U0NirnuRYjslVL9t2eswtgkBNpxO8felIsX+G3XOx0J1ujp1/futpKzG0j
	 F68cXWnyw+wMr04UQO0dKG/c9YDqxVG/fWF9Z7lkocussW4s7pFNxe7FEYJ395PHBjnbR
	 k3l1i/qoIReSN6mump0vTP2Kch43wyoRg9OF12dcEO6d6LVJchPBZb6HJY0XWiyJg0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CWMxmg6g;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9660860A3832
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Nov 2026 00:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9660860A3832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CWMxmg6g
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-48ed188ee81so725647fac.1
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Nov 2026 16:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794268865; x=1794873665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AMaxqg7mFW30l8DXrD6/F4a8xmqD4FuJt5pJtPbHk5M=;
        b=CWMxmg6g2abgyUL5n3vZf/Z9PKy3GyA5VprFxK1HtxhTnu7L0zo6Kl9i5Dco9q4JYe
         L45BL6POyL/UOgpR+NESp6BFYJd1egU9vqKj9v7LjGw2XzDIYKCkPUFSL48hRpNONyma
         Cpp66jfSduBkNvP9xWrkTi67/KuKkHPdM9N9cy7J/vul4YdaROCfUQnNMDJhqHnhO7Bj
         pexc6Kurpan5ou39HoL0Txe4yzqXCisy8qrstnDtzT4kN0cY7ckG2RxIdwougbkz7z+l
         NetBoFnVtmBvxAlLcCdQwVydp2nVwYgHpdqKudef0OBb9KCGazMx92HZaHwkxCH8PX1/
         lvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268865; x=1794873665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AMaxqg7mFW30l8DXrD6/F4a8xmqD4FuJt5pJtPbHk5M=;
        b=Pgc6Q4LANM1kv1esBvacP2gLC9cLLdslvCv46HR+GNZxyNPR8oNmCPyfTTCqEXHmh1
         6/cRjtHqmLVN6TlCeXa7PTr6F/Y2ZSSTtZiiHqqtpiwCAvC5Lnef9ZY7E4paizeSw7Ti
         lYKwvFUB4LDyYA4BUwQHTu+CZivIV54slH+feNHPY1iUvvqyGD9G5vZl+vEHNfy8GG3Z
         aD3DYUbbzxoCc3DQHD20gZAc5EY3I4U6YoFt9iSgtzJ4juddfDNTCOJRGrUXC/d0Zydv
         eSTAP+WwcKN9eiai5aFCXnzObaqk647iR3thXCtzPpZsNtyRQQdV7lO69yseoaFVeoE3
         UN0g==
X-Forwarded-Encrypted: i=1; AL+hErF5ZXJqmdfxkUsTCCVonuUBKINo8howTGPnzICqlVKgzb5LiYwGfAyvWTJSnoBgbIhZ0iI3yfYHq2Qp7Fs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0ryLjccXXqzj2bd6X3dUy4z3m7pSWNRA8aXqAEkKq3SCr1EfO
	bsJTy+0Etjmx05V3mHXweJE7PiWEJJ64A5aEGKPYYqeQLpfCgsjcuXZf
X-Gm-Gg: AYBFou1bjU9YmD6bBT4sebNRRopsVA4Q2Lh2h+d9xxeii7bOILgP3/cd6Bmhw/70fvc
	LcBAflpjfpF6VPjYc6NrIIpOK5pzGdOHtcst2xmRFPKU4cX/D40vueGEZXNmiFKMWCKz5DibQSm
	/nv2qoYqz73imxDCGGwc43ZlkTsjAkFPLLpLio5fyRGqqXKgRknrRi45K7UuVzMknwyVktQazW4
	caQNIo8RqPxAjH547AOMFIJgbw5dgB3dk+2jbK31hedmEa5igJXuMHFd4u8CDCs/E/bv0yKTYSr
	djA3Uqt6zTFYNUI2etNWKY74mOUIArifnVxswVnprwj02wF92YrGFUJ6dBGb/OQ6RBtR3pjM7qT
	Zs5c0ej5wuhRXVWG53qN5DxDe6hJZF1xPPdNrc5jBZCoVldSw/SIvi49jxOjdAxvczMfMqxJ51W
	0ThKGpFTe2oQmFw96BFkMwhRaa842wLyiGyV0z1PgVXPjrJ3WAzkcRLF3TEdeHutRxg4WMep9lx
	r2AiB0zDt+zORMFT4IuHXXXJcbHx7r4fZmfHMiAT5xoJnZ31GrzLnkEhfWfGRhKnmImbWgO5olo
	8u74jyce8rdp6iPpPxkYBbrkCStOeY8+hugvEER63Vk=
X-Received: by 2002:a05:6808:c123:b0:55c:844:98ff with SMTP id 5614622812f47-5683cd4858fmr845306b6e.34.1794268865523;
        Mon, 09 Nov 2026 16:01:05 -0800 (PST)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905735edasm623697b6e.7.2026.11.09.16.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:01:04 -0800 (PST)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: masahiroy@kernel.org,
	ardb@kernel.org,
	rostedt@goodmis.org,
	hpa@zytor.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH v3 5/6] sorttable: avoid pointer arithmetic overflow when locating sort_needed
Date: Mon,  9 Nov 2026 18:00:02 -0600
Message-Id: <20261110000003.1719966-6-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110000003.1719966-1-lzsx618@gmail.com>
References: <20261110000003.1719966-1-lzsx618@gmail.com>
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

The location of the main_extable_sort_needed variable is computed as

  (void *)ehdr + shdr_offset(sec) + sym_value(sym) - shdr_addr(sec)

which first adds the symbol's virtual address (e.g. 0xffffffff8...) to
the pointer and only then subtracts the section address. The
intermediate pointer overflows, which is undefined behaviour and is
reported by UBSan.

Subtract the section address from the symbol value first.

The problem was found with UBSan, and the analysis and fix were
prepared with the help of an AI coding assistant; I reviewed and
tested the result.

Fixes: a79f248b9b30 ("scripts: Add sortextable to sort the kernel's exception table.")
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
 scripts/sorttable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index 88e49a5c4251..0425e00c490f 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -788,7 +788,7 @@ static int do_sort(Elf_Ehdr *ehdr,
 	sort_needed_sec = get_index(shdr_start, shentsize, sort_need_index);
 	sort_needed_loc = (void *)ehdr +
 		shdr_offset(sort_needed_sec) +
-		sym_value(sort_needed_sym) - shdr_addr(sort_needed_sec);
+		(sym_value(sort_needed_sym) - shdr_addr(sort_needed_sec));
 
 	/* extable has been sorted, clear the flag */
 	elf_parser.w(0, sort_needed_loc);
-- 
2.34.1

