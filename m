Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:17637 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751574AbdJJLyI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Oct 2017 07:54:08 -0400
MIME-Version: 1.0
In-Reply-To: <1507089367-10402-2-git-send-email-yamada.masahiro@socionext.com>
References: <1507089367-10402-1-git-send-email-yamada.masahiro@socionext.com> <1507089367-10402-2-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 10 Oct 2017 20:53:11 +0900
Message-ID: <CAK7LNATvSspPqjn7MpSAW88cwzhUwFTzUpEkqtUApwt_pCEzCw@mail.gmail.com>
Subject: Re: [PATCH 2/4] kbuild: move "_all" target out of $(KBUILD_SRC) conditional
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

2017-10-04 12:56 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> The first "_all" occurrence around line 120 is only visible when
> KBUILD_SRC is unset.
>
> If O=... is specified, the working directory is relocated, then the
> only second occurrence around line 193 is visible, that is not set
> to PHONY.
>
> Move the first one to an always visible place.  This clarifies "_all"
> is our default target and it is always set to PHONY.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>


Applied to linux-kbuild/kbuild.



-- 
Best Regards
Masahiro Yamada
