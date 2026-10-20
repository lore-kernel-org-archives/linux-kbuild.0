Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792476658;
	b=cE9RxefMJKkJdVlhBmHcWy9xIq/lmR5CsschyY71I/6HFWCKxIm103NzGY19DO8oc/XE
	 9nsYxkQ0imFiGDATJYodBFJpaOcfM9YcVXCMc+jUACYSyp5Thg7jGFyhvZF9GTkxtxTBA
	 v5zVkcocx8BerqUh4Aq1U8L2f/pIJH3Iz/A2mzS53TXn34ENaDu5bH9qhtrKS6znEpJvs
	 ecirA/TWsG/HE6dUxTa52BcglSDEKQIyR1y0LZi3SpCevUNnLuMQsN2Dx3e4i17LlSyBG
	 6NmJZu0+jD6axp0WsWvKJDdmPkWO6xoBzvrBXBHkXv31k0iP22SlfbvhZ1fvUwr4FhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792476658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=cS6pFcdr0G2iGELigekAsBdFkK/RBG24WDWNE/2IQ9o=;
	b=WBXmb8qkBFntS1/N/hmniTe7q0OYZ//Ouqr+YqJZAaN6bFmetbRYIuTB7ZZSAYjYgY0A
	 CSILzIJ2IJhTLaAgs98DHRS6KOOiHifDaCdUgMv3hOIGfD92aus7M6uScgYTLFom4EHq4
	 n55bVKisSsOBa0Ol2i5WddN9TfHv34wT9dME1lsvjhegiw6Nfs+3wX9Q3nHHTkYpsyfj8
	 9jV1FzIcEYUlzBMVqusUsGOVeiYa4OpDgL+gRZeBes4LSLJLWl0SWIjpzgZVr9LrQ/s0h
	 2eXQCLy/uLA3nxqyyesZpc+MpIkZ6il+fNtuaVDhioCD1nhav1tLjULo7hBzMtpSFlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bwbzEbCB;
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11B0606A322
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 06:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E11B0606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bwbzEbCB
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be47aa555cso2969869e87.3
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Oct 2026 23:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792476656; x=1793081456; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cS6pFcdr0G2iGELigekAsBdFkK/RBG24WDWNE/2IQ9o=;
        b=bwbzEbCBKLILFMcjDjfHaekztqM7Pyji2tFufkZ8htUzXdgMg+CPqH6tgjR0Nz84+g
         q8D/v3kagHhkZMH1nqqK3ZDki3gyzly0NzhRzk6c1mnXH6gnqn8zCvqxK0CIVBt0DuRk
         ykaHaW1H2mfano4cteTwnuS/YqTQ34t6DVFpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792476656; x=1793081456;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cS6pFcdr0G2iGELigekAsBdFkK/RBG24WDWNE/2IQ9o=;
        b=YU99kwvio+2HzmmP8s6EzvAMRNbXkFJQY9F6ePoISpVFMchFzGWan4WQYBggHPqznM
         5gL0ZM1hbTuDUolG3qgTnaO5fISW8GJKt/4n6nRq+Hnf1lw2PyuKTc6rBQEPhtx2+xny
         E2c+ns4rgKqEXPHbKW0LjC0TFl9yW1+gPKhjKUjtuxfByS/XAj2o7gMz0kftHp90Xo9M
         3KpkZKpxmrcyZvM36TIuyy1Ny1V9d//hOQDfRgw9TKaJp0ToP3iZY7y4Lx9yskihtDFM
         D4ZWEqe0QVu4O8mxqIT7rlgsJKFeb7v3PRAtlDvmzk4pFUjxAXm36NOR+olNZA81L4TV
         NyXA==
X-Gm-Message-State: AFq9FYLlluXWQyjAsnujil9haNrBOr5J1TB78I+TFiCeDj9eIha3GTpE
	Gu6J7AqUJkIC44tCHbrji5V5EnSecRqVlB5V3a/5rPGog7PoOMaxZyXJx5Q0Tttm+A==
X-Gm-Gg: AYBFou13KuRC1dWlXtg9NjAXYXPZsl/flQ9kwFWrOaLH88ByHqPorrxwVl8LMXGpkXp
	6eZRi2uViFOHPT+Z6aL+UdBnCbwRYp9o49PHtX/cOL/Ze6OJ7kCls7HcWRhIchtXY9E7Fi4q6Ev
	UDVlvjgClTyVaVaQru6UKNOOwM3IM9l5TPYpBuEfcl7UT8YUHha6A28ilciga5meimezx1xbuAB
	KOglD4Rqcoz5krpQ88/yesvxrWO2JqIjxZwIggDZoDAiUM/hzJUltJmJ+8Pf3EMBL/iU0y3ikDx
	uIfPfs5Bqgb9hi4eOhOtYQ9tJO6f5ViAXVLsD6RhLDtLRkhPbXvHyZJCGOtPoxX+t9vMRdjtyby
	WkSwc6ruGT64kJBxSnReLRW1u3wk301/UhRgr+UB/zh3n1ZehXoqDmRaUquQ3OjgVAXCnskctSK
	55Xdmc2S5msqxP0piWyz+H5YmpXWzn76etoWorcjCEmhOWpkDfNqgPK7tpQpQCo8GI7wCzwfODk
	bBDTe76gEEiDNqdbCrHvEhRv058YzT6bd0wTyJB5uxS3NQ9J0iIQz4=
X-Received: by 2002:a05:6512:3da1:b0:5be:4ed2:1e22 with SMTP id 2adb3069b0e04-5be50a81189mr3184228e87.51.1792476656072;
        Mon, 19 Oct 2026 23:10:56 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a3fce99sm2370782e87.9.2026.10.19.23.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 23:10:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 20 Oct 2026 06:10:52 +0000
Subject: [PATCH] kbuild: pass -fno-pic when probing for -mfentry
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-pie-v1-1-9be09f2324b1@chromium.org>
X-B4-Tracking: v=1; b=H4sIAOsF12oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyMD3YLMVF0zc3OTlDQjgySDtEQloMqCotS0zAqwKdGxtbUAaz1zzVU
 AAAA=
X-Change-ID: 20261020-pie-6774df20b0fa
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Julian Braha <julianbraha@gmail.com>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

Some distros (namely Debian) configure their 32-bit toolchain with
--enable-default-pie.

To properly probe for -mfentry on them we need to pass -fno-pic,
otherwise allmodconfig will fail with:

./arch/x86/include/asm/ftrace.h:9:3: error: #error Compiler does not support fentry?

Fixes: 454e00cf8ee5 ("kbuild: avoid re-running compiler and linker probes")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
I found this while testing next with media-ci.

Full logs:
https://gitlab.freedesktop.org/linux-media/users/ribalda/-/jobs/113299249#L4729
---
 scripts/Kconfig.toolchain | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
index b0b9a663ddbe..53b361cf365a 100644
--- a/scripts/Kconfig.toolchain
+++ b/scripts/Kconfig.toolchain
@@ -170,8 +170,10 @@ config CC_HAS_MNOP_MCOUNT
 	def_bool $(cc-option,-mnop-mcount)
 
 # s390-linux-gnu-gcc did not support -mfentry until gcc-9.
+# 32-bit x86 gcc does not support -mfentry in combination with -fpic, which will
+# be enabled by default when gcc is configured with --enable-default-pie.
 config CC_HAS_MFENTRY
-	def_bool $(cc-option,-mfentry)
+	def_bool $(cc-option,-fno-pic -mfentry)
 
 config LD_OPT_FORCE_GROUP_ALLOCATION
 	def_string "$(ld-option-str,--force-group-allocation)"

---
base-commit: 3d229ce89862b8e82d71a9e11d6f840ca272a6d6
change-id: 20261020-pie-6774df20b0fa

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

