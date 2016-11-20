Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from tartarus.angband.pl ([89.206.35.136]:42946 "EHLO
        tartarus.angband.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753025AbcKTTLw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 20 Nov 2016 14:11:52 -0500
Date: Sun, 20 Nov 2016 20:11:43 +0100
From: Adam Borowski <kilobyte@angband.pl>
Subject: Re: [GIT PULL] kbuild post v4.9-rc1 fixes
Message-ID: <20161120191143.GA29543@angband.pl>
References: <20161118205051.GA11224@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161118205051.GA11224@sepie.suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Nov 18, 2016 at 09:50:51PM +0100, Michal Marek wrote:
> Hi Linus,
> 
> Here are some regression fixes for kbuild:
> - modversion support for exported asm symbols (Nick Piggin). The
>   affected architectures need separate patches adding asm-prototypes.h.

As the pull request's comment says, we do need the per-arch asm-prototypes.h
patches.  I've just checked on x86: still broken with current mainline,
works with my patch from 20161102121427.10103-1-kilobyte@angband.pl;
I suspect the arm counterpart (patch by Arnd Bergmann) is also needed
(you just commented on that thread).

-- 
A true bird-watcher waves his tail while doing so.
