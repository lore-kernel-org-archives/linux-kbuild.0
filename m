Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:43371 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750912AbeAUQqJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 21 Jan 2018 11:46:09 -0500
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com [209.85.217.180]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id w0LGjulk011537
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Jan 2018 01:45:56 +0900
Received: by mail-ua0-f180.google.com with SMTP id e18so1826435ual.6
        for <linux-kbuild@vger.kernel.org>; Sun, 21 Jan 2018 08:45:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180116204445.21096-1-yselkowi@redhat.com>
References: <20180116204445.21096-1-yselkowi@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 22 Jan 2018 01:45:15 +0900
Message-ID: <CAK7LNARKrfPCekKudy6jUgDbSK-EqKkAwoe4otkRosPs3RbiYw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: fix make xconfig when gettext is missing
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Yaakov Selkowitz <yselkowi@redhat.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-01-17 5:44 GMT+09:00 Yaakov Selkowitz <yselkowi@redhat.com>:
> The C-based config programs are properly guarded from a missing (or,
> currently, external) libintl.h by the HOST_EXTRACFLAGS check, but
> this does not help the C++-based qconf.
>
> Signed-off-by: Yaakov Selkowitz <yselkowi@redhat.com>
> ---

Applied to linux-kbuild/kconfig.  Thanks!

-- 
Best Regards
Masahiro Yamada
