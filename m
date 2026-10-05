Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AE24A49AC;
	Mon,  5 Oct 2026 15:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215820; cv=none; b=MFBjcZlBwlms/fcz/t7njeHQDTgMmLona+Rfe/aflWaH9ApQyurEOWWLyTEYQlqLWQqsERG7/QfORXOFUJx9FcWzroq5UeBMxGsOtMiiaLEWIMBvCp0Rzrrkl6pcxOEyi/lQb5WxbBNQ7J96q8nWgWrIkYnaDn7v0orSZeB1T5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215820; c=relaxed/simple;
	bh=dYo2kAPf9NEmY/28ppm4ruNY+cwOypZRmKOtEoPJxYE=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=tWh4Wo+L9liYpYi1PzZK7d4kGA+CQnNVv9s8kh13EO+ixG+3Pe3jCUpPm6btf61arXNX3E4K4Cbp1lT16JTFTDS7Zai4VuZiW0mLyC1W5hHbWPFYo+PgcOBPA94GUaihq3L7abGrmL/h6EC6DY5mYiL+Tvv5ULC2k9P0aO76TZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ll6HwW8T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ll6HwW8T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 081391F000FF;
	Mon,  5 Oct 2026 15:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791215818;
	bh=kjgAz0qkfM8efwXACO7HAMNw5vpK3e6UvJXcySC2o4w=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Ll6HwW8TIPiiJdluj+FtZdiAVuUPL3PBUCrGjw7qL3/3/8RG1F+s2lwRa0eLg3wOY
	 4ozloST2gsvQI0TzjohJ2VyUtuo2x3QY3AYnACMBZz5yWu6wof5z5+1oMcubWEmhf9
	 0XHScL7hQ3VWbeCzAiEv3MycQw90VE4dRUwjgfbejCtp5lyuZUwef8CTJ++0aBTGws
	 Ce8PnB2Q6BlB9RtCrmOdZ2LylZRBm8FHSdDv/BfsdN2HWaU5j5KfNq4GRcC3laVjq3
	 91tpSWOcoi96H/36wKAKMeOYxexrN4o3xKenTwqTLbYf2sdgd1uPNVF+FBdo3PcXSl
	 CV33CYsR0FAeg==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5] scripts/config: honor $KBUILD_OUTPUT by default
From: Nathan Chancellor <nathan@kernel.org>
To: Dmitry Voytik <voytikd@gmail.com>
Cc: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <n.schier@fritz.com>, Rong Zhang <i@rong.moe>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
In-Reply-To: <20261002222119.393508-1-voytikd@gmail.com>
References: <20261002222119.393508-1-voytikd@gmail.com>
Date: Mon, 05 Oct 2026 17:56:52 +0200
Message-Id: <179121581235.2275809.12565811683284940522.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4756; i=nathan@kernel.org;
 h=from:subject:message-id; bh=dYo2kAPf9NEmY/28ppm4ruNY+cwOypZRmKOtEoPJxYE=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFmHTxxd/oj7xLw5+xO8QyfdrbxtrhbC6XlFvqR7qZHBn
 8wqX/7bHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAi80oZ/gqXvdvifP1feN/8
 MvmgngnRbsk/PYU4u7eufaZ9LlTG8BMjw5GLbS78B2KtjrhP8rrJeaMmdvnpXxOmcb1sMWc0+XG
 vngsA
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
> Test --refresh picks up correct config file by using $KBUILD_OUTPUT:
> 	./scripts/config -d CONFIG_UBSAN
> 	./scripts/config --refresh -e CONFIG_UBSAN
> 	grep "CONFIG_UBSAN=y" $KBUILD_OUTPUT/.config && echo "OK"
> 
> Test --file takes precedence over $KBUILD_OUTPUT and a relative
> path is handled properly:
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
> Test --file can accept files with hyphen:
> 	./scripts/config -d CONFIG_UBSAN
> 	cp .out/.config -- -my_config
> 	grep "CONFIG_UBSAN=y" -- -my_config || echo "OK"
> 	./scripts/config  --refresh \
> 	       -e CONFIG_UBSAN --file -my_config
> 	grep "CONFIG_UBSAN=y" -- -my_config && echo "OK"
> 
> Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
> ---
> v5:
>  - Per Nathan Chancellor's suggestion, improved handling $FN path by
>    realpath
>  - https://lore.kernel.org/lkml/179097210878.309835.10523307262544578337.b4-review@b4/
>  - Documented the new test scenario in the git commit message
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
> index 32428ea909c2..7e84c3d4e621 100755
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
> +FN=$(realpath -q -- "$FN" || echo "$FN")

Sashiko has some further complaints about this:

  https://sashiko.dev/#/patchset/20261002222119.393508-1-voytikd@gmail.com

Due to travel and Linux Plumbers, I am not sure I will be able to think
about the best way to resolve this before I finalize the Kbuild tree for
7.4, so this may need to be deferred until after 7.4-rc1 is released
(i.e., it will target 7.5). One option that immediately comes to mind is
requiring $KBUILD_OUTPUT to exist already and only running realpath on
$KBUILD_OUTPUT, which would leave the script unchanged for the case of
$KBUILD_OUTPUT being unset, which seems safer to me:

  if [ -n "$KBUILD_OUTPUT" ]; then
      if [ ! -d "$KBUILD_OUTPUT" ]; then
          echo "KBUILD_OUTPUT is set but does not exist or is not a directory, create it before running $myname" >&2
          exit 1
      fi
      FN=$(realpath "$KBUILD_OUTPUT")/$FN
  fi

This would leave a relative '--file' value + KBUILD_OUTPUT + '--refresh'
in a weird state still but it appears that commit f757f6011c92 ("kbuild:
fix argument parsing in scripts/config") got that wrong almost two years
ago so it doesn't feel like it is worth caring about that until someone
actually complains about it (but I might be missing something).

-- 
Cheers,
Nathan

