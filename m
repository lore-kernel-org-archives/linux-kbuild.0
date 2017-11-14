Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:54959 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755112AbdKNQwX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Nov 2017 11:52:23 -0500
Date: Tue, 14 Nov 2017 17:52:21 +0100
From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: Re: [Cocci] [PATCH v3] coccinelle: fix parallel build with
 CHECK=scripts/coccicheck
Message-ID: <20171114165221.GF729@wotan.suse.de>
References: <1510650290-3363-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1510650290-3363-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr

On Tue, Nov 14, 2017 at 06:04:49PM +0900, Masahiro Yamada wrote:
> diff --git a/scripts/coccicheck b/scripts/coccicheck
> index 040a8b1..7da82a1 100755
> --- a/scripts/coccicheck
> +++ b/scripts/coccicheck
> @@ -70,6 +64,13 @@ if [ "$C" = "1" -o "$C" = "2" ]; then
>      # Take only the last argument, which is the C file to test
>      shift $(( $# - 1 ))
>      OPTIONS="$COCCIINCLUDE $1"
> +
> +    # If -j option is given to Make, scripts/coccicheck runs in parallel.
> +    # If coccinelle also runs in parallel, it fails because multiple processes
> +    # try to get access to the same subdirectory that stores stdout/stderr.
> +    # No need to parallelize coccinelle in this case - this mode takes only
> +    # one file input.
> +    NPROC=1

Shouldn't this also warn to the user, and recommend to use a proper form to
parallelize coccinelle? Otherwise a user might get the impression they are
parallelizing coccinelle where they really did not.

  Luis

>  else
>      ONLINE=0
>      if [ "$KBUILD_EXTMOD" = "" ] ; then
