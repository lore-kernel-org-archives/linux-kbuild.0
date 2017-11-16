Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:23888 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758838AbdKPAN4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Nov 2017 19:13:56 -0500
MIME-Version: 1.0
In-Reply-To: <1510569199-26057-1-git-send-email-yamada.masahiro@socionext.com>
References: <1510569199-26057-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 16 Nov 2017 09:13:07 +0900
Message-ID: <CAK7LNASQoipb_-eT7P+BwghbGLvSZpfxxvWTvA5guvGhhGGpFQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: specify FORCE as .PHONY target in Makefile.headersinst
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-11-13 19:33 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Swap the order of ".PHONY: $(PHONY)" and "PHONY += FORCE"
> so that FORCE is correctly specified as a .PHONY target.
>
> Use a preferred way for specifying $(subdirs) as .PHONY targets.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>


Applied to linux-kbuild/kbuild.



Best Regards
Masahiro Yamada
