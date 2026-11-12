Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491144;
	b=ClqfWB4aA1mfCBl0Glj2iXUvswWi4EUZxYIqFnHydUje9pS85EPIHx2pSevlz9BnR2RR
	 18Gl056G1KRVo7k1cICjLY3sz6souJOWF6YXjot/xuQMbJ7rjzENJa9RvavN7tz1Krcby
	 s3XEXE8S1fzE4ZWUcPvTmp0Fh+IInxRI7vF4LvRTVtyTQDwwFKwqWognk+CVOx7XyDTLM
	 965kxQ/i0x5pm4+16Yiofr+3Wxp1qDl0ccSinCHLRAdE8P9BjBRUIvmSGxKq8cboR/Xlb
	 fTL21xsWtYC51ZJnnZ1IodMMWdegXq+Y6HUqR0V9O+vUbuBmUQfaeNivkmnuFJPlrCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491144;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aT16KA4MQDAF15+nyLCa6tt/dF/cLKIFYBequyDmlYg=;
	b=teDI5qiuy10296TYXVUrj4sRtgi7WhW9zfZ0GFS8s8PVyon4qd+58oS8xrPDQ5Xy7HEe
	 WDW+6gOz8H3ejs9J1tVEKtFodiFoEwWXN6C5JYkyejJO6lbHPdTVP5pqLTD8yJBImBdt6
	 GBflX+8bH9WCAdthDh/QlIOSYmYtX6usUsc0OpdSHVMSavdkMmIQ2c2mrm6yIsR/HW/QJ
	 frfEbFpDV1IOpQGFArsmwMe+TsiuEV8e9XOBkRyxB4IyLFf4OqJoIa8cBivORUYKEdn7u
	 WMQ9i+tHrFjpKTNRqwkrr4dN7e59rGBlzG2YAauxzN3y14j8JnnsWne06Jq1rNad8qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GkCK6X2f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD44606A330
	for <linux-kbuild@vger.kernel.org>; Thu, 12 Nov 2026 13:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GkCK6X2f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D256D1F00A05;
	Thu, 12 Nov 2026 13:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794491144;
	bh=aT16KA4MQDAF15+nyLCa6tt/dF/cLKIFYBequyDmlYg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GkCK6X2f29+YUfaiFlUcKgcLKFu8JAdVV7FoSPMdqvdio0zssyXE2SSbIG6bTzfvN
	 Eq79Yn1LhgMJrrggwwDGYMFtMqcjEnbQJXvGFZVYcReO2oOG7wugueHauaMGwi8BT1
	 WZHSaAxGYMvdFRrae4rOZZT3cmo5x3FnQkXhGXjc9FkytHxKkwVvaWH+J3iQv9zfKu
	 MXH+uPMsCWpfyUhheUnoQ/EdEOUiW2kMxTuH60ZzX6T9R1eqTrrRyiHRajyyQALoy/
	 w3LcUHQR3BPOhGiifJx8BBjoFhCpnPbvB2/75yaVORqeY2stw3VxkuOIYB7sZ4a18U
	 ZKJeBhqBMpDOg==
Message-ID: <sashiko-outbox-211218@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] kbuild: move scripts/mod target out of single-build
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Mailhol" <mailhol@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org
In-Reply-To: <20261111-reduce-single-build-dependencies-v1-3-7196ca986a85@kernel.org>
References: <20261111-reduce-single-build-dependencies-v1-0-7196ca986a85@kernel.org>
 <20261111-reduce-single-build-dependencies-v1-3-7196ca986a85@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 13:45:43 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] kbuild: unordered modpost_prepare and stack_protector_prepare
  mutates CFLAGS
--

commit 08ffc13380249741520c2ea434688d701b5d0e9b
Author: Vincent Mailhol <mailhol@kernel.org>

kbuild: move scripts/mod target out of single-build

This commit moves the scripts/mod build out of prepare0 into a new
modpost_prepare target depended on by modules_prepare and modpost.

> diff --git a/Makefile b/Makefile
> index 2c1289a44c560..93236f310f080 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1405,7 +1405,7 @@ scripts: scripts_basic scripts_dtc
>  # archprepare is used in arch Makefiles and when processed asm symlink,
>  # version.h and scripts_basic is processed / created.
> =20
> -PHONY +=3D prepare archprepare
> +PHONY +=3D prepare archprepare modpost_prepare
> =20
>  archprepare: outputmakefile archheaders archscripts scripts include/conf=
ig/kernel.release \
>  	asm-generic $(version_h) include/generated/utsrelease.h \
> @@ -1414,6 +1414,8 @@ archprepare: outputmakefile archheaders archscripts=
 scripts include/config/kerne
> =20
>  prepare0: archprepare
>  	$(Q)$(MAKE) $(build)=3D. prepare $(if $(single-build),,prepare_checks)
> +
> +modpost_prepare: archprepare
>  	$(Q)$(MAKE) $(build)=3Dscripts/mod

[Severity: Low]
Should modpost_prepare be ordered relative to stack_protector_prepare (or
depend on prepare)?

On arm, arm64, powerpc, and riscv, prepare depends on
stack_protector_prepare, which depends on prepare0 and mutates the
exported KBUILD_CFLAGS variable at recipe execution time:

arch/arm64/Makefile:
prepare: stack_protector_prepare
stack_protector_prepare: prepare0
	$(eval KBUILD_CFLAGS +=3D -mstack-protector-guard=3Dsysreg		  \
				-mstack-protector-guard-reg=3Dsp_el0	  \
				-mstack-protector-guard-offset=3D$(shell	  \
			awk '{if ($$2 =3D=3D "TSK_STACK_CANARY") print $$3;}' \
				$(objtree)/include/generated/asm-offsets.h))

Previously, scripts/mod was built inside prepare0, so it always ran before
stack_protector_prepare modified KBUILD_CFLAGS.  With modpost_prepare
only depending on archprepare, a parallel build runs modpost_prepare
concurrently with prepare0 before stack_protector_prepare updates
KBUILD_CFLAGS, whereas a serial build or make modules_prepare runs
prepare first and passes the updated KBUILD_CFLAGS to scripts/mod.

Because scripts/mod/empty.o is compiled with KBUILD_CFLAGS, switching
between parallel and serial or single-module builds changes its recorded
command line, rebuilding empty.o, regenerating elfconfig.h (which uses
if_changed), and forcing a full rebuild of modpost.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-reduce-sin=
gle-build-dependencies-v1-0-7196ca986a85@kernel.org?part=3D3
