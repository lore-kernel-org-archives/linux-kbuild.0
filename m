Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281840;
	b=zl406IGX8VYuQxSpFVeg6O6lze0LGkCwlF0hWA4kZaYBHqULnHMS5P/znXQfcQW2Tlz3
	 gje0k58W6KwG56iiG6azoQYX4IuZYWz5T0ZzMTJuPL5UKjs4NIxmuJWUg6GfjeYAEpIQm
	 wUUcHhzuSLo8uODn0VIF9cMwwN1rF9c6H0R9ksY4ijA33QC9FVGnVj36mu6ex2zqepWMV
	 0E4g45ikGGmTB6HcsK3NyQv/K2UDCMq/Q9Lu9Tp01VDUKwzV2jvj7M51e0MaYam5tYFb5
	 5zl2m4LmGJ83QtOOxXiyTIDv0L6/mfD75c4Ub3N5cwA6997VWh6ZhPzGUtdGNnCgQ4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=rHmC9nnHSs/HBIYFqAJimZ70eQd4OJw7JCv9j7P9OZ4=;
	b=ldUICAa6JiUF357IQ5JvGOJREmCbJY+iiPHrU20IOD4DES0cbLxLFIh6U/8wzj2WubeQ
	 HjzLyT4ClMldXKkNpBSb9jN1tZSz7W1Yzz6z+3l2xyoigJoxBb9eRchMZiLf5CSJl/UfX
	 d+6DylTtiF13uotDQU6XXgFyBQdlGVN62n0fDFIH041Bpfj7e8v+hfanmIPpMFBysS9FT
	 eJU7wLO5cO/VFROV0IirtNQx3dk9SJSvcnug4URveKxAs0/ToUB+nXjUnYfNipOLrpmNS
	 HBTHSJ8QidLxjQVE5bFP4GfjmB9jUx4yNh9UjsllDVDyzO5KeteMsfZ/bzdGqyhGVYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pye7StVF;
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E08560A2603
	for <linux-kbuild@vger.kernel.org>; Thu, 29 Oct 2026 13:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E08560A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pye7StVF
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e0389d6f9so1304855f8f.1
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Oct 2026 06:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793281839; x=1793886639; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHmC9nnHSs/HBIYFqAJimZ70eQd4OJw7JCv9j7P9OZ4=;
        b=pye7StVFKtRSkDKooVu6T0zv1CXbTCcB1Ru2v0/T9uZ52RN6jiqnXmmJHFdxoMUjDW
         bk6Zvfhf9r11Y6V3eWWClkLZ8WG3TEZLu/DF0/lUnkvASEiyXZeulv8C86il9/yNaJeG
         LNl/+7fS6JKbKDOEgWCA8F7oD0YNdQY8KX0jqPP4G5QlzwDnuFHfqaxTmWDUZ340yLI5
         3Ea2CUUO9syqqfS0z/p3BDwiDuPybOrZlIYQfIksS5jloXtUPwm04ChpE1b5j9JKAESD
         xNAYB0pYKdGugETh9GXghEq37MzZhFGEMWdvH/cCN5iBFGheiXiwbB/zLvYZZlUoVBBs
         XJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281839; x=1793886639;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rHmC9nnHSs/HBIYFqAJimZ70eQd4OJw7JCv9j7P9OZ4=;
        b=R+HYw+anMs9R4RRcTS2Tx2VgG0PiR7iMW7gZtLyYooVpdTW080weBYOB5arA3QJMor
         en+NCaa4axhOAi9ZT6ZCzcbYrnfPlhL7sRvdgrsefNe/seNZZjgnbFXdqLpL+8jo98d8
         FcdrFUmtm0cP3mxfExbxVTxtvCUj4kGXuPPhE8lWInej4Ed+3pVh96nqf6tLseM7gZgs
         N7UhNk6IdpeOeRu98D+bHDIGimM/vG6q4HaspI1nZRrQQe1Od5EFh6WDcIOYD/W9oW7F
         SIuVONP3xJWJIW7/5Pbz0QViG5OSTMh0A+1yxu2YvR6Xe/UhJn4Tan2SriAH2HuFGlru
         gAGQ==
X-Gm-Message-State: AFq9FYLFADkou/GK6zGQkY7fqldDmBjuLrHAVMCDPB/Yi9Bav+A+FVbn
	CqMaCViKv3NmrLt2eCCEMklZZmFoMNVuonDY46vZ5hnHyyeXjldIE9Xzgl/jXHroaw+IYu/N/26
	QmoyW/0dhc8VgpRPtUwD+4FxMgx38IaSCepOnjQgLWIC7NLROyZ5RLox0RfFv95MV0MpvDzOilK
	OgMlAzV+7EaL5WXjZLNP2rDGbY0sTdocI8Cg==
X-Received: from wmbdx18.prod.google.com ([2002:a05:600c:63d2:b0:4a7:a5bc:d876])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8183:b0:4a4:fc8c:cfd9
 with SMTP id 5b1f17b1804b1-4a96710c712mr106879715e9.25.1793281838064; Thu, 29
 Oct 2026 06:50:38 -0700 (PDT)
Date: Thu, 29 Oct 2026 14:50:23 +0100
In-Reply-To: <20261029135020.272082-6-ardb+git@google.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261029135020.272082-6-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261029135020.272082-9-ardb+git@google.com>
Subject: [PATCH 3/4] arm64: Drop stdint.h type overrides from asm/neon-intrinsics.h
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

None of the users of NEON intrinsics include <linux/types.h> anymore,
and so there is no longer a need to override __INT64_TYPE__ and
__UINT64_TYPE__ in order to make the definitions of int64_t and uint64_t
provided by the compiler's freestanding <stdint.h> compatible with the
kernel's. So drop the overrides.

This also means that uint64_t now matches the type that Clang uses for
64-bit quantities in the prototypes of its NEON builtins, and so the
-Wincompatible-pointer-types warnings that are currently being disabled
for all NEON intrinsics code will no longer occur. So drop the pragma
that disables them as well.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/neon-intrinsics.h | 24 ++++----------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/include/asm/neon-intrinsics.h b/arch/arm64/include/asm/neon-intrinsics.h
index 5f13505d39fc..43cdf4d16170 100644
--- a/arch/arm64/include/asm/neon-intrinsics.h
+++ b/arch/arm64/include/asm/neon-intrinsics.h
@@ -6,23 +6,13 @@
 #ifndef __ASM_NEON_INTRINSICS_H
 #define __ASM_NEON_INTRINSICS_H
 
-#include <asm-generic/int-ll64.h>
-
 /*
- * In the kernel, u64/s64 are [un]signed long long, not [un]signed long.
- * So by redefining these macros to the former, we can force gcc-stdint.h
- * to define uint64_t / in64_t in a compatible manner.
+ * <arm_neon.h> includes <stdint.h>, which defines some C99 types differently
+ * from <linux/types.h>, so the latter must not be included into code that uses
+ * NEON intrinsics. The kernel's u8/u16/u32/u64 types can be used alongside the
+ * C99 ones, so provide those instead.
  */
-
-#ifdef __INT64_TYPE__
-#undef __INT64_TYPE__
-#define __INT64_TYPE__		long long
-#endif
-
-#ifdef __UINT64_TYPE__
-#undef __UINT64_TYPE__
-#define __UINT64_TYPE__		unsigned long long
-#endif
+#include <asm-generic/int-ll64.h>
 
 /*
  * genksyms chokes on the ARM NEON instrinsics system header, but we
@@ -33,8 +23,4 @@
 #include <arm_neon.h>
 #endif
 
-#ifdef CONFIG_CC_IS_CLANG
-#pragma clang diagnostic ignored "-Wincompatible-pointer-types"
-#endif
-
 #endif /* __ASM_NEON_INTRINSICS_H */
-- 
2.56.0.313.g2479322e68-goog

