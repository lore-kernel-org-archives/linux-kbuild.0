Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:36530 "EHLO
        ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934707AbcKDQKx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Nov 2016 12:10:53 -0400
Date: Fri, 4 Nov 2016 16:10:48 +0000
From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH 2/2] kbuild: add -fno-PIE
Message-ID: <20161104161048.GG19539@ZenIV.linux.org.uk>
References: <20161102172058.13641-1-bigeasy@linutronix.de>
 <20161102172058.13641-2-bigeasy@linutronix.de>
 <1478213455.29107.13.camel@decadent.org.uk>
 <20161104010811.GD19539@ZenIV.linux.org.uk>
 <adb64e4e-0745-c23c-2b8f-a67372b1d28f@gmail.com>
 <20161104142424.jy6ble3pge3beowh@linutronix.de>
 <20161104151811.GE19539@ZenIV.linux.org.uk>
 <20161104152223.GA1052@infradead.org>
 <20161104155427.GF19539@ZenIV.linux.org.uk>
 <20161104155855.diyclit55eay6gxk@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161104155855.diyclit55eay6gxk@linutronix.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Christoph Hellwig <hch@infradead.org>, "Austin S. Hemmelgarn" <ahferroin7@gmail.com>, Ben Hutchings <ben@decadent.org.uk>, linux-kernel@vger.kernel.org, Sven Joachim <svenjoac@gmx.de>, Tomas Janousek <tomi@nomi.cz>, Joe Perches <joe@perches.com>, Adam Borowski <kilobyte@angband.pl>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, doko@debian.org

On Fri, Nov 04, 2016 at 04:58:55PM +0100, Sebastian Andrzej Siewior wrote:
> On 2016-11-04 15:54:27 [+0000], Al Viro wrote:
> > Christoph, would you mind rereading what I posted upthread?  I *am* aware of
> > that clusterfuck, including the Balint's charming games with the reassignments,
> > etc.  Directly affected by the whole mess, actually.
> 
> Al, I am re-doing the patch with a runtime check for -fno-PIE and
> tagging it stable and looking after Ben's fstack protector thingy.
> This should allow you to compile maintained stable kernels but it won't
> allow you to bisect to prior versions.
> I don't see any other way around it.

And I don't see any way around severity:important against gcc-6.  Unless the
policy has changed, "has a major effect on the usability of a package, without
rendering it completely unusable to everyone" still warrants that.  And
kernel development (including bisects) has, until now, been consdered
a normal use of gcc.
