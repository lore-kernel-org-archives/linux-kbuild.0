Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404482;
	b=QrX1fhwjOZtdsw7z+KnCuXvbinRn+Smjl4tHdnpk6jpErolbXrNTtg0s1vovtHktkhDI
	 ATUyjhBrFS23JDfvG4COHZSJtuRhJ9UiXZVrGcObt3cK1vrkgOI7ggfxHxgob/hjZnoXo
	 3aNLCoCYmhBUmMtJoL4t6IxqokgG9SAeGCeKsbcmKr/KXojFOUC6cMzRgCe4JWXZ9Yi3z
	 LqyByV/nUy6k1bGHT7ER6qKBMbJKekK0zgMgGux/LUKOzHDzwi7Muzj0cU6LStjpdsgF0
	 +qtLb7uglGTtXswf0yf1ooELHsEfA1GNxrjOUJYl52jkDlEsPz2nnC4DuEK0FqK1FBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404482;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=SkbdlxpS/Sq1iXhAPXJHQNNt5ZBReMg1cK8wjB9zo1s=;
	b=QLLkwcn/EQqdPLlml5bHMappwM4zj02WcTf3PC5z2i/Vys/lfsVlKU3mRnUb6i7LG3ht
	 +1lXOSI+iBHrxyskg7DKGALqpDTDIDOcLB+67KyT5WGooRIohUxtXJ4c3cht5lShxrUsO
	 jZxxw2gHzhJdUrMhY4qkIjmt4jD/kQXgCw88JLKUVFmHbJQeVHRt4Nh+br17Gb0755pI7
	 xzEq2lF+ljJW6UOvMdi6rTfnlFF6nS0x5a/Yb20VZ1CnLyqtAI/JAynm2BrICbQ2ZL38i
	 TIGxTSOW9uYg41ll0nWPKP+kaoPfMyo/OGOJuJWu8qmg5PRG7Es6AsGZOZEhlG7J31g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UTeQPVjP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98734606A891;
	Wed, 11 Nov 2026 13:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UTeQPVjP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741501F00A07;
	Wed, 11 Nov 2026 13:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794404482;
	bh=SkbdlxpS/Sq1iXhAPXJHQNNt5ZBReMg1cK8wjB9zo1s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UTeQPVjPmqkSmpaELrob+fhumbeUluX/Tzqz6hnwCurnbwBtfJ+sv+Rno9UFjbFWz
	 NObLLMBF4g/qh874wBbfm2bHEpo1eeQuOLdAhmPSWgUYA+440aj0Pr8PTD9IfBeo7k
	 Fv9TH2u/bZy0TSWMfNBduhG0pwpIeXzK2OW5qlM/WXFIal/+LBMp8ZiwQVzGRISFOb
	 bH1V3DvM+/d9nzyxtDPEsc5HoVG19NcSh96TSP95d5e+LLX1880LrS1u14udmRC9+K
	 16ZYXzWZnfCwJbAyzlj+wa6S02fGzTGBprXjV6Jhatwlbi9uxCnUb+Bx5OvvOXyVy3
	 8h4apdNhjaTSw==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Wed, 11 Nov 2026 14:41:05 +0100
Subject: [PATCH 3/3] kbuild: move scripts/mod target out of single-build
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
Message-Id: <20261111-reduce-single-build-dependencies-v1-3-7196ca986a85@kernel.org>
References: <20261111-reduce-single-build-dependencies-v1-0-7196ca986a85@kernel.org>
In-Reply-To: <20261111-reduce-single-build-dependencies-v1-0-7196ca986a85@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1942; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=0sF8VsL9CRgOH/a13nzodBXkj5zHDfpfgSGiaMVJ3EM=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDFlfCmrMr6203si2fc2EqBuK6Z8W9H3VDkmZfUd4i/jbf
 83J5ZreHRNZGMS4GCzFFFmWlXNyK3QUeocd+msJM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 Ahk6RgxcnAIw1YqvGRlO3fy7pLv8Y8He++tfK/1iDu1RmPK4bo6QuqqjSTWvZtIERobv+nOqzjP
 OCH2kI/qLacZ77oIP1x8xuSiFHj+1xIhz8QUeAA==
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2

The scripts/mod target is currently set as a preparation dependency.
However, this is not needed to compile, for example, a single object.

Add a new modpost_prepare target for scripts/mod and make in-tree
modpost and modules_prepare depend on it so that the prepare target does
not trigger that dependency anymore.

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
 Makefile | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 2c1289a44c56..93236f310f08 100644
--- a/Makefile
+++ b/Makefile
@@ -1405,7 +1405,7 @@ scripts: scripts_basic scripts_dtc
 # archprepare is used in arch Makefiles and when processed asm symlink,
 # version.h and scripts_basic is processed / created.
 
-PHONY += prepare archprepare
+PHONY += prepare archprepare modpost_prepare
 
 archprepare: outputmakefile archheaders archscripts scripts include/config/kernel.release \
 	asm-generic $(version_h) include/generated/utsrelease.h \
@@ -1414,6 +1414,8 @@ archprepare: outputmakefile archheaders archscripts scripts include/config/kerne
 
 prepare0: archprepare
 	$(Q)$(MAKE) $(build)=. prepare $(if $(single-build),,prepare_checks)
+
+modpost_prepare: archprepare
 	$(Q)$(MAKE) $(build)=scripts/mod
 
 # All the preparing..
@@ -1765,7 +1767,7 @@ endif
 modules: modules_prepare
 
 # Target to prepare building external modules
-modules_prepare: prepare
+modules_prepare: prepare modpost_prepare
 	$(Q)$(MAKE) $(build)=scripts scripts/module.lds
 
 endif # CONFIG_MODULES
@@ -2189,7 +2191,8 @@ KBUILD_MODULES :=
 endif # CONFIG_MODULES
 
 PHONY += modpost
-modpost: $(if $(single-build),, $(if $(KBUILD_BUILTIN), vmlinux.o)) \
+modpost: $(if $(KBUILD_EXTMOD),,modpost_prepare) \
+	 $(if $(single-build),, $(if $(KBUILD_BUILTIN), vmlinux.o)) \
 	 $(if $(KBUILD_MODULES), modules_check)
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 

-- 
2.56.1

