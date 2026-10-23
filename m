Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792794787;
	b=vixtCZQMDpYVaynt2NPEG2yru1mIKwvSo/K+ejXFqfP/lgqkhzw5QHIb8X9hh8nlPSKM
	 QdfOf7J3yfZ7JnnPsr9FAPI70jMQVfhe5GEvOC9boieKxLCitMqoJljuTVSdCmJjWHAPM
	 h11hVefgyZiHPIRDNoz56ud/JgaAwzipQFhuusNEHHuijzC0lIKKXefSQicuAQLmdEDSo
	 Mjn9MfvgmOgfI+s6sYKyBCuhAKCXtk0d90BlxFX1EZ5NHUXp+DLg2ik0iJA9I/EejLWZw
	 nUs2rCMZ/Li9Yx8tXPnEaFen/IdOepP/Zo5G8pgScnHaPv0d1OZvVZwn3dDzfVM1Ksw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792794787;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=znWVJcYHFQ2BizY58Hdsla2jCEzmrR55Dw81paPSO2E=;
	b=ED26Fm52a1nhbxCbNDbdWYS4hHJUMPgytkp+DzTo1I0eUJdJotHakZY0kAHS16eDoYjt
	 H/6kGefoj+I3XRLIR1YpZd+vJRJU1wVegCol5k8wLjlt0FJuXP/X3UdYUxoLjH0r3llnG
	 yGLNvo05GsV2Pt1SI96bY4Py3zwKpJzwQE8xSDsn5CKcXNZhzcTHzxbn75lelZR5J4P8V
	 nMZUTjfC9RtYANybzkoDeMHNDBDIBvIoPq59I3gkugkCmGllIVfzr/rV93CqeqMMqP2M2
	 MRwmAVbDvTMzM2Ds23XAYidNPkWUZimPHHclJbaUG1eOY/9xh9AR66yaKWUU6kRVpRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=acQDHfzE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FC3606A32D;
	Fri, 23 Oct 2026 22:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=acQDHfzE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E3371F031E1;
	Fri, 23 Oct 2026 22:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792794787;
	bh=znWVJcYHFQ2BizY58Hdsla2jCEzmrR55Dw81paPSO2E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=acQDHfzET/x/SdGQF7/2iFwE7NuHGZu7/Ph0JHZKsldr2FoQnVj5JWqZb0e4kDWwn
	 2q0siJfAWsxxfhDVW/5f01SXQHjKH4vpToIFdtMYzuxGI2P55jT//sjOMZmyK9imPP
	 24HhpM44lYA+FzOKc7em8lDHtB12IB+yYdZ8ObmIcDEFi+7q5Nye1NBLB+ocwDciUW
	 r9GZvzXm48hAsqAMLxPk258Lbp30imblZi9kHoPdXU5dk2jv0tufH0re0Eu+EPjpuv
	 lWHY/pCqCP5ncTaktk7SYXn8tG5JYfCGGKUSi2ePnOhvvhOeo4RVT07pKbnw0VzPsm
	 ZD5BcmvXp8Kbg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 23 Oct 2026 17:32:47 -0500
Subject: [PATCH v5 1/2] kbuild: Convert %.dtb(o) targets to single target
 rules
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
Message-Id: <20261023-dtb-dirs-v3-v5-1-dfe13d47aa64@kernel.org>
References: <20261023-dtb-dirs-v3-v5-0-dfe13d47aa64@kernel.org>
In-Reply-To: <20261023-dtb-dirs-v3-v5-0-dfe13d47aa64@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>
Cc: David Heidelberg <david@ixit.cz>, Arnd Bergmann <arnd@arndb.de>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.16-dev

Single .dtb and .dtbo targets can be built using the existing kbuild
single target infrastructure. The only difference is the custom rules
work on a relative path under the arch dts directory, so we have to
fixup the path for the single targets.

With this both relative and full paths work:

make arch/arm64/boot/dts/arm/juno.dtb
make arm/juno.dtb

Complicating matters is building DTBs works without $ARCH compiler as
only the host preprocessor is used. This is useful for building all the
DTBs in the tree without installing a bunch of cross-compilers. The
single target rule needs to depend on 'dtbs_prepare' rather the
'prepare' to maintain support for that.

Reviewed-by: Nicolas Schier <nsc@kernel.org>
Tested-by: Nicolas Schier <nsc@kernel.org>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v3:
 - New patch
---
 Makefile | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index 4ad67b737af7..c307ee9293bc 100644
--- a/Makefile
+++ b/Makefile
@@ -301,7 +301,7 @@ no-dot-config-targets := $(clean-targets) \
 			 run-command
 no-sync-config-targets := $(no-dot-config-targets) %install modules_sign kernelrelease \
 			  image_name
-single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s %/
+single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s %.dtb %.dtbo %/
 
 config-build	:=
 mixed-build	:=
@@ -1663,12 +1663,6 @@ dtbindingtree := Documentation/devicetree/bindings
 
 ifneq ($(dtstree),)
 
-%.dtb: dtbs_prepare
-	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
-
-%.dtbo: dtbs_prepare
-	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
-
 PHONY += dtbs dtbs_prepare dtbs_install dtbs_check
 dtbs: dtbs_prepare
 	$(Q)$(MAKE) $(build)=$(dtstree) need-dtbslist=1
@@ -1683,7 +1677,7 @@ export CHECK_DTBS=y
 endif
 
 ifneq ($(CHECK_DTBS),)
-dtbs_prepare: dt_binding_schemas
+scripts_dtc: dt_binding_schemas
 endif
 
 dtbs_check: dtbs
@@ -2190,6 +2184,8 @@ modpost: $(if $(single-build),, $(if $(KBUILD_BUILTIN), vmlinux.o)) \
 #
 #   make foo/bar/baz/
 
+single-build-prep := prepare
+
 ifdef single-build
 
 # .ko is special because modpost is needed
@@ -2212,8 +2208,20 @@ ifneq ($(KBUILD_MODPOST_NOFINAL),1)
 endif
 	$(Q)rm -f modules.order
 
+# For compatibility with existing %.dtb targets without full path
+single-dtb := $(filter-out $(dtstree)/%, $(filter %.dtb %.dtbo, $(single-no-ko)))
+single-no-ko := $(filter-out $(single-dtb), $(single-no-ko)) $(addprefix $(dtstree)/, $(single-dtb))
+
 single-goals := $(addprefix $(build-dir)/, $(single-no-ko))
 
+# DT-only targets need host tools, but no architecture-specific preparation.
+ifneq ($(dtstree),)
+single-dt-patterns := $(addprefix $(dtstree)/,%.dtb %.dtbo)
+ifeq ($(filter-out $(single-dt-patterns),$(single-no-ko)),)
+single-build-prep := dtbs_prepare
+endif
+endif
+
 KBUILD_MODULES := y
 
 endif
@@ -2225,7 +2233,7 @@ prepare: outputmakefile
 # make menuconfig etc.
 # Error messages still appears in the original language
 PHONY += $(build-dir)
-$(build-dir): prepare
+$(build-dir): $(single-build-prep)
 	$(Q)$(MAKE) $(build)=$@ need-builtin=1 need-modorder=1 $(single-goals)
 
 clean-dirs := $(addprefix _clean_, $(clean-dirs))

-- 
2.53.0

