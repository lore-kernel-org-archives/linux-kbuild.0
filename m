Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46603 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755826AbeEIHVc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 9 May 2018 03:21:32 -0400
Date: Wed, 9 May 2018 09:21:29 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2] kbuild: deb-pkg improve maintainer address generation
Message-ID: <20180509072129.s5pllvhg6w7e4g6t@pengutronix.de>
References: <20180507071134.5213-1-riku.voipio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180507071134.5213-1-riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: riku.voipio@linaro.org
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, debian-kernel@lists.debian.org, malat@debian.org

Hello,

On Mon, May 07, 2018 at 10:11:34AM +0300, riku.voipio@linaro.org wrote:
> From: Riku Voipio <riku.voipio@linaro.org>
> 
> There is multiple issues with the genaration of maintainer string
> 
> It uses DEBEMAIL and EMAIL enviroment variables, which may contain angle brackets,
> creating invalid maintainer strings. The documented KBUILD_BUILD_USER and
> KBUILD_BUILD_HOST variables are not used. Undocumented and uncommon NAME
> variable is used. Refactor the Maintainer string to:
> 
> - use EMAIL or DEBEMAIL directly if they are in form "name <user@host>"
> - use KBUILD_BUILD_USER and KBUILD_BUILD_HOST if set before falling
>   back to autodetection
> - no longer use NAME variable or the useless Anonymous string
> 
> The logic is switched from multiline if/then/fi statements to compact
> shell variable substition commands.
> 
> Reported-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> ---
> v2: include improvements suggested by Masahiro-san
> 
>  scripts/package/mkdebian | 27 +++++++++++++--------------
>  1 file changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 6adb3a16ba3b..985d72d1ab34 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -71,22 +71,21 @@ if [ "$ARCH" = "um" ] ; then
>  	packagename=user-mode-linux-$version
>  fi
>  
> -# Try to determine maintainer and email values
> -if [ -n "$DEBEMAIL" ]; then
> -       email=$DEBEMAIL
> -elif [ -n "$EMAIL" ]; then
> -       email=$EMAIL
> -else
> -       email=$(id -nu)@$(hostname -f 2>/dev/null || hostname)
> -fi
> -if [ -n "$DEBFULLNAME" ]; then
> -       name=$DEBFULLNAME
> -elif [ -n "$NAME" ]; then
> -       name=$NAME
> +email=${DEBEMAIL-$EMAIL}
> +
> +# use email string directly if it contains <email>
> +if echo $email | grep -q '<.*>'; then
> +	maintainer=$email

Alternatively you can do:

	case "$email" in
	*\<*\>*)
		maintainer="$email"
		;;
	*)
		...

	esac

which might be a tad quicker because case is shell-builtin.

>  else
> -       name="Anonymous"
> +	# or construct the maintainer string
> +	user=${KBUILD_BUILD_USER-$(id -nu)}
> +	name=${DEBFULLNAME-$user}
> +	if [ -z "$email" ]; then
> +		buildhost=${KBUILD_BUILD_HOST-$(hostname -f 2>/dev/null || hostname)}

On Debian machines there is also /etc/mailname which should be preferred
over hostname -f.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
