Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:18199 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727016AbeJPXn3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Oct 2018 19:43:29 -0400
MIME-Version: 1.0
References: <1539681053-24388-1-git-send-email-yamada.masahiro@socionext.com>
 <1539681053-24388-3-git-send-email-yamada.masahiro@socionext.com> <20181016142540.pxlwu3ft6n2b4pgj@treble>
In-Reply-To: <20181016142540.pxlwu3ft6n2b4pgj@treble>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 17 Oct 2018 00:51:40 +0900
Message-ID: <CAK7LNARLW4NmeY0Rq19Bj_5kOFbp6YDtsUDhNaAfVXjL85cAMg@mail.gmail.com>
Subject: Re: [PATCH 2/3] objtool: move libelf check out of top Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Bernd Edlinger <bernd.edlinger@hotmail.de>, Borislav Petkov <bp@suse.de>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Oct 16, 2018 at 11:25 PM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> On Tue, Oct 16, 2018 at 06:10:52PM +0900, Masahiro Yamada wrote:
> > Another behavioral change is, missing libelf for CONFIG_STACK_VALIDATION
> > was previously a warning, but now a error.
>
> This behavioral change should be fine.  It was already an error for
> UNWINDER_ORC, so this would only upgrade a warning to an error for
> people using STACK_VALIDATION without ORC, which should be a small
> number of people by this point.
>
> > diff --git a/scripts/Makefile.toolcheck b/scripts/Makefile.toolcheck
> > index f3c165d..bc26fc0 100644
> > --- a/scripts/Makefile.toolcheck
> > +++ b/scripts/Makefile.toolcheck
> > @@ -12,6 +12,11 @@ include include/config/auto.conf
> >  __toolcheck:
> >       @:
> >
> > +chk_stack_validation = echo "int main() {}" | $(HOSTCC) -xc -o /dev/null -lelf -
> > +msg_stack_validation = "libelf is necessary for building the objtool." \
> > +                    "Please install libelf-dev, libelf-devel or elfutils-libelf-devel."
> > +toolcheck-$(CONFIG_STACK_VALIDATION) += stack_validation
> > +
> >  PHONY += $(toolcheck-y)
> >  __toolcheck: $(toolcheck-y)
>
> This is a nice improvement.
>
> It would probably be a good idea to clarify to the user which config
> option(s) are the cause for the error, by putting
> "CONFIG_STACK_VALIDATION" in the error string, for example.
>
> Though, for this particular case, it would be clearer to have a
> different error, based on which option is enabled, like we had before.
>
> Like:
>
>
> ifdef CONFIG_UNWINDER_ORC
>
> chk_unwinder_orc = echo "int main() {}" | $(HOSTCC) -xc -o /dev/null -lelf -
> msg_unwinder_orc = "Cannot build objtool to generate ORC metadata for CONFIG_UNWINDER_ORC=y.  " \
>                        "Please install libelf-dev, libelf-devel or elfutils-libelf-devel."
> toolcheck-$(CONFIG_UNWINDER_ORC) += unwinder_orc
>
> else
>
> chk_stack_validation = echo "int main() {}" | $(HOSTCC) -xc -o /dev/null -lelf -
> msg_stack_validation = "Cannot build objtool for CONFIG_STACK_VALIDATION=y.  " \
>                        "Please install libelf-dev, libelf-devel or elfutils-libelf-devel."
> toolcheck-$(CONFIG_STACK_VALIDATION) += stack_validation
>
> endif
>
>
> What do you think?


It is ugly.

Do you need such detailed information like ORC metadata stuff here?

This Makefile aims to error out, showing why the build failed.
That's it.



-- 
Best Regards
Masahiro Yamada
