Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:41112 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753952Ab0HSRcp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 19 Aug 2010 13:32:45 -0400
Date: Thu, 19 Aug 2010 19:32:43 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: xconfig oddity
Message-ID: <20100819173243.GA19204@merkur.ravnborg.org>
References: <20100819095102.f418cd9c.rdunlap@xenotime.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20100819095102.f418cd9c.rdunlap@xenotime.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kbuild@vger.kernel.org

On Thu, Aug 19, 2010 at 09:51:02AM -0700, Randy Dunlap wrote:
> In xconfig, when I enable (on menu) Option/Show Debug Info,
> the symbol's help/symbol info box (window) often says:
> 
> type: tristate
> unknown property: symbol
> ^^^^^^^^^^^^^^^^^^^^^^^^


I introduced a new property P_SYMBOL used
to hold information about where a symbol is defined.
(which Kconfig files/line numbers).

You could just plainly ignore that
property in ConfigInfoView::debug_info(struct symbol *sym)

Or you could add info about the file/line where 
the symbol is defined. Note - it may be in several files.

Can you try this yourself?

	Sam
