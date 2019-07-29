Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39495 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726940AbfG2RRt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jul 2019 13:17:49 -0400
Received: by mail-pl1-f195.google.com with SMTP id b7so27806050pls.6
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Jul 2019 10:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190727030110.17208-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190727030110.17208-1-yamada.masahiro@socionext.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 29 Jul 2019 10:17:36 -0700
Message-ID: <CAKwvOdmUUuFvdqD3X4SO7xPOpUevvc0iDpyUGC98KQH_AvvD=A@mail.gmail.com>
Subject: Re: [PATCH] gen_compile_commands: lower the entry count threshold
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Tom Roeder <tmroeder@google.com>, LKML <linux-kernel@vger.kernel.org>

On Fri, Jul 26, 2019 at 8:01 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Running gen_compile_commands.py after building with allnoconfig
> gave this:
>
> $ ./scripts/gen_compile_commands.py
> WARNING: Found 449 entries. Have you compiled the kernel?
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

This potentially may need to go lower for other arch's allnoconfig.
I'm guessing you tested x86_64?
Acked-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  scripts/gen_compile_commands.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/gen_compile_commands.py b/scripts/gen_compile_commands.py
> index 7915823b92a5..c458696ef3a7 100755
> --- a/scripts/gen_compile_commands.py
> +++ b/scripts/gen_compile_commands.py
> @@ -21,9 +21,9 @@ _LINE_PATTERN = r'^cmd_[^ ]*\.o := (.* )([^ ]*\.c)$'
>  _VALID_LOG_LEVELS = ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
>
>  # A kernel build generally has over 2000 entries in its compile_commands.json
> -# database. If this code finds 500 or fewer, then warn the user that they might
> +# database. If this code finds 300 or fewer, then warn the user that they might
>  # not have all the .cmd files, and they might need to compile the kernel.
> -_LOW_COUNT_THRESHOLD = 500
> +_LOW_COUNT_THRESHOLD = 300
>
>
>  def parse_arguments():
> --
> 2.17.1
>


-- 
Thanks,
~Nick Desaulniers
