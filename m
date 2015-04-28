Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb3-smtp-cloud2.xs4all.net ([194.109.24.29]:54005 "EHLO
	lb3-smtp-cloud2.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932150AbbD1ITb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 28 Apr 2015 04:19:31 -0400
Message-ID: <1430209167.2411.41.camel@x220>
Subject: Re: [PATCH] kconfig: add tinfo library if it exists to lxdialog
 linking flags
From: Paul Bolle <pebolle@tiscali.nl>
Date: Tue, 28 Apr 2015 10:19:27 +0200
In-Reply-To: <20150427120019.GA567@freedom>
References: <20150425160546.GA4002@freedom> <1430083148.2411.15.camel@x220>
	 <20150427120019.GA567@freedom>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sylvain.bertrand@gmail.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2015-04-27 at 12:00 +0000, sylvain.bertrand@gmail.com wrote:
> The pkg-config file I use is straight from the ncurses distribution with the
> lastest "rollup" patch.
> 
> Either it's a fedora specific modification, either a genuine ncurses patch
> released after the lastest "rollup" patch.

(If I read ftp://invisible-island.net/ncurses/5.9/README correctly, a
rollup is the patch that should be applied on top of the latest ncurses
release in order to get a development snapshot.)

What version of ncurses are you actually using?

> As far I understand it, from an application point of view, "standard" ncurses
> programming, in the case where tinfo lib is outside of ncurses lib, involves
> linking to libncurses library only. libtinfo linking would be required only in
> some special features are used, which seems to be the case with lxdialog.

On my Fedora 20 box linking to libtinfo is only necessary if you're
linking an application that's using libncurses statically.

> Please correct me if I'm wrong.

I have no idea.

Perhaps - and I'm speculating here - some features got moved from
ncurses(w) to tinfo. Anyhow, over here linking to tinfo is unneeded but
doesn't break mconf as far as I noticed. But, personally, I'd like to
know what triggered the issue you ran into before considering this
patch.


Paul Bolle

