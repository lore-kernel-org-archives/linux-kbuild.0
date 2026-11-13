Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794592641;
	b=g+yHG97qTPh1soZvIJFdlql+j2GZhUb86CgP1nBLW6JkjEE7jtbN1PenVoGeYDBHs7of
	 Jru83LTI3S6u/20BQXMVUzqftMUosc0+EzsZAHeX9npV3qjWkSLl8xfacZBFTE0B6xyzX
	 tBiN706Fr2/3Ul6IjvhKyt+HRzVDAnC6x1hgDn/I8394EXTIdi+uIzynveRXF6muksKTH
	 ZDIa40OSNwQ7FsqC8SO0L2+4OWSJ7jh8uXV5nCR+zdpN3lyjY30BsGeB8Qzra7R9cLkc2
	 8mBsSrUV8Oy78t9lvNS12iMe6ZTCAC1FyFae9RMcuq6pWz2MljhDdV0vxS5XTXHX7UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592641;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=MrbbXWqqRA8F4byXr6X3fjrfKuTxucre2nyzSbdaekY=;
	b=2znhUZjH9NYxI2VE0Px5kq03fuUidpZCey+ge0+Vw4OykFUfeJFUjV5z3aWy2zgrC0Hc
	 wQOixpvHen5d5U4/XrHsK6cXTpEPOeQV7J22a1Qv4SILiKHKuLE8Dz3a/SgAlBVLbHX/b
	 tNMDa4QSqeqpIKYGO+b0mNW8zPC+Gk+w7xInt60OLdxhiTpDDu37Htb9tMf9BiWaEV1NA
	 RPEH8nTiFZdjeJP42yM9jdWVGVZLMR9ur0lXf4sIZRG7THOshVZs6sWzneWqcinuPfxmR
	 QPMEaorzA7dar3gtvjYYbaBfURYohf10C7cas94ZSLMepwkm/Zp/eHaFKcC4A89Pb/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NxJShcdX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29340606CEF2;
	Fri, 13 Nov 2026 17:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NxJShcdX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBEFE1F000C5;
	Fri, 13 Nov 2026 17:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794592641;
	bh=MrbbXWqqRA8F4byXr6X3fjrfKuTxucre2nyzSbdaekY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NxJShcdXYmWpdrawyHEcGim6pEPR0NcJG+pf90WXyVFSh6t5OHqiVP83EBXYlPHqt
	 lA1FVSCShSWO70WkEQiVXZAa+0/FGO+mjF7Spm1wc8OBlkFtlUmGiUBDgxt9rdUiZp
	 fs3jNYzWDkXnTAyCa60xKSX0P2fOAgm1ZDn3WhmjyuYkTIEKhXwY3zhlqWT33hrEVj
	 A8M7cF9e0BsNNy0Ig5xiZLtD+iIpyGss2ekZT1xzoskgWZFJnJl2yQIQm048/BhSJI
	 g4QZFb6crkJ8ji1IyhhMh5ZZAoqBGWHmxSFbOMMwK1QggHCkiSDo+Wa6oaCaPWeN9c
	 BmjjKBGkCMi9A==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Fri, 13 Nov 2026 18:57:07 +0100
Subject: [PATCH v2 3/3] kbuild: move scripts/mod target out of single-build
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
Message-Id: <20261113-reduce-single-build-dependencies-v2-3-93ba1f6c4e46@kernel.org>
References: <20261113-reduce-single-build-dependencies-v2-0-93ba1f6c4e46@kernel.org>
In-Reply-To: <20261113-reduce-single-build-dependencies-v2-0-93ba1f6c4e46@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1975; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=7SaGmxCSY2RLIUeY623awJKZoMW2Gpy+OUVq0+DTeNk=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDFnf/at7f8l/P6uxuvj+FdPYwxOcn3n/3j+zK/BJccqe9
 3PXZUvu7pjIwiDGxWAppsiyrJyTW6Gj0Dvs0F9LmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMWLg4hSAqVabwMhwXWnSu0+xO2SypThDHrR5xLx75Ph0DatBpbvywuObn/tYMPyvDHr153b
 C2qWeMR+mmGk/u/w/Ro/9VGSoyp2LxvIeclc5AQ==
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2

The scripts/mod target is currently built by prepare0, even when
compiling a single object that does not need modpost.

Introduce modpost_prepare between prepare and modules_prepare, and make
in-tree modpost depend on it. Move the scripts/mod build from prepare0
to this new target. This keeps scripts/mod out of single-object builds
that do not need modpost.

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
 Makefile | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 2c1289a44c56..86b9100af854 100644
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
+modpost_prepare: prepare
 	$(Q)$(MAKE) $(build)=scripts/mod
 
 # All the preparing..
@@ -1765,7 +1767,7 @@ endif
 modules: modules_prepare
 
 # Target to prepare building external modules
-modules_prepare: prepare
+modules_prepare: modpost_prepare
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

