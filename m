Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:16414 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727243AbeKLPXo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Nov 2018 10:23:44 -0500
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id wAC5Vn5T007373
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Nov 2018 14:31:50 +0900
Received: by mail-vs1-f48.google.com with SMTP id b74so4397073vsd.9
        for <linux-kbuild@vger.kernel.org>; Sun, 11 Nov 2018 21:31:50 -0800 (PST)
MIME-Version: 1.0
References: <CAMBOaT3wpJ3RTX8XQeLkK2v9sxKUCUqe++ULAbYAOCrsjqDihg@mail.gmail.com>
In-Reply-To: <CAMBOaT3wpJ3RTX8XQeLkK2v9sxKUCUqe++ULAbYAOCrsjqDihg@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 12 Nov 2018 14:31:13 +0900
Message-ID: <CAK7LNATLXejPyzkypC+e-mm4WLCDDi1quEMJCtOmX-nGRZ+JFg@mail.gmail.com>
Subject: Re: scripts/Makefile.modinst: removing module path M from module
 destination is not working for some cases
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mikich7777@gmail.com
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Thu, Nov 8, 2018 at 8:27 PM Mikolaj Ch <mikich7777@gmail.com> wrote:
>
> Hi,
>
> I noticed a problem while installing external module with command:
> make M=dir modules_install
>
> For me it appeared in two separate cases:
> - when 'dir' includes symbolic link
> - when 'dir' includes double slash.
>
> For this two cases module is installed to:
> lib/modules/<kernel_version>/extra/<'dir>'/<module_name>.ko
> instead of
> lib/modules/<kernel_version/extra/<module_name>.ko
>
> I've traced the problem and it appeared to be in:
> scripts/Makefile.modinst in line:
>
> in line 12 the path to module is taken from MODVERDIR/*.mod file:
> __modules := $(sort $(shell grep -h '\.ko$$' /dev/null $(wildcard
> $(MODVERDIR)/*.mod)))
>
> and then directory part of this path is going to be removed with subst
> function in line 30:
> ext-mod-dir = $(INSTALL_MOD_DIR)$(subst $(patsubst
> %/,%,$(KBUILD_EXTMOD)),,$(@D))
>
> but it fails since KBUILD_EXTMOD is not evaluated path (can include
> symlink or double slash) and @D is direct/evaluated path from *.mod
> file.
> -------------------------
> the same in more details:
> -------------------------
>
> In kernel Makefile the following variables are set:
> KBUILD_EXTMOD = $M
> MODVERDIR = $KBUILD_EXTMOD/.tmp_versions
>
>
> in scripts/Makefile.modinst in lines:
> __modules := $(sort $(shell grep -h '\.ko$$' /dev/null $(wildcard
> $(MODVERDIR)/*.mod)))
> modules := $(patsubst %.o,%.ko,$(wildcard $(__modules:.ko=.o)))
>
> The path in $MODVERDIR is evaluated correctly by shell (symbolic link
> is followed and double slash is interpreted as single slash)
> and the path to the module $modules is taken form $(MODVERDIR)/*.mod file).


I tested it, but it did not happen to me.

The path in $(MODVERDIR) reflects
the directory path given via M= option for 'make modules'.


I guess you passed a normalized path to
'make M=<dir> modules'
then, a non-normalized path to
'make M=<dir> modules_install'
Didn't you ?



> The $modules is then passed to __modinst function as $@ where in line:
> ext-mod-dir = $(INSTALL_MOD_DIR)$(subst $(patsubst
> %/,%,$(KBUILD_EXTMOD)),,$(@D))
>
> subst function substitutes text from $KBUILD_EXTMOD to empty string in
> directory part of $@ (@D) but here KBUILD_EXTMOD is different then @D.
>
>
> Can't directory part be remove differently if using absolute paths to
> avoid such problems ?


I think  this is a hypothetical problem, like
   What if a user passed different passes for
  'make modules' and 'make modules_install' ?



         $ make -C <path_to_kernel_src> M=$PWD

is the idiom to build external modules.

M=$PWD will do a good job for you.


See Documentation/kbuild/modules.txt





> Regards,
>   Mikolaj Chadzynski



-- 
Best Regards
Masahiro Yamada
