Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from david.siemens.de ([192.35.17.14]:45671 "EHLO david.siemens.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753163AbdLDJCK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Dec 2017 04:02:10 -0500
Date: Mon, 4 Dec 2017 10:01:50 +0100
From: Henning Schild <henning.schild@siemens.com>
Subject: Re: [PATCH] builddeb: introduce variables for control-file
 customization
Message-ID: <20171204100150.1f040839@md1em3qc>
In-Reply-To: <1512154058.2811.4.camel@decadent.org.uk>
References: <20171127161345.17880-1-henning.schild@siemens.com>
        <1512147072.2785.20.camel@decadent.org.uk>
        <20171201193433.68b25efe@md1em3qc>
        <1512154058.2811.4.camel@decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kernel@vger.kernel.org, Ben Hutchings <ben.hutchings@codethink.co.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, Konrad Schwarz <konrad.schwarz@siemens.com>

Am Fri, 1 Dec 2017 18:47:38 +0000
schrieb Ben Hutchings <ben@decadent.org.uk>:

> On Fri, 2017-12-01 at 19:34 +0100, Henning Schild wrote:
> > Am Fri, 1 Dec 2017 16:51:12 +0000
> > schrieb Ben Hutchings <ben@decadent.org.uk>:
> >   
> > > On Fri, 2017-12-01 at 15:56 +0000, Henning Schild wrote:  
> > > > The debian packages coming out of "make *deb-pkg" lack some
> > > > critical information in the control-files e.g. the "Depends:"
> > > > field. If one tries to install a fresh system with such a
> > > > "linux-image" debootstrap or multistrap might try to install
> > > > the kernel before its deps and the package hooks will fail.    
> > > 
> > > I assume you're talking about those hook scripts being run while
> > > the packages they belong to are only unpacked?  I hadn't thought
> > > about this issue, but it seems to me that those hook scripts
> > > generally ought to be fixed to handle this case properly.  Most
> > > of the packages installing hook scripts for kernel packages are
> > > not going to be dependencies of linux-image packages, so it will
> > > never be safe for them to assume their package has been fully
> > > installed.  
> > 
> > Yes these hook scripts fail when installing the kernel on another
> > system. Indeed we seem to have a case where packages installed on
> > the build-machine cause install-time deps for the package.  
> 
> Can you give an example?  I don't see how that would happen.

Scripts in /etc/kernel/ will end up as hooks for the kernel-package, if
you do not set KDEB_HOOKDIR. Looking at an example system that pulls in
things like "pm-utils, grub-pc .. initramfs". With this mechanism any
package placing a hook in /etc/kernel can influence the deps. I guess
in practice that is prevented with policies on what these scripts are
allowed to do.

> > In my case the build-machine is pretty minimal but i still want
> > some of that i.e. initramfs.
> >   
> > > > Different debian-based distros use different values for the
> > > > missing fields. And the values differ between distro versions
> > > > as well. So hardcoding of e.g. "Depends" is not possible.    
> > > 
> > > The dependencies also depend on the kernel configuration.  (And a
> > > custom kernel built with 'make deb-pkg' often won't have any
> > > dependencies outside of essential packages.)  
> > 
> > In fact it does not have any at the moment, there is no essential.
> > Or maybe that is hidden in debian-magic.  
> [...]
> 
> Essential packages are always installed, which means there is no need
> to declare a dependency on them (in fact it is discouraged):
> https://www.debian.org/doc/debian-policy/#dependencies

Ok, i will need to double-check how multistrap deals with those.

Henning

> Ben.
> 

