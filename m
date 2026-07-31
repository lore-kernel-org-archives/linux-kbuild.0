Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAF141736B
	for <linux-kbuild@vger.kernel.org>; Fri, 31 Jul 2026 10:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785493360; cv=none; b=faVsTzu+RNmvO17/Y4YdTX+lQUYfjKGRmJhwaWVOHg5HgtD0I7He7Jo4iJHNeq7YH81MtFc/ht06H4d5Bs1V6JcvolqQXVt7KwhzemQE0FkfigfIyN8WSKLZZg55a2mrb3J2LDQ/PRWJ7atf/OL7rbhGFiwU9KPH1D4WmU7JHEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785493360; c=relaxed/simple;
	bh=qzyo+QnTFnmrAYUBPCsnn0eKLSz6YYxKWoVA9EDKIQs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=tbhawiGswt3tHIe8qk92pzvOVaQcsEctxUn8xs53AKzCRjNKRxRuVoubAcT1UqAzUiw9dQpyHe8MSJ5saxEbKgaUhpy++LJLm9u8acwqvcrURVpHYocM6/DLV65+C9pVdXZ57ETU60d5Se95gGZuAO2mzJaHnTU61khQOOK9n6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzjzO917; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzjzO917"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-81e9f7491ffso12822707b3.0
        for <linux-kbuild@vger.kernel.org>; Fri, 31 Jul 2026 03:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785493352; x=1786098152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yAih+EkoeJkECqgrlhNFazVCvb2E5wCnFNuHCFELofo=;
        b=bzjzO9175SkKUyx4v/P3+mKPuudf7z3/OBKg/RgLATqEXcD1VJegwZgG3evhVnSgQD
         8hkkmS2XigvUm7VYWOoC5CFN0KhTDulIjhSTH+T1E+f8oPBX9IdSgIqWw05EGEQWZ3OJ
         0fUa8C+y9xTbEuhVNMUeh7c8WTDdzoueQdtP9BqmmHvkqtnpLVBg5fGmpDYfFvyO21KZ
         2RniGRlLCuLfmk+A8t3n/Qtd4KUVnLdzwsfGjhWE02L1cZGns3iL99buiV9DbC8K0oVZ
         jHDqCr8IUC5Xtaw4rIODbX5VnN44ZzbW0G/iBc06GMreBpVcFn8jNA4DFcKQqhIRJg4C
         0UGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785493352; x=1786098152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yAih+EkoeJkECqgrlhNFazVCvb2E5wCnFNuHCFELofo=;
        b=Pzwm+BNPNesTZxa+SK937gf6tJRNIg7Oainq8escbM6dw1dS/bLTFd94LXrXyHYsGR
         QArVI94YJw0ToUQlP9L2l68vjPnVW55rBumYIEuwKsBvy2uVC/PEAKODj0Zb9JyMngCf
         UTbWaCGjs7G5i7+CPpXttiw9GWM2o5+mNuQ8B2+HPAhU/K0UR5bn430HnHaPQEoHGscY
         5993p2qHkhaeVJDTD4TghpVzHbiJlBZdmJXhPNuGm+jDmcGSzhodoFsg3yvYIv8c8Tg1
         RS4hlXO4morR8Sua1nSwh/54FmDr8QIDd/qYMSAyhe1w13iMNCHTNhAHqsNDLb/NoFDN
         Qc1g==
X-Forwarded-Encrypted: i=1; AHgh+Rq64hHQDZ9TAdQLLcgCg2RzWbKzZkOk/4mWMi2QNeNlVu8hwJjGG6jPG5Cn7GyKNqCKmz/zHGFJuoOFV20=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaepXplEl0gaFhVKLd3/ks34+RZ1f9oSUlIZnMuq1n9JIJvbWX
	CkVCM3/k9MxZzLlO2seeQG49wO30D1QOi0QPuLBNmOvZcNDyTdl2xjzj
X-Gm-Gg: AR+sD130s0Wvl55aCRs55RCheTqJrWXKRQCVXEkhLXPrjAUjeNUh9eAK9tTcIUX9467
	Fjc6sT3VIiV/zdkXnXGtkMUcvkoo4+9l4Sqy0DQ6MTmru1g65zxRNtL31BXW+mMfUo+yBnH/wzY
	jBby4fSoiYlqxaYZ79DQYeDW3R5bfjHsVdTDM2JRBbTr6/69LYct+tZw6r7TpdNXbAUSKEv+QMW
	yjvrcLTC8kzH2W+UC+tDs87cEiFzSKo9B0b98f3sZZfaJHMU4DMVAedkQNOISxYpfzvyqzWS7Bh
	lUchSnyX7F5y0lzZnpzilKvVL/9omrBsQPDrMI7dVkqlu6c9/OdPmE7KPBK/acKO1yIMGbMYszI
	75j3ErQ7mwW3GvYfUuriC9JGx3T33eDxEG+pF4oE/Y+gTwvARZaaii8aqqMxSb/gGvys+WTTKFP
	kcJtbbCRIUhLQudGvYdfdIEi4oPa7R17xadpqsJIBSfWI6euXEHgeeYR6rbhb2xzNFKqY=
X-Received: by 2002:a05:690c:e0c5:10b0:809:fd83:a88b with SMTP id 00721157ae682-81fcec457dbmr4861587b3.3.1785493352235;
        Fri, 31 Jul 2026 03:22:32 -0700 (PDT)
Received: from Gentoo ([191.96.150.98])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccd799b5sm4466817b3.0.2026.07.31.03.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:22:31 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org,
	unixbhaskar@gmail.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usr: Correct a spelling by changing a latter
Date: Fri, 31 Jul 2026 15:50:10 +0530
Message-ID: <20260731102211.2327476-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

s/dit/did/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 usr/initramfs_data.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/usr/initramfs_data.S b/usr/initramfs_data.S
index cd67edc38797..e92fb59b3fba 100644
--- a/usr/initramfs_data.S
+++ b/usr/initramfs_data.S
@@ -3,7 +3,7 @@
   initramfs_data includes the compressed binary that is the
   filesystem used for early user space.
   Note: Older versions of "as" (prior to binutils 2.11.90.0.23
-  released on 2001-07-14) dit not support .incbin.
+  released on 2001-07-14) did not support .incbin.
   If you are forced to use older binutils than that then the
   following trick can be applied to create the resulting binary:

--
2.54.0

