Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795737630;
	b=0eOYOjIylYh7gV03T98aVhgpC9s2mAXL/cFnz/4LpDar0ZRCTMbVCkRSA1VGjWpJOy/7
	 tZqN5kzgtQbHBFg9RYdR6xMKbhrxob5HNIW6kI5HGEPQqicHkvB2NjTWSUo1HvP11+cJU
	 mO8Hzj1BCJuQz6d7RU7AkUrimBOx7f7XtllbirH/PfBI9c8gw8wmEEpov7DwawT+FZzAU
	 psbDvBroKKukquv6Tmwge/vgTszid4X8KFAjQ8u8udMrrA9SWesIaT5jxamJsQ7P7tyk5
	 /GjXOdVlciZ1irgAkElfQrqyJ1WD67xg9KiHf6kOA/pFwl8B4dxDYy1Siy/nG4Lf6Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795737630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=BeaediEPiyvNCVsEZncQlv8H37LBayA0CIHeGsXXEqs=;
	b=3C6/z3Z/McUjkKoBrHFdS7mlMDOzDU2GSER5Szr2NeUf5Fl2iX0JKtUR6JDa6U2dZaGe
	 c8MosFjI80gD8b/VQDYspo1fWE94bZgDKX2vLsBPY4asAvY9aYCD6mC3/lL/+MJY0L3Sw
	 pFl5HAO6LpDmWI/fqH2jqcQOM8oWUWaRMB3Dvntfwj1RUQ4YKr4aSCM24Xtb6cgEs9u3t
	 SQTfwuympAcuJgcNNReAvTpG6RXMG4DxBV3w89UQZPntJBjt/DBmkqDlT4um3Eq95jmBd
	 RN1P+O3k0HHMza1vqdY0WwqgEaMtfRXUeOyeuCZzVFMgzBz/94+Yh7CCo1pCTLydiKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ieiPBByc;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148C3606A686
	for <linux-kbuild@vger.kernel.org>; Fri, 27 Nov 2026 00:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 148C3606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ieiPBByc
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490d59c3edaso5119784f8f.1
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Nov 2026 16:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795737628; x=1796342428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BeaediEPiyvNCVsEZncQlv8H37LBayA0CIHeGsXXEqs=;
        b=ieiPBBycSaIialON0r3egXgkOds8V+lp3Rx2UO+1Y0rc9nyNj3E8dmAyRMl2/P9BD+
         PFavVZZmNjPcy7UAGi2wzMcobZ2cJAlGDv6z2NcQ2h/93ltnk/WP52gnS4fQqtwyBm51
         JqSI9cstk3F74SB1inEcLmKqWtQ5P3Pynl7ma6L4ZLchz00VchONifCfcSvxYRGEuDVt
         MTYR2mBKPkbYTv3mB1WR8QnfVdLFNnmSdLxkcK9nDw/rVstI0vvaFQlTTXWkrTlfl1T4
         NXGMmYwxxS2+y2mrp9fs6RC0GPtI4QyfsZGg4gMlis+dVpm+L+R/pcwBgk4EGuKQ3HbA
         82Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795737628; x=1796342428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BeaediEPiyvNCVsEZncQlv8H37LBayA0CIHeGsXXEqs=;
        b=ya4xpdpDG+Z10ZXXzUBMWoc9exQ4y+JGUWtMD5b2M5NEWdrab1V8daRqGJ4ZNHzbp3
         BtQ4gfLEIZCUyEX42/Q5UWdkLGx2tgmm9r8Tmh3EfM0BSzZ3MOEU6Ooe057wekqar3P5
         kQMoZAuNeRaR8kODmXQVRjnqfhNQiZFHwS+Qf64/JlAwfvtSUiW91RunekNxQJ7cN4xU
         +sM8ecTQuZP6GOMKyWOisXxofyepQXrMd4DCkW/sLEarkXwTKOp2LVf7kuAAUxl1gugy
         4t57hRT0lXVVV/szvaym9D6tCE7H9/lAtCOjJkZmHjoHOoX3SY1H+/RfzpQz3dFLowfy
         UmSA==
X-Forwarded-Encrypted: i=1; AL+hErH9ZXxx+8nTKg2cZkdFsaUCjvFkwJv4s2HIt8DlFc1VA4ASnGxI2sGaFvjbOtJKpnQRKzcxPa3xrL7cAlQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YgKummTN5b/kE7AniAUDE0SsPBh0xT+LPa9cq5NXIfcTaE0pR
	tnhUWoZGwOoAWyOTm8WlDW8AbzS7tv+D3PDzqVxBSL0r/NPcsHzmugfL
X-Gm-Gg: AZFdTZdpsQAUyB0zf4mTtchYK2xz+Fo7LnUFyxCX8p1jKMbxR7ziwyTWXnFUR8yH0N1
	KxitK4lMMzQpHIt8b/0VVYf5LruU07LN2ecTWMZcmkIqketFYFrPao3vs7mKoKb0xipazph1Rx2
	kFpVD54FV2cH+RucgllLlyPRuz4LnRQeNp/EcS98xhj4zljxUy5JVpdXkK7qJ8wv2E3llKb0N3G
	mEZgeZp/EL5DSbcMMvgc4WbtzbeI4U8BVB5fovQ1EFq5R96EtkMNzBUjC4v1I4S6K9hp1z+ULFA
	qmUtC6HmhQtWQnHHL7vXsnWv88U3TNjieg/PprXfHQpq0wP9jcgGGBBT2HMzuBDcpUHVPSXCGgF
	nPC+NlgWSSa0eWDj5ITjwm6Ah3VrDbRMdumCdaj0b6fGi0oTuj/bCga8jERenSFtZCle/8eDONu
	+pNJV4Jgw+RBRz1oibnLtQFMUAkFweZdkjC2p5g5u9uwdyws3Jn82VzYXcHBHpfOAo1czSOc6Vz
	Srswu4EPKS3mNnmxfu3JPrjhy2RyQDWxjIUdCU/mKHTDUPYqi7JsTWsVvWIMe9o0Z4Q3BmCCpH5
	6F7/JSSHLdwyRz2cBlmZKRXxEUO32pO6ZKl06j1pAhIx37QgJ9V2kvsrxpYCrTyZ6Y9CSJHfni1
	yqpJzwPc6+KPiaChpmg==
X-Received: by 2002:adf:e00e:0:10b0:4bb:c87d:62bd with SMTP id ffacd0b85a97d-4bbc87d6304mr6603804f8f.23.1795737628291;
        Thu, 26 Nov 2026 16:00:28 -0800 (PST)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a68048esm45536616f8f.29.2026.11.26.16.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:00:27 -0800 (PST)
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
Subject: [PATCH 2/5] scripts: restore support for 64-bit pointers in host hash functions
Date: Fri, 27 Nov 2026 00:00:12 +0000
Message-ID: <20261127000015.3662267-3-julianbraha@gmail.com>
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

When the kernel's hash headers were copied over for host usage, hash_ptr()
was also simplified to remove the bit count parameter, with only the "fast
32bit" path in use.

With the bit count parameter restored, let's restore support for passing a
64-bit pointer to hash_ptr(), rather than truncating to 32 bits.

Like other headers in tools/, use __SIZEOF_LONG__ to check the host word
size, as opposed to the in-kernel BITS_PER_LONG.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/include/hash.h | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/scripts/include/hash.h b/scripts/include/hash.h
index ae0d3fc8d470..08e901b8a43d 100644
--- a/scripts/include/hash.h
+++ b/scripts/include/hash.h
@@ -12,17 +12,29 @@ static inline unsigned int hash_str(const char *s)
 	return hash;
 }
 
+#if __SIZEOF_LONG__ == 4
+#define hash_long(val, bits) hash_32(val, bits)
+#else
+#define hash_long(val, bits) hash_64(val, bits)
+#endif
+
 /* simplified version of functions from include/linux/hash.h */
 #define GOLDEN_RATIO_32 0x61C88647
+#define GOLDEN_RATIO_64 0x61C8864680B583EBull
 
 static inline unsigned int hash_32(unsigned int val, unsigned int bits)
 {
 	return bits ? (val * GOLDEN_RATIO_32) >> (32 - bits) : 0;
 }
 
+static inline unsigned int hash_64(unsigned long long val, unsigned int bits)
+{
+	return bits ? (val * GOLDEN_RATIO_64) >> (64 - bits) : 0;
+}
+
 static inline unsigned int hash_ptr(const void *ptr, unsigned int bits)
 {
-	return hash_32((unsigned int)(unsigned long)ptr, bits);
+	return hash_long((unsigned long)ptr, bits);
 }
 
 #endif /* HASH_H */
-- 
2.56.0

