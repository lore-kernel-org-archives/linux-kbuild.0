Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:40169 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752067AbYL0Uzr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 27 Dec 2008 15:55:47 -0500
Date: Sat, 27 Dec 2008 21:57:20 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Improve dependency checks in kconfig
Message-ID: <20081227205720.GA16609@uranus.ravnborg.org>
References: <20081227090339.GA6279@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20081227090339.GA6279@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>

On Sat, Dec 27, 2008 at 10:03:39AM +0100, Sam Ravnborg wrote:

> With this change kconfig at least report one of the
> places where said symbol is defined. It is not perfect as
> we should report all places where a symbol is reported but
> for the cases I hit what we have here was good enough.

I gave it a spin and following two patches does:
- print out all places where a symbol is defined
- print out where we hit source "" issues

	Sam
