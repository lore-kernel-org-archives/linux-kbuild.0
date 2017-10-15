Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:40806 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750836AbdJOHs5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 15 Oct 2017 03:48:57 -0400
MIME-Version: 1.0
In-Reply-To: <1507635801-30561-1-git-send-email-yamada.masahiro@socionext.com>
References: <1507635801-30561-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 15 Oct 2017 16:48:11 +0900
Message-ID: <CAK7LNARNdwLfhGHJm7=EHbkffv1OGWXFCqADC_RL-sCX96P1PQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove KBUILD_SUBDIR_ASFLAGS and KBUILD_SUBDIR_CCFLAGS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-10-10 20:43 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Accumulate subdir-{cc,as}flags-y directly to KBUILD_{A,C}FLAGS.
> Remove KBUILD_SUBDIR_{AS,CC}FLAGS.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>

Applied to linux-kbuild/kbuild.

Best Regards
Masahiro Yamada
