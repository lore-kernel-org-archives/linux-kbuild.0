Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5F13E6394;
	Wed, 19 Aug 2026 07:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787126035; cv=none; b=XOVnoqTjjWZmqh67hNJFgR+XHspmvjAfXsJGWE9vf+Ac7W3QykVeBGoGUPu32utSWweVPJsAHVM9tbbArQ0yFhJs/x4Qw6KJkIR1scGCosTi5f6+H/YzBAp34Y284VNCcEM7wngL9R6HOzQL4pmCnlsKw547Yswg8z/B0P9tLEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787126035; c=relaxed/simple;
	bh=JnSct6/TsJnnEleSEqx+8paLEEPPn1nK+NoZRM45JJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X0Y7/P21pyOVHYSDmZkePlI7x0o//qkcwakZcrWsByI/uc4i1i11uydvOSLEtUtwN+/9cDvWJEpyWRydx6bjfKlvHY1RL9HaTrIndRnqRCxGsjDGocvyvsCwbrXbUlj7fercI7vARLr1p0z6f93oGit3c3lPrQyKdmWaFQNl0WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=O8Jz1nLQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XfrdsHs5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="O8Jz1nLQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XfrdsHs5"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787126030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lwfkSpt6me8XnSJlkua8zcfI2vpApiDhn0AHO/A/10c=;
	b=O8Jz1nLQtCW1jlxJ777lyj7fcICcw+NZXI5Xj3QOiSn+qEkg3ysQw6ydfPna45AHQx0Mym
	8897MLRzU0Q8+euAxdoNvy1RE7wzAyCjT94ZP4LB7qlR5EiRc6tDc01ctYvPdFRjOgROHA
	Zn3ghbCfyH0cTN9/MUjs6+y/y5kp+vRDy7sB/9bqepSucd3OBtyZzED+7O01ebeDK4sRHw
	5VWlxCnseNbCSlZDKA2bNowlgrcn1FyBqYXsZZWTDmp90LVEUO4tjI/VRFGDfpKqmIWmB5
	+XlpMQ+YDblM0MM9cri7wyGISeS5x7XrKvBUFvPqg9nUvJ16Q8mPcPperadxwg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787126030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lwfkSpt6me8XnSJlkua8zcfI2vpApiDhn0AHO/A/10c=;
	b=XfrdsHs58VLykoM4EcVEWMxkZ4YTv2qQ9JNbx1uOwvyJ/egE8hWNnvg8w2c2v5qyg7iBPG
	pGt4d0ZDoo5TitBQ==
Date: Wed, 19 Aug 2026 09:53:38 +0200
Subject: [PATCH] kbuild: use prefix-map for host and user progs
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260819-kbuild-prefix-map-v1-1-f5168b96fac0@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0NL3eyk0sycFN2CotS0zArd3MQCXdNEA1OzZMOkxERLCyWgPogU2Mz
 o2NpaAMlbfVZjAAAA
X-Change-ID: 20260819-kbuild-prefix-map-5a056c1baa98
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787126024; l=1085;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=JnSct6/TsJnnEleSEqx+8paLEEPPn1nK+NoZRM45JJg=;
 b=6vkEXuMuZ8kYZw6mgbtBT46pbSO4uZ5XdTJzvts4FT3vJQ13i2tv3zSFhCH+vQcF1AhnIAtk/
 h/O7+F3I/eDBv7ToIUUMlEwdGSofABSUOSRGtTISOCoGr/po8wcxdek
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Host and user progs may also use __FILE__.

Make sure it shows up canonicalized, as in regular kernel code.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 130926fa592e..322b5ce9f218 100644
--- a/Makefile
+++ b/Makefile
@@ -1188,7 +1188,10 @@ export CFLAGS_GCOV
 
 # change __FILE__ to the relative path to the source directory
 ifdef building_out_of_srctree
-KBUILD_CPPFLAGS += -fmacro-prefix-map=$(srcroot)/=
+CFLAGS_PREFIX_MAP := -fmacro-prefix-map=$(srcroot)/=
+KBUILD_CPPFLAGS += $(CFLAGS_PREFIX_MAP)
+KBUILD_USERCFLAGS += $(CFLAGS_PREFIX_MAP)
+KBUILD_HOSTCFLAGS += $(CFLAGS_PREFIX_MAP)
 ifeq ($(call rustc-option-yn, --remap-path-scope=macro),y)
 KBUILD_RUSTFLAGS += --remap-path-prefix=$(srcroot)/= --remap-path-scope=macro
 endif

---
base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
change-id: 20260819-kbuild-prefix-map-5a056c1baa98

Best regards,
--  
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

