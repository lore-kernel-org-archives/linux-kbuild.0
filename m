Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:37599 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbeKPLsZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Nov 2018 06:48:25 -0500
MIME-Version: 1.0
References: <1542270435-11181-1-git-send-email-yamada.masahiro@socionext.com>
 <1542270435-11181-6-git-send-email-yamada.masahiro@socionext.com> <6ee62b52-5d6d-c540-5f01-f522b6986c4d@rasmusvillemoes.dk>
In-Reply-To: <6ee62b52-5d6d-c540-5f01-f522b6986c4d@rasmusvillemoes.dk>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 16 Nov 2018 10:37:18 +0900
Message-ID: <CAK7LNAS5CKoT_4jk6BB5zs_EtXtj2HNjZ76FeOFBRA01nrQhUQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] kbuild: change if_changed_rule to accept multi-line recipe
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Nov 15, 2018 at 6:12 PM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> On 15/11/2018 09.27, Masahiro Yamada wrote:
> > GNU Make supports 'define' ... 'endef' directive, which can describe
> > a recipe that consists of multiple lines.
> >
> >   endef
> >
> > This does not actually exploit the benefits of 'define' ... 'endef'
> > form. All shell commands must be concatenated with '; \' so that it
> > looks like a single command from the Makefile point of view. '@' can
> > only appear before the first action.
> >
> > The root cause of this misfortune is the '@set -e;' in if_changed_rule.
> > It is easily solvable by moving '@set -e' to the 'cmd' macro.
> >
> > The combo of $(call echo-cmd,*) $(cmd_*) in rule_cc_o_c and rule_as_o_S
> > were replaced with $(call cmd,*). The tailing back-slashes went away.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> >  define rule_cc_o_c
> > -     $(call echo-cmd,checksrc) $(cmd_checksrc)                         \
> > -     $(call cmd_and_fixdep,cc_o_c)                                     \
> > -     $(cmd_gen_ksymdeps)                                               \
> > -     $(cmd_checkdoc)                                                   \
> > -     $(call echo-cmd,objtool) $(cmd_objtool)                           \
> > -     $(cmd_modversions_c)                                              \
> > -     $(call echo-cmd,record_mcount) $(cmd_record_mcount)
> > +     $(call cmd,checksrc)
> > +     @$(call cmd_and_fixdep,cc_o_c)
> > +     $(call cmd,gen_ksymdeps)
> > +     $(call cmd,checkdoc)
> > +     $(call cmd,objtool)
> > +     $(call cmd,modversions_c)
> > +     $(call cmd,record_mcount)
> >  endef
>
> Does this mean that Make now spawns a new shell for each of these
> commands,


Yes and No.

Basically, each line is run in an independent sub-shell,
but things are a little bit complex.

GNU Make, if possible, runs the command directly
instead of forking a shell process.

That is what I understood according to the following document:


http://wanderinghorse.net/computing/make/book/ManagingProjectsWithGNUMake-3.1.3.pdf

See "chapter 7: commands"
  ---------->8----------
  Commands are essentially one-line shell scripts.
  In effect, make grabs each line and passes it to a subshell for execution.
  In fact, make can optimize this (relatively) expensive fork/exec algorithm
  if it can guarantee that omitting the shell will not change the behavior of
  the program. It checks this by scanning each command line for shell special
  characters, such as wildcard characters and i/o redirection. If none are
  found, make directly executes the command without passing it to a subshell.
  ---------->8----------





> and if so, what's the performance impact? Or am I just
> misreading things? If this does change the semantics (one shell instance
> versus many), I think that's worth mentioning explicitly in the
> changelog, regardless of whether there's no measuarable performance impact.


Last night, I checked 'perf stat' of x86 defconfig build,
which enables cmd_objtool.



Without this commit:


 Performance counter stats for 'make -j8' (10 runs):

     125.499068713 seconds time elapsed
          ( +-  0.10% )


With this commit:

 Performance counter stats for 'make -j8' (10 runs):

     125.618321667 seconds time elapsed
          ( +-  0.24% )



I did not get noticeable performance regression.



-- 
Best Regards
Masahiro Yamada
