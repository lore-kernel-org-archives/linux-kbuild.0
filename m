Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:39477 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752756AbeFHV47 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Jun 2018 17:56:59 -0400
Date: Fri, 8 Jun 2018 23:56:55 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [RFC v4 0/1] i-search functionality for mconf
Message-ID: <20180608215655.GB28473@ravnborg.org>
References: <20180608184606.5029-1-dirk@gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180608184606.5029-1-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Segher Boessenkool <segher@kernel.crashing.org>

Hi Dirk.

On Fri, Jun 08, 2018 at 08:46:05PM +0200, Dirk Gouders wrote:
> Hello,
> 
> this version is a prototype of the idea, Sam suggested -- I hope I
> undestood it correctly.
> 
> This is a remarkable change to mconf in it's behavior; mainly it now
> differentiates two focuses and operates differently, depending on the
> focus.  When the focus is on the menu, mconf is in i-search mode, for
> a detailed description see 1/1.
> 
> As stated earlier, this is just a prototype, documentation is missing
> and the code is not ready for a real commit.

When trying this out it started to work as envisioned.
But somehw I manage to get stuck in the menus and cannot navigate to
the buttons.

Consider to remove the old short-cut for the menus.
(Most/all the first_alph thingy in menubox.c)
That will avoid two confliting navigations principles and likely
make the code simpler to read.

I am not sure, but maybe you can get rid of all the hotkey
support in print_item with this change too.

	Sam
