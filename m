Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:65373
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751303AbdKMPac (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Nov 2017 10:30:32 -0500
Date: Mon, 13 Nov 2017 16:30:25 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH v2] coccinelle: fix parallel build with
 CHECK=scripts/coccicheck
In-Reply-To: <1510210850-28866-1-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <alpine.DEB.2.20.1711131628370.20333@hadrien>
References: <1510210850-28866-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, cocci@systeme.lip6.fr, Nicolas Palix <nicolas.palix@imag.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>



On Thu, 9 Nov 2017, Masahiro Yamada wrote:

> The command "make -j8 C=1 CHECK=scripts/coccicheck" produces lots of
> "coccicheck failed" error messages.
>
> I do not know the coccinelle internals, but I guess --jobs does not
> work well if spatch is invoked from Make running in parallel.
> Disable --jobs in this case.

Why is this change under:

if [ "$C" = "1" -o "$C" = "2" ];

The coccicheck failed messages come also if one runs Coccinelle on the
entire kernel.

julia


>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> Changes in v2:
>   - Grep '-j' instead of '--jobserver-auth'.
>     '--jobserver-*' is not a stable option flag.
>     Make 4.2 change '--jobserver-fds' into '--jobserver-auth'
>   - Add -q option to grep
>
>  scripts/coccicheck | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/coccicheck b/scripts/coccicheck
> index 040a8b1..8bab11e 100755
> --- a/scripts/coccicheck
> +++ b/scripts/coccicheck
> @@ -70,6 +70,9 @@ if [ "$C" = "1" -o "$C" = "2" ]; then
>      # Take only the last argument, which is the C file to test
>      shift $(( $# - 1 ))
>      OPTIONS="$COCCIINCLUDE $1"
> +
> +    # --jobs does not work if Make is running in parallel
> +    echo $MAKEFLAGS | grep -q -E '(^| )-j' && USE_JOBS="no"
>  else
>      ONLINE=0
>      if [ "$KBUILD_EXTMOD" = "" ] ; then
> --
> 2.7.4
>
>
