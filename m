Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:51524 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbfD2DKG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Apr 2019 23:10:06 -0400
MIME-Version: 1.0
References: <1556346241-10451-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNAS2vTGF0dYJ67Ct2xDL=7qxYhhK-VoVHfkqDu0d8ULd+g@mail.gmail.com> <20190428174315.GC24089@mit.edu>
In-Reply-To: <20190428174315.GC24089@mit.edu>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 29 Apr 2019 12:09:16 +0900
Message-ID: <CAK7LNASQqbWL_Lvn+=9PX41kbHNEB4K9dVS0LS=X-h0FEN9FHg@mail.gmail.com>
Subject: Re: [PATCH] unicode: refactor the rule for regenerating utf8data.h
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>, Masahiro Yamada <yamada.masahiro@socionext.com>, Olaf Weber <olaf@sgi.com>, Gabriel Krisman Bertazi <krisman@collabora.co.uk>, Gabriel Krisman Bertazi <krisman@collabora.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, linux-fsdevel@vger.kernel.org

On Mon, Apr 29, 2019 at 2:44 AM Theodore Ts'o <tytso@mit.edu> wrote:
>
> Thanks, for the suggestion and the patch!  I agree it's much better
> with your proposed change (and it gets mkutf8data out of your hair :-)

Yes, this is my main motivation.

>
> I did need to make one change to your patch in order for it to work
> correctly with a build directory.  That is, to support
>
>         make -O /build/ext4 REGENERATE_UTF8DATA=1 fs/unicode/
>
> I'll apply it to the ext4 git tree with this change.


Thanks for the suggestion.

My first thought was "don't do this",
but it would be better to make it work with O= option.

However, even with your fix-up, it won't work correctly.

If O= is given, the newly-generated utf8data.h will be
put in the object tree.

It will co-exist with the old check-in utf8data.h
and the old one will be included because
the include paths in the srctree are searched first.

I will send v2 shortly so that O= build will work
correctly.

Thanks.





>                                    - Ted
>
> diff --git a/fs/unicode/Makefile b/fs/unicode/Makefile
> index 1a109b7a1da9..45955264ac04 100644
> --- a/fs/unicode/Makefile
> +++ b/fs/unicode/Makefile
> @@ -14,13 +14,13 @@ $(obj)/utf8-norm.o: $(obj)/utf8data.h
>
>  quiet_cmd_utf8data = GEN     $@
>        cmd_utf8data = $(obj)/mkutf8data \
> -               -a $(src)/DerivedAge.txt \
> -               -c $(src)/DerivedCombiningClass.txt \
> -               -p $(src)/DerivedCoreProperties.txt \
> -               -d $(src)/UnicodeData.txt \
> -               -f $(src)/CaseFolding.txt \
> -               -n $(src)/NormalizationCorrections.txt \
> -               -t $(src)/NormalizationTest.txt \
> +               -a $(srctree)/$(src)/DerivedAge.txt \
> +               -c $(srctree)/$(src)/DerivedCombiningClass.txt \
> +               -p $(srctree)/$(src)/DerivedCoreProperties.txt \
> +               -d $(srctree)/$(src)/UnicodeData.txt \
> +               -f $(srctree)/$(src)/CaseFolding.txt \
> +               -n $(srctree)/$(src)/NormalizationCorrections.txt \
> +               -t $(srctree)/$(src)/NormalizationTest.txt \
>                 -o $@
>
>  $(obj)/utf8data.h: $(filter %.txt, $(cmd_utf8data)) $(obj)/mkutf8data FORCE



-- 
Best Regards
Masahiro Yamada
