Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:49243 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752332AbbDOMaS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Apr 2015 08:30:18 -0400
Message-ID: <552E59D9.7060101@suse.cz>
Date: Wed, 15 Apr 2015 14:30:17 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] deb-pkg: move setting debarch for a separate function
References: <cf573e24baadc04da27c471dafee90344e0cb400.1428671643.git.riku.voipio@linaro.org>
In-Reply-To: <cf573e24baadc04da27c471dafee90344e0cb400.1428671643.git.riku.voipio@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: riku.voipio@linaro.org
Cc: linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org

On 2015-04-10 15:15, riku.voipio@linaro.org wrote:
> From: Riku Voipio <riku.voipio@linaro.org>
> 
> create_package() function tries to resolve used architecture
> for everry package. Split the setting the architecture to a
> new function, set_debarch(), called once on startup.
> 
> This allows using debarch from other parts of script as
> needed.
> ---
>  scripts/package/builddeb | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index a9858a4..e397815 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -27,8 +27,15 @@ create_package() {
>  	chown -R root:root "$pdir"
>  	chmod -R go-w "$pdir"
>  
> +	# Create the package
> +	dpkg-gencontrol $forcearch -Vkernel:debarch="${debarch:-$(dpkg --print-architecture)}" -p$pname -P"$pdir"
> +	dpkg --build "$pdir" ..
> +}
> +
> +set_debarch() {
>  	# Attempt to find the correct Debian architecture
> -	local forcearch="" debarch=""
> +	forcearch=""
> +	debarch=""
>  	case "$UTS_MACHINE" in
>  	i386|ia64|alpha)
>  		debarch="$UTS_MACHINE" ;;
> @@ -73,10 +80,8 @@ create_package() {
>  	if [ -n "$debarch" ] ; then
>  		forcearch="-DArchitecture=$debarch"
>  	fi
> +	export forcearch debarch

You do not need to export the variables. But it will improve the
readability of the script if you initialize the variables in the
toplevel scope.

Also, the fallback for empty $debarch is $(dpkg --print-architecture).
It makes sense to set it once in the new function.

Michal
