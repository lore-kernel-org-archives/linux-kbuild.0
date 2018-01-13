Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:23917 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932251AbeAMNRE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Jan 2018 08:17:04 -0500
MIME-Version: 1.0
In-Reply-To: <1515662888-18296-1-git-send-email-yamada.masahiro@socionext.com>
References: <1515662888-18296-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 13 Jan 2018 22:16:00 +0900
Message-ID: <CAK7LNAQpmpw1_HeWq+iA0QOa4jMP8oYJZKaNi+QR+BCuRxBicw@mail.gmail.com>
Subject: Re: [PATCH] genksyms: drop *.hash.c from .gitignore
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-01-11 18:28 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> This is a left-over of commit bb3290d91695 ("Remove gperf usage from
> toolchain").
>
> We do not generate a hash function any more.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>

Applied to linux-kbuild/fixes.

-- 
Best Regards
Masahiro Yamada
