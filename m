Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f42.google.com ([209.85.210.42]:40122 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbfEDM0X (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 May 2019 08:26:23 -0400
MIME-Version: 1.0
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Sat, 4 May 2019 14:26:11 +0200
Message-ID: <CAFkk2KR+of+7YZKC=LOn1J7q8_u5b8HyM6yh4Ynfh68jYW7X8w@mail.gmail.com>
Subject: [ANNOUNCE] Kconfiglib GUI menuconfig
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>

Hello,

Kconfiglib (https://github.com/ulfalizer/Kconfiglib) now has a
Tkinter-based guiconfig.py in addition to the curses-based
menuconfig.py. It has been tested on Linux, Windows, and macOS.

See https://github.com/ulfalizer/Kconfiglib#menuconfig-interfaces for
a screenshot (with show-all mode on). The interface is inspired by
qconfig.

The images come from data embedded directly in guiconfig.py by
default, to avoid having to carry around a bunch of separate .gif
files.

makefile.patch now has a new 'guiconfig' target for trying out the GUI
menuconfig on the Linux kernel. Python 2 is used by default. Run 'make
PYTHONCMD=python3 guiconfig' to use Python 3.

Please tell me if you try it out and spot any issues or annoyances. :)

Cheers,
Ulf
