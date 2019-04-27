Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:61237 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbfD0G1w (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Apr 2019 02:27:52 -0400
MIME-Version: 1.0
References: <1556346241-10451-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1556346241-10451-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 27 Apr 2019 15:27:00 +0900
Message-ID: <CAK7LNAS2vTGF0dYJ67Ct2xDL=7qxYhhK-VoVHfkqDu0d8ULd+g@mail.gmail.com>
Subject: Re: [PATCH] unicode: refactor the rule for regenerating utf8data.h
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Olaf Weber <olaf@sgi.com>, Gabriel Krisman Bertazi <krisman@collabora.co.uk>, Theodore Ts'o <tytso@mit.edu>
Cc: Gabriel Krisman Bertazi <krisman@collabora.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, linux-fsdevel@vger.kernel.org

On Sat, Apr 27, 2019 at 3:24 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> scripts/mkutf8data is used only when regenerating utf8data.h,
> which never happens in the normal kernel build. However, it is
> irrespectively built if CONFIG_UNICODE is enabled.
>
> Moreover, there is no good reason for it to reside in the scripts/
> directory since it is only used in fs/unicode/.
>
> Hence, move it from scripts/ to fs/unicode/.
>
> In some cases, we bypass build artifacts in the normal build. The
> conventianl way to do so is to surround the code with ifdef REGENERATE_*.


This is a typo.

conventianl -> conventional



> For example,
>
>  - 7373f4f83c71 ("kbuild: add implicit rules for parser generation")
>  - 6aaf49b495b4 ("crypto: arm,arm64 - Fix random regeneration of S_shipped")
>
> I rewrote the rule in a more kbuild'ish style.
>
> It works like this:
>
> $ make REGENERATE_UTF8DATA=1 fs/unicode/
>   [ snip ]
>   HOSTCC  fs/unicode/mkutf8data
>   GEN     fs/unicode/utf8data.h
>   CC      fs/unicode/utf8-norm.o
>   CC      fs/unicode/utf8-core.o
>   AR      fs/unicode/built-in.a
>
> Also, I added utf8data.h to .gitignore and dontdiff.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---




-- 
Best Regards
Masahiro Yamada
