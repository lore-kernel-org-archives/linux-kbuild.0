Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:25975 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751480AbeCTPf4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Mar 2018 11:35:56 -0400
MIME-Version: 1.0
In-Reply-To: <1521185836-19120-1-git-send-email-yamada.masahiro@socionext.com>
References: <1521185836-19120-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 21 Mar 2018 00:35:06 +0900
Message-ID: <CAK7LNASq5MML3PRSB+mze3zgHEq11--31nKsaP0qG2hN6tEi_A@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] kbuild: various fix, clean-up, improvements of CONFIG_TRIM_UNUSED_KSYMS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Nicolas Pitre <nicolas.pitre@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

2018-03-16 16:37 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
>
> Masahiro Yamada (7):
>   kbuild: clear LDFLAGS in the top Makefile
>   kbuild: remove wrong 'touch' in adjust_autoksyms.sh
>   kbuild: move 'scripts' target below
>   kbuild: restore touching autoksyms.h to the top Makefile
>   kbuild: move CONFIG_TRIM_UNUSED_KSYMS code unneeded for external
>     module
>   kbuild: move include/config/ksym/* to include/ksym/*
>   kbuild: link vmlinux only once for CONFIG_TRIM_UNUSED_KSYMS
>

Series, applied to linux-kbuild.

-- 
Best Regards
Masahiro Yamada
