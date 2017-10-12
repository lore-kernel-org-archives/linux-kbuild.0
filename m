Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:48473 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752024AbdJLBAS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Oct 2017 21:00:18 -0400
MIME-Version: 1.0
In-Reply-To: <1507089367-10402-3-git-send-email-yamada.masahiro@socionext.com>
References: <1507089367-10402-1-git-send-email-yamada.masahiro@socionext.com> <1507089367-10402-3-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 12 Oct 2017 09:59:31 +0900
Message-ID: <CAK7LNAQNzYhss=fyi_HDBqzEL=fkDQt6phdtxdpz9vyDjSErwA@mail.gmail.com>
Subject: Re: [PATCH 3/4] kbuild: re-order the code to not parse unnecessary variables
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

2017-10-04 12:56 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> The top Makefile is divided into some sections such as mixed targets,
> config targets, build targets, etc.
>
> When we build mixed targets, Kbuild just invokes submake to process
> them one by one.  In this case, compiler-related variables like CC,
> KBUILD_CFLAGS, etc. are unneeded.
>
> Check what kind of targets we are building first, then parse necessary
> variables for building them.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  Makefile | 233 ++++++++++++++++++++++++++++++++-------------------------------
>  1 file changed, 118 insertions(+), 115 deletions(-)


Applied to linux-kbuild/kbuild.  Thanks.

-- 
Best Regards
Masahiro Yamada
