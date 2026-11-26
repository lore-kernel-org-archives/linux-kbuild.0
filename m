Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675423;
	b=3mP0meGFhTh7R1jehcz+BC68dT+QSLl+3a5oqFLLALvvwfe+vKp3BEydm0gJSXRePWwP
	 DkRd33WhBTVXi0U8VzsQdXr3hJNGjAIhBavd6+vCAJ2nro/Z/0pdDh3Mme+RkUDVSITB4
	 lxVM9eKB6+wt7Ytu0Ares52lRM6OhAuzGZcXb4SmuEoEChMni8EnINZrYIn7cXlnxeaNs
	 fE9PEZn/EDNf0WzPO8c02vQJQ9uMHvE8Dt+CqHov57fwNqxU4mP+1oVt5TtaA5tnYdY3s
	 GB3+WWTz0CESIiCy3lf+faWuy5AVHTeEknSS00k/vRz9yEMgLYsLrNteP8FkKseYD2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675423;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VTZrY4RaRFLLd3ml+mubk2bvf6qsTqby9nV31hm0gpE=;
	b=22TsIpf8Zf2r1qaWweW0LLUS/Myg5nXmJSkfDS2jmpapZi1/GpoXQHYuyWKzSIH9DurF
	 2Ahv9VX71hL+A39KsgLYforUNT9PkycAIf3VAMhnjDKntftQL6b1gXseKQH9TCF8t+P/Y
	 pIFCPutYKdeTn4RjKEfrNt6gkLiH0I+Kxc+Wi8aQAzQBk+ea9QvCKovu/D8ZOMIatMF4s
	 nRSheZmWBoXBGFnMsNO7/lTcKIrjUYj7KggDP6eYVt/UYiO6vlQLE1PbMZVirqMI6O97R
	 wDSAhw2uWXevLLevLikxb1A+ocjIJnBDquZ4kBhmHozt5R1HqHKLicjV/79mzIgk+1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KRlyU233;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89E8606A323
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Nov 2026 06:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KRlyU233
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA891F000C0;
	Thu, 26 Nov 2026 06:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795675422;
	bh=VTZrY4RaRFLLd3ml+mubk2bvf6qsTqby9nV31hm0gpE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KRlyU233Z3eAgXqv9O2kMPXblO1PiaQ31WsbnlW5FTg3HwhXrJqBrO1+5+can0m5I
	 OUE0NdxAvP7/mTlQfGM7m4KBfCrjcQ0CU+2Kd2jD+JajAEUTPEiWWMlvOXDNBDPNJA
	 VCxQDvA2aLJUfkJvEvJmLpfLztSMdBMiTmN6rwmCMSTKAPyyGkWCGDH0h7uNCfAwpS
	 NqgkPDkmE/2WODRWVauyWxVWLrnhKxGtuavJim5nUQL0c6pTTklDON6rGp5uJmh3eK
	 mYU5Ls1oJmfaF+FQGr405lDsPSgRiCpnIIQj9caDj0qrvEQRI8oFPZ7KLYkIE5WaRw
	 VD+0oAuPdu8PA==
Message-ID: <sashiko-outbox-234889@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] kbuild: Introduce CONFIG_CROSS_COMPILING
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nathan Chancellor" <nathan@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>, "Nicolas
 Schier" <nsc@kernel.org>
Cc: x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, "Nick Desaulniers" <ndesaulniers@google.com>, "Bill
 Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>, "Julian
 Braha" <julianbraha@gmail.com>, linux-kbuild@vger.kernel.org, "Linus
 Torvalds" <torvalds@linux-foundation.org>
In-Reply-To: <20261124-x86-no-march-native-on-non-x86_64-v3-1-268354149c5f@kernel.org>
References: <20261124-x86-no-march-native-on-non-x86_64-v3-0-268354149c5f@kernel.org>
 <20261124-x86-no-march-native-on-non-x86_64-v3-1-268354149c5f@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 06:43:41 +0000
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
- [Medium] kbuild: missing LC_ALL=3DC in check-cross-compiling.sh breaks
  get_target()
--

commit 9280272f16cf67d3e6acabda19014fda4538151a
Author: Nathan Chancellor <nathan@kernel.org>

kbuild: Introduce CONFIG_CROSS_COMPILING

This commit introduces CONFIG_CROSS_COMPILING and a helper script,
scripts/check-cross-compiling.sh, to detect cross-compilation by comparing
the first component of the target triples reported by $(HOSTCC) -v and
$(CC) -v.

Link: https://lore.kernel.org/CAHk-=3DwgmkoWHWwaQ6nsGoCiBp0hrpJuiwmoVbQ=3DE=
fun8JyUNKw@mail.gmail.com/

> diff --git a/scripts/check-cross-compiling.sh b/scripts/check-cross-compi=
ling.sh
> new file mode 100755
> index 0000000000000..4c1e6a061b3b1
> --- /dev/null
> +++ b/scripts/check-cross-compiling.sh
> @@ -0,0 +1,26 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +
> +HOSTCC=3D"$1"
> +CC=3D"$2"
> +
> +get_target() {
> +    "$@" -v 2>&1 | grep -o 'Target: \([^-]\+\)'
> +}
> +
> +if ! hostcc_target=3D$(get_target $HOSTCC); then
> +    echo >&2 "$0: Could not get target for HOSTCC!"
> +    exit 1
> +fi

[Severity: Medium]
Can get_target() fail to match "Target: " when building under a non-English
locale?

The top-level Makefile runs "unexport LC_ALL" and only forces LC_COLLATE=3DC
and LC_NUMERIC=3DC, leaving LANG and LC_MESSAGES intact in the environment.
When GCC has localized message catalogs installed, "gcc -v" translates the
"Target: %s" line (for example, "Ziel: " in de_DE or "Cible : " in fr_FR).
Because CROSS_COMPILING invokes this script via $(success,...), the
resulting exit 1 is silently treated as a native build, leaving
CONFIG_CROSS_COMPILING=3Dn during cross-compilation.  Prefixing the compiler
invocation with LC_ALL=3DC avoids the locale dependency.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-x86-no-mar=
ch-native-on-non-x86_64-v3-0-268354149c5f@kernel.org?part=3D1
