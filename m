Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yb0-f194.google.com ([209.85.213.194]:38887 "EHLO
        mail-yb0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933475AbeGJPTV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Jul 2018 11:19:21 -0400
Received: by mail-yb0-f194.google.com with SMTP id i9-v6so8741782ybo.5
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Jul 2018 08:19:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <ghwou4prif.fsf@lena.gouders.net>
References: <1530758389-30862-1-git-send-email-yamada.masahiro@socionext.com>
 <1530758389-30862-6-git-send-email-yamada.masahiro@socionext.com>
 <ghva9simch.fsf@lena.gouders.net> <ghbmbk0wbj.fsf@quad.gouders.net> <ghwou4prif.fsf@lena.gouders.net>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 10 Jul 2018 08:19:18 -0700
Message-ID: <CAGXu5jLLAE7H37Ug+vFJ42gv5gOV1mc28BMVQeiP_kkkodjsSw@mail.gmail.com>
Subject: Re: [PATCH v3 05/12] kconfig: make syncconfig update .config
 regardless of sym_change_count
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, Ulf Magnusson <ulfalizer@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>

On Mon, Jul 9, 2018 at 4:39 AM, Dirk Gouders <dirk@gouders.net> wrote:
> I think, I solved the puzzle and perhaps, that saves others some time:
>
> The problem is that "if_changed" was not designed for multiple use
> inside a recipe and in the case of compressed/vmlinux, the 2-fold use
> created a kind of flip-flop for situations when nothing has to be done
> to build the target.
>
> Because each of the two users of "if_changed" stores it's footprint in
> .vmlinux.cmd but that file then isn't re-read, one of the two
> "if_changed" calculates that nothing has to be done wheras the other one
> recognizes a change in the commandline, because it sees the command-line
> for the other part of the reciepe.

Ooh, nice find. Thanks for debugging this!

> In the next make, the roles flip, because the previously satisfied
> "if_changed" now sees the command-line of the other one.  And so on...
>
> I am not a Kbuild expert but the attached patch fixes that problem by
> introducing "if_changed_multi" that accepts two commands -- one whose
> commandline should be checked and a second one that should be
> executed.
>
> Dirk
>
>
> diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
> index fa42f895fdde..f39822fca994 100644
> --- a/arch/x86/boot/compressed/Makefile
> +++ b/arch/x86/boot/compressed/Makefile
> @@ -107,8 +107,8 @@ define cmd_check_data_rel
>  endef
>
>  $(obj)/vmlinux: $(vmlinux-objs-y) FORCE
> -       $(call if_changed,check_data_rel)
> -       $(call if_changed,ld)
> +       $(call if_changed_multi,ld,check_data_rel)
> +       $(call if_changed_multi,ld,ld)

This does seem to do the right thing, but mainly because arg1 is what
actually writes vmlinux, which seems a bit fragile here.

However, the combination is "if_changed" with the "FORCE". This is to
make sure the command line is evaluated in addition to the build deps.
The check_data_rel isn't as sensitive, so maybe the right solution is
just:

-$(obj)/vmlinux: $(vmlinux-objs-y) FORCE
-       $(call if_changed,check_data_rel)
+$(obj)/vmlinux:: $(vmlinux-objs-y)
+       $(call cmd,check_data_rel)
+$(obj)/vmlinux:: $(vmlinux-objs-y) FORCE
        $(call if_changed,ld)

Then check_data_rel is only evaluated with when the deps change (no
FORCE nor if_changed needed), and doesn't interfere with the "ld"
call?

Regardless, the docs for if_changed should be updated to explicitly
mention it should only be called once per target.

-Kees

-- 
Kees Cook
Pixel Security
