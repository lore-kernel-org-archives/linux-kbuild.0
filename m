Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:61251 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756886Ab1DZGwy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2011 02:52:54 -0400
MIME-Version: 1.0
In-Reply-To: <4DB4832E.6080009@verizon.net>
References: <4DB4832E.6080009@verizon.net>
Date: Tue, 26 Apr 2011 02:52:54 -0400
Message-ID: <BANLkTikbo2tqcvAZ5_druZR+fYhBozakew@mail.gmail.com>
Subject: Re: [PATCH] kbuild: allow headerdep to work in KBUILD_OUTPUT and add
 targets to PHONY
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: pefoley2@verizon.net
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, mmarek@suse.cz

Hi,

On Sun, Apr 24, 2011 at 4:08 PM, Peter Foley <pefoley2@verizon.net> wrote:
> This patch fixes the headerdep target so it will work when make is executed from KBUILD_OUTPUT.
> It also adds a few targets to PHONY so they are always executed.
>
one change, one patch, please.

Why do you want that much consistency check to be always ran ?
Especially `coccicheck', which rely on a non-common program being
available.

Thanks,
 - Arnaud

> Signed-off-by: Peter Foley <pefoley2@verizon.net>
> ---
>  Makefile |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index b967b96..093c9d2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -991,7 +991,8 @@ include/generated/utsrelease.h: include/config/kernel.release FORCE
>
>  PHONY += headerdep
>  headerdep:
> -       $(Q)find include/ -name '*.h' | xargs --max-args 1 scripts/headerdep.pl
> +       $(Q)find $(srctree)/include/ -name '*.h' | xargs --max-args 1 \
> +       $(srctree)/scripts/headerdep.pl -I$(srctree)/include
>
>  # ---------------------------------------------------------------------------
>
> @@ -1392,6 +1393,8 @@ tags TAGS cscope gtags: FORCE
>  # Scripts to check various things for consistency
>  # ---------------------------------------------------------------------------
>
> +PHONY += includecheck versioncheck coccicheck namespacecheck export_report
> +
>  includecheck:
>        find * $(RCS_FIND_IGNORE) \
>                -name '*.[hcS]' -type f -print | sort \
> --
> 1.7.5.rc1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
