Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:35206 "EHLO
        ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934358AbcKDPSV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Nov 2016 11:18:21 -0400
Date: Fri, 4 Nov 2016 15:18:11 +0000
From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH 2/2] kbuild: add -fno-PIE
Message-ID: <20161104151811.GE19539@ZenIV.linux.org.uk>
References: <20161102172058.13641-1-bigeasy@linutronix.de>
 <20161102172058.13641-2-bigeasy@linutronix.de>
 <1478213455.29107.13.camel@decadent.org.uk>
 <20161104010811.GD19539@ZenIV.linux.org.uk>
 <adb64e4e-0745-c23c-2b8f-a67372b1d28f@gmail.com>
 <20161104142424.jy6ble3pge3beowh@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161104142424.jy6ble3pge3beowh@linutronix.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: "Austin S. Hemmelgarn" <ahferroin7@gmail.com>, Ben Hutchings <ben@decadent.org.uk>, linux-kernel@vger.kernel.org, Sven Joachim <svenjoac@gmx.de>, Tomas Janousek <tomi@nomi.cz>, Joe Perches <joe@perches.com>, Adam Borowski <kilobyte@angband.pl>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, doko@debian.org

On Fri, Nov 04, 2016 at 03:24:24PM +0100, Sebastian Andrzej Siewior wrote:

> Eventually Fedora and SUSE will migrate to PIE by default and by then we
> should cover all major distros so even Al should be affected unless he
> decides not to update or is using something else.

That "something else" happens to be mostly Debian, actually.
