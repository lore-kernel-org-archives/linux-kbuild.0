Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1679377A80;
	Sat, 17 Oct 2026 19:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266595; cv=none; b=qTdRIiA1YFHmuyA+N9+WunLgTVgtMOmCzMIGIPZ2jcDj+/eA/0pAbrOVAgG8PlZUxq9W5ojKNeYAM8k+Db/39IY+aGyevl8ZfpiLqa6oXoLlh4FKpFCi7PzKYhMQ+ZSMtGiLit9B4erpYjjNiIVYm754OeaDRqOekiyYQRLY4gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266595; c=relaxed/simple;
	bh=Tfwp3pB+E9EIigimP4TOoTrHManA8WO6NE56tzftGuc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Hm42TevjgnDv+8C1bUOjzN+GmTe2yyPYsrSGiEFTpeIxIcdhC/F4u5uRF2GbvKnlCQY0dgHWe1uTbp+dITJbGvuaQww4dWDt4bz1oY1juBCgYtgEtWxrNAX6kK7tHZa3cMFY6lqXGP751hpzNzoaBz+dwsDqUk/zXo4G3THnNGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=il00IixY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="il00IixY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 377301F000C4;
	Sat, 17 Oct 2026 19:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792266594;
	bh=xROonoP9OfNRth81uZgSFQTd3QtGSaDs22N/+nVADuQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=il00IixYlJqo4I4S1d0PGEEf2u0+dsxvJwlwS0dy7zMXuS75TReIWrzQRvP8iIkp7
	 BRqve/A0r231fz/ryWKITTOOHVNgb5IPhqwjube+21zLbvMN1EXA+qoevZ3nuB0SOp
	 jTncCob5+Wk09V3RtBTSATv+z4MSrcwrBWYNTZOwKXIHHQn7jt6epOGC0F5iBPzT7s
	 HxtAoptR3pqcOzFQbYkAh+FVJgU7CpQVcWP8py4mpXz763J6N/QtvTmvqgPIgqQ3Ni
	 ScJc8uvusAN6G22x0VjbcrWD9OVd45xUsDABpEK9U13vVfPeLwntqrRXHC4jcTjyxy
	 +520PWNUFeWMA==
Message-ID: <sashiko-outbox-175793@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] kbuild: Support directory targets for building
 DTBs
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Saravana
 Kannan" <saravanak@kernel.org>
Cc: "David Heidelberg" <david@ixit.cz>, "Arnd Bergmann" <arnd@arndb.de>, linux-kbuild@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016-dtb-dirs-v3-v4-2-0ec42fd8ef9b@kernel.org>
References: <20261016-dtb-dirs-v3-v4-0-0ec42fd8ef9b@kernel.org>
 <20261016-dtb-dirs-v3-v4-2-0ec42fd8ef9b@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 19:49:53 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] kbuild: parallel build race in dtbs target and extra boot/dts trav=
ersal
--

commit 3f00c18c0d96a2ac1d59c7335959fec4fa041ff7
Author: Rob Herring (Arm) <robh@kernel.org>

kbuild: Support directory targets for building DTBs

This commit enables building DTBs using directory targets so that all DTBs
for a vendor directory can be built, including base+overlay DTB targets,
and updates the dtbs target to use the directory target rule.

> diff --git a/Makefile b/Makefile
> index c307ee9293bcd..6d1d1c803ee86 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1664,8 +1664,8 @@ dtbindingtree :=3D Documentation/devicetree/bindings
>  ifneq ($(dtstree),)
> =20
>  PHONY +=3D dtbs dtbs_prepare dtbs_install dtbs_check
> -dtbs: dtbs_prepare
> -	$(Q)$(MAKE) $(build)=3D$(dtstree) need-dtbslist=3D1
> +dtbs:
> +	$(Q)$(MAKE) $(dtstree)/

[Severity: High]
Does dropping dtbs_prepare from the dtbs target prerequisites and spawning a
separate top-level make for $(dtstree)/ introduce a parallel build race when
vmlinux and dtbs are built together (for example, during make -j all when
CONFIG_OF_EARLY_FLATTREE=3Dy, make -j vmlinux when CONFIG_GENERIC_BUILTIN_D=
TB=3Dy,
or make -j image.fit on arm64)?

Previously, vmlinux (via . -> prepare -> prepare0 -> archprepare) and dtbs
(via dtbs_prepare) shared the same top-level make dependency graph, which
serialized include/config/kernel.release, scripts_basic, and scripts_dtc:

Makefile:
    scripts: scripts_basic scripts_dtc
    	$(Q)$(MAKE) $(build)=3D$(@)
    ...
    archprepare: outputmakefile archheaders archscripts scripts include/con=
fig/kernel.release \
    ...
    dtbs_prepare: include/config/kernel.release scripts_dtc

With dtbs running $(MAKE) $(dtstree)/, the child make enables single-build
and evaluates $(build-dir): $(single-build-prep) where single-build-prep is
dtbs_prepare. In a parallel build, the parent make (building archprepare) a=
nd
the child make (building dtbs_prepare) have independent dependency graphs a=
nd
can run concurrently:

1. Both make instances can run filechk for include/config/kernel.release at
   the same time, racing on the shared include/config/.tmp_kernel.release
   temporary file in scripts/Kbuild.include:

   define filechk
   	$(check-FORCE)
   	$(Q)set -e;						\
   	mkdir -p $(dir $@);					\
   	trap "rm -f $(tmp-target)" EXIT;			\
   	{ $(filechk_$(1)); } > $(tmp-target);			\
   	if [ ! -r $@ ] || ! cmp -s $@ $(tmp-target); then	\
   		$(kecho) '  UPD     $@';			\
   		mv -f $(tmp-target) $@;				\
   	fi
   endef

2. Both make instances can concurrently invoke $(MAKE) $(build)=3Dscripts/b=
asic
   and $(MAKE) $(build)=3Dscripts/dtc in the same output directory, racing =
on
   building the host binaries (fixdep, dtc, fdtoverlay) and their .*.cmd
   files.

[ ... ]

> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 4349108e75e1f..d22b3b2d43b32 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -38,6 +38,13 @@ include $(srctree)/scripts/Makefile.compiler
>  include $(kbuild-file)
>  include $(srctree)/scripts/Makefile.lib
> =20
> +# Make DT directory targets reachable for architectures with a DTS tree.
> +ifeq ($(obj),arch/$(SRCARCH))
> +ifneq ($(wildcard $(src)/boot/dts/),)
> +subdir-y +=3D boot/dts
> +endif
> +endif
> +

[Severity: High]
Because subdir-y +=3D boot/dts is added unconditionally whenever $(obj) is
arch/$(SRCARCH), won't the main "." build pass (as well as non-DT builds li=
ke
make vmlinux or make modules) now recurse into arch/$(SRCARCH)/boot/dts and
all vendor subdirectories even when need-dtbslist is not set?

During make -j, the parent make's "." traversal will descend into
arch/$(SRCARCH)/boot/dts in parallel with the child $(MAKE) $(dtstree)/
spawned by the dtbs target. In every vendor directory where dtb-y or dtb- is
non-empty, scripts/Makefile.build includes scripts/Makefile.dtbs (which adds
$(real-dtb-y) to targets) and then includes the .cmd files for existing
targets:

scripts/Makefile.build:
    ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb %.dtb.o %.dtbo.o,$=
(targets)),)
    include $(srctree)/scripts/Makefile.dtbs
    endif
    ...
    existing-targets :=3D $(wildcard $(sort $(targets)))

    -include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)

If the parallel dtbs sub-make has just created a .dtb file and cmd_and_fixd=
ep
is still writing the corresponding .*.dtb.cmd file while the "." build walk
is evaluating that directory, can the "." sub-make read a partially written
.*.dtb.cmd file and fail with a syntax error?

[ ... ]

$>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-dtb-dirs-v=
3-v4-0-0ec42fd8ef9b@kernel.org?part=3D2
