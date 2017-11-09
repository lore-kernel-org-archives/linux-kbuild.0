Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:50383 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753007AbdKIQhV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Nov 2017 11:37:21 -0500
MIME-Version: 1.0
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Thu, 9 Nov 2017 17:37:19 +0100
Message-ID: <CAFkk2KTTLZHRjy7mnLwgLW+2XN1uXSJ6o-87x0-Uaqcz3J+x8A@mail.gmail.com>
Subject: [ANNOUNCE] Kconfiglib 2: An improved, more general redesign
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, corbet@lwn.net, Simon Glass <sjg@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, bruce.ashfield@windriver.com, Samuel Martin <s.martin49@gmail.com>, ivan@espressif.com, dirk@gouders.net, yann.morin.1998@free.fr, randy.dunlap@oracle.com, mmarek@suse.cz, ziegler@cs.fau.de, dl@cs.fau.de, rothberg@cs.fau.de, soos.mate@gmail.com, bergert@chalmers.se, kconfig-sat@googlegroups.com, mikew@google.com, akpm@linux-foundation.org

Hello,

A new, much-improved version 2 of Kconfiglib
(https://github.com/ulfalizer/Kconfiglib) is out.

I got tired of some old interface and design mistakes while working on adding
implicit menu support, and decided to redo things the right way.

For a summary of changes, see kconfiglib-2-changes.txt
(https://github.com/ulfalizer/Kconfiglib/blob/master/kconfiglib-2-changes.txt).
Highlights include direct access to the menu tree (including implicit menus)
and direct access to symbol properties and their conditions. Expressions can be
inspected directly and use a simple tuple-based format. The API has gotten more
general and less clunky to use.

See the kconfiglib.py module docstring (at the top of kconfiglib.py) for an
introduction to some Kconfig/Kconfiglib concepts. Maybe some of it would be
nice to have in kconfig-language.txt as well.

It's now pretty easy to implement menuconfig-like functionality on top of
Kconfiglib, like in the the following example/proof-of-concept
(examples/menuconfig.py):


  ======== Example Kconfig configuration ========

  [*] Enable loadable module support (MODULES)
      Bool and tristate symbols
          [*] Bool symbol (BOOL)
                  [ ] Dependent bool symbol (BOOL_DEP)
                  < > Dependent tristate symbol (TRI_DEP)
                  [ ] First prompt (TWO_MENU_NODES)
          < > Tristate symbol (TRI)
          [ ] Second prompt (TWO_MENU_NODES)
              *** These are selected by TRI_DEP ***
          < > Tristate selected by TRI_DEP (SELECTED_BY_TRI_DEP)
          < > Tristate implied by TRI_DEP (IMPLIED_BY_TRI_DEP)
      String, int, and hex symbols
          (foo) String symbol (STRING)
          (747) Int symbol (INT)
          (0xABC) Hex symbol (HEX)
      Various choices
          -*- Bool choice (BOOL_CHOICE)
                  --> Bool choice sym 1 (BOOL_CHOICE_SYM_1)
                      Bool choice sym 2 (BOOL_CHOICE_SYM_2)
          {M} Tristate choice (TRI_CHOICE)
                  < > Tristate choice sym 1 (TRI_CHOICE_SYM_1)
                  < > Tristate choice sym 2 (TRI_CHOICE_SYM_2)
          [ ] Optional bool choice (OPT_BOOL_CHOICE)

  Enter a symbol/choice name, "load_config", or "write_config" (or
press CTRL+D to exit): BOOL
  Value for BOOL (available: n, y): n
  ...


Printing Kconfig objects now produces reparsable Kconfig output:

  >>> print(kconf.syms["MODULES"])
  menuconfig MODULES
          bool
          prompt "Enable loadable module support"
          option modules
          help
            Kernel modules are small pieces of compiled code which can
            be inserted in the running kernel, rather than being
            permanently built into the kernel.  You use the "modprobe"
            tool to add (and sometimes remove) them.  If you say Y here,
            many parts of the kernel can be built as modules (by
            ...


Cheers,
Ulf
