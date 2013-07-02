Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ee0-f42.google.com ([74.125.83.42]:42542 "EHLO
	mail-ee0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753063Ab3GBPWg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 2 Jul 2013 11:22:36 -0400
Received: by mail-ee0-f42.google.com with SMTP id c4so2777064eek.15
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jul 2013 08:22:35 -0700 (PDT)
From: davidgraeff <david.graeff@web.de>
Subject: Kconfig Gtk/Qt interface flavours ported to newest toolkit versions
Date: Tue,  2 Jul 2013 17:22:21 +0200
Message-Id: <1372778550-22110-1-git-send-email-david.graeff@web.de>
In-Reply-To: <kconfig-port-gtk-qt>
References: <kconfig-port-gtk-qt>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Hello all,

I've no idea if this is the right way to send patches. I'm kind of new to this.
Attached is a patchset basically for porting the graphical Gtk and Qt flavours
to their latest toolkit versions (Gtk3 and Qt4 with compatibility to Qt5 respectively).
It took a day or so to get into the code -> Newly inserted and changed source code
is commented in many/some places now.

I do not know if it was on purpose to keep all flavours except lxdialog in one single directory,
but for presumably easier maintenance the first patch split of each flavours into its
own subdirectory. Additionally I ripped out flavour specific makefile targets. Each subdirectory
contains a separate makefile now.
An advantage is a more simple makefile for e.g. all the C++/Qt stuff, where Qt specific moc and uic
tools are necessary.

The 2nd to 6th patch port the Gtk2 ui to the modern Gtk3 toolkit including the conversion
from a libglade (deprecated) interface to a gtkbuilder interface.

The 7th to 9th patch port the Qt3/Qt4+Qt3support ui to the current version 4 of the Qt toolkit.
The gui is no longer realised by handwritten c++ code but by the Qt Designer for a much easier
user interface design and less code.
The Model/View concept of Qt is heavily used and no Qt3 support classes are used anymore,
as a result the code should work with the newest Qt5, too.

Those newer graphical kconfig flavours will be used by a project I'm involved in so
I will maintain it for the next couple of months.

If I did anything wrong, please instruct me or provide me a link please.

- David -

