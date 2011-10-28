Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:37850 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932075Ab1J1H5L (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 28 Oct 2011 03:57:11 -0400
Date: Fri, 28 Oct 2011 09:52:31 +0200
From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] config: Add 'make kvmconfig'
Message-ID: <20111028075231.GA8626@elte.hu>
References: <1319717234-20918-1-git-send-email-levinsasha928@gmail.com>
 <20111027193448.GA3514@merkur.ravnborg.org>
 <20111028070336.GF12995@elte.hu>
 <1319786635.3235.11.camel@lappy>
 <20111028073915.GA27593@elte.hu>
 <1319788039.3235.13.camel@lappy>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1319788039.3235.13.camel@lappy>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sasha Levin <levinsasha928@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, Pekka Enberg <penberg@cs.helsinki.fi>, linux-kbuild@vger.kernel.org


* Sasha Levin <levinsasha928@gmail.com> wrote:

> On Fri, 2011-10-28 at 09:39 +0200, Ingo Molnar wrote:
> > * Sasha Levin <levinsasha928@gmail.com> wrote:
> > 
> > > > ? It would be very obvious at a glance what it does.
> > > 
> > > We can possibly make 'make defconfig abc' run arch specific script 
> > > located next to the defconfig files (arch/$(ARCH)/configs/).
> > 
> > AFAICS that's not the same as the current kvmconfig functionality 
> > though: we want to minimally enable certain config options in the 
> > current .config - not pick some default config.
> 
> Yup, I wasn't planning on it to work like defconfig does where it 
> just uses a default config, thats why I said 'run arch specific 
> script' :)
> 
> That script could either copy over a default config, or simply add 
> config options like what we're interested in doing.

i'd be fine with that extension to defconfig functionality. It in 
fact makes much more sense than the *current* defconfig functionality 
which is kind of a joke (as it's really just an arbitrary config).

Thanks,

	Ingo
