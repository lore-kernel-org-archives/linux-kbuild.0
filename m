Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Cpsmtpm-eml106.kpnxchange.com ([195.121.3.10]:60017 "EHLO
	CPSMTPM-EML106.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750980AbZGHH2c (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 Jul 2009 03:28:32 -0400
From: Frans Pop <elendil@planet.nl>
Subject: Re: [PATCH] kbuild: deb-pkg fix install scripts for posix sh
Date: Wed, 8 Jul 2009 09:28:29 +0200
References: <1246817854-27396-1-git-send-email-max@stro.at>
In-Reply-To: <1246817854-27396-1-git-send-email-max@stro.at>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200907080928.30733.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: linux-kbuild@vger.kernel.org, sam@ravnborg.org, Andres Salomon <dilinger@debian.org>

On Sunday 05 July 2009, maximilian attems wrote:
> bash versus dash and posh disagree on expanding $@ within double
> quotes: export x="$@"
> see http://bugs.debian.org/381091 for details
> just use the arglist with $*.
[...]
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index b19f1f4..8b357b0 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -89,7 +89,7 @@ for script in postinst postrm preinst prerm ; do
>  set -e
>
>  # Pass maintainer script parameters to hook scripts
> -export DEB_MAINT_PARAMS="\$@"
> +export DEB_MAINT_PARAMS="\$*"

Although blindly replacing "$@" by "$*" can cause regressions because they 
*do* expand differently [1], I do not see a problem in this case given 
that AFAIK Debian maintainer scripts only pass parameters without 
whitespace in them.

Acked-by: Frans Pop <elendil@planet.nl>


[1] $@ preserves quoting; try the following:
cat <<EOF >test.fjp
#! /bin/bash
for i in "$*"; do echo $i; done
for i in "$@"; do echo $i; done
EOF
chmod +x test.fjp
./test.fjp This "is a" test
