Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2253BB12A
	for <linux-kbuild@vger.kernel.org>; Mon, 17 Aug 2026 23:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787008279; cv=none; b=kYfjqMR4HmUNHv8JQIh/eV2RwBOdt4G9CfznLRNvC/FoAtEcLJIdJInnTYEwJisCDIKqPU3zarArQCRtr64rFirKhIGlKwjwv+pw87tsucrvjpLZyuVRGHv18EEBatn9LsikSuZG4rK2Y4VDrn1d5kF/XKDurpi3Kb5LI5Ea5xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787008279; c=relaxed/simple;
	bh=bom+sO/3itmB4RbdUuIFtM6u7kj2BzzYmX4ckOa7QOY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=rkktQuNvRkJUCh3wVOPnTQc4cXg23nsr3Ff33KG8ZeblW0N02co6dR3edbPga8tfoQrXSO9lIBTQSF4+Jty9NJQ4TkyBe3IbAe7e0SltxzK4d5BxE7QlNLud7/B/JBmjTUD5g8mnFFbT3ts13o17pdDfrf1QV2cXTDY570aZXUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hzj9MU8F; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hzj9MU8F"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51c2a76536bso37937451cf.1
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Aug 2026 16:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787008277; x=1787613077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PTQLSacLNQAZe1bmh5PVj19bRQdT+z6zMy0cKH0987M=;
        b=Hzj9MU8F/JQYCFk7MSte17ovL7MkrsPw7Mc3IR38Krp245M4jJ4F2zbl94m4Wcn3YA
         khqNYOVISwgjC0DEE4x+wtzHZK3EpCJbyXlYAQ/pl8A/VkGhqijex8f+5CPvmHo8A0Cj
         9rDTFmeZT9JGsedChmj9ny/LUEWh2YZGRW1cus6sP/iwzKl59YoKym8DdDoMHNt8TR8x
         UeldBit72R8BO9BDLvjDU/lAzjFvYvO65IGYSfIIkT8espv4U10yIzwVBlGWpu+Q1nIP
         UaYA7hmrFFyIQZcDAg5VE2fJlYEGTJSwKuz8nN9DZB4TmdQz7/aRGfroOeC+P0YRdj3q
         MmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787008277; x=1787613077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PTQLSacLNQAZe1bmh5PVj19bRQdT+z6zMy0cKH0987M=;
        b=DQZDJYytqhLDkfdMy0eDEO87v08pEiQBt1W+80yYMwLTnhE2jC0Q/y42203JjGFhkE
         TjcuyFRU06L6yFMIC8Yq66OxlbGAS65aPuqUw38/BCvHHAHhMgTzuCzEKISu0yBrUJpF
         HuWl2R6dYXejG44o0gkgOSbc79tAEbYuOPF2VPdcVESrkala6aJuJIwwKkxnS8IHS3wA
         U9MFoG2FbqDQ8VnVF/NTgFIc6HSv+ctKba8+WqeNQPs1LwIX0dIV0Nw/5pRhz2X0V0A4
         1t4O15gJcorEwtNflqa9iBNmAgXB1MHFV9HSZxM89ka7Z/t4myPwGuIF7wJlint9uswT
         vUTg==
X-Forwarded-Encrypted: i=1; AHgh+Rrj8gN1zmPvgPEcfv+GWbZ2FwvHgSGnUWyltyMvOqjpNPxv44AYVSB4Qbd5wqi9xllipByRduNUbrN+ioQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1QQ09aM6eI/cs7+UbcoN7rzF+3rUoiBN+psnjifhIDudtgF7N
	e26ukNloMemLTVdNdbx8a8Rta+YRCJAkk2O6o295bO9mjwwcGkdANj9P
X-Gm-Gg: AR+sD136OFHdLCf015v3L5OrSIhqb2FA5ReBlFi+IKthsg0qapX0t0xYexchpPL3ebt
	r9BU8GuBybP0xaOdjDT/wCDUYpf80gMTymiDaq2ijMDedE0FcNsruBKbhEylIGZjIsxO2HdZh/c
	vq3BNtGOxCAfkuk/sRoqe31ZwMIxlfVEhZ6bQ63uTdtRp38YPb/t0OLQWS4QMuNIOTsZvn/DKu9
	WnLkIgS8ghaaOYWsNNwP7MMtbQDA8W5LANtmfvaXOQCab0o2wEzXXXpo+EqD4ZKGT0z9+YSmob2
	fLnh8OwW2OxYsMr4sWIrZ0G/LzojsKHheh1PhiK7RozfF0mqi66jxS4NqHkCaIzGGMLETfBkNt6
	eAc/T2SNyQ2hR2Gp5c9buneL2Z3KBZoOtuxlyW7j8cV21+MAGtvQKL0EpFd28/0yaii5DZoQoR2
	BAhhWRbdjagUU7mcJri27zIoGHFUs/wKOJpn+NYv+5Yhn3FLfbJtS3uFva
X-Received: by 2002:ac8:5e49:0:b0:51b:ec6c:766c with SMTP id d75a77b69052e-52d853cb00fmr294206011cf.12.1787008276782;
        Mon, 17 Aug 2026 16:11:16 -0700 (PDT)
Received: from Gentoo ([158.173.25.156])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c4567a2a1sm19530756d6.0.2026.08.17.16.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 16:11:16 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org,
	unixbhaskar@gmail.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scripts: Make the code use consistent syntax
Date: Tue, 18 Aug 2026 04:33:34 +0530
Message-ID: <20260817230915.3860140-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code was using a different form of syntax. So, make it more
consistent with a similar kind of syntax.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 scripts/mkcompile_h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
index 2596f78e52ef..bf0d5669d9bc 100755
--- a/scripts/mkcompile_h
+++ b/scripts/mkcompile_h
@@ -11,7 +11,7 @@ else
 	LINUX_COMPILE_BY=$KBUILD_BUILD_USER
 fi
 if test -z "$KBUILD_BUILD_HOST"; then
-	LINUX_COMPILE_HOST=`uname -n`
+	LINUX_COMPILE_HOST=$(uname -n)
 else
 	LINUX_COMPILE_HOST=$KBUILD_BUILD_HOST
 fi
--
2.54.0

