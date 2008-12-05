Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp-vbr14.xs4all.nl ([194.109.24.34]:4131 "EHLO
	smtp-vbr14.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750755AbYLEDuh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 4 Dec 2008 22:50:37 -0500
Date: Fri, 5 Dec 2008 04:50:17 +0100 (CET)
From: Roman Zippel <zippel@linux-m68k.org>
Subject: Re: [patch 5/8] kconfig: add module_name shortcut
In-Reply-To: <20081203215439.GB8115@uranus.ravnborg.org>
Message-ID: <Pine.LNX.4.64.0812041744270.24668@localhost.localdomain>
References: <200812012221.mB1ML5ZW013101@imap1.linux-foundation.org>
 <Pine.LNX.4.64.0812031619150.24668@localhost.localdomain>
 <20081203215439.GB8115@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: akpm@linux-foundation.org, linux-kbuild@vger.kernel.org, adobriyan@gmail.com

Hi,

On Wed, 3 Dec 2008, Sam Ravnborg wrote:

> > The config symbol is derived from the module name or can be specified 
> > after the name. I also added the option to specify the sources, so that 
> > these can be used to generate the Kbuild information.
> 
> Do you have any idea how do do this properly on the Kbuild side?
> I see a few possibilities but have not made up my mind yet.
> 
> 1) We could generate a Kbuild.foo file in the dir where we have the module
> 2) We could add info to auto.conf so we could build all modules defined
>    in the configuration in one step
> 
> Both alternatives have their drawbacks.

I'm considering a combination of both.
Separate files keeps thing local, as we may need further Makefile 
fragments, so keeping things local reduces the risk of conflicts.
OTOH we should have a global list of all dirs, which is then used by make, 
this avoids the dependency problem of some old generated Makefile still 
around which is magically included.

> Have you ever considered the possibility to add the Kconfig info
> direct in the .c file so we could have a single file driver for the
> typical cases?


I think currently it would create more problem than it provides in 
convenience.
First you have the dependency problem. How do you find new files? What 
happens if there are multiple version of a driver (e.g. a backup file).
Then there will be a performance problem, so that we would need some 
caching. Currently the whole Kconfig is read, when something is changed, 
since it's a only few MB, we get away with with, but if you have to scan 
all the sources it's a problem.

bye, Roman
