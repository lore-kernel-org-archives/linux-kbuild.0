Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:54081 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbgAKGOd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 11 Jan 2020 01:14:33 -0500
MIME-Version: 1.0
References: <09f5b36d9c64b4e6d1d235f84a7333b7802b2866.1578131485.git.mirq-linux@rere.qmqm.pl>
 <081640c81d3c89707fdbb8869ae5f54aaea5064e.1578131485.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <081640c81d3c89707fdbb8869ae5f54aaea5064e.1578131485.git.mirq-linux@rere.qmqm.pl>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 11 Jan 2020 15:13:43 +0900
Message-ID: <CAK7LNAQ6TuyRvtDww-CeKweJR7wEnOPyGFRFbDCv+xVEXRp0FQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] builddeb: make headers package thinner
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, Jan 4, 2020 at 6:56 PM Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.q=
mqm.pl> wrote:
>
> Remove a bunch of files not used during external module builds:
>  - foreign architecture headers
>  - subtree Makefiles
>  - Kconfig files
>  - perl scripts
>
> On amd64 system this looses a third of the resulting .deb size.
>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>

Applied to linux-kbuild.
Thanks.


> ---
>  scripts/package/builddeb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index d289c4ebc891..fb68916d5898 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -165,8 +165,8 @@ EOF
>  done
>
>  # Build kernel header package
> -(cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl)=
 > "$objtree/debian/hdrsrcfiles"
> -(cd $srctree; find arch/*/include include scripts -type f -o -type l) >>=
 "$objtree/debian/hdrsrcfiles"
> +(cd $srctree; find . arch/$SRCARCH -maxdepth 1 -name Makefile\*) > "$obj=
tree/debian/hdrsrcfiles"
> +(cd $srctree; find include scripts -type f -o -type l) >> "$objtree/debi=
an/hdrsrcfiles"
>  (cd $srctree; find arch/$SRCARCH -name module.lds -o -name Kbuild.platfo=
rms -o -name Platform) >> "$objtree/debian/hdrsrcfiles"
>  (cd $srctree; find $(find arch/$SRCARCH -name include -o -name scripts -=
type d) -type f) >> "$objtree/debian/hdrsrcfiles"
>  if is_enabled CONFIG_STACK_VALIDATION; then
> --
> 2.20.1
>


--=20
Best Regards
Masahiro Yamada
