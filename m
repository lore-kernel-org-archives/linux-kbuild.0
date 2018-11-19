Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:38806 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727857AbeKSVqR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Nov 2018 16:46:17 -0500
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id wAJBMqS7007746
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Nov 2018 20:22:53 +0900
Received: by mail-vs1-f50.google.com with SMTP id g68so17502355vsd.11
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Nov 2018 03:22:53 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9riFHZc9zBtFamPOd1N1D=BZoYM9yp+x+o5naerg3wRAA@mail.gmail.com>
In-Reply-To: <CAHmME9riFHZc9zBtFamPOd1N1D=BZoYM9yp+x+o5naerg3wRAA@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 19 Nov 2018 20:22:15 +0900
Message-ID: <CAK7LNASfw4uht7AxtX+mSVT9OZgwsbw1Q2yF9z7=YzpxQPuBUg@mail.gmail.com>
Subject: Re: Automatic secondary intermediate target deduction
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jason@zx2c4.com
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Jason,


On Sat, Nov 17, 2018 at 5:39 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hello,
>
> The tree used to put patterns in the .PRECIOUS target to prevent make
> from cleaning up intermediate files. Masahiro realized this was wrong
> and moved this to the .SECONDARY target instead, while also generally
> ensuring things wind up in the $(targets) variable, which is nice
> because it means those intermediate files are correctly cleaned up by
> `make clean`. This is great, but it comes with some issues, which I've
> now worked around, but I wanted to run the whole reasoning and
> solution by you.
>
> A great thing about the build system is that you can write "widgets-y
> += acmelib.o", and it will automatically figure out whether that
> should be built from a .c or a .o or from something else. But what if
> the chain is actually .pl -> .S -> .o? In that case it's standard to
> add a rule for that in the subdirectory's makefile:
>
> quiet_cmd_perlasm = PERLASM $@
>      cmd_perlasm = $(PERL) $< > $@
> %.S: %.pl
>        $(call cmd,perlasm)
>
> This works fine and is boring and standard, but we still need to add
> those intermediate .S files to $(targets).
>
> Consider a general structure of a makefile like this:
>
> widgeter_snickers-y := snickers/snickers.o
> widgeter_snickers-$(CONFIG_SNICKER_MEGA) += snickers/snickers-mega.o
> widgeter_snickers-$(CONFIG_SNICKER_TINY) += snickers/snickers-tiny.o
> obj-$(CONFIG_SNICKERVILLE) += widgeter_snickers.o
>
> widgeter_skittles-y := skittles/skittles.o
> widgeter_skittles-$(CONFIG_SKITTLE_BLUE) += skittles/skittles-blue.o
> widgeter_skittles-$(CONFIG_SKITTLE_RED) += skittles/skittles-red.o
> widgeter_skittles-$(CONFIG_SKITTLE_GREEN) += skittles/skittles-green.o
> obj-$(CONFIG_SKITTLEMESA) += widgeter_skittles.o
>
> Some of those .o might come from .c, others from .S, and others from
> .pl->.S->.o. Our goal is to compute a list of all of the file's .S
> that come from .pl. It's important that we allow this to work both
> when the CONFIG_* variables are present (Makefile.build) and when the
> CONFIG_* variables aren't present, since Makefile.clean doesn't
> include auto.conf. Here's how we're going to do it:
>
> 1. Expand obj-*, remove the .o suffix, and treat as a variable, and
> then expand the -* of those variables:
>
> part1 := $(foreach t,$(patsubst %.o,%,$(obj-) $(obj-m)
> $(obj-y)),$($(t)-) $($(t)-y))
>
> Now $(part1) contains all of the *.o files we wrote into the above file.
>
> 2. Replace all of the *.o files with a corresponding *.pl and tack on
> the full path:
>
> part2 := $(patsubst %.o,$(srctree)/$(src)/%.pl,$(part1))
>
> Now $(part2) contains full paths of potential .pl files.
>
> 3. Remove from the list all *.pl files that don't actually exist
> (since the .o might be coming from a .c or directly a .S instead):
>
> part3 := $(wildcard $(part2))
>
> Now $(part3) contains full paths of existing .pl files that correspond
> to the makefile's explicitly listed .o files.
>
> 4. Remove the full path prefix and change the .pl suffix to a .S
> suffix, so that it represents the intermediate file:
>
> part4 := $(patsubst $(srctree)/$(src)/%.pl,%.S,$(part3))
>
> Now $(part4) contains all of the intermediate .S targets that
> correspond with .pl sources and .o destinations. We can now add that
> to $(targets);
>
> targets += $(part4)
>
> And after this everything works perfectly. Putting it all together, we
> can simply add this single line to the makefile and everything
> functions exactly as expected:
>
> targets += $(patsubst $(srctree)/$(src)/%.pl,%.S,$(wildcard $(patsubst
> %.o,$(srctree)/$(src)/%.pl,$(foreach t,$(patsubst %.o,%,$(obj-)
> $(obj-m) $(obj-y)),$($(t)-) $($(t)-y)))))
>
> Cool! I mean, sort of. I really love make, and so this whole exercise
> is perversely enjoyable for me (maybe I should quit kernels and write
> lisp instead?), but I realize this isn't exactly a simple solution.
> It's sitting in my repo right now with a big comment, but I'm sort of
> hesitant to submit it. If that's okay with you, I'll send it upstream
> as part of something else I'm working on. But if these types of
> shenanigans don't really sit well, there are a few alternatives I can
> think of that you might weigh in on:
>
> a. The solution above, which achieves all objectives, but results in a
> sort of obtuse line.


How many intermediate .S files do you have?
Is it worthwhile computing them automatically?


> b. The solution above, but I split that line up into a few
> intermediate stages to make it more clear.
>
> c. I list the .pl files explicitly instead of depending on automatic
> inference like the above. This is simple, but not as slick and another
> thing developers have to remember to do when adding. But it's probably
> the least controversial and most obvious.


Kind of.
I'd recommend you to list the intermediate files in 'targets'.

For example, if you use .pl -> .S for arch/arm/crypto/Makefile,
the following should work.



diff --git a/arch/arm/crypto/Makefile b/arch/arm/crypto/Makefile
index bd5bcee..b463fcd 100644
--- a/arch/arm/crypto/Makefile
+++ b/arch/arm/crypto/Makefile
@@ -54,15 +54,13 @@ crct10dif-arm-ce-y  := crct10dif-ce-core.o
crct10dif-ce-glue.o
 crc32-arm-ce-y:= crc32-ce-core.o crc32-ce-glue.o
 chacha20-neon-y := chacha20-neon-core.o chacha20-neon-glue.o

-ifdef REGENERATE_ARM_CRYPTO
 quiet_cmd_perl = PERL    $@
       cmd_perl = $(PERL) $(<) > $(@)

-$(src)/sha256-core.S_shipped: $(src)/sha256-armv4.pl
+$(obj)/sha256-core.S: $(src)/sha256-armv4.pl
        $(call cmd,perl)

-$(src)/sha512-core.S_shipped: $(src)/sha512-armv4.pl
+$(obj)/sha512-core.S: $(src)/sha512-armv4.pl
        $(call cmd,perl)
-endif

 targets += sha256-core.S sha512-core.S




All you need to do for intermediate files is
targets += sha256-core.S sha512-core.S


Makefile.clean handles $(targets).






> d. Rather than going .pl -> .S, I go .perlasm.pl -> .perlasm.S, and
> then add the filetype to Makefile.build, where it has stanzas like
> "$(call intermediate_targets, .asn1.o, .asn1.c .asn1.h)". One
> significant downside of this is that I don't see any such stanzas in
> Makefile.clean, so I'm not sure that intermediate targets generated
> this way are getting cleaned up.
>
> e. I quit trying to be clever by ensuring that the .S in $(targets)
> corresponds with both a .pl and a .o listed in the tree of $(obj-*),
> and instead just wildcard my way to the relevant *.pl files with
> something like: targets += $(patsubst
> $(srctree)/$(src)/%.pl,%.S,$(wildcard $(srctree)/$(src)/*/*.pl)). This
> is slightly simpler than (a) and (b), but usually wildcard'ing on
> actual directories isn't the most bug-free way of using make.
>
> f. Something else?
>
> The answer is probably "just use (c)", but in case the topic interests
> you, I'm happy to discuss the various alternatives.
>
> Thanks,
> Jason



-- 
Best Regards
Masahiro Yamada
