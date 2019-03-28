Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:28165 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbfC1M6U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Mar 2019 08:58:20 -0400
MIME-Version: 1.0
References: <20190325160438.8982-1-joe.lawrence@redhat.com>
 <CAK7LNARyD=tG0JhwN_mjdyDRSPAF8UoZKvqAT3Ah_v7GfymCPg@mail.gmail.com> <20190326173308.GA26546@redhat.com>
In-Reply-To: <20190326173308.GA26546@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 28 Mar 2019 21:57:31 +0900
Message-ID: <CAK7LNAT4VTUOtjEvJfe9+7yNemkodUnDo6bMoKxSgqGq7H4mOQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: strip whitespace in cmd_record_mcount findstring
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nicholas Piggin <npiggin@gmail.com>, Steven Rostedt <rostedt@goodmis.org>

Hi Joe,


On Wed, Mar 27, 2019 at 2:33 AM Joe Lawrence <joe.lawrence@redhat.com> wrote:
>
> On Tue, Mar 26, 2019 at 02:29:47PM +0900, Masahiro Yamada wrote:
> > On Tue, Mar 26, 2019 at 1:05 AM Joe Lawrence <joe.lawrence@redhat.com> wrote:
> > >
> > > CC_FLAGS_FTRACE may contain trailing whitespace that interferes with
> > > findstring.
> > >
> > > For example, commit 6977f95e63b9 ("powerpc: avoid -mno-sched-epilog on
> > > GCC 4.9 and newer") introduced a change such that on my ppc64le box,
> > > CC_FLAGS_FTRACE="-pg -mprofile-kernel ".  (Note the trailing space.)
> > > When cmd_record_mcount is now invoked, findstring fails as the ftrace
> > > flags were found at very end of _c_flags, without the trailing space.
> > >
> > >   _c_flags=" ... -pg -mprofile-kernel"
> > >   CC_FLAGS_FTRACE="-pg -mprofile-kernel "
> > >                                        ^
> > >     findstring is looking for this extra space
> > >
> > > Remove the redundant whitespaces from CC_FLAGS_FTRACE in
> > > cmd_record_mcount to avoid this problem.
> > >
> > > Fixes: 6977f95e63b9 ("powerpc: avoid -mno-sched-epilog on GCC 4.9 and newer").
> > > Signed-off-by: Joe Lawrence <joe.lawrence@redhat.com>
> > > ---
> > >
> > > Standard disclaimer: I'm not a kbuild expert, but this works around the
> > > problem I reported where ftrace and livepatch self-tests were failing as
> > > specified object files were not run through the recordmcount.pl script:
> > >
> > > ppc64le: ftrace self-tests and $(CC_FLAGS_FTRACE) broken?
> > > https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-March/187298.html
> > >
> > >  scripts/Makefile.build | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > > index 2554a15ecf2b..74d402b5aa3c 100644
> > > --- a/scripts/Makefile.build
> > > +++ b/scripts/Makefile.build
> > > @@ -199,10 +199,10 @@ sub_cmd_record_mcount = perl $(srctree)/scripts/recordmcount.pl "$(ARCH)" \
> > >         "$(if $(part-of-module),1,0)" "$(@)";
> > >  recordmcount_source := $(srctree)/scripts/recordmcount.pl
> > >  endif # BUILD_C_RECORDMCOUNT
> > > -cmd_record_mcount =                                            \
> > > -       if [ "$(findstring $(CC_FLAGS_FTRACE),$(_c_flags))" =   \
> > > -            "$(CC_FLAGS_FTRACE)" ]; then                       \
> > > -               $(sub_cmd_record_mcount)                        \
> > > +cmd_record_mcount =                                                    \
> > > +       if [ "$(findstring $(strip $(CC_FLAGS_FTRACE)),$(_c_flags))" =  \
> > > +            "$(strip $(CC_FLAGS_FTRACE))" ]; then                      \
> > > +               $(sub_cmd_record_mcount)                                \
> > >         fi
> > >  endif # CC_USING_RECORD_MCOUNT
> > >  endif # CONFIG_FTRACE_MCOUNT_RECORD
> > > --
> > > 2.20.1
> > >
> >
> >
> >
> > I do not see a point in using the shell command here
> > in the first place.
> >
> > Instead of adding crappy workarounds,
> > I guess the following simple code should work:
> >
> >
> > index 2554a15..5f13021 100644
> > --- a/scripts/Makefile.build
> > +++ b/scripts/Makefile.build
> > @@ -199,11 +199,8 @@ sub_cmd_record_mcount = perl
> > $(srctree)/scripts/recordmcount.pl "$(ARCH)" \
> >         "$(if $(part-of-module),1,0)" "$(@)";
> >  recordmcount_source := $(srctree)/scripts/recordmcount.pl
> >  endif # BUILD_C_RECORDMCOUNT
> > -cmd_record_mcount =                                            \
> > -       if [ "$(findstring $(CC_FLAGS_FTRACE),$(_c_flags))" =   \
> > -            "$(CC_FLAGS_FTRACE)" ]; then                       \
> > -               $(sub_cmd_record_mcount)                        \
> > -       fi
> > +cmd_record_mcount = $(if $(findstring $(CC_FLAGS_FTRACE),$(_c_flags)),\
> > +                 $(sub_cmd_record_mcount))
> >  endif # CC_USING_RECORD_MCOUNT
> >  endif # CONFIG_FTRACE_MCOUNT_RECORD
> >
>
> Hi Masahiro,
>
> Agreed on the shell command ugliness, however I still think we need to
> strip the search pattern here.  With your suggestion:
>
> % rm -f kernel/trace/trace_selftest_dynamic.o
> % make kernel/trace/trace_selftest_dynamic.o
>   CALL    scripts/checksyscalls.sh
>   CALL    scripts/atomic/check-atomics.sh
>   CC      kernel/trace/trace_selftest_dynamic.o
>
> % eu-readelf --sections kernel/trace/trace_selftest_dynamic.o | grep mcount
> (nothing)
>
> Adding it back as, as below, restores those sections and the self tests
> work again.


OK, confirmed.

First, I was wondering why I could not reproduce this issue.
Then, I found the reason was I was using the latest GNU Make
compiled from the git source tree.

I found the following commit:

commit b90fabc8d6f34fb37d428dc0fb1b8b1951a9fbed
Author: Paul Smith <psmith@gnu.org>
Date:   Sat May 27 20:07:30 2017 -0400

    * NEWS: Do not insert a space during '+=' if the value is empty.

    * doc/make.texi (Appending): Document this behavior.
    * variable.c (do_variable_definition): Only add a space if the variable
    value is not empty.
    * tests/scripts/variables/flavors: Test this behavior.

diff --git a/NEWS b/NEWS
index e60644a..6e2c5c6 100644
--- a/NEWS
+++ b/NEWS
@@ -29,6 +29,12 @@
http://sv.gnu.org/bugs/index.php?group=make&report_id=111&fix_release_id=108&set
   This was claimed to be fixed in 3.81, but wasn't, for some reason.
   To detect this change search for 'nocomment' in the .FEATURES variable.

+* WARNING: Backward-incompatibility!
+  Previously appending using '+=' to an empty variable would result in a value
+  starting with a space.  Now the initial space is only added if the variable
+  already contains some value.  Similarly, appending an empty string does not
+  add a trailing space.
+
 * The previous limit of 63 jobs under -jN on MS-Windows is now
   increased to 4095.  That limit includes the subprocess started by
   the $(shell) function.




Applied to linux-kbuild/fixes with additional comments.

[Additional info by masahiro.yamada:
This issue only happens in the released versions of GNU Make.
CC_FLAGS_FTRACE will not contain the trailing space if you use
the latest GNU Make, which contains commit b90fabc8d6f3
("* NEWS: Do not insert a space during '+=' if the value is empty.")
]




> Regards,
>
> -- Joe
>
> -->8-- -->8-- -->8-- -->8-- -->8-- -->8-- -->8-- -->8-- -->8-- -->8--
>
> From 6a85e8ecf4179b3e80601a327ec43d8d49f0e3cd Mon Sep 17 00:00:00 2001
> From: Joe Lawrence <joe.lawrence@redhat.com>
> Date: Tue, 26 Mar 2019 10:50:28 -0400
> Subject: [PATCH v2] kbuild: strip whitespace in cmd_record_mcount findstring
>
> CC_FLAGS_FTRACE may contain trailing whitespace that interferes with
> findstring.
>
> For example, commit 6977f95e63b9 ("powerpc: avoid -mno-sched-epilog on
> GCC 4.9 and newer") introduced a change such that on my ppc64le box,
> CC_FLAGS_FTRACE="-pg -mprofile-kernel ".  (Note the trailing space.)
> When cmd_record_mcount is now invoked, findstring fails as the ftrace
> flags were found at very end of _c_flags, without the trailing space.
>
>   _c_flags=" ... -pg -mprofile-kernel"
>   CC_FLAGS_FTRACE="-pg -mprofile-kernel "
>                                        ^
>     findstring is looking for this extra space
>
> Remove the redundant whitespaces from CC_FLAGS_FTRACE in
> cmd_record_mcount to avoid this problem.
>
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com> (refactoring)
> Fixes: 6977f95e63b9 ("powerpc: avoid -mno-sched-epilog on GCC 4.9 and newer").
> Signed-off-by: Joe Lawrence <joe.lawrence@redhat.com>
> ---
>  scripts/Makefile.build | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 2554a15ecf2b..76ca30cc4791 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -199,11 +199,8 @@ sub_cmd_record_mcount = perl $(srctree)/scripts/recordmcount.pl "$(ARCH)" \
>         "$(if $(part-of-module),1,0)" "$(@)";
>  recordmcount_source := $(srctree)/scripts/recordmcount.pl
>  endif # BUILD_C_RECORDMCOUNT
> -cmd_record_mcount =                                            \
> -       if [ "$(findstring $(CC_FLAGS_FTRACE),$(_c_flags))" =   \
> -            "$(CC_FLAGS_FTRACE)" ]; then                       \
> -               $(sub_cmd_record_mcount)                        \
> -       fi
> +cmd_record_mcount = $(if $(findstring $(strip $(CC_FLAGS_FTRACE)),$(_c_flags)),        \
> +       $(sub_cmd_record_mcount))
>  endif # CC_USING_RECORD_MCOUNT
>  endif # CONFIG_FTRACE_MCOUNT_RECORD
>
> --
> 2.20.1
>


-- 
Best Regards
Masahiro Yamada
