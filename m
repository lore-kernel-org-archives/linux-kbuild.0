Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:34521 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753006Ab1J0Ngb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 27 Oct 2011 09:36:31 -0400
Date: Thu, 27 Oct 2011 15:34:50 +0200
From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] config: Add 'make kvmconfig'
Message-ID: <20111027133450.GB23787@elte.hu>
References: <1319717234-20918-1-git-send-email-levinsasha928@gmail.com>
 <CAOJsxLH-O8+Fx=VLsoXhVLNtXWD_1eVrUMOgbk2DODbrwPAzhQ@mail.gmail.com>
 <20111027123713.GB22032@elte.hu>
 <4EA953E8.4020004@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4EA953E8.4020004@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Pekka Enberg <penberg@kernel.org>, Sasha Levin <levinsasha928@gmail.com>, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-kbuild@vger.kernel.org


* Michal Marek <mmarek@suse.cz> wrote:

> On 27.10.2011 14:37, Ingo Molnar wrote:
> > 
> > * Pekka Enberg <penberg@kernel.org> wrote:
> > 
> >> On Thu, Oct 27, 2011 at 3:07 PM, Sasha Levin <levinsasha928@gmail.com> wrote:
> >>> This patch adds 'make kvmconfig' which allows to add KVM guest support
> >>> to a config file.
> >>>
> >>> This allows for easier testing of configurations under virtualized
> >>> environments.
> >>>
> >>> Cc: Ingo Molnar <mingo@elte.hu>
> >>> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> >>> Cc: Michal Marek <mmarek@suse.cz>
> >>> Cc: Pekka Enberg <penberg@cs.helsinki.fi>
> >>> Cc: linux-kbuild@vger.kernel.org
> >>> Cc: linux-kernel@vger.kernel.org
> >>> Suggested-by: Ingo Molnar <mingo@elte.hu>
> >>> Signed-off-by: Sasha Levin <levinsasha928@gmail.com>
> >>
> >> Acked-by: Pekka Enberg <penberg@kernel.org>
> >>
> >> Btw, Michal, if people are OK with the patch I'd really love to 
> >> take this patch in my kvmtool git tree to have it contained in a 
> >> single pull request.
> > 
> > I like the feature - i hope it's expressed in the right Kbuild-ish 
> > fashion.
> > 
> > Acked-by: Ingo Molnar <mingo@elte.hu>
> 
> I hope we won't now also be getting make nfsconfig, make paeconfig 
> and whatnot :).

;-)

Well, we could make any such future naming fit into it naturally. 
'make defconfig kvm' perhaps?

> [...] Also, the lists of select statements might need updates from 
> time to time, if new dependencies appear.

Yeah, correct.

I have a similar solution myself, a 'make ingoconfig' in essence, to 
make stuff boot on my test-boxes - and updates are needed every now 
and then - about once a year. It's manageable.

Thanks,

	Ingo
