Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37842 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730560AbgCaQCd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 12:02:33 -0400
Received: by mail-pg1-f193.google.com with SMTP id i34so406080pgl.4
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2020 09:02:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200326194155.29107-1-natechancellor@gmail.com>
 <CAK7LNAQ8uHtuhd7DiGGOLbkEX524rPjfUuWAHjU-_92Ow3_1Pg@mail.gmail.com> <20200331101122.GA6292@ubuntu-m2-xlarge-x86>
In-Reply-To: <20200331101122.GA6292@ubuntu-m2-xlarge-x86>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 31 Mar 2020 09:02:19 -0700
Message-ID: <CAKwvOdkkpnkLwtNctSnebXTwumfprEQtLiuM5_4e-UBFTYBUxg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Enable -Wtautological-compare
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Dmitry Vyukov <dvyukov@google.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>

On Tue, Mar 31, 2020 at 3:11 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
> Just a follow up, those two patches have been picked up and should be in
> this coming release:
>
> https://git.kernel.org/balbi/usb/c/58582220d2d34228e5a1e1585e41b735713988bb
> https://git.kernel.org/rostedt/linux-trace/c/bf2cbe044da275021b2de5917240411a19e5c50d
>
> As of next-20200331, with the former applied (because it is not there
> yet) along with this patch, I see no warnings on arm, arm64, x86_64
> all{mod,yes}config.

kbuild test robot is testing more arch's than that with Clang so it
may report if it finds more instances of that warning in those.

-- 
Thanks,
~Nick Desaulniers
