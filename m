Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789925;
	b=lP8sS92QNCs5PJpvYTWCa/oVJW9qbnvguoponZW3Ms+jcWUGPmHGw5NvTDvPNrAAvWbS
	 7H5d3QOqiaSdIHkrsfbaDvPJg6wKzmiKPnzWVpgXFw6AfHUODdLNMANbeNHOtcBrYBMq2
	 Qos6gWL7JXzPnZW8DqVDCr1/u1LuaomYOUNCnDGZ41/rD7H5QB/90gGgJuRjOYCLpNt+A
	 o3l229rXJUcJy3NulhubWrCtkM56roJpIn2F/S6fjR+mGOaHCNSvSAhdsLAkAcIFMpK7D
	 ML65LNbEytjOGsZd86wdQZjxI5L41oVk9GUGS9C1KbC2jIpdLsFq396CGTII71S3uqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789925;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aFc2GklP3bjxGgVfXDwz33q+VHgdgBseGYkS0162pL0=;
	b=tr0t5VQqQ2xVZClcvWVzhGXpoLkLax4zQpjX3TkPWl3J4zFc9JLeJHOFXSBFEsMhwVtf
	 WEV0ipEjFxDR0qWuZXT8Q1/sEQJ2Jr9bIG1xCMzaeN8h5duzzHPQ5Zu69GIEuXmnDDPn6
	 QiqNjtGloG2cnmGMneCfRXk/cDfeYXX/C/cpepcy+BUxhVg1CSA80LCpn3qRqnsXPc/uM
	 qHTvRnfietj9ke0beeUXnXHYBeLA9O4DSFRy0FbrYhFrmT7BlqhKY6epHr8uKau+RjOPS
	 7R/yulo/PRLZO20kFSk9woyT5KLQT5Pt/tR+htIdSb34gf68D5lMphqxjARNcpewTYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YFSbxTh1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4304D606A32D
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Nov 2026 10:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YFSbxTh1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D318C1F000C1;
	Wed,  4 Nov 2026 10:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793789925;
	bh=aFc2GklP3bjxGgVfXDwz33q+VHgdgBseGYkS0162pL0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YFSbxTh1j7qRdqlzRk0ik/9WJ5chD52AZDxff71ZL2lINuIClC9YgpjHK7rmg30Sc
	 /qiSgWjwgFjZtRDmB6yQbemOU5rr4PSqEwZEHaexQ7/oUBlBcPcKZ9t/p4VKKLO9DT
	 YGDz8dLz2ho/6miLdgpQw0RqLnYpZWnzUNTyi7XoI42rLU+t3elFSODkxC5xr5aoMB
	 A6z0WaxuO0vdSOL5dTMxllSTosgkkrYr5pnf9RR/CdSjyokfRKtt9B0eWmDNfItofJ
	 Q21GrWep+fQxEgsCEpm9R3jJNESChjDma8/x196Yl07EZoyB4h4SP6hGKtDeBBugVD
	 m/sukYioSu07Q==
Message-ID: <sashiko-outbox-197134@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] scripts: check-function-names: propagate nm failures
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hamdy Abou El Anein" <info@daylightlinux.ch>, nathan@kernel.org
Cc: nsc@kernel.org, linux-kbuild@vger.kernel.org, hamdy.aea@protonmail.com
In-Reply-To: <20261103105829.10511-1-info@daylightlinux.ch>
References: <20261103105829.10511-1-info@daylightlinux.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 10:58:44 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] scripts: check-function-names: buffering full vmlinux.o nm outpu=
t in shell
--

commit 329efcc5adb68fe0ddbe8ccd5ee716b893c4188e
Author: Hamdy Abou El Anein <hamdy.aea@protonmail.com>

scripts: check-function-names: propagate nm failures

This commit captures the output of nm in a shell variable before piping it
to awk and grep so that check-function-names.sh exits with an error if nm
fails on the input object file.

> diff --git a/scripts/check-function-names.sh b/scripts/check-function-nam=
es.sh
> index 94883e690627d..f07a0e1cf3394 100755
> --- a/scripts/check-function-names.sh
> +++ b/scripts/check-function-names.sh
> @@ -13,7 +13,8 @@ if [ ! -f "$objfile" ]; then
>  	exit 1
>  fi
> =20
> -bad_symbols=3D$(${NM:-nm} -p "$objfile" | awk '$2 ~ /^[TtWw]$/ {print $3=
}' |
> +symbols=3D$(${NM:-nm} -p "$objfile") || exit 1
> +bad_symbols=3D$(printf '%s\n' "$symbols" | awk '$2 ~ /^[TtWw]$/ {print $=
3}' |
>  	      grep -E '^(startup|exit|split|unlikely|hot|unknown)(\.|$)')

[Severity: Medium]
Does capturing the entire nm output into symbols and expanding it into
printf introduce a build-time performance and memory regression when linking
vmlinux.o?

In scripts/Makefile.vmlinux_o, rule_ld_vmlinux.o runs this script on
vmlinux.o in the serial path of the kernel link:

scripts/Makefile.vmlinux_o:
cmd_check_function_names =3D $(srctree)/scripts/check-function-names.sh $@

define rule_ld_vmlinux.o
	$(call cmd_and_savecmd,ld_vmlinux.o)
	$(call cmd,gen_objtooldep)
	$(call cmd,check_function_names)
endef

Because vmlinux.o contains the full built-in kernel symbol table (spanning
many megabytes and hundreds of thousands of symbols, especially on
allmodconfig or allyesconfig builds), previously nm -p streamed directly
into awk in parallel and command substitution only buffered the matching
bad_symbols output (which is empty in the normal case).

With this change, the shell waits for nm to finish while buffering the
entire multi-megabyte symbol table in the symbols variable, and then forks a
subshell that expands and copies the entire string as an argument to printf
before piping it to awk, working against the serial link optimization in
commit c2970d8b52d1 ("kbuild: do not sort nm output where the order is
irrelevant").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103105829.1051=
1-1-info@daylightlinux.ch?part=3D1
