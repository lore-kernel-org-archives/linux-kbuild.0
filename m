Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B9B5172D5;
	Fri,  2 Oct 2026 20:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790972116; cv=none; b=akbk/V4LrxLoSg1pJHvgJC1Ied+XVyPM6fVzVWe2K2Szuh3Lfe/xevKTpaMq7DW8xJn8xqxVZ2Y7Q08hVwYWHVTe/fLlvRrF2ZjR3X9cM4OzMcYDdYvFAV1UbEESWFLJZtAIDm0Mw4a5jdYjbFF51kIbUa+tcccj6LULD5wikW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790972116; c=relaxed/simple;
	bh=Ue4xjfWPlwQ6fQWJe2kgGFfvSix+i4cTBvU6YyC7v0g=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=bQaolnRmDKdLkJl2lL139Brh2hbHQDIJ/NtTf1zFwTOuTX9oOlBxEpERRc+AI6XRNJqXbLyNmWZ0yO4w7KV3QzHXNOB8VOLrITg+JWCySLSc0lcCX3lOybC5bEFwzUIeaAszrZWCELVBf8bTVW59dvC8ugpiZuZvpU59cYSX8Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NWLapAOy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NWLapAOy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F1881F000FF;
	Fri,  2 Oct 2026 20:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790972115;
	bh=BSgXFsOyzdqxoC0iBHweIF6GPmDqgY9jRrynJS6jg2s=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=NWLapAOyMuPHEiJoplwA9fSWyO5PULkmXkOaDiIR9nI2YSoMUW/NFCWvf80MV3MJ1
	 HNxgCEDp+1j0sqnB8dgK+H//94agbKpMqbgp9t/a0vl/K1isJRlC4bo/qRlJoTssYS
	 8ZmdyHFTQOA+P4XHs8P4ekH12Jn+gwclnehQqafMM719OD6VR1NIXmB/CH6eSSRtkc
	 lCMUFdZIjejqkpWDZbvf2vmYk4WoPEZ/p0lle9I4FjObxwlurQfQf2wVN2uphrhGsV
	 ERogMynRZguUMY9bIR6dOzOR+PY8dHCnIfWXhHOAh5ZSSzcxE6WQW/FSOd0jVD2FHh
	 3gOioyJMe9kBA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4] scripts/config: honor $KBUILD_OUTPUT by default
From: Nathan Chancellor <nathan@kernel.org>
To: Dmitry Voytik <voytikd@gmail.com>
Cc: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <n.schier@fritz.com>, Rong Zhang <i@rong.moe>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
In-Reply-To: <20261001214618.283635-1-voytikd@gmail.com>
References: <20261001214618.283635-1-voytikd@gmail.com>
Date: Fri, 02 Oct 2026 22:15:08 +0200
Message-Id: <179097210878.309835.10523307262544578337.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3651; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Ue4xjfWPlwQ6fQWJe2kgGFfvSix+i4cTBvU6YyC7v0g=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFkHBM7d08hjO/aobOP+4M+uuvWnrbwjLHSqLilf/CRq/
 ntDXHlwRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZjITX1Ghplxgv4C5nl2jb1a
 G19/CW4LPdP99GkW2xrz+ZOinG+KNzMyzPrHvFI52I9Ppus356Fd77pjmh7v++Kbxx5qcHTFnl1
 tfAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Hi Dmitry,

> If $KBUILD_OUTPUT is set, use it by default if --file is not passed.
> 
> Fix the issue when the script silently updates a stale .config in
> the root directory, while the user expects ${KBUILD_OUTPUT}/.config
> to be updated.
> Handle properly if the config file is a relative path.
> 
> The problem can be worked around with --file, but this is easy to miss,
> and is inconsistent with how the Makefile and other tools work
> (e.g., scripts/diffconfig).
> 
> How to reproduce the issue:
> 	rm .config
> 	export KBUILD_OUTPUT=.out
> 	make defconfig
> 	./scripts/config \
> 	       -e CONFIG_UBSAN
> 	grep: .config: No such file or directory
> 
> How the patch was tested:
> 	make mrproper
> 	export KBUILD_OUTPUT=.out
> 	make defconfig
> 	grep "CONFIG_UBSAN=y" $KBUILD_OUTPUT/.config || echo "OK"
> 
> Test the basic usage:
> 	./scripts/config -e CONFIG_UBSAN
> 	grep "CONFIG_UBSAN=y" $KBUILD_OUTPUT/.config && echo "OK"
> 
> Test --refresh picks up correct config file by using $KBUILD_OUTPUT
> 	./scripts/config -d CONFIG_UBSAN
> 	./scripts/config --refresh -e CONFIG_UBSAN
> 	grep "CONFIG_UBSAN=y" $KBUILD_OUTPUT/.config && echo "OK"
> 
> Test --file takes precedence over $KBUILD_OUTPUT and
> a relative path is handled properly
> 	./scripts/config -d CONFIG_UBSAN
> 	mkdir .out2
> 	cp .out/.config .out2/.my_config
> 	grep "CONFIG_UBSAN=y" .out2/.my_config
> 	./scripts/config --file .out2/.my_config --refresh \
> 	       -e CONFIG_UBSAN
> 	grep "CONFIG_UBSAN=y" .out2/.my_config && echo "OK"
> 	ls .out/.out2 || echo "OK"
> 	ls .out/.out || echo "OK"
> 
> Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
> ---
> v4:
>  - Addressed Nicolas Schier's comments - dropped the change how '--refresh'
>    is handled
>  - Implemented conversion of $FN to the absolute path which helps with
>    '--refresh' and relative paths
>  - Documented testing steps in the commit message
> v3:
>  - Added an example in the commit message how to reproduce the issue
> v2:
>  - Addressed comments by sashiko:
>    - https://sashiko.dev/#/patchset/20260920064350.17999-1-voytikd%40gmail.com
>    - use basename when --refresh is used
>    - remove echo which can be misleading when --file is passed
> v1:
>  - https://lore.kernel.org/all/20260920064350.17999-1-voytikd@gmail.com/
> ---
>  scripts/config | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/scripts/config b/scripts/config
> index 32428ea909c2..0b28fc498195 100755
> --- a/scripts/config
> +++ b/scripts/config
> @@ -130,6 +130,10 @@ on_exit() {
>  trap on_exit EXIT
>  
>  FN=.config
> +if [ -n "${KBUILD_OUTPUT}" ]; then
> +	FN=${KBUILD_OUTPUT}/${FN}
> +fi
> +
>  CMDS=()
>  while [[ $# -gt 0 ]]; do
>  	if [ "$1" = "--file" ]; then
> @@ -143,6 +147,7 @@ while [[ $# -gt 0 ]]; do
>  		shift
>  	fi
>  done
> +FN=$(realpath "$FN")

Sashiko has a couple of comments here:

  https://sashiko.dev/#/patchset/20261001214618.283635-1-voytikd%40gmail.com

The second comment around KBUILD_OUTPUT / '--file' beginning with '-' is
a fairly contrived example but sticking '--' in there does not seem like
an unreasonable hardening move.

As for the first comment, I am not sure I want to rely on 'realpath -m'
since that is a coreutils-ism and up until now, this could work on any
operating system (as least as far as I can tell). Maybe we could do
something like

  FN=$(realpath -q -- "$FN" || echo "$FN")

to just try and hobble along if we cannot resolve $FN properly but maybe
there is a better solution that I am just not seeing at the moment.

-- 
Cheers,
Nathan

