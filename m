Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:37360 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgDWOjn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 10:39:43 -0400
MIME-Version: 1.0
References: <20200419180445.26722-1-natechancellor@gmail.com> <20200419202128.20571-1-natechancellor@gmail.com>
In-Reply-To: <20200419202128.20571-1-natechancellor@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 23 Apr 2020 23:38:35 +0900
Message-ID: <CAK7LNAT3pt6VoQb3-HtOFJF5JEmaQhjyi+8OSCXu6zQ3oV579A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] kbuild: add CONFIG_LD_IS_LLD
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Sami Tolvanen <samitolvanen@google.com>, Dmitry Golovin <dima@golovin.in>, Sedat Dilek <sedat.dilek@gmail.com>

On Mon, Apr 20, 2020 at 5:21 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> From: Sami Tolvanen <samitolvanen@google.com>
>
> Similarly to the CC_IS_CLANG config, add LD_IS_LLD to avoid GNU ld
> specific logic such as ld-version or ld-ifversion and gain the
> ability to select potential features that depend on the linker at
> configuration time such as LTO.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> [nc: Reword commit message]
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---


Acked-by: Masahiro Yamada <masahiroy@kernel.org>


-- 
Best Regards
Masahiro Yamada
