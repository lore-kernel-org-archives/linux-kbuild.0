Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lebrac.rtp-net.org ([195.154.106.105]:34477 "EHLO
	lebrac.rtp-net.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751469AbbDBMCr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Apr 2015 08:02:47 -0400
From: Arnaud Patard (Rtp) <arnaud.patard@rtp-net.org>
Subject: Re: [PATCH 1/4] deb-pkg: Add automatic support for armhf architecture
References: <cover.1427968988.git.riku.voipio@linaro.org>
	<834bd55c0de686780eb15f9a06b13f7fb560e9a8.1427968988.git.riku.voipio@linaro.org>
Date: Thu, 02 Apr 2015 14:01:43 +0200
In-Reply-To: <834bd55c0de686780eb15f9a06b13f7fb560e9a8.1427968988.git.riku.voipio@linaro.org>
	(riku voipio's message of "Thu, 2 Apr 2015 14:27:27 +0300")
Message-ID: <87fv8i3fiw.fsf@lebrac.rtp-net.org>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: riku.voipio@linaro.org
Cc: linux-kbuild@vger.kernel.org, mmarek@suse.cz, debian-kernel@lists.debian.org, Ben Hutchings <ben@decadent.org.uk>, debian-arm@lists.debian.org

riku.voipio@linaro.org writes:

> From: Ben Hutchings <ben@decadent.org.uk>
>
> The Debian armhf architecture uses the ARM EABI hard-float variant,
> whereas armel uses the soft-float variant.  If the compiler used
> to compile the kernel uses the __ARM_PCS_VFP ABI, the compiler
> targets armhf architecture.
>
> v3 by Riku: Use gcc define instead of CONFIG_VFP
>
> Cc: debian-arm@lists.debian.org
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> ---
>  scripts/package/builddeb | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 88dbf23..146b74f 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -45,7 +45,16 @@ create_package() {
>  	arm64)
>  		debarch=arm64 ;;
>  	arm*)
> -		debarch=arm$(grep -q CONFIG_AEABI=y $KCONFIG_CONFIG && echo el || true) ;;
> +		if grep -q CONFIG_AEABI=y $KCONFIG_CONFIG; then
> +			if $CC -dM -E - < /dev/null|grep -q __ARM_PCS_VFP; then

Actually, I guess there's nothing preventing you building a armhf kernel
with a compiler not having __ARM_PCS_VFP defined by default, but I'm not sure
we should take care of this case. One can always use KBUILD_DEBARCH=armhf.

Arnaud
