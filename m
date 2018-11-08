Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:25847 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726469AbeKIBDI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Nov 2018 20:03:08 -0500
MIME-Version: 1.0
References: <20181107143646.27675-1-robh@kernel.org>
In-Reply-To: <20181107143646.27675-1-robh@kernel.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 9 Nov 2018 00:26:07 +0900
Message-ID: <CAK7LNATcs4bZv6Q1BEkb+V_SdiBek-fawO1RWKuh68uPN7ymUA@mail.gmail.com>
Subject: Re: [PATCH] builddeb: Fix inclusion of dtbs in debian package
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, nunojpg@gmail.com

On Wed, Nov 7, 2018 at 11:37 PM Rob Herring <robh@kernel.org> wrote:
>
> Commit 37c8a5fafa3b ("kbuild: consolidate Devicetree dtb build rules")
> moved the location of 'dtbs_install' target which caused dtbs to not be
> installed when building debian package with 'bindeb-pkg' target. Update
> the builddeb script to use the same logic that determines if there's a
> 'dtbs_install' target which is presence of the arch dts directory. Also,
> use CONFIG_OF_EARLY_FLATTREE instead of CONFIG_OF as that's a better
> indication of whether we are building dtbs.
>
> This commit will also have the side effect of installing dtbs on any
> arch that has dts files. Previously, it was dependent on whether the
> arch defined 'dtbs_install'.
>
> Fixes: 37c8a5fafa3b ("kbuild: consolidate Devicetree dtb build rules")
> Reported-by: Nuno Gon=C3=A7alves <nunojpg@gmail.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: linux-kbuild@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Applied to linux-kbuild/fixes.
Thanks!


--=20
Best Regards
Masahiro Yamada
