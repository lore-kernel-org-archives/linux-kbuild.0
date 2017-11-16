Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:22506 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753956AbdKPAL1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Nov 2017 19:11:27 -0500
MIME-Version: 1.0
In-Reply-To: <1510568979-24440-1-git-send-email-yamada.masahiro@socionext.com>
References: <1510568979-24440-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 16 Nov 2017 09:10:16 +0900
Message-ID: <CAK7LNASTaSum7Lk70fFmfGFmonycizo7FBv9H=j1URttCo6LvA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] kbuild: optimize output directory creation
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@amacapital.net>, Ingo Molnar <mingo@redhat.com>

2017-11-13 19:29 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
>
> I looked into the build scripts, focusing on "mkdir" optimization.
>
> With this series, I succeeded in speeding up the incremental build
> with O= option.
>
> The following is the result of "time make O=foo",
> where "foo" is the output directory that has already been built.
>
> Before:
>
> real    0m8.322s
> user    0m4.324s
> sys     0m1.220s
>
> After:
>
> real    0m6.989s
> user    0m4.168s
> sys     0m1.080s
>
> 4/6 gave the biggest impact.
>
>


Series, applied to linux-kbuild/kbuild.

-- 
Best Regards
Masahiro Yamada
