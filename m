Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7A93C1097;
	Fri, 16 Oct 2026 19:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792180188; cv=none; b=k5L1RLqLq9gpZAGrkuCZAFGMGcCHmYLomhC12r94W6dRjbWC6qpiTNPdFroUVLr0x5HqNqaHzxcEaUz1/RSdkP0jHcDeL97s31qso3vE/cNXU5aNylF9okXqduF3+LTHAROa1uYsukCqCRSDGdNcdlwujQNOfh/mZ6fHQFDj7IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792180188; c=relaxed/simple;
	bh=GV1fXI2g5MFAQ6N0FOqjMn8iqTDYQDg6fUsGTZjLRmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HSUGUayoRwq93Xv6cy6J2qk5V1X+J4JV4j263KBnoMf7W9Ij767MNYyqUhksSyQNazgpCNAiVdnpO2mKg7znBidmCFxZRnbfBbjclKfMYUDYpBXOPpjsEsH5F5cyRGUlJKpB+VG9+8KLNddo9auBtnlJQURIu07+mqy0rbuygfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mj+DxyIX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mj+DxyIX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED7551F000C5;
	Fri, 16 Oct 2026 19:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792180185;
	bh=znWVJcYHFQ2BizY58Hdsla2jCEzmrR55Dw81paPSO2E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mj+DxyIXrC+xeOFJ+PtyFWPwr3gKzN3cfj8/9p5D7Rd09uMbR3k/OR5SxMHcpL+tr
	 XfpOdcV0lrsFI4HokYB9r1or/bM6U3F6LmYiayP0ZNo+I0bLqkgk0HsnzQKByyAcpr
	 HEf+3lNTucTTtIUB3Gt8R3h7DzjXXSW2Ohcf9SEErlf8N64Qrhl45PVHbbF2NyRFBC
	 H6lrTL6AKoelk4qA6qD2IN7lAmQyvp5qr3UIpslYvZPwMcZKl84b2JWMQlQvTq0CG4
	 0MeytLlNiltk5/C0LzCSrf3BNdWoxjdKaqP8GQkxnuDdNJChrfFk9gUxqYTuj/3kBq
	 +AsY6An8+V28Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 16 Oct 2026 14:49:19 -0500
Subject: [PATCH v4 1/2] kbuild: Convert %.dtb(o) targets to single target
 rules
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dtb-dirs-v3-v4-1-0ec42fd8ef9b@kernel.org>
References: <20261016-dtb-dirs-v3-v4-0-0ec42fd8ef9b@kernel.org>
In-Reply-To: <20261016-dtb-dirs-v3-v4-0-0ec42fd8ef9b@kernel.org>
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

