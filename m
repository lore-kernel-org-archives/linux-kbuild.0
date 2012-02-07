Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:43489 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753700Ab2BGQhX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 7 Feb 2012 11:37:23 -0500
Date: Tue, 7 Feb 2012 16:37:16 +0000
From: Ben Hutchings <ben@decadent.org.uk>
Message-ID: <20120207163716.GA12704@decadent.org.uk>
References: <1327318828-12984-1-git-send-email-joerg.roedel@amd.com>
 <4F1D8810.1040501@suse.cz>
 <20120204143449.GA28068@stro.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120204143449.GA28068@stro.at>
Subject: Re: [PATCH] kbuild: Fix link to headers in 'make deb-pkg'
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, Joerg Roedel <joerg.roedel@amd.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, debian-kernel@lists.debian.org

On Sat, Feb 04, 2012 at 03:34:49PM +0100, maximilian attems wrote:
> adding bwh + debian-kernel
> 
> On Mon, 23 Jan 2012, Michal Marek wrote:
> 
> > (adding max to CC)
> > 
> > On 23.1.2012 12:40, Joerg Roedel wrote:
> > > The Link to the kernel header files in the debian packages
> > > point to the original build directory. This is a bad choice
> > > if the packages were installed on a different machine. Fix
> > > this in by manually re-creating the link in the builddeb
> > > script.

Right, but:

[...]
> > > @@ -121,10 +122,14 @@ fi
> > >  
> > >  if grep -q '^CONFIG_MODULES=y' .config ; then
> > >  	INSTALL_MOD_PATH="$tmpdir" make KBUILD_SRC= modules_install
> > > -	if [ "$ARCH" = "um" ] ; then
> > > -		mv "$tmpdir/lib/modules/$version"/* "$tmpdir/usr/lib/uml/modules/$version/"
> > > -		rmdir "$tmpdir/lib/modules/$version"
> > > -	fi
> > > +fi
> > > +
> > > +# Make sure link to the headers is correct
> > > +ln -snf "/usr/src/$kernel_headers_packagename" "$tmpdir/lib/modules/$version/build"
[...]

This should be removed from the kernel image package and created
in the kernel headers package instead, otherwise it's potentially a
broken link.

Ben.

-- 
Ben Hutchings
We get into the habit of living before acquiring the habit of thinking.
                                                              - Albert Camus
