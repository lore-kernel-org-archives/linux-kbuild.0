Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:52935 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751420AbdJJLwu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Oct 2017 07:52:50 -0400
MIME-Version: 1.0
In-Reply-To: <1507089367-10402-1-git-send-email-yamada.masahiro@socionext.com>
References: <1507089367-10402-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 10 Oct 2017 20:51:47 +0900
Message-ID: <CAK7LNATghWOW8iYKs+3XOa9UHUSa9bWao9oTC6PQ8-SoaRbg=Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] kbuild: replace $(hdr-arch) with $(SRCARCH)
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

2017-10-04 12:56 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Since commit 5e53879008b9 ("sparc,sparc64: unify Makefile"), hdr-arch
> and SRCARCH always match.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied to linux-kbuild/kbuild.

-- 
Best Regards
Masahiro Yamada
