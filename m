Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792881200;
	b=g+1GD1E0pY37OVsXnWQ0/6uM4emrnwULEoqDZeoXSk+pAqLbHbQyrOX+0KMEAc1BGJcK
	 ynHJv2HEFDq4ugXCE9nli5XgVCGJRtN3OQA6kx8ArO4yS/zTB3S5Jzfhu967K55Jhk5ME
	 7UZeC8VM3NzJLqbWePxEfNbddr8t00yxlS22ZS5nj4x8pGVVFQ4jEDzhPDVwG63OBdHdK
	 kBAhwof4J2521MdfWNeMuTSjYFT96tZXjOi1qLVkLpw/U4b59aXsFn8CuH/i+YQZCczl8
	 qY1jEoyTcGlMKYkUqTdGg+4NfR3UiKh2pnqoAqaASN7SlIlQd4CbWDSzswzZbs04j4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792881200;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TGz7r1Aby2yZxmQUWdeEn21pWMzlGMbPc089rpZiF60=;
	b=1iN946JnlMGq5vCIPvDUNw3Ol988IDJ7IKx6mjJDlN9MvABdb6RmZf6uTNjsuVMHhp45
	 fwNAqL8p18IxqiPzK1+UhGDRlwYaVZ9gD3CiHa0IKdi2rydQ3PLtTpiz5AbRQGoZpwd3L
	 dN6PaKW5sxY2xfaL0YZJMdXA/VBpbq8YpKbQ9B1G/0EcSogIAJ1ZdyTILVC4YjShtvQ4f
	 PCgrn1UR0pK+s/o835nkLLFLUhUVo11nnFXVhfS4QxpJIz+Kc/HGi1sXUc8lvbTgvVOLt
	 2zOAMAjTOQk6DRSQnaRnHm2Ci0EtMuKxwxryziOZlMR3Z4YhddEhCIB07F7v0Qncbtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="gsjvu2f/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D16B606A31A;
	Sat, 24 Oct 2026 22:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gsjvu2f/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F9371F01825;
	Sat, 24 Oct 2026 22:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792881200;
	bh=TGz7r1Aby2yZxmQUWdeEn21pWMzlGMbPc089rpZiF60=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gsjvu2f/4orqpDcqlU52e59XPEzbiNQWZwmx24oDc2m4q8v/RMh4WziztpRDDZt2W
	 xNz+BSDzwqxY2zYdOFTTOI9pwpXA9f85PDGAmayIcFuJj12Bs/CRmw6GS+BGuCdUrC
	 jxgniBwN0BjPxPAfYSyOyPga1BAG8EpB7SiVL56cHXq/4jKgu+919p8Q/LKuc9Un1z
	 PbpsxA1ZpTY/vCHXLp3ACN1jJuTn3mC3/S1G/fWd9t9MkWNalMPqoyGhFIA5WQLXh/
	 goSgcTd9OOh68bUe4fqvHumpgCBe7JoCodiLLKncAlQ7NXQiBJZgnRZRm16FYepzsp
	 BEAiWyOFXjoRQ==
Message-ID: <sashiko-outbox-183928@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] kbuild: Convert %.dtb(o) targets to single
 target rules
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Saravana
 Kannan" <saravanak@kernel.org>
Cc: "David Heidelberg" <david@ixit.cz>, "Arnd Bergmann" <arnd@arndb.de>, linux-kbuild@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261023-dtb-dirs-v3-v5-1-dfe13d47aa64@kernel.org>
References: <20261023-dtb-dirs-v3-v5-0-dfe13d47aa64@kernel.org>
 <20261023-dtb-dirs-v3-v5-1-dfe13d47aa64@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 22:33:19 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] kbuild: single-target .dtb and .dtbo rules fail to descend into bo=
ot/dts
- [Medium] kbuild: unconditional dtstree prefixing corrupts non-dtstree .dt=
b targets
--

commit 7e93223635a0ece771bb2b9e12840b3751ca5a16
Author: Rob Herring (Arm) <robh@kernel.org>

kbuild: Convert %.dtb(o) targets to single target rules

This commit replaces the dedicated top-level %.dtb and %.dtbo rules with the
generic kbuild single-target infrastructure, rewriting relative DTB paths to
include $(dtstree) and using dtbs_prepare as the prerequisite for DT-only
single builds.

> diff --git a/Makefile b/Makefile
> index 4ad67b737af7a..c307ee9293bcd 100644
> --- a/Makefile
> +++ b/Makefile

[ ... ]

> @@ -2212,8 +2208,20 @@ ifneq ($(KBUILD_MODPOST_NOFINAL),1)
>  endif
>  	$(Q)rm -f modules.order
> =20
> +# For compatibility with existing %.dtb targets without full path
> +single-dtb :=3D $(filter-out $(dtstree)/%, $(filter %.dtb %.dtbo, $(sing=
le-no-ko)))
> +single-no-ko :=3D $(filter-out $(single-dtb), $(single-no-ko)) $(addpref=
ix $(dtstree)/, $(single-dtb))

[Severity: Medium]
What happens here when building an in-tree .dtb or .dtbo target located
outside $(dtstree), such as make drivers/of/empty_root.dtb or
make drivers/of/unittest-data/testcases.dtbo, or when $(dtstree) is empty?

Because single-dtb matches any %.dtb or %.dtbo target that does not begin
with $(dtstree)/, targets under drivers/of/ or drivers/clk/ have
$(dtstree)/ unconditionally prepended to their path, rewriting them to
non-existent paths under arch/$(SRCARCH)/boot/dts/drivers/....

In addition, unlike the single-dt-patterns check just below, this rewrite is
not guarded by ifneq ($(dtstree),). On architectures without a boot/dts
directory or during external module M=3D builds where $(dtstree) is empty,
$(addprefix $(dtstree)/, $(single-dtb)) prepends a leading / to the target.

Should this rewrite be guarded by ifneq ($(dtstree),) and restricted to
paths that actually exist under $(dtstree) (or do not already exist at their
given path)?

> +
>  single-goals :=3D $(addprefix $(build-dir)/, $(single-no-ko))
> =20
> +# DT-only targets need host tools, but no architecture-specific preparat=
ion.
> +ifneq ($(dtstree),)
> +single-dt-patterns :=3D $(addprefix $(dtstree)/,%.dtb %.dtbo)
> +ifeq ($(filter-out $(single-dt-patterns),$(single-no-ko)),)
> +single-build-prep :=3D dtbs_prepare
> +endif
> +endif
> +
>  KBUILD_MODULES :=3D y
> =20
>  endif
> @@ -2225,7 +2233,7 @@ prepare: outputmakefile
>  # make menuconfig etc.
>  # Error messages still appears in the original language
>  PHONY +=3D $(build-dir)
> -$(build-dir): prepare
> +$(build-dir): $(single-build-prep)
>  	$(Q)$(MAKE) $(build)=3D$@ need-builtin=3D1 need-modorder=3D1 $(single-g=
oals)

[Severity: High]
Does routing single .dtb and .dtbo targets through $(build-dir) allow
scripts/Makefile.build to descend into arch/$(SRCARCH)/boot/dts?

Previously, the %.dtb and %.dtbo rules invoked
$(MAKE) $(build)=3D$(dtstree) $(dtstree)/$@, starting scripts/Makefile.build
directly at obj=3Darch/$(SRCARCH)/boot/dts. With this change, $(build-dir)
starts at obj=3D. and descends into obj=3Darch/$(SRCARCH), which includes
arch/$(SRCARCH)/Kbuild. However, in arch/$(SRCARCH)/Kbuild (for example in
arch/arm64/Kbuild):

    # for cleaning
    subdir- +=3D boot

neither boot nor boot/dts is in obj-y, obj-m, subdir-y, or subdir-m. When
scripts/Makefile.build evaluates single-subdirs at obj=3Darch/$(SRCARCH):

    single-subdirs :=3D $(foreach d, $(subdir-ym), $(if $(filter $d/%, $(MA=
KECMDGOALS)), $d))
    single-subdir-goals :=3D $(filter $(addsuffix /%, $(single-subdirs)), $=
(MAKECMDGOALS))

single-subdirs is empty, so Kbuild stops descending at obj=3Darch/$(SRCARCH)
and places arch/$(SRCARCH)/boot/dts/<vendor>/<target>.dtb(o) directly into
$(targets) at obj=3Darch/$(SRCARCH) without ever including
arch/$(SRCARCH)/boot/dts/Makefile or the vendor subdirectory Makefile.

This causes three regressions when building single targets at this commit:

1. Building any single .dtbo target (e.g. make <vendor>/<overlay>.dtbo)
   fails with "No rule to make target", because at obj=3Darch/$(SRCARCH),
   need-dtbslist, dtb-y, and dtb- are empty, and scripts/Makefile.build:

       ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb %.dtb.o %.dtbo.=
o,$(targets)),)
       include $(srctree)/scripts/Makefile.dtbs
       endif

   omits %.dtbo from the $(targets) filter, so scripts/Makefile.dtbs is
   never included.

2. Building any composite .dtb target defined via <name>-dtbs :=3D base.dtb
   overlay.dtbo (such as make qcom/apq8016-sbc-usb-host.dtb) fails with
   "No rule to make target" because the vendor Makefile is not included and
   multi-dtb-y remains empty.

3. Building simple .dtb targets matches $(obj)/%.dtb: $(obj)/%.dts at
   obj=3Darch/$(SRCARCH) with target-stem set to boot/dts/<vendor>/<board>
   instead of <board>, silently dropping per-directory DTC_FLAGS,
   per-target DTC_FLAGS_<stem>, and base-dtb-y automatic -@ symbol
   generation.

Note that a subsequent commit in this series, commit 02ed329e5679 ("kbuild:
Support directory targets for building DTBs"), partially addresses traversal
by passing need-dtbslist=3D1 for DT builds and adding subdir-y +=3D boot/dt=
s in
scripts/Makefile.build when need-dtbslist is set, though this commit is
broken on its own during bisection (and the %.dtbo filter omission in
scripts/Makefile.build remains if need-dtbslist, dtb-y, and dtb- are empty).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-dtb-dirs-v=
3-v5-0-dfe13d47aa64@kernel.org?part=3D1
