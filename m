Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:36329 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756828AbYBPV0K (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 16 Feb 2008 16:26:10 -0500
Date: Sat, 16 Feb 2008 22:26:18 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: ccflags-y versus EXTRA_CFLAGS??
Message-ID: <20080216212618.GA16599@uranus.ravnborg.org>
References: <alpine.LFD.1.00.0802161615400.3910@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.1.00.0802161615400.3910@localhost.localdomain>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: kbuild devel list <linux-kbuild@vger.kernel.org>

On Sat, Feb 16, 2008 at 04:21:18PM -0500, Robert P. J. Day wrote:
> 
>   IIRC, there are a number of deprecated variables and preferred
> forms, along the lines of:
> 
>   ccflags-y -> EXTRA_CFLAGS
>   asflags-y -> EXTRA_AFLAGS

ccflags-y, asflags are preferred.
A set of patches to fix this up subsystem by subsystem, arch by arch
would be appreciated.

	Sam
