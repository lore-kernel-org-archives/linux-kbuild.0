Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:55358 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751466AbYLCVxP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Dec 2008 16:53:15 -0500
Date: Wed, 3 Dec 2008 22:54:39 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [patch 5/8] kconfig: add module_name shortcut
Message-ID: <20081203215439.GB8115@uranus.ravnborg.org>
References: <200812012221.mB1ML5ZW013101@imap1.linux-foundation.org> <Pine.LNX.4.64.0812031619150.24668@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0812031619150.24668@localhost.localdomain>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roman Zippel <zippel@linux-m68k.org>
Cc: akpm@linux-foundation.org, linux-kbuild@vger.kernel.org, adobriyan@gmail.com

On Wed, Dec 03, 2008 at 04:52:34PM +0100, Roman Zippel wrote:
> Hi,
> 
> On Mon, 1 Dec 2008, akpm@linux-foundation.org wrote:
> 
> > From: Alexey Dobriyan <adobriyan@gmail.com>
> > 
> > As correctly noticed in bug 11446
> > (http://bugzilla.kernel.org/show_bug.cgi?id=11446) "To compile this driver
> > as a module, blah-blah" boilerplate is being copy-pasted to death with
> > slight variations.
> > 
> > Add Kconfig token "module_name" to supply module's name. Example:
> > 
> > 	config FOO
> > 		tristate "foo"
> > 		module_name foo
> > 		---help---
> > 		  foo
> 
> This syntax is a little inflexible.
> Below is a patch, which integrates modules fully into the kconfig syntax,
> so this is enough:

Thanks Roman - looks good.

> 
> module foo
> 	tristate "foo"
> 
> The config symbol is derived from the module name or can be specified 
> after the name. I also added the option to specify the sources, so that 
> these can be used to generate the Kbuild information.

Do you have any idea how do do this properly on the Kbuild side?
I see a few possibilities but have not made up my mind yet.

1) We could generate a Kbuild.foo file in the dir where we have the module
2) We could add info to auto.conf so we could build all modules defined
   in the configuration in one step

Both alternatives have their drawbacks.

I hesitate to add the patch until we have the kbuild bits sorted out.
I do not ask you to do the kbuild bits - I'm just asking for inputs
on what you have considered when you made this patch.

Have you ever considered the possibility to add the Kconfig info
direct in the .c file so we could have a single file driver for the
typical cases?
It could be a natural extension to what you made so far.

	Sam
