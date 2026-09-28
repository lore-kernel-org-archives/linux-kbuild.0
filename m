Received: from mail-lr2-f9.google.com (mail-lr2-f9.google.com [74.125.230.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16E43C8716
	for <linux-kbuild@vger.kernel.org>; Mon, 28 Sep 2026 23:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790639262; cv=pass; b=IgBex8F8/ImO9r5/N34qT9S0YkJ/aSIlK7w2bv63CRC9jbwZQa8M+Qkpnq4VLLvPfSFJsldjdRvg8S3AkFXNgs4O3Qg8L/iDeAsXmgNsF+nsVfKWm0ycUspjfKpgxgUre6NiFe+J86XI8YYeC3ZXe31p6x9n+EuhXAkQmU8lsAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790639262; c=relaxed/simple;
	bh=DVJ/tVZaxyTOGo7htZLe1TTO4wXp4y9mUVH3Vu+9EfI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=dKEpK195f+qyq2yfCLUQgUB4mWBLss2tsp+YCntTIUD9djwrU6UexuDA8ZIXGdMTyaywuajqXZ409LCkJMisfwPjaPH7/SSMLUTvjhuOE8IELD8F7Kh7sFAKzZKspTss3/xJ/dg0ddwH37pWOghI/H8WrQ0kve/irNrzK7/bb+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L93Wu0i5; arc=pass smtp.client-ip=74.125.230.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L93Wu0i5"
Received: by mail-lr2-f9.google.com with SMTP id 38308e7fff4ca-3a6525e763aso25324431fa.0
        for <linux-kbuild@vger.kernel.org>; Mon, 28 Sep 2026 16:47:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790639259; cv=none;
        d=google.com; s=arc-20260327;
        b=GPghQyM0FweLol2OdE9C1cd60slltwCLHDT0lk3hLt3FUOlL+E1vtvVZaS0M37l8Xj
         x/s4ipAhI6qr7PWAHGVGhVg+5bW4PLH/U/hdkm3UU1mgr6H+05yaC0DFDynfG4+GIwMi
         FyiB1ClSdupVPBPLB+KrjCCFu5CghMnyje2ll8oZmVefnpZ65VNjZPLo8FJkXBP6tAHe
         IYKJFpd5Nyf7dbJo/Nd2sxBYObuOzN56Hu60cS1PRoMR2GnrzsEGpR1ZnJnOaxBvNKwm
         /CfrYdSUhRUGAQNcLda39yiXLfBhitchc1HycmHMPMiCB2/VFsVVbO70CMyIMmqc+Zr2
         BZFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=DVJ/tVZaxyTOGo7htZLe1TTO4wXp4y9mUVH3Vu+9EfI=;
        fh=TWB2nSz3q9i+doqR6xy5bBs7IWEDMEYjG7QfRKEGBpI=;
        b=BtoCFF0lvMgMrfwSgpU2jVkTDbCvKaJT7aXqwytKX+y8ViMPokEOfw8hr9our251a5
         PZowNOUV5TTYSFXYpiefQZKBFV4Pg3p88pXfDtod+M6CMOVkvFAYl0cWjM6wdsRmgoK4
         DBbB/v5C/hGqYFj0Wj6U3XbrMmb7GLDEdc9X98I7bD15Ezi0u/4s4zhW8kH4YYt3UYGC
         WnIl1+zz0OlPK8x2Z5G1l/7xddGfv3OPulvJ4G0K7vZXnyyvNp/dNhNY9Qux/QDnGJdx
         T5DQWEV5GlQFj2UknYJ9tbQK7c2LsXFiBGw2TAxcwa39MfissMI7i+YnwtWF54FpB28a
         z+Lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790639259; x=1791244059; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DVJ/tVZaxyTOGo7htZLe1TTO4wXp4y9mUVH3Vu+9EfI=;
        b=L93Wu0i5/KILI87z5HQllEbvOr4lLRuRU4kT0Nt4DD0ldvn4kL4vZh6NNBP+mV3Kfa
         BEWDDkhdD+HGD6dmqpmCP/Tt0e5YfWsB/y4FPKRjypN8qWywIS2n7YcsfJHkj147YlQ+
         tcfg/R3aE2JcbgVDWvBivMZl/y3VQHSyL17kAx5u6lP+6vZ7+ROywfWf84kv/tQZKlCB
         g6c9CEizlYtINwBgV8l4VSVxWsJksFGN9OUyA55n031E1LR96wERk51Ce1UvpiVIj/dq
         NK4lTNAK7hYEncxWCJrWgIb9MtHedtTCJ7rqBgMtKRY9yYJc8t1R4ZrNCuDMTwSnqrGG
         HnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790639259; x=1791244059;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DVJ/tVZaxyTOGo7htZLe1TTO4wXp4y9mUVH3Vu+9EfI=;
        b=zJ4QUCfIbPqCctC255D3n83z/GAZho1vuGbCAqQ7F7QOEA0KNIRsaJoGePNjdLgzHS
         X+PyuHhQTkbxMGwnJPwT0vwdg7Rcoxv20o8X+1Q5Ru0bFbmo2marhrUFt9z4kWJzk2Qx
         WOPy9+q+U/ICsFWClMYceX6VJhXfk5Chod9lmS+GX9MgX+144x7oyXmjciUsYdJiH/KM
         xN6GtMBGT720LRs5xqKT1UFwn/Fqkjqurx1nv+vBpU6vfIdYP0o8a9KxiLtTP1eMFuRe
         ZLNWZQT/BD4MtbKN061Y0LkGU0zlbTJoeBAolnWkyYw9shS2wGN6+psSDtJRx5tfFynd
         vQ8w==
X-Forwarded-Encrypted: i=1; AKwUvByq8+Vw3tiXOXBZe/U0X/yjTYjuueS19plAgMvRb9Y+HoN74ca4Orn5XynkxxTbPD085KjVuAQEAg5T2bI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5QWiwACpoHEECvUIUQVwH/d8TCcU19PoFIjiHdRRvj5FbgAR3
	fQxXv5X35TmbPcakAJLGoC1uNdcTf47Wd8hvydTHmqRqnRxxk8iJGrppPsZcg92Xqacxjto9xja
	m/H0tUrla/X/zku0i4jHYXQUTneR9/+U=
X-Gm-Gg: AYBFou1ApVMhgwwDszxMKXIrVw3c7s8QeWomNAevbQsB7orchNaRaGYE1w5n9NdmBnH
	PJFGiScZADlHRjrNa9aju1lxkNxh9BOnzjgKhuCZmKwFCBv2leH8niYzmMMhzdDoIbqNO+tWSfd
	oEVC1D07eMHj4mgf1gUF+HDl3STEJV2gn9JH7z5UjO4vsYB7mkdz64ieINcOyvF35xc9rdxiUM3
	UTPHGUxWmey48rIY/1Nt58gtA/qyl07LQjspebUfQVDlMGnkN4rgKd8WVzGlsL2JXTPCYjju5Oq
	cHJf016lhEuCCmGElugFu5iDmIE/rTnIvQw7swpR95NIkzzbhyhYyhS0gVTWNTZys5yhfwmbAZp
	q6EhzXm+B1wf4BFPOrVHyThpg7oUkR/xaUJSM0EIrT7j7tSazJ4Yv3BZL8VHHrXWgRdFARYcu
X-Received: by 2002:a05:651c:b0e:b0:3a6:568f:40dc with SMTP id
 38308e7fff4ca-3a6568f4370mr24957201fa.2.1790639258883; Mon, 28 Sep 2026
 16:47:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: omer zalman <omerzalman42@gmail.com>
Date: Mon, 28 Sep 2026 19:47:26 -0400
X-Gm-Features: AclHuK-F4KwTB3L0zw0yce4vdiYkxCjFy1htwvqvL4sLssm6GQ_gSjmsUXDF2TU
Message-ID: <CAGLNFZetqY9WOioph=1U4Ek-KaSm_ZzNrUo-r1QjT-8tbhWodA@mail.gmail.com>
Subject: [RFC] scripts: should run-clang-tools propagate analyzer failures?
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In v7.3-rc4, run-clang-tools.py prints clang-tidy output but does not use
the subprocess return code. A test analyzer that prints a failure and
exits 17 makes the wrapper exit 0.

Is the wrapper intended to signal analyzer failures to its caller? If so,
I can send a separate patch that returns nonzero when any analyzer worker
fails. I have tested the control flow with a stub analyzer; I have not
tested a full kernel compilation database.
