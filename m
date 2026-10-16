Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A18A3BB128;
	Fri, 16 Oct 2026 19:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792180188; cv=none; b=FTx5OzL27IdMjGkEX0r0ZyO72StfiZ+C2O5mRP18HFPcVG58YjtJbqc3zhlwg5DHL2+KAuUKZTmAJRjGs8tNMCHLu4WjeOa5TG7hNcDFD/7YwTNP54M1Rc4VEXs6NacDWGVv0oTRODosvbeL18OIE6LKpCNRTx7IqTEWnsSstKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792180188; c=relaxed/simple;
	bh=sADb4tx2BL0NSlaM3rZsHXHM6fFPmcpdTsPqCOR5sL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QZsjMvzn4wGWkv2kMEFOJcRbVh0LH2SUSiZ0me+mtkxIbTUCq2626Quf3tOACk/lUfNIwURvxv8Kyt57gg0DJwMPrURYfzC9tGjxbK6MxkdGreBAwQ7ttYKUZlQemvrIBg82U8qouM9rjZnworylWeVJ0Q7BzCbm9ak6qleXDKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbXdpC0y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbXdpC0y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED1AE1F000C6;
	Fri, 16 Oct 2026 19:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792180186;
	bh=BVjfNNDxnha2WcYK2YfgdKGUZO5N3o2MpeBPwszC7nY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bbXdpC0yti8V8aK3X77fIFGsfYhrcAk1cqwFdEt/Wm5ENggSz0tSMYpKnCN2HPmZv
	 QpNLq7eM3JwooTzs9A2LUsJLNJ7VOdSTj8VYFWK7iJ4plnvG2RvB7AlARgzm3Yxbgv
	 A8n0q8pSqIAp9iLYVvCJUpvQT1a7cq6dcR5qFiRLQ1ypDOfkQ6EsKCZczup2u8WcYv
	 ViHd2hTr+zpUGooaKZyYIPBjwkPhywcjYntvXbDy7qPDkcZVTIn+yrwQqVc3Yn4RcL
	 3PIQFs901I56ipHWyrdURC0uZey9sn4M8P34BiuqfDSUhtxueHKoyrmuDriInru3dq
	 sdwh1vWY1YPkg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 16 Oct 2026 14:49:20 -0500
Subject: [PATCH v4 2/2] kbuild: Support directory targets for building DTBs
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dtb-dirs-v3-v4-2-0ec42fd8ef9b@kernel.org>
References: <20261016-dtb-dirs-v3-v4-0-0ec42fd8ef9b@kernel.org>
In-Reply-To: <20261016-dtb-dirs-v3-v4-0-0ec42fd8ef9b@kernel.org>
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

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v4:
 - Don't create a dtbs-list file in every directory

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
 Makefile                          | 14 ++++++++++----
 drivers/of/unittest-data/Makefile |  5 +++++
 scripts/Makefile.build            |  7 +++++++
 scripts/Makefile.dtbs             |  2 ++
 4 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index c307ee9293bc..6d1d1c803ee8 100644
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
@@ -2185,6 +2185,7 @@ modpost: $(if $(single-build),, $(if $(KBUILD_BUILTIN), vmlinux.o)) \
 #   make foo/bar/baz/
 
 single-build-prep := prepare
+single-dtbslist-arg :=
 
 ifdef single-build
 
@@ -2216,9 +2217,13 @@ single-goals := $(addprefix $(build-dir)/, $(single-no-ko))
 
 # DT-only targets need host tools, but no architecture-specific preparation.
 ifneq ($(dtstree),)
-single-dt-patterns := $(addprefix $(dtstree)/,%.dtb %.dtbo)
+single-dt-patterns := $(dtstree)/ $(addprefix $(dtstree)/,%.dtb %.dtbo %/)
+ifneq ($(filter $(single-dt-patterns),$(single-no-ko)),)
+single-dtbslist-arg := need-dtbslist=1
+endif
 ifeq ($(filter-out $(single-dt-patterns),$(single-no-ko)),)
 single-build-prep := dtbs_prepare
+single-dtbslist-arg := need-dtbslist=1
 endif
 endif
 
@@ -2234,7 +2239,8 @@ prepare: outputmakefile
 # Error messages still appears in the original language
 PHONY += $(build-dir)
 $(build-dir): $(single-build-prep)
-	$(Q)$(MAKE) $(build)=$@ need-builtin=1 need-modorder=1 $(single-goals)
+	$(Q)$(MAKE) $(build)=$@ need-builtin=1 need-modorder=1 \
+		$(single-dtbslist-arg) $(single-goals)
 
 clean-dirs := $(addprefix _clean_, $(clean-dirs))
 PHONY += $(clean-dirs) clean
diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
index 01a966e39f23..bac6ee9327e2 100644
--- a/drivers/of/unittest-data/Makefile
+++ b/drivers/of/unittest-data/Makefile
@@ -104,3 +104,8 @@ static_test_1-dtbs := static_base_1.dtb $(apply_static_overlay_1)
 static_test_2-dtbs := static_base_2.dtb $(apply_static_overlay_2)
 
 dtb-$(CONFIG_OF_OVERLAY) += static_test_1.dtb static_test_2.dtb
+
+# Include the static overlay tests in normal kernel builds.
+ifdef CONFIG_OF_OVERLAY
+need-dtbslist := 1
+endif
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

