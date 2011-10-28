Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:38164 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754918Ab1J1H7N (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 28 Oct 2011 03:59:13 -0400
Date: Fri, 28 Oct 2011 09:54:33 +0200
From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] config: Add 'make kvmconfig'
Message-ID: <20111028075432.GB8626@elte.hu>
References: <1319717234-20918-1-git-send-email-levinsasha928@gmail.com>
 <20111027193448.GA3514@merkur.ravnborg.org>
 <20111028070336.GF12995@elte.hu>
 <CAMuHMdUSyNcbmmXjFqSVQmsSqGS5xKFt4DSnskkg80UyWoJjLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUSyNcbmmXjFqSVQmsSqGS5xKFt4DSnskkg80UyWoJjLQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Sasha Levin <levinsasha928@gmail.com>, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, Pekka Enberg <penberg@cs.helsinki.fi>, linux-kbuild@vger.kernel.org


* Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> > ? It would be very obvious at a glance what it does.
> 
> This fits in the generic "I have a .config and I want to enable an 
> additional option" functionality:
> 
> make oldconfig CONFIG_KVMTOOL_TEST_ENABLE=y
> 
> Don't we already have that support? I seem to remember it flying 
> by. Or was it just a proposal that never got implemented?

Well, it would be nice to have something (much) shorter and more 
obvious, as we really expect to use this frequently.

Maybe:

  make oldconfig kvm

would work too.

Thanks,

	Ingo
