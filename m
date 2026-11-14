Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794682656;
	b=sr9xXoq5DM4WnXgjJqQ+yoZ/a6lErLvBMihlpzVmLQbN1Te0Cl37sStDVcB7AYL44hYv
	 N+pOW7yTrkOZYC+PTJKr8HQvi1NM6xEznV244rXAhWGNO1loolZ/1stY/gfs3kll0i+ym
	 cMcH2tGIZGIF6/k1JbHMWViQCq6+qbU5Eo+CsSzPshFu1L6XSZ20y6H054bqTlDPNy+wK
	 cI2aCJNJovvzPadDVHx8UyA2nv94FfH9KFGBMCIR6TLxc9g8Jk1c9//i0WYaYNuuNwMZg
	 Ve59b7QZ9qv4Cci8qwSz1ZBmqocbgCm3+nFjWIKgQChrKYIDTSGgSLJ05NRlt0pkUJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794682656;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=vnkTlo4N4U982xGS+ENsyF3kse9AEPgpM9mcMNeQORc=;
	b=GuAgGem3r7Uj9GfkBRqsptjQI3Kmkhyqv/KRTXua9FhVLfulDnCfZ+CRdQpith/pWIpw
	 84Q83/SKkvxCFO0NCHC1veL+4yjnzcbV8oI5fvbGU3HkMtyeLwksjgbXED4xazQsjYodd
	 ReUARPsp8A0zTlgiiEo3PiJwUC+b3J2uto2ILlMjTcUmq2hZi7spkELP7xewGr6CcrGap
	 rNBilgNgExWIi8wNbSOocP8zKvyeb9v/kz0+p3FKEuRGWrE7qU38H2AXF9lBbRWzE3iQs
	 9NzJqiabK1TxNeAh/CluaQVXzFD5o+1gENsf3DwfwJni8QsxuDhyxXM1EopiEfVo24Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZpSpCJnc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 9FAAB606A323;
	Sat, 14 Nov 2026 18:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZpSpCJnc
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C4E8F1F000C4;
	Sat, 14 Nov 2026 18:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794682656;
	bh=vnkTlo4N4U982xGS+ENsyF3kse9AEPgpM9mcMNeQORc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZpSpCJncqnm8wM9DdvYgqS7HSLNuZh8MwPhUWzZu646WA1RC0qVFv5/MnzoJdFwXH
	 fPT0Pa8sruEJRneTusHjqatoJO+1m2de10pe4vKx0JH4Avl3CELUf/0ryJH1v5HZYu
	 ZIS8wa9Pe4fnHVGBYQudz//qDVDkYSzE6LKziFVlL2kvcBbdEGJALKBHIEMs/VvQ4O
	 vB81ZOjAS6mfuWtBfrCOcuyICNqqXv+EeaG9ovq+5aqgpZ+ZeZVfopyPBdGYnEiLmN
	 QvGZX5BoYCV9COI6GRuUjMt4eW1Qs6QgG6erm4k7vjW3992ml7kr/pUAJuwItwji+h
	 HUQXn2E87Gftw==
Date: Sat, 14 Nov 2026 19:56:09 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Dmitry Voytik <voytikd@gmail.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v7] scripts/config: honor $KBUILD_OUTPUT by default
Message-ID: <aviuyR8CO027Ch5R@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Dmitry Voytik <voytikd@gmail.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
References: <20261006161155.862736-1-voytikd@gmail.com>
 <179454594618.814257.8646757102444143940.b4-reply@b4>
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
In-Reply-To: <179454594618.814257.8646757102444143940.b4-reply@b4>

On Thu, Nov 12, 2026 at 09:59:06PM -0700, Nathan Chancellor wrote:
> Hi Dmitry,
> 
> On 2026-10-06 18:11 +0200, Dmitry Voytik wrote:
> > If $KBUILD_OUTPUT is set, use it by default if --file is not passed.
> > 
> > Fix the issue when the script silently updates a stale .config in
> > the root directory, while the user expects ${KBUILD_OUTPUT}/.config
> > to be updated.
> > Handle properly if the config file is a relative path.
> > 
> > The problem can be worked around with --file, but this is easy to miss,
> > and is inconsistent with how the Makefile and other tools work
> > (e.g., scripts/diffconfig).
> 
> I was finally able to sit down and look at this a little bit more. I
> think we can avoid the use of realpath altogether, which would avoid
> most of what Sashiko is complaining about. I tested the following diff
> with your examples and they appear to pass without any issues. Please
> give it a shot.

Thanks, somehow the sashiko mail missed my inbox.

realpath on Linux uses '-E' behaviour by default, which is what we want:
check existence of all directory path components of the given path.
Adding the POSIX '-E' option explicitly should solve the non-Linux
issues.

As a follow-up, I would like to add support for $KCONFIG_CONFIG as well.

> I think we can drop most of the reproduction and
> examples in the commit message. If you want to include them for others,
> please put it below the '---' where you have the changelog, as I don't
> think it needs to end up in git history.

+1

But still thanks for providing the test examples, it was and is indeed
helpful for my follow-up tests.

> 
> diff --git a/scripts/config b/scripts/config
> index 32428ea909c2..497551538433 100755
> --- a/scripts/config
> +++ b/scripts/config
> @@ -144,6 +144,22 @@ while [[ $# -gt 0 ]]; do
>  	fi
>  done
>  
> +# If no '--file' was specified, use KBUILD_OUTPUT as the base if it exists
> +if [[ "$FN" = ".config" && -n "$KBUILD_OUTPUT" ]]; then
> +	if [[ ! -d "$KBUILD_OUTPUT" ]]; then
> +		echo "KBUILD_OUTPUT is set ('$KBUILD_OUTPUT') but does not exist or is not a directory." >&2
> +		echo "Create it before running $myname or use '--file' to specify configuration file." >&2
> +		exit 1
> +	fi
> +	FN="$KBUILD_OUTPUT/$FN"
> +fi
> +# Turn FN into an absolute path if it is relative so that '--refresh' works on
> +# the correct file. This does not use realpath, as $FN may not exist yet.
> +case "$FN" in
> +	/*) ;;
> +	*) FN="$PWD/$FN" ;;
> +esac
> +
>  set -- "${CMDS[@]}"
>  if [ "$1" = "" ] ; then
>  	usage
> @@ -200,10 +216,10 @@ while [ "$1" != "" ] ; do
>  		;;
>  
>  	--state|-s)
> -		if grep -q "# ${CONFIG_}$ARG is not set" $FN ; then
> +		if grep -q "# ${CONFIG_}$ARG is not set" "$FN" ; then
>  			echo n
>  		else
> -			V="$(grep "^${CONFIG_}$ARG=" $FN)"
> +			V="$(grep "^${CONFIG_}$ARG=" "$FN")"
>  			if [ $? != 0 ] ; then
>  				echo undef
>  			else
> @@ -229,7 +245,7 @@ while [ "$1" != "" ] ; do
>  		;;
>  
>  	--refresh)
> -		yes "" | make oldconfig KCONFIG_CONFIG=$FN
> +		yes "" | make oldconfig KCONFIG_CONFIG="$FN"
>  		;;
>  
>  	*)
> 
> -- 
> Cheers,
> Nathan
> 

Looks good to me, thanks.

Reviewed-by: Nicolas Schier <nsc@fjasle.eu>


-- 
Nicolas
