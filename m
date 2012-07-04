Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46557 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750986Ab2GDQcI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Jul 2012 12:32:08 -0400
Date: Wed, 4 Jul 2012 18:32:06 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kconfig/nconf: fix compile with ncurses reentrant API
Message-ID: <20120704163206.GA12094@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1339545915-8892-1-git-send-email-yselkowitz@users.sourceforge.net>
 <1339545902-8812-1-git-send-email-yselkowitz@users.sourceforge.net>
 <1339460981-7568-1-git-send-email-yselkowitz@users.sourceforge.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yaakov (Cygwin/X)" <yselkowitz@users.sourceforge.net>
Cc: linux-kbuild@vger.kernel.org

On Mon, Jun 11, 2012 at 07:29:41PM -0500, Yaakov (Cygwin/X) wrote:
> ESCDELAY is a global variable which is replaced by getter and setter
> functions with NCURSES_REENTRANT.  This fixes the following error:
> 
> nconf.c: In function ‘main’:
> nconf.c:1506:2: error: lvalue required as left operand of assignment

On Tue, Jun 12, 2012 at 07:05:02PM -0500, Yaakov (Cygwin/X) wrote:
> Commit 8c41e5e363db55d91aa3b1cdce4ab02ad9821de7 added a check for
> ncursesw/curses.h for the case where ncurses and ncursesw are build
> separately but only one is installed.  But if both are installed,
> the headers ncurses/curses.h and ncursesw/curses.h differ, and since
> libncursesw will be found first, so should ncursesw/curses.h.

On Tue, Jun 12, 2012 at 07:05:15PM -0500, Yaakov (Cygwin/X) wrote:
> Import libraries on Cygwin and MinGW/MSYS use the .dll.a suffix, so
> checking this suffix is necessary to make sure ncurses will still be
> found when built without static libraries.

I applied these three to kbuild.git#kconfig. Sorry for the delay.

Michal
