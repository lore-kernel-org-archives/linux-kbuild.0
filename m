Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fallback.mail.elte.hu ([157.181.151.13]:48643 "EHLO
	fallback.mail.elte.hu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750790Ab1J0MsY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 27 Oct 2011 08:48:24 -0400
Received: from mx2.mail.elte.hu ([157.181.151.9])
	by fallback.mail.elte.hu with esmtp (Exim)
	id 1RJPNe-0007LC-60
	from <mingo@elte.hu>
	for <linux-kbuild@vger.kernel.org>; Thu, 27 Oct 2011 14:48:22 +0200
Date: Thu, 27 Oct 2011 14:37:13 +0200
From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] config: Add 'make kvmconfig'
Message-ID: <20111027123713.GB22032@elte.hu>
References: <1319717234-20918-1-git-send-email-levinsasha928@gmail.com>
 <CAOJsxLH-O8+Fx=VLsoXhVLNtXWD_1eVrUMOgbk2DODbrwPAzhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOJsxLH-O8+Fx=VLsoXhVLNtXWD_1eVrUMOgbk2DODbrwPAzhQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Pekka Enberg <penberg@kernel.org>
Cc: Sasha Levin <levinsasha928@gmail.com>, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org


* Pekka Enberg <penberg@kernel.org> wrote:

> On Thu, Oct 27, 2011 at 3:07 PM, Sasha Levin <levinsasha928@gmail.com> wrote:
> > This patch adds 'make kvmconfig' which allows to add KVM guest support
> > to a config file.
> >
> > This allows for easier testing of configurations under virtualized
> > environments.
> >
> > Cc: Ingo Molnar <mingo@elte.hu>
> > Cc: Linus Torvalds <torvalds@linux-foundation.org>
> > Cc: Michal Marek <mmarek@suse.cz>
> > Cc: Pekka Enberg <penberg@cs.helsinki.fi>
> > Cc: linux-kbuild@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Suggested-by: Ingo Molnar <mingo@elte.hu>
> > Signed-off-by: Sasha Levin <levinsasha928@gmail.com>
> 
> Acked-by: Pekka Enberg <penberg@kernel.org>
> 
> Btw, Michal, if people are OK with the patch I'd really love to 
> take this patch in my kvmtool git tree to have it contained in a 
> single pull request.

I like the feature - i hope it's expressed in the right Kbuild-ish 
fashion.

Acked-by: Ingo Molnar <mingo@elte.hu>

Thanks,

	Ingo
