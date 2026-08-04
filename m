Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D82E46C83E
	for <linux-kbuild@vger.kernel.org>; Tue,  4 Aug 2026 14:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785852896; cv=none; b=UPwaRroUBF2EooDLjP6CtOv82xIqCvxsSBrJoxLQjz2TFIVngOPgP5qao8IeKceBnwoigOvNm+sBlkldKyfuZM6qIbqz7iC5VpizD61UUH/xxGrR9d0iepE8mRmAehe/3A13uhM0J70bBjK3dNCB4BmzbD+vyLlys/UcrgfA+cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785852896; c=relaxed/simple;
	bh=P+vjawshhcK66kpzi+ttzhrOzeylTFmVFIjJIijqlWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RLYgDgcWeW+f3HxYLmIck8EkBKEQdWRvgGezNmElpJJPbNKK9YWrU0WshOELaJCEWwOiblH3x1TlltepoL6z7r6mvYuOjgCwfImRfWkL+dzXSvq/qWmHJt/zPtmbospUl3d3lFEc1m8+RaR1M/DwJjOY7na1yrBYqPlDyf/sGs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hRe28OaB; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hRe28OaB"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b966dd74so18593155e9.3
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Aug 2026 07:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785852887; x=1786457687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8W3PWSGOXwpEy335A7Edw5MasYhAcjkF4w8RpVGlkRQ=;
        b=hRe28OaBU1aKYpq5dRFROF/ubkgmUBQ2CqGW+zi/yfRAuDFF8jd2r7gEgI4BMd/76b
         TruRb86SRAppXDjk/1PVN5E6b78x3tkrpqrt9sDH7Q7G8PJOBGFeG53kMeZHW7UeH13B
         nEKOVpE5KKgPyQ8VNt0er3PWmDtGSps7UcQJSesEv647mCn43xOqDeuxhU+EQaK+YVVz
         yOJC3ortT7xL1LmeAkdR5AzqbuhODPATSHCKYP6/th+iGBvZnMeS5r8WLCYcfoJKkxR1
         vgAjYZoIs0AePkyAkBmJBvS2O+Rd8UetQU4Lk5aaMtOjGoVQbqdjCoWL6Y0AX4Y9qAp/
         zXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785852887; x=1786457687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8W3PWSGOXwpEy335A7Edw5MasYhAcjkF4w8RpVGlkRQ=;
        b=oS83x1B2veVY2M58sXIGZr0e65+Rdmmprc4sSnAxcRv6f6JvOHyqdOYi1jQ+UNeKL7
         oGhrxBtndtzNU/Qms/qVscFStEHzUBDzEFHbGIMP2VLTQk8HhVxtftIZBTnXpTyGjrkK
         5n9cB+vGv3rOw6fROIkRVwQwNeKCGwbrzJVeT7Rr+AKdv49155Y5jAUayNdzz+hXXB/A
         S1CwkoBpXid0cjOS3RtAEwsU6esjr4V87poi3MxTg1zr2o8S04rt3oSr6ZN7Xl/8Ea0R
         8JbyKwhRnKt96WlAyC9LdoJC0hsLrTJviRO6HAgcDzMuEmUD+VvNP5+vPbuXC0o3akQU
         kgoA==
X-Gm-Message-State: AOJu0YwmXxaYjHDsMTp3pXRq7ov55Ka3KtiADGpYWfqQs5Tr8ayjY2t/
	wNLlD69GQc+NAJ3c2X/2L0v4fXndbQHqEjbmEt8DxGFudJvxfBqNDLnW
X-Gm-Gg: AR+sD13qkBliejtJjtKvklmXHOpg9xnVCZ1FQs9Pr6lVyM0VywQhemRkqqatFOuoaVO
	M4S/e4ElpQG6Us5oSLeNwk3pODiNDsX9C8GYDyN+lQGiPSrJGROzOcnYb1ML9tclPd1cEKqKk0n
	QaztN/xte1kvXpdLedgtmssJEnV4tBn/nQ/pkMkWmbbahzZLfRScg7UAvmEVKqJAez+7sWHmjag
	Aq4sGW+9FaZBxWs111KKorFiOXRzXY97qbgx882GmtNAxWcdnUhjgsF8SviPLobMxFv7/9/rBob
	UKm+VPrWn0NzaaWX3RwowvQznroRXiJ+68watc9Y7ewJs3tnltpYGLzGEgBrdcRypwWkKOqhMWN
	eT58L8KEeZ9KhTcC1j6vJ7/u1G35zCDDARRdsvo0ogDEFZg3MSEf6yCQBJurezdpxHI0D25jWqf
	oXcN453D34IIueBEJpUCAIoniSPo08l2sKKSwpawTJNtClPujuLDjDYabGBalFuS+bMienrlULU
	N2jOaJXdFvZno9ukBSQkEgrcFX5L66EhRUSVEbb6tmdqXvIEBWmbmx2ZSMXZDGw
X-Received: by 2002:a05:600c:6092:b0:497:ff28:6deb with SMTP id 5b1f17b1804b1-4980c64b8bfmr408949505e9.11.1785852886684;
        Tue, 04 Aug 2026 07:14:46 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b2a61asm233702225e9.0.2026.08.04.07.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 07:14:46 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nsc@kernel.org,
	nathan@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] MAINTAINERS: add Julian Braha as Kconfig reviewer
Date: Tue,  4 Aug 2026 15:14:36 +0100
Message-ID: <20260804141436.1451211-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add myself as Kconfig reviewer, as privately discussed with the Kconfig
maintainers.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 03febbc91a06..e248136bf3dd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14029,6 +14029,7 @@ F:	scripts/Makefile.kasan
 KCONFIG
 M:	Nathan Chancellor <nathan@kernel.org>
 M:	Nicolas Schier <nsc@kernel.org>
+R:	Julian Braha <julianbraha@gmail.com>
 L:	linux-kbuild@vger.kernel.org
 S:	Odd Fixes
 Q:	https://patchwork.kernel.org/project/linux-kbuild/list/
-- 
2.55.0

