Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2294A471265
	for <linux-kbuild@vger.kernel.org>; Fri,  9 Oct 2026 10:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791541164; cv=none; b=JHI0MkwZEJORriiIdcnTwk8UhmDdf6kv9QYvU/XgbOJ+ZYgGgBqmCqbO1TQzWaouXn4Q6xi7ncK9+/GxovkjZY2oxve+UwclqCjHO3jA0YpQeiNHTf3YCIQPLdl/RFHOJ98wI2m1GejGHHHb0aRen9fFnU8i4y6bzSjdHkImQgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791541164; c=relaxed/simple;
	bh=8cixHCL/2G57Wkvwabe/1EbioTWhZ4LSnUxA9fXVA8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nS80x76GKMSh0WygEXnQSeBN1jjTdJdfG7jsJfnGWqz8pnAtYZPw7anJHE/r2wqr+cLw4idDoV4g2jqe39KwiEPeP7lHoyYeBoipfDYHYrhuu1N69A6oaOUfG3yd0EMODheIqCrnrVEnI1q9o7+NDTa6SN/0FTtUe/TEjekWXks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=egicon.com; spf=pass smtp.mailfrom=egicon.com; dkim=pass (2048-bit key) header.d=egicon.com header.i=@egicon.com header.b=gcRZOpTZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=egicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=egicon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=egicon.com header.i=@egicon.com header.b="gcRZOpTZ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so11405835e9.1
        for <linux-kbuild@vger.kernel.org>; Fri, 09 Oct 2026 03:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=egicon.com; s=google; t=1791541160; x=1792145960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DyGMCGtg5FlToMVE2JvbolYvVP9QNvtBAQgSJYZkupU=;
        b=gcRZOpTZQRnq7KftafRspcKUcpIE7d1urCKBPfBg6us2NE2ho640JeccDJuog7NYfw
         52zhsKEl5v+YKRJSy4c3oAJG6ADtfruoGyaxbpJIgc5/soLq1Xn7NHDtfjBhCpsIErJO
         mdxbuS4uZJPx4qajHRXCtbvWxRqIf5HRFReL9G8ZD8Ae8xuNooAwcRG2absuzxT8jTm9
         3PTJZtILvsNTCqJNOFrh1RzP79JGyTExTX8/GXGF9erHve8S2jNiSo1NJeuFA2OXeUna
         6FReyAqFf9L8U27BNCTmO9PxX6JGjat0pMveoHjYWlkIlvXnyIzJbMA1nMDUDd9Q8pG3
         G/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791541160; x=1792145960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DyGMCGtg5FlToMVE2JvbolYvVP9QNvtBAQgSJYZkupU=;
        b=027kW5GBm9NOFwph+NK34+/qOFDvrZ/vXIWXiKsxTbXe0mn6HbdCN+HdjEFdziXlOs
         Z+XfA2kGBWJu5kWeApMljofIlcaJNQEzpEYwXX8ejwaqQXFk2cdDVO7NK++YAbHgT7Hc
         zr/2RyEiLmfb4FA1kXESlz5zThfq9U5dNc6h74lM7ylB/b6QmzhA1DohsF6+LhMe4RBz
         cHdUIFoVTS4ZAei2spn0QJU+FjtRc2B+oCPZVY0xShLm5seLVZ4zrCbRPxDSdWuIWvqu
         fDUa9IpILj3HPkY6v0Tj+FG+zBzE98SK3zsqfWKoTByZpLVJn+Sysy0ZxqtjqPQIZOL0
         ntIg==
X-Forwarded-Encrypted: i=1; AKwUvBxsXLGrldVfIXLUN2miunlFAThZXW52Zs+lNrnziWCl+y3oiXRFiopxePPzLVtR1AjzZh3tJ2LdPM8tq0k=@vger.kernel.org
X-Gm-Message-State: AFuF++mnqN90CPcBihmRZoWNydra0H1NpIfvgsgnPVWczq9sBeXm3s53
	z88Cfcd2PZfeP3aCZnAFh0NsogUJn54abdUClGdXUb5ehSVwfottQMAbZ9G6Q2wcvQ==
X-Gm-Gg: AYBFou0tR11XPqtaVRHaldUrTQWbsLrQZ7hnQ7tHmz5FizY0Wvx17LkjY5sKu0G7myo
	+GVZE6Vq+42vYk1XgpKiYmG//iHNpgjRKsZsVcuYGecfEMbiJJfYXvQCrYay6ZkLCkCb/jzd/Id
	EgrTR3efKfb0QXM5jNv7Rk09V/wjxFigP0RJegvk4sHbIaNPTl98E/u3OgNX3X2SnF8oLWx1EhE
	sgRgSZTOUiDAIoyhWhL2Tht2qui0ttgzmLG0st6MnAPPw6l+rk2LXXl2QDT+ho/Te2Hpr6vnTkn
	S6uSBvujED2Hh1TfVnlaqMlkp4tMksTc0YN94e3UVRHsE5+JDRC+H8F8WVnhyTFravMQLPP6VzH
	1umSKDQXspGgzmVrb5nFsv5/7br49gK/nyxUt3iLPAWqmQrh5xrH4L3MhTgqXoItwcCDfVJCiIi
	RzA4mIkrqFmw+2mvjzBqJ5baB/p8xBJvECh4whT0G7LfoLgiJqAN3f1TtP0sY/E3l6J8KTeRL9O
	CpHJkOE8yTxoyZ5sqhLo34S9eXrvnTc8AmYMHos+B8M0kNlVt//vu8Ad2093h3wVA==
X-Received: by 2002:a05:600c:19ca:b0:49d:10d6:fd55 with SMTP id 5b1f17b1804b1-4a18e4487b5mr26368395e9.1.1791541160293;
        Fri, 09 Oct 2026 03:19:20 -0700 (PDT)
Received: from xpsmax.egicon.com ([37.179.95.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acf12bsm3189363f8f.46.2026.10.09.03.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:19:20 -0700 (PDT)
From: Massimiliano Marretta <massimiliano.marretta@egicon.com>
To: David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: keyrings@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Massimiliano Marretta <massimiliano.marretta@egicon.com>
Subject: [PATCH 2/2] kbuild: sign modules in bulk when the signing key is on PKCS#11
Date: Fri,  9 Oct 2026 12:19:15 +0200
Message-ID: <20261009101915.495734-3-massimiliano.marretta@egicon.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009101915.495734-1-massimiliano.marretta@egicon.com>
References: <20261009101915.495734-1-massimiliano.marretta@egicon.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When CONFIG_MODULE_SIG_KEY contains a PKCS#11 URI, each module is
currently signed by a separate invocation of scripts/sign-file.
This is inefficient because every invocation pays the fixed cost
of initializing the PKCS#11 token, verifying the PIN and setting
up the session, which can take tens of seconds per module.

Use the newly added '-b' option of scripts/sign-file to sign all
modules in a single invocation when the signing key is provided
as a PKCS#11 URI. Modules are installed first, then signed in
bulk in a dedicated target that runs before depmod.

When the signing key is a PEM file, the classic per-module signing
path is kept unchanged, since the bulk mode provides no benefit
in that case.

Measured on a build with 50 modules and the key stored on a
SmartCard-HSM:
  - before: ~24 minutes
  - after:  ~3 min 17 s

Signed-off-by: Massimiliano Marretta <massimiliano.marretta@egicon.com>
---
 scripts/Makefile.modinst | 43 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index 9ba45e5b32b1..e7894d195e7d 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -101,34 +101,63 @@ endif
 #
 ifeq ($(filter pkcs11:%, $(CONFIG_MODULE_SIG_KEY)),)
 sig-key := $(if $(wildcard $(CONFIG_MODULE_SIG_KEY)),,$(objtree)/)$(CONFIG_MODULE_SIG_KEY)
+sign-bulk :=
 else
 sig-key := $(CONFIG_MODULE_SIG_KEY)
+# Signing via a PKCS#11 URI is much faster in bulk mode, as the
+# per-invocation initialization cost of the token is high.
+sign-bulk := 1
 endif
+
 quiet_cmd_sign = SIGN    $@
       cmd_sign = $(objtree)/scripts/sign-file $(CONFIG_MODULE_SIG_HASH) "$(sig-key)" $(objtree)/certs/signing_key.x509 $@ \
                  $(if $(KBUILD_EXTMOD),|| true)
 
+quiet_cmd_bulk_sign = BULK SIGN
+      cmd_bulk_sign = $(objtree)/scripts/sign-file -b $(CONFIG_MODULE_SIG_HASH) "$(sig-key)" $(objtree)/certs/signing_key.x509 $(modules) \
+                     $(if $(KBUILD_EXTMOD),|| true)
+
 ifeq ($(sign-only),)
 
 # During modules_install, modules are signed only when CONFIG_MODULE_SIG_ALL=y.
 ifndef CONFIG_MODULE_SIG_ALL
 quiet_cmd_sign :=
       cmd_sign := :
+quiet_cmd_bulk_sign :=
+      cmd_bulk_sign := :
 endif
 
 # Create necessary directories
 $(foreach dir, $(sort $(dir $(install-y))), $(shell mkdir -p $(dir)))
 
+ifeq ($(sign-bulk),)
+
 $(dst)/%.ko: %.ko FORCE
 	$(call cmd,install)
 	$(call cmd,strip)
 	$(call cmd,sign)
 
+else
+
+$(dst)/%.ko: %.ko FORCE
+	$(call cmd,install)
+	$(call cmd,strip)
+
+PHONY += bulk-sign-modules
+bulk-sign-modules: $(install-y)
+	$(call cmd,bulk_sign)
+
+__modinst: bulk-sign-modules
+
+BULK_SIGN_DEP := bulk-sign-modules
+
+endif
+
 ifdef CONFIG_MODULES
 __modinst: depmod
 
 PHONY += depmod
-depmod: $(install-y)
+depmod: $(install-y) $(BULK_SIGN_DEP)
 	$(call cmd,depmod)
 
 quiet_cmd_depmod = DEPMOD  $(MODLIB)
@@ -137,9 +166,21 @@ endif
 
 else
 
+ifeq ($(sign-bulk),)
+
 $(dst)/%.ko: FORCE
 	$(call cmd,sign)
 
+else
+
+PHONY += bulk-sign-modules
+bulk-sign-modules: $(install-y)
+	$(call cmd,bulk_sign)
+
+__modinst: bulk-sign-modules
+
+endif
+
 endif
 
 #
-- 
2.43.0

