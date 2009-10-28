Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bw0-f227.google.com ([209.85.218.227]:40896 "EHLO
	mail-bw0-f227.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754883AbZJ1WyD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Oct 2009 18:54:03 -0400
Received: by bwz27 with SMTP id 27so1619861bwz.21
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Oct 2009 15:54:06 -0700 (PDT)
From: Bernhard Kaindl <bernhard.kaindl@gmx.net>
Subject: [remarks 0/4] user remarks for config symbols
Date: Wed, 28 Oct 2009 23:53:46 +0100
Message-Id: <4ae8cb8c.0d1abc0a.0bd6.3d0e@mx.google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org, Bernhard Kaindl <bernhard.kaindl@gmx.net>

When dealing with creating or maintaining a kernel configuration, one
may want to remember why a certain symbol was set in a certain way.

I've been working on enhancing the config tools keep and edit remarks
entered by the user to make keeping remarks as simple as possible.

The following patches show a simple approach to that which I used
to quite some extent, tracking hundreds of comments, using the patched
make xconfig, which makes editing them quite comfortable.

This simple, and rather minimum approach leaves out some changes which
I added to make xconfig to show the remark for the newly selected
config symbol in the panel which shows additional info for that symbol.

If the general idea finds support, I will, of course, also bring these
additional changes to make xconfig forward, and I have a "config2html"
which exports the configuration decisions taken, along with any remarks
for them, to a html file using a simple table.

Such export may be useful for community-oriented Linux distributions which
like to do their kernel package management in an open environment, and
may want do document the decisions taken in an efficient manner. I saw
some efforts on be half of the Ubuntu kernel packagers group in that
direction, but I am not affiliated in this regard with any distribution.

Thanks,
Bernhard Kaindl


Bernhard Kaindl (4):
  Support loading and saving custom remarks for config symbols
  menuconfig: allow editing of remarks for config symbols
  xconfig: allow editing of remarks for config symbols
  make config / oldconfig: allow editing of remarks for config symbols

 scripts/kconfig/conf.c             |   19 +++++++++++++
 scripts/kconfig/confdata.c         |   45 ++++++++++++++++++++++++++++--
 scripts/kconfig/expr.h             |    1 +
 scripts/kconfig/lxdialog/menubox.c |    3 ++
 scripts/kconfig/mconf.c            |   51 ++++++++++++++++++++++++++++++++++
 scripts/kconfig/qconf.cc           |   53 ++++++++++++++++++++++++++++++++++++
 scripts/kconfig/qconf.h            |   19 +++++++++++++
 7 files changed, 188 insertions(+), 3 deletions(-)

