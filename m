Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA0A48F026;
	Wed,  7 Oct 2026 18:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791398395; cv=none; b=PkCiw7t5h7Nq6d9tImm+MKj0Lo+WWmF61xK0tr+HW7kpA5uZfwvwX/MevdLoifGN3rQx8bJWYlavinLc6tFA2l4gKJZ2IA4+Tr24QJWyaSfGfUyIawPWgxZEcE5M9cAIZXO4EolLzOccp9Au0jVuePRjN9igYcZXRweoA4L6Anc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791398395; c=relaxed/simple;
	bh=QpR/+p4shYH6IPSpl9TwA6tHi7LJ+UOqgGubad3Y0JE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LLgGTWjNH0EFkOJFAUeFfa6h29DASEOgS34DbNoLArHu3/fy8Pvm1lCbaHumMqVLkzAHoRjH9BfTjDWs1MFQk1fkuJUU4AKqRPsVdaw758OPx0pPd0lgVOwUBWKKOKXlHpMl5SInEjo84sP0lQXp5X1EL850T4i57hhhSTVMmUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gSEVSF1P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gSEVSF1P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EFE71F00893;
	Wed,  7 Oct 2026 18:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791398393;
	bh=iXhTo5GsUVensTg07JpCi6r4Zmzr7mztwPkHp0oBui8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gSEVSF1PxEUY0EkdYgi+TvtpDjpxr9EAFrlDDNwpbty5fwf7MsgnCoCNk2HsBtZSa
	 rOQZSQXJUOr7jkRyDD/VX3vYRNKR5Px2eJ9fBZ8Qxam7FCpxneClghjX4fkU+32oVe
	 7LOiYnwvGvRfwyMs3subtgCkAeOMblsyJ+PIEIsLNlkJnG6MPZv6/kDziEsJbwGmos
	 lVpbUSigt7/1xO4rzRlzqtYRFXj2Eu01SwLNND1sMmM22+kiEF8EJyqZ6Qwk6l2F5+
	 o1pKb69MxDdx0x+P2KJR7jYYI7ze6dWcxS6u7RPlh7yVSwVGSDZRruSAV9bSxJNcDz
	 lsw48+8/uGSyw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 07 Oct 2026 13:39:40 -0500
Subject: [PATCH v3 1/2] kbuild: Convert %.dtb(o) targets to single target
 rules
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-dtb-dirs-v3-v3-1-b3ab32b64fa6@kernel.org>
References: <20261007-dtb-dirs-v3-v3-0-b3ab32b64fa6@kernel.org>
In-Reply-To: <20261007-dtb-dirs-v3-v3-0-b3ab32b64fa6@kernel.org>
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

