Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA4C44104F;
	Tue, 31 Mar 2026 17:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774979431; cv=none; b=Jh0m9XpMFjCCr9NPSJd7u0RZkMNp1sD9+NO0tb8fo9NfYayZCFuy/0l1CmxiZgsZj1JDbrrCXZU//ekBaA3fx99YoPdXbYdIxBqkfCeEql2zBKc85YibHofV7coDxVMLyLYbDbGBNl+bcbcOJ7J26ezbxZRYGgyoXxVbwYsonvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774979431; c=relaxed/simple;
	bh=mchiqnGLvwuBQbG8IWLuJsEzw1XR8t0Q9M0wO/p/ov8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IsxWtqc/rxZ1xZK4yauZZCRiTE4rChwkXrtAKmQPdgzdYJLe1PA23OVFJJGRqyOlObY/3kgJhRJBYIu38BJRR9JS5krVLPOpHSwbKYuuw88U4zUuDLdhdzkGgpkrI5Y/gA8536qfFiHNrhFcaaqACcQFrh5t7dINcKw6HlNogD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=MwDF1okm; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="MwDF1okm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1774979424;
	bh=mchiqnGLvwuBQbG8IWLuJsEzw1XR8t0Q9M0wO/p/ov8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MwDF1okm2Jn1oYi7gJH57ye6nxlTU2H5q37mxouYuD9UtlkvwqefinKMPwYOBmdaR
	 u626hClTt2x6tkjWD4cX8/BCVTcv04jqnRM5v6+z5WuykCEZS+xk2cTH3Zv3c/Z4yq
	 Y0k7+pBPdi19IVRNd+zShr+VrERp90KCWxkdcOAY=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 31 Mar 2026 19:50:22 +0200
Subject: [PATCH v2 4/4] kbuild: vdso_install: drop build ID architecture
 allow-list
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260331-kbuild-vdso-install-v2-4-606d0dc6beca@weissschuh.net>
References: <20260331-kbuild-vdso-install-v2-0-606d0dc6beca@weissschuh.net>
In-Reply-To: <20260331-kbuild-vdso-install-v2-0-606d0dc6beca@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774979424; l=1081;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=mchiqnGLvwuBQbG8IWLuJsEzw1XR8t0Q9M0wO/p/ov8=;
 b=nwT9Glu3YuSBQKSvRFBt8py6D2MndrvZJgRuRfYzeE5RfEkThF4k3j5p+d8A/j21rYl3g5Uyi
 zWm39DPESMUDg4sKGYOmnSFacvD4Po83ouk2cqbEKz7JNqvVwD9a/jG
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Many architectures which do generate build IDs are missing from this
list. For example arm64, riscv, loongarch, mips.

Now that errors from readelf and binaries without any build ID are
handled gracefully, the allow-list is not necessary anymore, drop it.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
---
 scripts/Makefile.vdsoinst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/scripts/Makefile.vdsoinst b/scripts/Makefile.vdsoinst
index 3de70218b8d4..d9f7243217bc 100644
--- a/scripts/Makefile.vdsoinst
+++ b/scripts/Makefile.vdsoinst
@@ -19,8 +19,6 @@ __default: $$(dest)
 $$(dest): $(1) FORCE
 	$$(call cmd,install)
 
-# Some architectures create .build-id symlinks
-ifneq ($(filter arm s390 sparc x86, $(SRCARCH)),)
 build-id-file := $$(shell $(READELF) -n $(1) 2>/dev/null | sed -n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p')
 
 ifneq ($$(build-id-file),)
@@ -30,7 +28,6 @@ __default: $$(link)
 $$(link): $$(dest) FORCE
 	$$(call cmd,symlink)
 endif
-endif
 
 endef
 

-- 
2.53.0

