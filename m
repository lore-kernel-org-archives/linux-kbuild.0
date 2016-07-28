Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ud10.udmedia.de ([194.117.254.50]:54870 "EHLO
	mail.ud10.udmedia.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751169AbcG1SDb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Jul 2016 14:03:31 -0400
Date: Thu, 28 Jul 2016 19:56:47 +0200
From: Markus Trippelsdorf <markus@trippelsdorf.de>
Subject: Re: [PATCH] Kbuild: Move -Wmaybe-uninitialized to W=1
Message-ID: <20160728175647.GB316@x4>
References: <20140616132045.GE8170@pd.tnic>
 <20140616211405.GA7914@ravnborg.org>
 <20140624213835.GD15068@pd.tnic>
 <20140707105339.GA4776@pd.tnic>
 <20160728042011.GA25498@nazgul.tnic>
 <20160728082915.GA2349@gmail.com>
 <20160728084624.GA30084@nazgul.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160728084624.GA30084@nazgul.tnic>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Ingo Molnar <mingo@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, lkml <linux-kernel@vger.kernel.org>, Michael Matz <matz@suse.de>, linux-kbuild@vger.kernel.org, x86-ml <x86@kernel.org>

On 2016.07.28 at 10:46 +0200, Borislav Petkov wrote:
> On Thu, Jul 28, 2016 at 10:29:15AM +0200, Ingo Molnar wrote:
> > BUT, isn't this the natural state of things, that the 'final' warnings
> > that don't get fixed are the obnoxious, false positive ones - because
> > anyone who looks at them will say "oh crap, idiotic compiler!"?
> 
> Hmm, so my experience is like Linus' - that -Wmaybe thing generates too
> much noise and a lot of false positives. The thing is, as Micha (on CC)
> explained it to me, that warning simply says that GCC sometimes *cannot*
> know whether the variable will be used uninitialized or not and eagerly
> issues the warning message, just in case.

Another issue is that the number of warnings you get depend on the
optimization level. So -Os may be different from -O2 and once you use
-O3 (I know it is not officially supported) you will drown in false
positives...

-- 
Markus
