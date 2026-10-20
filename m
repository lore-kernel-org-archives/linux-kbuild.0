Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792517127;
	b=rxhlJ0dB9/XBUeJ//WJ7/MqDR7Qb0bEVpx8n1rgocbO7dOEZQULWjbrdNxc0ZDN7uwG/
	 GFO6SUD0keBe9sq+K4sW8GWbUtmyVFmwwTLLPI3PV8U6y0BT9iqPGxBNwEHyEnZM4Q94E
	 +tWDRMjQRvdPa7TKvhQiz83fVgY7rAkZtHuk0sx4A5aExoxhMpcqyMSqYxYkWoGE/CU8k
	 cQ3DfokYSnC8mxMu3IiHfowosF7kHeKR0xMkeu8bU7lh8N/UZu7/f9aAf27AjVb2emdMV
	 aWN8NOZij0DpjDQ7mF1lJUhWYrCvDv6U2QjX5fdpgFvLjnXxdgod9jK1kBpaErQbxiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517127;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=41GcUzN4XDaRMpPBkysR0QGcyhgarr2Sb5LXYMDsLOU=;
	b=A9WnG4/LyQfVTm52zcT7SQ45M52bGoPUxBxpGa8qUGg/+Z//L1EJOq7o+hL2ISj+8FWW
	 CLjaJLempB74Ep6BKC+K2xPHMDCTXuxhXooUGLnQy6kLi1bdnxaWuBPlwJQI8cyuvLMlJ
	 0IoJUvIUsTpZb2nn6mRJfIc6QtJ6O7JcZAay+1dpuUci4TmEi7viUi/b8u/s4QsPLpxl7
	 fq6MVm0fCh+LxdGIsFCNLIOKPtb5Q3Vw9VlCUNuur3IXdWRjISkLc1z4nKQBt0Z7UFHEK
	 7wcq5+RMLUtZD+MT0567XzgdLTE+WTOjed7e7XDD9PhNAiYXyBAPYD6IWnslaO7EX6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mQLGW5sj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBAB606A31B;
	Tue, 20 Oct 2026 17:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mQLGW5sj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A0E01F000C9;
	Tue, 20 Oct 2026 17:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792517126;
	bh=41GcUzN4XDaRMpPBkysR0QGcyhgarr2Sb5LXYMDsLOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mQLGW5sjrhktucLERIORURV17rz6cGETr9P4eyl3MmKQ3mX0f33jcKT7NGcTOYoYp
	 +Dodqkq9zERI2/j4HC2b8VDGbMwGc7mOkHLTWSYGsedGpGLNDbTuIJwp4XZZyjp+XD
	 rx+V1VvI0V9jscNC8121bbsCrergl6Xv+jhv+0Fodgi0axAqMb5Cr/E3nRos6L6lVX
	 O/T571rTIq7TKzTLTQLvZ5QR0kTnJiNZKLbMUh+DduTax1fG7A4LB7x3JkVf8AUMGi
	 uqnLZSuAeTGIuKVHqvVKW3igQQ8k8K1zYJPjMI3X/wiOwevCWKepI/HI1LPzvKNKbe
	 wiHoeAe3csCOw==
Date: Tue, 20 Oct 2026 12:25:25 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	David Heidelberg <david@ixit.cz>, Arnd Bergmann <arnd@arndb.de>,
	linux-kbuild@vger.kernel.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v4 2/2] kbuild: Support directory targets for building
 DTBs
Message-ID: <20261020172525.GA4166631-robh@kernel.org>
References: <20261016-dtb-dirs-v3-v4-0-0ec42fd8ef9b@kernel.org>
 <20261016-dtb-dirs-v3-v4-2-0ec42fd8ef9b@kernel.org>
 <sashiko-outbox-175793@kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-175793@kernel.org>

On Sat, Oct 17, 2026 at 07:49:53PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] kbuild: parallel build race in dtbs target and extra boot/dts traversal
> --
> 
> commit 3f00c18c0d96a2ac1d59c7335959fec4fa041ff7
> Author: Rob Herring (Arm) <robh@kernel.org>
> 
> kbuild: Support directory targets for building DTBs
> 
> This commit enables building DTBs using directory targets so that all DTBs
> for a vendor directory can be built, including base+overlay DTB targets,
> and updates the dtbs target to use the directory target rule.
> 
> > diff --git a/Makefile b/Makefile
> > index c307ee9293bcd..6d1d1c803ee86 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1664,8 +1664,8 @@ dtbindingtree := Documentation/devicetree/bindings
> >  ifneq ($(dtstree),)
> >  
> >  PHONY += dtbs dtbs_prepare dtbs_install dtbs_check
> > -dtbs: dtbs_prepare
> > -	$(Q)$(MAKE) $(build)=$(dtstree) need-dtbslist=1
> > +dtbs:
> > +	$(Q)$(MAKE) $(dtstree)/
> 
> [Severity: High]
> Does dropping dtbs_prepare from the dtbs target prerequisites and spawning a
> separate top-level make for $(dtstree)/ introduce a parallel build race when
> vmlinux and dtbs are built together (for example, during make -j all when
> CONFIG_OF_EARLY_FLATTREE=y, make -j vmlinux when CONFIG_GENERIC_BUILTIN_DTB=y,
> or make -j image.fit on arm64)?

I think I just need to add back dtbs_prepare here.

> Previously, vmlinux (via . -> prepare -> prepare0 -> archprepare) and dtbs
> (via dtbs_prepare) shared the same top-level make dependency graph, which
> serialized include/config/kernel.release, scripts_basic, and scripts_dtc:
> 
> Makefile:
>     scripts: scripts_basic scripts_dtc
>     	$(Q)$(MAKE) $(build)=$(@)
>     ...
>     archprepare: outputmakefile archheaders archscripts scripts include/config/kernel.release \
>     ...
>     dtbs_prepare: include/config/kernel.release scripts_dtc
> 
> With dtbs running $(MAKE) $(dtstree)/, the child make enables single-build
> and evaluates $(build-dir): $(single-build-prep) where single-build-prep is
> dtbs_prepare. In a parallel build, the parent make (building archprepare) and
> the child make (building dtbs_prepare) have independent dependency graphs and
> can run concurrently:
> 
> 1. Both make instances can run filechk for include/config/kernel.release at
>    the same time, racing on the shared include/config/.tmp_kernel.release
>    temporary file in scripts/Kbuild.include:
> 
>    define filechk
>    	$(check-FORCE)
>    	$(Q)set -e;						\
>    	mkdir -p $(dir $@);					\
>    	trap "rm -f $(tmp-target)" EXIT;			\
>    	{ $(filechk_$(1)); } > $(tmp-target);			\
>    	if [ ! -r $@ ] || ! cmp -s $@ $(tmp-target); then	\
>    		$(kecho) '  UPD     $@';			\
>    		mv -f $(tmp-target) $@;				\
>    	fi
>    endef
> 
> 2. Both make instances can concurrently invoke $(MAKE) $(build)=scripts/basic
>    and $(MAKE) $(build)=scripts/dtc in the same output directory, racing on
>    building the host binaries (fixdep, dtc, fdtoverlay) and their .*.cmd
>    files.
> 
> [ ... ]
> 
> > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > index 4349108e75e1f..d22b3b2d43b32 100644
> > --- a/scripts/Makefile.build
> > +++ b/scripts/Makefile.build
> > @@ -38,6 +38,13 @@ include $(srctree)/scripts/Makefile.compiler
> >  include $(kbuild-file)
> >  include $(srctree)/scripts/Makefile.lib
> >  
> > +# Make DT directory targets reachable for architectures with a DTS tree.
> > +ifeq ($(obj),arch/$(SRCARCH))
> > +ifneq ($(wildcard $(src)/boot/dts/),)
> > +subdir-y += boot/dts
> > +endif
> > +endif
> > +
> 
> [Severity: High]
> Because subdir-y += boot/dts is added unconditionally whenever $(obj) is
> arch/$(SRCARCH), won't the main "." build pass (as well as non-DT builds like
> make vmlinux or make modules) now recurse into arch/$(SRCARCH)/boot/dts and
> all vendor subdirectories even when need-dtbslist is not set?
> 
> During make -j, the parent make's "." traversal will descend into
> arch/$(SRCARCH)/boot/dts in parallel with the child $(MAKE) $(dtstree)/
> spawned by the dtbs target. In every vendor directory where dtb-y or dtb- is
> non-empty, scripts/Makefile.build includes scripts/Makefile.dtbs (which adds
> $(real-dtb-y) to targets) and then includes the .cmd files for existing
> targets:
> 
> scripts/Makefile.build:
>     ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb %.dtb.o %.dtbo.o,$(targets)),)
>     include $(srctree)/scripts/Makefile.dtbs
>     endif
>     ...
>     existing-targets := $(wildcard $(sort $(targets)))
> 
>     -include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
> 
> If the parallel dtbs sub-make has just created a .dtb file and cmd_and_fixdep
> is still writing the corresponding .*.dtb.cmd file while the "." build walk
> is evaluating that directory, can the "." sub-make read a partially written
> .*.dtb.cmd file and fail with a syntax error?

This should fix the issue:

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index d22b3b2d43b3..22fbd5199091 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -40,7 +40,7 @@ include $(srctree)/scripts/Makefile.lib
 
 # Make DT directory targets reachable for architectures with a DTS tree.
 ifeq ($(obj),arch/$(SRCARCH))
-ifneq ($(wildcard $(src)/boot/dts/),)
+ifdef need-dtbslist
 subdir-y += boot/dts
 endif
 endif
