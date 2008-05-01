Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp-vbr8.xs4all.nl ([194.109.24.28]:3624 "EHLO
	smtp-vbr8.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752401AbYEAEuc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 1 May 2008 00:50:32 -0400
From: Roman Zippel <zippel@linux-m68k.org>
Subject: Re: Additional kconfig targets (cloneconfig, nonint_oldconfig etc)
Date: Thu, 1 May 2008 06:40:29 +0200
References: <20080429183531.GB19652@uranus.ravnborg.org>
In-Reply-To: <20080429183531.GB19652@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200805010640.33973.zippel@linux-m68k.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Dave Jones <davej@codemonkey.org.uk>, Roland McGrath <roland@redhat.com>, Andres Salomon <dilinger@queued.net>

Hi,

On Tuesday 29. April 2008, Sam Ravnborg wrote:

> Recently there has been request for a number of new
> kconfig related targets.
>
> In general it boils down to the following:
>
> We need to be flexible in what configuration
> we start out from and how we apply it.
>
> We need to be able to apply it in following ways:
> 1) automated - select defaults for all new symbols
>    => It is used for "make defconfig, make *_defconfig" today
>
> 2) interactive - asking user for all new symbols
>    and error out if stdin is redirected
>
> 3) list unknown - list all new symbols and do not
>    create a new config

A general comment about the intendend design:
conf.c is primarily meant as interactive tool. defconfig isn't exactly 
interactive, but is included for historical reasons as it produces the same 
output.
The patch I've seen for the last point put it into conf.c, which is the wrong 
place for it. For this sort of thing we should create a small query tool, 
which then can export all sorts of information.

If we silence the defconfig output (which IMO is a good thing, as I don't 
think anyone looked at the output seriously for a long time and the current 
behaviour has purely historical reasons), it would also open up the 
possibility to separate it from conf.c.
This also fits into an idea I'm playing with to extend the .config format like 
this:

%defaultmode: mod
CONFIG_FOO=n

Basically this could replace "make allmodconfig KCONFIG_ALLCONFIG=..." and the 
current way to produce an allmodconfig would be replaced by a dedicated 
function.

bye, Roman
