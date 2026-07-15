Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D213644A4
	for <linux-kbuild@vger.kernel.org>; Wed, 15 Jul 2026 22:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784152931; cv=none; b=O72arXSiwd5vuKpQb6jJVnexwCL5uKev1B5ax2KoXU/7IjXeZ9vnM7gH4xWNtiAAPrL6zBzpymgos0XMtThaOR5xoUwdBNXo+PtI+wlPCory+pP3RgoKYQAGosaIkI/Y/aHvZKpWhyJnl2GHw6/FZsFvO13mMqjKBt/1HG43so0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784152931; c=relaxed/simple;
	bh=hXccJTGkDogFq9xNnd2HhyQ0ZplziOGnAqlX+J2y+Xc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WDh/ir0vXQO8Cty6XIck5dX/afFaDcYnbOheTYmnxFicpIoOB0m3fqv1mFgEZdvoK397RN7RZS/i5auDupc8zfroutiSO890wbv3FVoaM95ToYrNZHemXfMGz7qGXRAVW1iW9q4NwIorD9K+yqnx0BwhKRPB1GurWFrZXIyyjFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S77IXi1b; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S77IXi1b"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e622cc874so409351885a.0
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Jul 2026 15:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784152929; x=1784757729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NvWacIrRt+twzRaS74wAVnv31KXtCgTOGubOP/O81X8=;
        b=S77IXi1bAVI6aX9OILWUPteCXYJNFgbfOpgd7Ck25143wN3Tg9JBA4t7a/My3B6RWD
         SncurGkXjMHLJiCpJAFznMiiR+EtdapvxRHN7d8Nn9DagbsEL0Z2k9eAua81vIj7ns95
         dkLQRn88xEWTEgqXrE/xDYg0UuhC5LBXF1kaMMPEhxY6Uq2LM40wgAWKxeN/k9hkQ/8V
         Tz60Oq9D1McCUVAA+5nhR40SHrAR2qK9bsbA4Yyw00DSn0iVJYtH+bgty/EY+sQq31q1
         Y+bYkVEsG2hwxFJTrhzF2YbAw/pyxInJpviZB5Vrfj+QXWFy120YMjPoYukce2GGk/Dn
         dyYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784152929; x=1784757729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NvWacIrRt+twzRaS74wAVnv31KXtCgTOGubOP/O81X8=;
        b=Ra/6HlR+WA/TyCbRHDG7y6xE41x7e3rU/NGmxd47rGXCzAYCuRtAydL3ZP8E0NacZ9
         qTcg3PJghaehfrqLpT4yamgoi66hBg6ETd3XChhNIepc1ldBEaKlBDrAifqQyCOTOqdV
         1GbzX4Y4ab1eCL9gYcyWlt8Wq4IrRb8+MaYFn/eQzBafaoP4/woLx2k22b/bps+bcpC2
         wYX/LM2AgnFltv5O4PUv6yqmxoX+PLh8g8fi5ET+dYXalfV3Tg6seKArC0Szi/LHuUBL
         LIOC4XBo1JceZ7zsgkPjHli3bfp8E03Vy+Gz4Pp4f50UNLMlP4FTQHainhykNNa/ooe+
         h3Yg==
X-Forwarded-Encrypted: i=1; AHgh+Rr1bUqoi1rvE4JYqSs0qaa5VGbhhMq4eTILUPeartfBhpcxAeyUqGdAwKObq5205/IJ+D2kIfliWVJ+brY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8JLiR8khkHGCaIA57lzH9KokgzcHlR3r94jL3mGFKcH7Bb3dA
	XSmRL5LVgRgjNIoS/V2fERZxvBwuPNFhqaDA9PEvCgo94h6vWZHZ8zLX
X-Gm-Gg: AfdE7cmUgVbGhBef+LDpd/ceF6lzGEpIJ/+gA/jWoUa122eLgNXdTGA6p130JpzFGll
	eQmzDhGLd4Dt+uAas2G2dVXZtnl1xpM+4hbPXN/5ym5A44DKTUrN9pwZiF563Im2lKgakhHuSvt
	kzuRA7yoPZZMzD2ZGmJieT0oLpuI21fiL7Bjg1PljQ3406/oGvzdfjA0yEUT4szgXdwl7QkL6SJ
	ZLogJZ0M7PJ0yZecGpP5+w5KOZQ08G5u5LxeiR0D6ALh0FPUs0byrKzn3QkkMT2RAE1eet6zs9H
	J3KPq/5XISNLkS0nX/6DIq0xii/AL0MeVmF8YlV+QHjpyUmzN2ltK3BV7NhvmP9VHfhjZM5FuO8
	MA4514DuXz7spGoWAtSuA04QbwQ86kJfumCyB2U3ldO15EM+UkrOT3vx+4+KD+EZa5NKrVCtcCX
	5aRlKJsACyxbObzaR2fkMlL8QtrjC3lYjxMpRC4tQENw==
X-Received: by 2002:a05:620a:459f:b0:930:a50a:4b39 with SMTP id af79cd13be357-930a50a4d12mr31029485a.75.1784152928660;
        Wed, 15 Jul 2026 15:02:08 -0700 (PDT)
Received: from nixos-office ([2607:fb91:1cc6:ee9:3c58:cb8d:fd13:5294])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d34f76sm1860910685a.35.2026.07.15.15.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 15:02:08 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: arnd@arndb.de,
	stefan.hengelein@fau.de,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	nico@fluxnic.net,
	officialnaumansabir@gmail.com,
	rdunlap@infradead.org,
	vegard.nossum@oracle.com,
	kees@kernel.org,
	tj@kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] Documentation: warn users not to use select on choice options in Kconfig
Date: Wed, 15 Jul 2026 23:01:49 +0100
Message-ID: <20260715220149.48700-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hengelein's master thesis about Kconfig from 2015 wrote that 'select'
does not work on member options inside of a 'choice'.

So I've re-implemented his check as part of kconfirm:
https://github.com/julianbraha/kconfirm

and discovered several instances of these dead selects in use, and
fixing them is not always trivial. For example, see:
https://lore.kernel.org/all/a3b7a752-8cc4-492a-bb62-43121b852c41@app.fastmail.com/

Let's add a warning to the documentation (a place where developers
are more likely to see it than a master's thesis...)

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 Documentation/kbuild/kconfig-language.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index d9338407c1c6..ab2822d7ca1c 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -164,6 +164,11 @@ applicable everywhere (see syntax).
 	That will limit the usefulness but on the other hand avoid
 	the illegal configurations all over.
 
+	select should also not be used on the member options of a choice.
+	Selecting a choice option will do nothing (dead code). Instead,
+	consider making these a dependency, or using the defaults of the
+	choice to enable the member option when it's needed.
+
 	If "select" <symbol> is followed by "if" <expr>, <symbol> will be
 	selected by the logical AND of the value of the current menu symbol
 	and <expr>. This means, the lower limit can be downgraded due to the
-- 
2.54.0

