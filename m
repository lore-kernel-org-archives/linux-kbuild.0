Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi1-f169.google.com ([209.85.167.169]:36652 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbeI1FEv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Sep 2018 01:04:51 -0400
MIME-Version: 1.0
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Fri, 28 Sep 2018 00:44:04 +0200
Message-ID: <CAFkk2KQ-sC=bAd9fCkOVPNmZn8m+EZfpZtirE+J5VpvW120sxQ@mail.gmail.com>
Subject: [ANNOUNCE] Kconfiglib menuconfig and documentation generation updates
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>

Hello,

Here's two small Kconfiglib (https://github.com/ulfalizer/kconfiglib) updates.

First, I've made it a lot easier to try out the menuconfig implementation on
the kernel. This will work now, in the kernel root:

  $ git clone https://github.com/ulfalizer/Kconfiglib.git
  $ git am Kconfiglib/makefile.patch
  $ make kmenuconfig

Here's an animation that demonstrates various menuconfig features:
https://raw.githubusercontent.com/ulfalizer/Kconfiglib/screenshots/screenshots/menuconfig.gif

Secondly, there's now a handy cross-referenced documentation generation script
available.

Example documentation output (warning: heavy page, lots of symbols):
https://docs.zephyrproject.org/latest/reference/kconfig/index.html

The script that generates the documentation:
https://github.com/zephyrproject-rtos/zephyr/blob/master/doc/scripts/genrest.py

The recently added Kconfig preprocessor has been implemented for a while now,
along with an extension that allows preprocessor functions to be defined in
Python.

I've also fixed some broken/incomplete behavior from the C tools, like not
being able to add symbols to choices by giving them a name and defining them in
multiple locations (though I think projects sometimes overdo multiple
definitions :). This is actually just a menuconfig hack that aggregates the
menu nodes from all choice definition locations when you enter a choice.

Zephyr and several smaller projects now use Kconfiglib exclusively.

Feedback appreciated!

Cheers,
Ulf
