Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:27579 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726431AbfHGCe3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Aug 2019 22:34:29 -0400
MIME-Version: 1.0
References: <patch-1.thread-2257a1.git-188f5a3d81d5.your-ad-here.call-01565088755-ext-5120@work.hours>
 <patch-2.thread-2257a1.git-2257a1c53d4a.your-ad-here.call-01565088755-ext-5120@work.hours>
In-Reply-To: <patch-2.thread-2257a1.git-2257a1c53d4a.your-ad-here.call-01565088755-ext-5120@work.hours>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 7 Aug 2019 11:33:40 +0900
Message-ID: <CAK7LNATyNWjwVXdbgXt0mL+3R8jTGe_cq1vEW8_VvB250P4bdg@mail.gmail.com>
Subject: Re: [PATCH 2/2] s390/build: use size command to perform empty .bss check
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vasily Gorbik <gor@linux.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Aug 6, 2019 at 7:56 PM Vasily Gorbik <gor@linux.ibm.com> wrote:
>
> Currently empty .bss checks performed do not pay attention to "common
> objects" in object files which end up in .bss section eventually.
>
> The "size" tool is a part of binutils and since version 2.18 provides
> "--common" command line option, which allows to account "common objects"
> sizes in .bss section size. Utilize "size --common" to perform accurate
> check that .bss section is unused. Besides that the size tool handles
> object files without .bss section gracefully and doesn't require
> additional objdump run.
>
> The linux kernel requires binutils 2.20 since 4.13.
>
> Kbuild exports OBJSIZE to reference the right size tool.
>
> Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
> ---
>  arch/s390/scripts/Makefile.chkbss | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/s390/scripts/Makefile.chkbss b/arch/s390/scripts/Makefile.chkbss
> index 884a9caff5fb..ba1d7a8a242f 100644
> --- a/arch/s390/scripts/Makefile.chkbss
> +++ b/arch/s390/scripts/Makefile.chkbss
> @@ -11,8 +11,7 @@ chkbss: $(addprefix $(obj)/, $(chkbss-files))
>
>  quiet_cmd_chkbss = CHKBSS  $<
>        cmd_chkbss = \
> -       if $(OBJDUMP) -h $< | grep -q "\.bss" && \
> -          ! $(OBJDUMP) -j .bss -w -h $< | awk 'END { if ($$3) exit 1 }'; then \
> +       if ! $(OBJSIZE) --common $< | awk 'END { if ($$3) exit 1 }'; then \

While you are touching this line,
you may also want to replace 'awk' with $(AWK),
which is defined in the top-level Makefile.




>                 echo "error: $< .bss section is not empty" >&2; exit 1; \
>         fi; \
>         touch $@;
> --
> 2.21.0
>


-- 
Best Regards
Masahiro Yamada
