Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw1-f66.google.com ([209.85.161.66]:42343 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbeHIJV6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Aug 2018 05:21:58 -0400
MIME-Version: 1.0
In-Reply-To: <1533791971-27504-1-git-send-email-yamada.masahiro@socionext.com>
References: <1533791971-27504-1-git-send-email-yamada.masahiro@socionext.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 8 Aug 2018 23:58:31 -0700
Message-ID: <CAMo8BfJAkrVRqmTSEc1MFpm8gTwO7FS=80yTNy3_gHM-ckfY8w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove deprecated host-progs variable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, linux-xtensa@linux-xtensa.org, Chris Zankel <chris@zankel.net>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Wed, Aug 8, 2018 at 10:19 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> The host-progs has been supported as an alias of hostprogs-y at least
> since the beginning of Git era, with the clear prompt:
>   Usage of host-progs is deprecated. Please replace with hostprogs-y!
>
> Enough time for the migration has passed.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  arch/xtensa/boot/Makefile | 3 +--
>  scripts/Makefile.build    | 7 -------
>  scripts/Makefile.clean    | 1 -
>  3 files changed, 1 insertion(+), 10 deletions(-)

For the xtensa part:
Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
