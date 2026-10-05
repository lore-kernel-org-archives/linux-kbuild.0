Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5904DDB5C
	for <linux-kbuild@vger.kernel.org>; Mon,  5 Oct 2026 20:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791231905; cv=none; b=tW2NkWgkmeMHCDHK2sTDljS7oTCcKJ7u7vch3YXykM+6r64Ap1h4Rgr6T/271MrGVW92wc4u7a1x78/E/zn7xGdZVE7q6WhCSGDEvTjxrJ2OBZ59PYZ6ddQ9v1dAmrCkmjC5zlodR5DYnTqg4t0IbMmSoNSolTTXEHMv87U3ykI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791231905; c=relaxed/simple;
	bh=Ato9zk31HKdJV/Amow1IntJf8hff2tqic020xwxddww=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E/EonLj6svYuxcEKCPO0yryZVhmlOTOZwA1slDgHMHGVMvV75xHel/oo8ts8SKuVktv+Omx+g3EA1dsi/exAP8zMFppkaTdv4UB9Oj/l0AlG2S3TyKVnmrqSFSp1+npcKfsf1EkNYarELn/FxnWP7WjnaDWfmyMMelnXt2MbpMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VtQNmDc8; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VtQNmDc8"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-8226a912bc9so2718642a34.2
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Oct 2026 13:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791231900; x=1791836700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ls3CBVIE383Zf0UiuPGgAzT1wZIZYrRMGVg+IGaAqgo=;
        b=VtQNmDc8plFA6b7Nhy0zH3iGKcmoXBq7Wn89uMr4I7nNB/25Ixs92q90cY/+uJaLIC
         tEsTNEmu8jX/SooSpDF/ZX27AwBNoe99VH37cOL0rvGR4B3uLJmwOohc9jMffs+ozEIJ
         FvqMpXbUfN+7YzkSGY2YwpcQ9gDOrt+rYAW1HIIK2aQ68A2XXsIp3wHf86zW871f3ht5
         4MnodD10S8hUQr+/rQRgAT6hOCmZH0WaQyFt0315pvfr0u1Vyvg0KNhZS8ZY24t3wh4/
         Ot4j3qBXtUiOGddq8zt1o3iUATdmWgItjqUnEmqHGC7R6n8uScH9ErcRloytOyLmh5b/
         Cw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791231900; x=1791836700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ls3CBVIE383Zf0UiuPGgAzT1wZIZYrRMGVg+IGaAqgo=;
        b=b8EUhQFQfJHoDuPC8tnufCH4ya5t+7c1wBuY1rSqHGDzAdZ4nk39VkCM+eERtxERGN
         Byp46qcQ8k8fUB/weQzgDkjYvCUgrVhWrnbLzyGdMj4RFjGZ5R5abEs+Ydc9Xyid3iRX
         Ruj+i+QefuQifQSBdp1q0r+jMKcVZIdzUFKAV+ExmVukSCI2vbsXznBn5cioZ0SeS+OV
         YzWLlhSEqiaO/IsxzdOpNbh/ighhKrn8V7ZHeW5OQd95fXTEySV2yNKNXM7MuiO8k+c5
         2LE8rxJDZ03k5Zhc1iQi/gmDq2F+AVNk3r78i6sM7yVBzhlCSH6iWshyIhtmifg6/gf0
         HM2A==
X-Gm-Message-State: AFuF++lP/i932QcVYGt9bOhfd/YTkV1tdzZQbXtWnE/jN2dNSeWPerK1
	RqE3rKlfRwvGpQfJAMYnfna5SBbsBNXZTPhOWU929e6GWvWRp3DmJlRSFbNjkyZp
X-Gm-Gg: AYBFou0QAmcVG3FxArmKCwa+8SmPZVoexW+SAWaOMKpQ7lIefJqxln2MmHktgjIV8JV
	QNuLYXbpaWUsCacnlDUwZ6ncQPjT1LF19V9x6AhuxpsIqUnUvzatPARiTCvllogg6+Z0VGbftCb
	TdTiX6aye2GESt4Kgo8lGwrcUzh3rBbFoXs3N2ZdH4Ljrl0TxzbiST11hV5p3puKaCFMIlLCA17
	FzumsjpDNfZQmelMBmdumgz7uOUvzZ7/t+pb4H8tpmhbQE4EdNQnUt5WULRr6e0ooz5QMdgnlje
	pVG8SbKp7Q/ifz43ruEt/O1xr6wxlLLjc/kM2qDzRqS/rNkvi1t8wbCMpGcAdVYGdp5oq7j4SrB
	mjE7RpAOIFuv3W11uOsHHjEluvAZGUzzQEWAaLUoYcrYvuMGrV5p8MlvEW9SbRvO5CXkUjAX1tw
	jEove5cqXj82MhyOnKX50+7+ffwDLxG1VKjBI1hwUxyVyAfLEi4Cc1PD7xIX6BolbP4k2oLzH/9
	p44vm76dpC2
X-Received: by 2002:a05:6820:200e:b0:6b7:46fa:169a with SMTP id 006d021491bc7-6df34c6fc30mr9544328eaf.47.1791231899934;
        Mon, 05 Oct 2026 13:24:59 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6e4c404e317sm321754eaf.13.2026.10.05.13.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:24:58 -0700 (PDT)
From: lzhan011 <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: fix infinite loop in conf_choice() when no choice value is visible
Date: Mon,  5 Oct 2026 15:24:51 -0500
Message-Id: <20261005202451.3461265-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: lzhan011 <zhangleizhen645@gmail.com>

If a choice is visible but none of its choice values is, conf_choice()
counts cnt == 0 visible values and finds no default. When the choice has
to be asked, e.g. because a new symbol was added to the same menu
(oldconfig, syncconfig) or because stdin is at EOF (oldaskconfig), the
loop that maps the answer to a menu entry never finds one and the
while (1) loop repeats forever, printing "choice[1-0?]: 0" each time.

This happens in the tree for s390 when the compiler supports none of the
-march=z* options (e.g. a non-s390 host compiler), so that all values of
the "Processor type" choice are invisible:

  $ make ARCH=s390 defconfig
  $ sed -i '/^CONFIG_NR_CPUS=/d' .config
  $ make ARCH=s390 oldconfig     # hangs

Before the removal of tristate choice support, conf_choice() returned
early in this case. Do the same when there is no visible choice value.

Found by fuzzing Kconfig input with ASan/UBSan.

Fixes: fde192511bdb ("kconfig: remove tristate choice support")
Assisted-by: Claude:claude-opus-5-5 libFuzzer
Signed-off-by: lzhan011 <zhangleizhen645@gmail.com>
---
 scripts/kconfig/conf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index ca6d9d735..31c6fd25e 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -483,6 +483,9 @@ static void conf_choice(struct menu *menu)
 			}
 			printf("\n");
 		}
+		/* Nothing to ask if none of the choice values is visible. */
+		if (!cnt)
+			return;
 		printf("%*schoice", indent - 1, "");
 		if (cnt == 1) {
 			printf("[1]: 1\n");
-- 
2.34.1

