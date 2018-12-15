Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:21201 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729029AbeLOKpE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 15 Dec 2018 05:45:04 -0500
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id wBFAigqf029878
        for <linux-kbuild@vger.kernel.org>; Sat, 15 Dec 2018 19:44:42 +0900
Received: by mail-ua1-f51.google.com with SMTP id n7so2900789uao.7
        for <linux-kbuild@vger.kernel.org>; Sat, 15 Dec 2018 02:44:42 -0800 (PST)
MIME-Version: 1.0
References: <20181208202640.GA28712@turska>
In-Reply-To: <20181208202640.GA28712@turska>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 15 Dec 2018 19:44:05 +0900
Message-ID: <CAK7LNASRkfbi5Vfr5a5aNa3Dt4vN5r9kB69-5XUziFozH_iVGQ@mail.gmail.com>
Subject: Re: [PATCH 001/123] kconfig/conf.c: Added optional colorization of output.
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tomi Salminen <tlsalmin@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Sun, Dec 9, 2018 at 5:27 AM Tomi Salminen <tlsalmin@gmail.com> wrote:
>
> From: Tomi Salminen <tlsalmin@gmail.com>
>
> Added option COLORIZE=1 for oldconfig, coloring the tristate options to
> yes=green, no=red, module=blue and boolean variables to true=green,
> false=red.

Hmm, I do not know if this is useful.
I tried this, but I thought
it was irritating to my eyes.



-- 
Best Regards
Masahiro Yamada
