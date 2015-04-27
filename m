Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f41.google.com ([74.125.82.41]:35774 "EHLO
	mail-wg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932508AbbD0MAX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 27 Apr 2015 08:00:23 -0400
Date: Mon, 27 Apr 2015 12:00:19 +0000
From: sylvain.bertrand@gmail.com
Subject: Re: [PATCH] kconfig: add tinfo library if it exists to lxdialog
 linking flags
Message-ID: <20150427120019.GA567@freedom>
References: <20150425160546.GA4002@freedom>
 <1430083148.2411.15.camel@x220>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1430083148.2411.15.camel@x220>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Apr 26, 2015 at 11:19:08PM +0200, Paul Bolle wrote:
> Is that how pkg-config should work? If so, I wonder why it fails for
> you.

The pkg-config file I use is straight from the ncurses distribution with the
lastest "rollup" patch.

Either it's a fedora specific modification, either a genuine ncurses patch
released after the lastest "rollup" patch.

As far I understand it, from an application point of view, "standard" ncurses
programming, in the case where tinfo lib is outside of ncurses lib, involves
linking to libncurses library only. libtinfo linking would be required only in
some special features are used, which seems to be the case with lxdialog.

Please correct me if I'm wrong.

regards,

-- 
Sylvain BERTRAND
