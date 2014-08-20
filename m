Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:39301 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751213AbaHTQkO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 Aug 2014 12:40:14 -0400
Received: by mail-pd0-f181.google.com with SMTP id g10so11904598pdj.40
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Aug 2014 09:40:09 -0700 (PDT)
Date: Wed, 20 Aug 2014 09:40:03 -0700
From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 0/2] kconfig: fix multi-byte UTF handling in nconfig
Message-ID: <20140820164003.GB3246@norris-Latitude-E6410>
References: <1401868351-24014-1-git-send-email-computersforpeace@gmail.com>
 <CAN8TOE8MqH9D=R-8FJdE52syY7uU8oBbu+5MtXAdtQEdBGZjkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN8TOE8MqH9D=R-8FJdE52syY7uU8oBbu+5MtXAdtQEdBGZjkA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org

Hi Yan,

On Thu, Jul 10, 2014 at 01:52:29AM -0700, Brian Norris wrote:
> Ping? The patches are simple.

Ping.

> On Wed, Jun 4, 2014 at 12:52 AM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> > Hi,
> >
> > The first patch is trivial.
> >
> > The second is inspired by a long-standing bugzilla entry:
> >
> >   https://bugzilla.kernel.org/show_bug.cgi?id=43067
> >
> > The MTD_NAND_CAFE Kconfig symbol (drivers/mtd/nand/Kconfig) has description
> > text which uses a multi-byte UTF-8 character: the 'É' in 'CAFÉ'. This
> > character (and other similar >8bit UTF-8 characters) is not handled
> > correctly by many of the kernel configuration tools (notably 'make nconfig'
> > and 'make xconfig'). nconfig was especially broken, as it would completely
> > drop any menu entry which had non-ASCII characters, as well as ALL
> > subsequent entries in the same window (!!).
> >
> > The fix for nconfig is to allow linking against the "wide" ncurses library.
> > I did not bother learning QT well enough to fix 'make xconfig'; it still
> > appears broken w.r.t. wide characters, and makes liberal use of the
> > QString::latin1() conversion for potentially non-Latin strings.
> >
> > Notably, this issue is not very obvious for the common user. For instance,
> > on Ubuntu one might install libncurses5-dev, which is sufficient for getting
> > 'menuconfig' to compile/link/run just fine. It is easy to miss the fact that
> > unicode handling is incorrect, because the behavior is undefined (usually
> > just chunk characters, but nconfig just silently drops data), and nothing
> > informs them that they should have installed libncursesw5-dev instead.
> >
> > Ideally, we could drop support for linking against legacy ncurses, and
> > instead require ncursesw, but that might be painful to enforce for all users
> > (i.e., nearly everyone who configures kernels). I welcome any thoughts on
> > improving this state for others (like me, for a long time) who don't realize
> > that they should install the ncursesw development package in order to get
> > 21st century support for unicode help text.
> >
> > Brian
> >
> > Brian Norris (2):
> >   kconfig: lxdialog: fix spelling
> >   kconfig: nconfig: fix multi-byte UTF handling
> >
> >  scripts/kconfig/Makefile          |    3 ++-
> >  scripts/kconfig/lxdialog/dialog.h |    2 +-
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> >
> > --
> > 1.7.9.5
> >
