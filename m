Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792794790;
	b=2V6g2MLv+bzY0rm/zwXvhjSFVTSFuJSfytxc2vOrwk38fmgIgaPyyJDn2b1YL6FNEf3h
	 u8ny0mq8tcs36ePWkEsA2Ur+u5jsveDjQimlkCU0MJzjOmbYPQmcxAk7LpL451stSPmfZ
	 MBTVMRNWpcUPF6rkaBQZyw3s3CXSHaXjCg4jzb2gxJc3U5UcN+GX2l5vpkr4EwAYAkIrQ
	 G4iLqb7g3kcLkuQgc4SFb9A+DQ2hRsRXziFfhz+/nxMq9DCfKXSGrXlrO98a8ZyJ3KAl5
	 A2yAfKDyXrCujnrAqzr/k87Bjmi/st27MhT11O73tBBogLeuSdPQgO0G1J3sLpG/iDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792794790;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=Y9AKSM54T+gQoRzYbvDKl1FtTg0ITEQX5IbPXj6FIUI=;
	b=BpHZkvdACZ+efw+vQUY5ddfRE7+6sx+z9p6DnDmJ+RFPF/e0Djpkf5/QqKBk5ruBQY7B
	 nrSvTDaMJKaEZQ7Tt7HW/0hrK4dstapUuWbELYC5kf1H00YFYPwJXAKT19mwUYgpiGaN4
	 pN2gxa3nyxtqtzXt8nSG6xLzaWQ1J0GvvqNU1S2x9ePDQQD78OUM3UwWSmCoaslChb3QJ
	 JIJJIemMYFUfr9zQSsWRxb/v+nLvIk/pQ4y2ThvTFqHSsML0riTkkhJcjyb3sLQ0GRrS0
	 4RgTfousv5YTMZ4foNUs90MatEUp11O6Wu1VGE0kiXgLDLzCtQtu2wPXklqxgcEz0Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QZa7NZLf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF968606A320;
	Fri, 23 Oct 2026 22:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QZa7NZLf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA02C1F031E1;
	Fri, 23 Oct 2026 22:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792794789;
	bh=Y9AKSM54T+gQoRzYbvDKl1FtTg0ITEQX5IbPXj6FIUI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QZa7NZLf3DjoS/atN0IN+OLwf3hobIw2QJgqKWOQYRL9kXZ3b+41vhiBwXXNJ1HYG
	 HK1m/ZRI7SPRzX8DpZJPHYJ8zjt1fbMy0/ha4ZM8mXzhQzs4krgWl2eOXX0mGEAY5y
	 LbPX8HiS2evbYa1+lx0IEIagjy5OJ5dr73C33gMyBqvBFR2Bf5foe3G/vBY80rnnpH
	 d+hHT/UAlQIw1Kpa9R4D7AS+gi1NgQ/we9D+Zg+Sa5ZiDvM+nqmabuYu7DJsHQ+6op
	 i0ygOEA1WTGGy6icGH6xCFNaEuqLTvcnF02PVkJFTmVt+8GL3H0gCTn4l5SOK9E9tt
	 d1ckH9A6Jzb9g==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 23 Oct 2026 17:32:48 -0500
Subject: [PATCH v5 2/2] kbuild: Support directory targets for building DTBs
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
Message-Id: <20261023-dtb-dirs-v3-v5-2-dfe13d47aa64@kernel.org>
References: <20261023-dtb-dirs-v3-v5-0-dfe13d47aa64@kernel.org>
In-Reply-To: <20261023-dtb-dirs-v3-v5-0-dfe13d47aa64@kernel.org>
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
v5:
 - Don't drop 'dtbs_prepare' for 'dtbs' rule to avoid parallel make
   issue
 - Limit adding boot/dts subdir to DT targets

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
 Makefile                          | 12 +++++++++---
 drivers/of/unittest-data/Makefile |  5 +++++
 scripts/Makefile.build            |  7 +++++++
 scripts/Makefile.dtbs             |  2 ++
 4 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index c307ee9293bc..8db22d02cceb 100644
--- a/Makefile
+++ b/Makefile
@@ -1665,7 +1665,7 @@ ifneq ($(dtstree),)
 
 PHONY += dtbs dtbs_prepare dtbs_install dtbs_check
 dtbs: dtbs_prepare
-	$(Q)$(MAKE) $(build)=$(dtstree) need-dtbslist=1
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
index 4349108e75e1..22fbd5199091 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -38,6 +38,13 @@ include $(srctree)/scripts/Makefile.compiler
 include $(kbuild-file)
 include $(srctree)/scripts/Makefile.lib
 
+# Make DT directory targets reachable for architectures with a DTS tree.
+ifeq ($(obj),arch/$(SRCARCH))
+ifdef need-dtbslist
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

