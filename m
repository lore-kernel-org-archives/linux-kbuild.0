Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io1-f67.google.com ([209.85.166.67]:43936 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbeKHVBl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Nov 2018 16:01:41 -0500
Received: by mail-io1-f67.google.com with SMTP id t81-v6so14321165iod.10
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Nov 2018 03:26:39 -0800 (PST)
MIME-Version: 1.0
From: Mikolaj Ch <mikich7777@gmail.com>
Date: Thu, 8 Nov 2018 12:26:27 +0100
Message-ID: <CAMBOaT3wpJ3RTX8XQeLkK2v9sxKUCUqe++ULAbYAOCrsjqDihg@mail.gmail.com>
Subject: scripts/Makefile.modinst: removing module path M from module
 destination is not working for some cases
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc: linux-kbuild@vger.kernel.org

Hi,

I noticed a problem while installing external module with command:
make M=dir modules_install

For me it appeared in two separate cases:
- when 'dir' includes symbolic link
- when 'dir' includes double slash.

For this two cases module is installed to:
lib/modules/<kernel_version>/extra/<'dir>'/<module_name>.ko
instead of
lib/modules/<kernel_version/extra/<module_name>.ko

I've traced the problem and it appeared to be in:
scripts/Makefile.modinst in line:

in line 12 the path to module is taken from MODVERDIR/*.mod file:
__modules := $(sort $(shell grep -h '\.ko$$' /dev/null $(wildcard
$(MODVERDIR)/*.mod)))

and then directory part of this path is going to be removed with subst
function in line 30:
ext-mod-dir = $(INSTALL_MOD_DIR)$(subst $(patsubst
%/,%,$(KBUILD_EXTMOD)),,$(@D))

but it fails since KBUILD_EXTMOD is not evaluated path (can include
symlink or double slash) and @D is direct/evaluated path from *.mod
file.

-------------------------
the same in more details:
-------------------------

In kernel Makefile the following variables are set:
KBUILD_EXTMOD = $M
MODVERDIR = $KBUILD_EXTMOD/.tmp_versions


in scripts/Makefile.modinst in lines:
__modules := $(sort $(shell grep -h '\.ko$$' /dev/null $(wildcard
$(MODVERDIR)/*.mod)))
modules := $(patsubst %.o,%.ko,$(wildcard $(__modules:.ko=.o)))

The path in $MODVERDIR is evaluated correctly by shell (symbolic link
is followed and double slash is interpreted as single slash)
and the path to the module $modules is taken form $(MODVERDIR)/*.mod file).

The $modules is then passed to __modinst function as $@ where in line:
ext-mod-dir = $(INSTALL_MOD_DIR)$(subst $(patsubst
%/,%,$(KBUILD_EXTMOD)),,$(@D))

subst function substitutes text from $KBUILD_EXTMOD to empty string in
directory part of $@ (@D) but here KBUILD_EXTMOD is different then @D.


Can't directory part be remove differently if using absolute paths to
avoid such problems ?

Regards,
  Mikolaj Chadzynski
