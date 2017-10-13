Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f49.google.com ([209.85.213.49]:51411 "EHLO
        mail-vk0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753501AbdJMPFN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Oct 2017 11:05:13 -0400
Received: by mail-vk0-f49.google.com with SMTP id 137so4461379vkk.8
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Oct 2017 08:05:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1507893929-32573-1-git-send-email-yamada.masahiro@socionext.com>
References: <1507893929-32573-1-git-send-email-yamada.masahiro@socionext.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Oct 2017 08:05:11 -0700
Message-ID: <CAD=FV=VgA1+fT8tUxsZN4_0SfED+ENvGVtuo01OAHRGKd2eHng@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: shrink .cache.mk when it exceeds 1000 lines
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Matthias Kaehlcke <mka@chromium.org>, Cao jin <caoj.fnst@cn.fujitsu.com>, Arnd Bergmann <arnd@arndb.de>, Mark Charlebois <charlebm@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Ingo Molnar <mingo@kernel.org>

Hi,

On Fri, Oct 13, 2017 at 4:25 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> The cache files are only cleaned away by "make clean".  If you continue
> incremental builds, the cache files will grow up little by little.
> It is not a big deal in general use cases because compiler flags do not
> change quite often.
>
> However, if you do build-test for various architectures, compilers, and
> kernel configurations, you will end up with huge cache files soon.
>
> When the cache file exceeds 1000 lines, shrink it down to 500 by "tail".
> The Least Recently Added lines are cut. (not Least Recently Used)
> I hope it will work well enough.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> Changes in v2:
>   - Simplify code per Douglas Anderson
>
>  scripts/Kbuild.include | 6 ++++++
>  1 file changed, 6 insertions(+)

Thanks for doing this!

Reviewed-by: Douglas Anderson <dianders@chromium.org>
