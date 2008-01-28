Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp2.linux-foundation.org ([207.189.120.14]:33069 "EHLO
	smtp2.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752552AbYA1WEx (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 28 Jan 2008 17:04:53 -0500
Date: Tue, 29 Jan 2008 09:04:38 +1100 (EST)
From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PATCH] kbuild updates
In-Reply-To: <20080128212624.GA3842@uranus.ravnborg.org>
Message-ID: <alpine.LFD.1.00.0801290901340.3505@www.l.google.com>
References: <20080128212624.GA3842@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Paul Mundt <lethal@linux-sh.org>



On Mon, 28 Jan 2008, Sam Ravnborg wrote:
> 
> Please pull following patches for kbuild/kconfig and a few other areas.
> 
> Pull from:
> 	ssh://master.kernel.org/pub/scm/linux/kernel/git/sam/kbuild.git

This conflicts with the SH updates (sh is also integrating 32/64-bit into 
one tree now).

Since I don't know the SH tree or your changes, the probably fairly 
trivial manual merge isn't an option (especially as I'm not at home and 
doing this on a laptop with a less than ideal keyboard and smaller screen 
than I'm used to).

So I hope you and Paul can resolve the conflicts and re-send.

		Linus
