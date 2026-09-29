Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114A1391828;
	Tue, 29 Sep 2026 12:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683525; cv=none; b=gjYC5XUIUjH0CruLbxctQcUJh4hMNP3Lr3EsoiaNWGEwbO6Y3CZrGSWEnhcz3ZqLEVIgtrIjlWcGleSgdp0ri4z0KtdYxwT6mV9zGU8RUJlZfPtDLo0KGW+UYkBzfQWyke9bfwZbi1uIU0qZUHFfVJAv9D0ApscAkRnFzulHPjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683525; c=relaxed/simple;
	bh=Gv3iMuSmU+Xp2uinMCZchVZhap3jjvIIJWZf7M8cIO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QxpMvnz0skgrf3NZ1MdnkGwT7NEY62Th7Q/ui2+uLb17hjm6bmtbCWoqi2ou+ge3T1tP7HOg2hktutLHNCKTtLaVt8fDdE6Hn0FIh20t+I4Dx9VonjEjO5XTm8BQEzeV3ol+r6iXOyC5rg9cWTjlPPtw+LU5GBf+AiEr8qCE1+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JGEcMqt9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JGEcMqt9"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 382E21F000FF;
	Tue, 29 Sep 2026 12:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790683523;
	bh=oj7thmJKcsZbHswn4eWFZG8u2Hhc7HXygNSaG0G1cmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JGEcMqt9dnSO8XCYce1Md+Pdk/sC2uTiGYCALci5Am25HNvUNpEFvfoYT071Flq0Y
	 ujgT/yMHWK0Ok9gRS3ltf1aZfMMKfXuFMG4GF4mvVIemRUqSaRPR+pTjvzt+HDC2QG
	 zytHQTXQHKcCVqoUjD64gvfKMDFADcfrNprVJJ91v1atOTV+GszRMV/2zMEQCZhZs5
	 FjeoyCyPMSRG24neWHFja7lvqsLniTqhrJaXDfQGiGrr6W6VEqOPyTKEtY+PcqAkDr
	 sfPikAGW9hLi+QIN9em4Vu/QiEeFsTA6YcJ3xHQxU0C9KiCQ2rMopLziqV5QPHt5oD
	 u2hCpAOWJNMLw==
Date: Tue, 29 Sep 2026 10:45:08 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Dmitry Voytik <voytikd@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Rong Zhang <i@rong.moe>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3] scripts/config: honor $KBUILD_OUTPUT by default
Message-ID: <art6lF6jcHBNHCi3@levanger>
Mail-Followup-To: Dmitry Voytik <voytikd@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>, Rong Zhang <i@rong.moe>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260927154101.122633-1-voytikd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927154101.122633-1-voytikd@gmail.com>

On Sun, Sep 27, 2026 at 05:41:01PM +0200, Dmitry Voytik wrote:
> If $KBUILD_OUTPUT is set, use it by default if --file is not passed.
> 
> Fix the issue when the script silently updates a stale .config in
> the root directory, while the user expects ${KBUILD_OUTPUT}/.config
> to be updated.
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
> Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
> ---
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
>  scripts/config | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/config b/scripts/config
> index 32428ea909c2..cdee67157fe1 100755
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
> @@ -229,7 +233,7 @@ while [ "$1" != "" ] ; do
>  		;;
>  
>  	--refresh)
> -		yes "" | make oldconfig KCONFIG_CONFIG=$FN
> +		yes "" | make oldconfig KCONFIG_CONFIG=$(basename $FN)

Thanks for attempting to fix the '--refresh' option.  But this way,
this may lead to very unexpected behaviour, as it regardlessly modifies
the path to the config file, even if it was specified via --file.

If --file is given, it should take precedence over any KBUILD_OUTPUT
(or KCONFIG_CONFIG) from the environment and not be changed unrequested.

It would be a tiny bit nicer to just strip the KBUILD_OUTPUT path from
FN, e.g. (untested):

		yes "" | make oldconfig KCONFIG_CONFIG="${FN#${KBUILD_OUTPUT}/}"

But I am still not feeling happy with that.

-- 
Nicolas
