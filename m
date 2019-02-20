Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:25805 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729770AbfBTDn7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Feb 2019 22:43:59 -0500
MIME-Version: 1.0
References: <1550113521-23577-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1550113521-23577-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 20 Feb 2019 12:43:11 +0900
Message-ID: <CAK7LNASpwS_1-4dOiYzOu-miVXbt1qFsxJOHc33FRqRxWW4XHw@mail.gmail.com>
Subject: Re: [PATCH 1/8] kbuild: pkg: use -f $(srctree)/Makefile to recurse to
 top Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Feb 14, 2019 at 7:41 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> '$(MAKE) KBUILD_SRC=' changes the working directory back and forth
> between objtree and srctree.
>
> It is better to recurse to the top-level Makefile directly.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Patch 1/8 - 4/8 applied to linux-kbuild.

I will send v2 for the rest
because I noticed some issues.


-- 
Best Regards
Masahiro Yamada
