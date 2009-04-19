Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]:37251 "EHLO
	master.linux-sh.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750850AbZDSWpE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 19 Apr 2009 18:45:04 -0400
Date: Mon, 20 Apr 2009 07:39:59 +0900
From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: [GIT] kbuild
Message-ID: <20090419223959.GB12054@linux-sh.org>
References: <20090419092555.GA19213@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090419092555.GA19213@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Russell King <rmk+lkml@arm.linux.org.uk>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Al Viro <viro@ZenIV.linux.org.uk>

On Sun, Apr 19, 2009 at 11:25:55AM +0200, Sam Ravnborg wrote:
> We have on the lists recently discussed two features:
> 1) Move generated files to include/generated
> 2) Introduce support for subdir-ccflags-y
> 
> Both features has low risk of introducing regressions
> and including them now allow us to use the features for next
> merge window.
> 
> This will for example allow arm to support mach-types.h in
> include/generated without touching files outside arch/arm.
> 
This applies to sh also, although apparently I've missed the discussion
about how mach-types.h generation should be using this.
