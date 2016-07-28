Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35056 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751304AbcG1U2W (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Jul 2016 16:28:22 -0400
Date: Thu, 28 Jul 2016 22:28:14 +0200
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] Kbuild: Move -Wmaybe-uninitialized to W=1
Message-ID: <20160728202814.GA16950@gmail.com>
References: <20140616132045.GE8170@pd.tnic>
 <20140616211405.GA7914@ravnborg.org>
 <20140624213835.GD15068@pd.tnic>
 <20140707105339.GA4776@pd.tnic>
 <20160728042011.GA25498@nazgul.tnic>
 <20160728082915.GA2349@gmail.com>
 <CA+55aFznBSQC+_KFq39eT2yTOd_cidqQ5viBLG6mshb_U_Y2EA@mail.gmail.com>
 <CA+55aFxSTYww0ZJ75q9p4RRwPVSxGji-OJ8vYdjVXuFs-2H3dw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+55aFxSTYww0ZJ75q9p4RRwPVSxGji-OJ8vYdjVXuFs-2H3dw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Borislav Petkov <bp@alien8.de>, Sam Ravnborg <sam@ravnborg.org>, lkml <linux-kernel@vger.kernel.org>, Michael Matz <matz@suse.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, x86-ml <x86@kernel.org>


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Thu, Jul 28, 2016 at 12:03 PM, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > Once we get to the point that the warning is no longer useful, and is more 
> > pain than gain, it gets disabled.
> 
> Btw, I have a suspicion that you didn't realize that "-Wmaybe-uninitialized" is 
> separate from "-Wuninitialized" (which is *not* disabled).

I very much know the difference, as you can see from the commit IDs I cited.

> The "maybe-uninitialized" warning is literally gcc saying "I haven't really 
> followed all the logic, but from my broken understanding it isn't _obvious_ that 
> it is initialized".
> 
> And the problem is that a lot of gcc optimization choices basically move the 
> pointer of "obvious". So the warning is a bit random to begin with. And when the 
> gcc people screw thigns up, things go to hell in a handbasket.

Fair enough.

Thanks,

	Ingo
