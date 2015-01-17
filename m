Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:34010 "EHLO
	asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751447AbbAQVsW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 17 Jan 2015 16:48:22 -0500
Date: Sat, 17 Jan 2015 22:41:32 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: fix scripts/headers.sh to see the correct Kbuild
 path
Message-ID: <20150117214132.GA21522@ravnborg.org>
References: <1417589535-15867-1-git-send-email-yamada.m@jp.panasonic.com>
 <20150113142404.CACA.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150113142404.CACA.AA925319@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>

On Tue, Jan 13, 2015 at 02:24:04PM +0900, Masahiro Yamada wrote:
> Hi Sam,
> 
> IIRC, you mentioned scripts/headers.sh is pointless
> and should be removed from the code base.

Took a quik look at it.
It seems that there is use for it still.
um require some special handling.
And the HDR_ARCH_LIST feature is also implemented here.

Both could be done in other ways and the shell script
may be cleaned up a little.
But we cannot get rid of it as I initally thought.

	Sam
