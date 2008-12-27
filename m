Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:44346 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751419AbYL0JCF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 27 Dec 2008 04:02:05 -0500
Date: Sat, 27 Dec 2008 10:03:39 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Improve dependency checks in kconfig
Message-ID: <20081227090339.GA6279@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>

While working on some unification of Kconfig stuff across
all architectures I hit a Kconfig bug where it segfaulted
due to a recursive dependency.
It's a bug I have introduced myself long time ago :-(

I decided to do the reporting more verbose while fixing
this bug.

When looking into this I added a few comments to expr.h
so I do not have to fnd out how it works next time.

The problem was that kconfig do not save where it finds
a config symbol but only the related properties.

But a symbol defined like this:

    config FOO
            bool

does not have any properties so we do not save any
filename/line numbers.

The solution I came up with was to add a new property:
P_SYMBOL used solely to record filename/line number for
defined symbols.
I could not add it to struct symbol because a symbol can
be defined at several places.

With this change kconfig at least report one of the
places where said symbol is defined. It is not perfect as
we should report all places where a symbol is reported but
for the cases I hit what we have here was good enough.

With this I hit a recursive dependency issue in m68k - a patch
is already sent to the m68k guys.

Patches follows.

Sam Ravnborg (4):
      kconfig: explain symbol value defaults
      kconfig: add comments to symbol flags
      kconfig: struct property commented
      kconfig: improve readout when we hit recursive dependencies

 scripts/kconfig/expr.h   |   83 ++++++++++++++++++++++++++++++---------------
 scripts/kconfig/menu.c   |    2 +
 scripts/kconfig/symbol.c |   11 ++++--
 3 files changed, 65 insertions(+), 31 deletions(-)

	Sam
