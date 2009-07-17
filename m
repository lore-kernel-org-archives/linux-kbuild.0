Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:60958 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757463AbZGQVDX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 17 Jul 2009 17:03:23 -0400
Date: Fri, 17 Jul 2009 23:03:22 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: deb-pkg fix install scripts for posix sh
Message-ID: <20090717210322.GB7080@merkur.ravnborg.org>
References: <1246817854-27396-1-git-send-email-max@stro.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1246817854-27396-1-git-send-email-max@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: linux-kbuild@vger.kernel.org, Frans Pop <elendil@planet.nl>, Andres Salomon <dilinger@debian.org>

On Sun, Jul 05, 2009 at 08:17:34PM +0200, maximilian attems wrote:
> bash versus dash and posh disagree on expanding $@ within double quotes:
> export x="$@"
> see http://bugs.debian.org/381091 for details
> just use the arglist with $*.
> 
> dpkg: error processing linux-image-2.6.31-rc1_2.6.31-rc1-18_i386.deb (--install):
>  subprocess pre-installation script returned error exit status 2
> export: 6: 2.6.31-rc1-18: bad variable name
> fixes http://bugzilla.kernel.org/show_bug.cgi?id=13567
> 
> seen on Ubuntu as there dash is the default sh,
> versus bash on Debian.
> 
> Reported-by: Pauli <suokkos@gmail.com>
> Cc: Frans Pop <elendil@planet.nl>
> Cc: Andres Salomon <dilinger@debian.org>
> Signed-off-by: maximilian attems <max@stro.at>

Applied to kbuild-fixes.git

	Sam
