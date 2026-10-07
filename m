Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1739F4DEC3B;
	Wed,  7 Oct 2026 18:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791398396; cv=none; b=dxZMSd+7sk6FB5TrQ6j8DeufFAjPtZt9IoxOwg+VLkVWi2hwsEl7ve3xa/+6jBBdRWPtT3DleKbU1JY4k5gVHzucIW0u/o+WWzWI+7Zj06mf2CRI5Qpcm2PdKazyPfmOLdCpIr8Dy4aQZqQNNHP2ioMO3YrNWVDnlhqJETk43bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791398396; c=relaxed/simple;
	bh=yEzeEqRyzkeNneE75WHmeQNkwdywPpw0kTdt/SFmhjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dvhsc9Ly1fqMrNPmzk5iYmmSlPCA58IDsPKg/6TMqU9NpcP+LkJNuQFCc3hsjOaMiXOcRpXdjoTszSgXIDPZWmEm3RXVJarafwz1BRonq0LSFwS3X4tiI01qqK2fh1j/DBDtStFdobujxdubTYWEJU7WGxWkIAxlc30dUIuOMug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C87mh4D3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C87mh4D3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0641F000FF;
	Wed,  7 Oct 2026 18:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791398394;
	bh=MCv2C8fY4xu/QhMyWNKnDvP7nn6RLVcj+W4fGSSQzxs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=C87mh4D3PuE9JqnkDteZuVBp4Thf5qSVhMmXT9EErkLFZC79D+3bQfdDEAQi3P64l
	 NnBkANyX52HKjFTYGRiNCOm8peEaM3bljXkJ/k/VZ6N4POZTZJEnrm/Ky0mRvlyICp
	 vnC8rrMt0WADxRwijkljVbCCPJZ/56P7zqzB90ajjDBWijBWu0ITUBO/od7xZ7Ui+0
	 6a1uREhmegJU0QP9w9d6FejXrdulI73V0xenF119lM0LfrkwjqmMzmHMIWmQmr2Z5/
	 kElSJJIjwKMVySn6CLyPlF3yvxIDWzdn0Ilql+xF8fD6wU2rMZc4IsfYEszG1J48lY
	 lQDgGxQrY2YkQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 07 Oct 2026 13:39:41 -0500
Subject: [PATCH v3 2/2] kbuild: Support directory targets for building DTBs
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-dtb-dirs-v3-v3-2-b3ab32b64fa6@kernel.org>
References: <20261007-dtb-dirs-v3-v3-0-b3ab32b64fa6@kernel.org>
In-Reply-To: <20261007-dtb-dirs-v3-v3-0-b3ab32b64fa6@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>
Cc: David Heidelberg <david@ixit.cz>, Arnd Bergmann <arnd@arndb.de>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.16-dev

It is useful to be able to build all the DTBs for a vendor. One can list
all the .dts files in a directory and convert those to %.dtb targets,
but that doesn't work for base+overlay DTB targets.

The 'dtbs' and 'dtbs_check' targets can use the directory rule targets
as well which avoids different make paths for building DTBs.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v3:
 - Reworked on top of single target rule for %.dtb
 - Make dtbs target use directory rule.
 - Move adding boot/dts subdir out of the arch code. Now supported on
   every arch (not that useful without vendor dirs).
 - Removed the need to look at MAKECMDGOALS
 - Fixed unnecessary rebuilding DT base+overlay targets
 - Link to v2: https://lore.kernel.org/all/20251120204812.1983452-4-robh@kernel.org/

v2:
 - Convert arm, mips and riscv. The other DT enabled arches don't have
   vendor directories.
 - Link to v1: https://lore.kernel.org/all/20251113225952.867138-1-robh@kernel.org/
---
 Makefile               | 8 ++++----
 scripts/Makefile.build | 7 +++++++
 scripts/Makefile.dtbs  | 2 ++
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index c307ee9293bc..75d290c2b7d8 100644
--- a/Makefile
+++ b/Makefile
@@ -1664,8 +1664,8 @@ dtbindingtree := Documentation/devicetree/bindings
 ifneq ($(dtstree),)
 
 PHONY += dtbs dtbs_prepare dtbs_install dtbs_check
-dtbs: dtbs_prepare
-	$(Q)$(MAKE) $(build)=$(dtstree) need-dtbslist=1
+dtbs:
+	$(Q)$(MAKE) $(dtstree)/
 
 # include/config/kernel.release is actually needed when installing DTBs because
 # INSTALL_DTBS_PATH contains $(KERNELRELEASE). However, we do not want to make
@@ -2216,7 +2216,7 @@ single-goals := $(addprefix $(build-dir)/, $(single-no-ko))
 
 # DT-only targets need host tools, but no architecture-specific preparation.
 ifneq ($(dtstree),)
-single-dt-patterns := $(addprefix $(dtstree)/,%.dtb %.dtbo)
+single-dt-patterns := $(dtstree)/ $(addprefix $(dtstree)/,%.dtb %.dtbo %/)
 ifeq ($(filter-out $(single-dt-patterns),$(single-no-ko)),)
 single-build-prep := dtbs_prepare
 endif
@@ -2234,7 +2234,7 @@ prepare: outputmakefile
 # Error messages still appears in the original language
 PHONY += $(build-dir)
 $(build-dir): $(single-build-prep)
-	$(Q)$(MAKE) $(build)=$@ need-builtin=1 need-modorder=1 $(single-goals)
+	$(Q)$(MAKE) $(build)=$@ need-builtin=1 need-modorder=1 need-dtbslist=1 $(single-goals)
 
 clean-dirs := $(addprefix _clean_, $(clean-dirs))
 PHONY += $(clean-dirs) clean
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 4349108e75e1..d22b3b2d43b3 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -38,6 +38,13 @@ include $(srctree)/scripts/Makefile.compiler
 include $(kbuild-file)
 include $(srctree)/scripts/Makefile.lib
 
+# Make DT directory targets reachable for architectures with a DTS tree.
+ifeq ($(obj),arch/$(SRCARCH))
+ifneq ($(wildcard $(src)/boot/dts/),)
+subdir-y += boot/dts
+endif
+endif
+
 # flags that take effect in current and sub directories
 KBUILD_AFLAGS += $(subdir-asflags-y)
 KBUILD_CFLAGS += $(subdir-ccflags-y)
diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
index c4e466390284..c7ec2a2a308e 100644
--- a/scripts/Makefile.dtbs
+++ b/scripts/Makefile.dtbs
@@ -23,7 +23,9 @@ dtb-y           := $(addprefix $(obj)/, $(dtb-y))
 multi-dtb-y     := $(addprefix $(obj)/, $(multi-dtb-y))
 real-dtb-y      := $(addprefix $(obj)/, $(real-dtb-y))
 
+ifdef need-dtbslist
 always-y        += $(dtb-y)
+endif
 targets         += $(real-dtb-y)
 
 # dtbs-list

-- 
2.53.0

