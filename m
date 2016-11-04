Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:56086 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934358AbcKDPWf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Nov 2016 11:22:35 -0400
Date: Fri, 4 Nov 2016 08:22:23 -0700
From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 2/2] kbuild: add -fno-PIE
Message-ID: <20161104152223.GA1052@infradead.org>
References: <20161102172058.13641-1-bigeasy@linutronix.de>
 <20161102172058.13641-2-bigeasy@linutronix.de>
 <1478213455.29107.13.camel@decadent.org.uk>
 <20161104010811.GD19539@ZenIV.linux.org.uk>
 <adb64e4e-0745-c23c-2b8f-a67372b1d28f@gmail.com>
 <20161104142424.jy6ble3pge3beowh@linutronix.de>
 <20161104151811.GE19539@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161104151811.GE19539@ZenIV.linux.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "Austin S. Hemmelgarn" <ahferroin7@gmail.com>, Ben Hutchings <ben@decadent.org.uk>, linux-kernel@vger.kernel.org, Sven Joachim <svenjoac@gmx.de>, Tomas Janousek <tomi@nomi.cz>, Joe Perches <joe@perches.com>, Adam Borowski <kilobyte@angband.pl>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, doko@debian.org

On Fri, Nov 04, 2016 at 03:18:11PM +0000, Al Viro wrote:
> On Fri, Nov 04, 2016 at 03:24:24PM +0100, Sebastian Andrzej Siewior wrote:
> 
> > Eventually Fedora and SUSE will migrate to PIE by default and by then we
> > should cover all major distros so even Al should be affected unless he
> > decides not to update or is using something else.
> 
> That "something else" happens to be mostly Debian, actually.

Debian is moving over to PIE already.  Looks at this for example:

https://lists.debian.org/debian-kernel/2016/10/msg00242.html
