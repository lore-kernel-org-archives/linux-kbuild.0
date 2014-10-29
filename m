Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:44160 "EHLO
	asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756193AbaJ2TGB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 29 Oct 2014 15:06:01 -0400
Date: Wed, 29 Oct 2014 19:59:07 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: collect shorthands into the top Makefile
Message-ID: <20141029185907.GA701@ravnborg.org>
References: <1414567651-2503-1-git-send-email-yamada.m@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1414567651-2503-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, "H. Peter Anvin" <hpa@linux.intel.com>, Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org

On Wed, Oct 29, 2014 at 04:27:31PM +0900, Masahiro Yamada wrote:
> The motivation of this commit is to avoid duplicated definitions
> of "clean" and "hdr-inst" shorthands.
> 
> The shorthand "clean" is defined in both the top Makefile and
> scripts/Makefile.clean.
> 
> Likewise, "hdr-inst" is defined in both the top Makefile and
> scripts/Makefile.headersinst.
> 
> The idea here is define and export them in the top Makefile
> because $(srctree) is constant during the build process.
> 
> For consistency, "build" and "modbuiltin" should be also moved.

As a general rule the exported names are always UPPERCASE, and local variables
are lowercase. (srctree, objtree are the exceptions).
This patch define new lowercase variables that conflicts with this.

And it is not that logical these are picked up from the enviroment.
Could you find a central place to define them rahter than using
the environemnt to export them?

	Sam
