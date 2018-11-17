Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from frisell.zx2c4.com ([192.95.5.64]:55661 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725930AbeKQVWi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Nov 2018 16:22:38 -0500
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e0625d41
        for <linux-kbuild@vger.kernel.org>;
        Sat, 17 Nov 2018 11:00:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7fca5a84 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
        for <linux-kbuild@vger.kernel.org>;
        Sat, 17 Nov 2018 11:00:32 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id y23so12620006oia.4
        for <linux-kbuild@vger.kernel.org>; Sat, 17 Nov 2018 03:06:16 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 17 Nov 2018 03:06:04 -0800
Message-ID: <CAHmME9ruRShDz=Pyva4NuMfwfh4UbEvFEYuPSx4cMO38i+uBAQ@mail.gmail.com>
Subject: Automatic secondary intermediate target deduction
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com

Hello,

The tree used to put patterns in the .PRECIOUS target to prevent make
from cleaning up intermediate files. Masahiro realized this was wrong
and moved this to the .SECONDARY target instead, while also generally
ensuring things wind up in the $(targets) variable, which is nice
because it means those intermediate files are correctly cleaned up by
`make clean`. This is great, but it comes with some issues, which I've
now worked around, but I wanted to run the whole reasoning and
solution by you.

A great thing about the build system is that you can write "widgets-y
+= acmelib.o", and it will automatically figure out whether that
should be built from a .c or a .o or from something else. But what if
the chain is actually .pl -> .S -> .o? In that case it's standard to
add a rule for that in the subdirectory's makefile:

quiet_cmd_perlasm = PERLASM $@
     cmd_perlasm = $(PERL) $< > $@
%.S: %.pl
       $(call cmd,perlasm)

This works fine and is boring and standard, but we still need to add
those intermediate .S files to $(targets).

Consider a general structure of a makefile like this:

widgeter_snickers-y := snickers/snickers.o
widgeter_snickers-$(CONFIG_SNICKER_MEGA) += snickers/snickers-mega.o
widgeter_snickers-$(CONFIG_SNICKER_TINY) += snickers/snickers-tiny.o
obj-$(CONFIG_SNICKERVILLE) += widgeter_snickers.o

widgeter_skittles-y := skittles/skittles.o
widgeter_skittles-$(CONFIG_SKITTLE_BLUE) += skittles/skittles-blue.o
widgeter_skittles-$(CONFIG_SKITTLE_RED) += skittles/skittles-red.o
widgeter_skittles-$(CONFIG_SKITTLE_GREEN) += skittles/skittles-green.o
obj-$(CONFIG_SKITTLEMESA) += widgeter_skittles.o

Some of those .o might come from .c, others from .S, and others from
.pl->.S->.o. Our goal is to compute a list of all of the file's .S
that come from .pl. It's important that we allow this to work both
when the CONFIG_* variables are present (Makefile.build) and when the
CONFIG_* variables aren't present, since Makefile.clean doesn't
include auto.conf. Here's how we're going to do it:

1. Expand obj-*, remove the .o suffix, and treat as a variable, and
then expand the -* of those variables:

part1 := $(foreach t,$(patsubst %.o,%,$(obj-) $(obj-m)
$(obj-y)),$($(t)-) $($(t)-y))

Now $(part1) contains all of the *.o files we wrote into the above file.

2. Replace all of the *.o files with a corresponding *.pl and tack on
the full path:

part2 := $(patsubst %.o,$(srctree)/$(src)/%.pl,$(part1))

Now $(part2) contains full paths of potential .pl files.

3. Remove from the list all *.pl files that don't actually exist
(since the .o might be coming from a .c or directly a .S instead):

part3 := $(wildcard $(part2))

Now $(part3) contains full paths of existing .pl files that correspond
to the makefile's explicitly listed .o files.

4. Remove the full path prefix and change the .pl suffix to a .S
suffix, so that it represents the intermediate file:

part4 := $(patsubst $(srctree)/$(src)/%.pl,%.S,$(part3))

Now $(part4) contains all of the intermediate .S targets that
correspond with .pl sources and .o destinations. We can now add that
to $(targets);

targets += $(part4)

And after this everything works perfectly. Putting it all together, we
can simply add this single line to the makefile and everything
functions exactly as expected:

targets += $(patsubst $(srctree)/$(src)/%.pl,%.S,$(wildcard $(patsubst
%.o,$(srctree)/$(src)/%.pl,$(foreach t,$(patsubst %.o,%,$(obj-)
$(obj-m) $(obj-y)),$($(t)-) $($(t)-y)))))

Cool! I mean, sort of. I really love make, and so this whole exercise
is perversely enjoyable for me (maybe I should quit kernels and write
lisp instead?), but I realize this isn't exactly a simple solution.
It's sitting in my repo right now with a big comment, but I'm sort of
hesitant to submit it. If that's okay with you, I'll send it upstream
as part of something else I'm working on. But if these types of
shenanigans don't really sit well, there are a few alternatives I can
think of that you might weigh in on:

a. The solution above, which achieves all objectives, but results in a
sort of obtuse line.

b. The solution above, but I split that line up into a few
intermediate stages to make it more clear.

c. I list the .pl files explicitly instead of depending on automatic
inference like the above. This is simple, but not as slick and another
thing developers have to remember to do when adding. But it's probably
the least controversial and most obvious.

d. Rather than going .pl -> .S, I go .perlasm.pl -> .perlasm.S, and
then add the filetype to Makefile.build, where it has stanzas like
"$(call intermediate_targets, .asn1.o, .asn1.c .asn1.h)". One
significant downside of this is that I don't see any such stanzas in
Makefile.clean, so I'm not sure that intermediate targets generated
this way are getting cleaned up.

e. I quit trying to be clever by ensuring that the .S in $(targets)
corresponds with both a .pl and a .o listed in the tree of $(obj-*),
and instead just wildcard my way to the relevant *.pl files with
something like: targets += $(patsubst
$(srctree)/$(src)/%.pl,%.S,$(wildcard $(srctree)/$(src)/*/*.pl)). This
is slightly simpler than (a) and (b), but usually wildcard'ing on
actual directories isn't the most bug-free way of using make.

f. Something else?

The answer is probably "just use (c)", but in case the topic interests
you, I'm happy to discuss the various alternatives.

Thanks,
Jason
