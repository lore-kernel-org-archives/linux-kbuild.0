Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.19]:59529 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751448AbaFPPsG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Jun 2014 11:48:06 -0400
From: Jan-Simon =?ISO-8859-1?Q?M=F6ller?= <dl9pf@gmx.de>
Subject: Re: 3d3d6b847420 ("kbuild: LLVMLinux: Adapt warnings for compilation with clang")
Date: Mon, 16 Jun 2014 17:48:01 +0200
Message-ID: <2065274.H8oo5iWEkB@aragorn.auenland.lan>
In-Reply-To: <539F0D55.31207.1DF87EFF@pageexec.freemail.hu>
References: <20140616130751.GD8170@pd.tnic> <539F0D55.31207.1DF87EFF@pageexec.freemail.hu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: pageexec@freemail.hu
Cc: Borislav Petkov <bp@alien8.de>, Behan Webster <behanw@converseincode.com>, Mark Charlebois <mcharleb@gmail.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>

Ok, let's wrap this case with 

ifeq ($(COMPILER),clang)
...
endif

And we'll update the stale entries.

Patch to follow after some testing.

-- 

Dipl.-Ing.
Jan-Simon Möller

jansimon.moeller@gmx.de
Am Montag, 16. Juni 2014, 17:29:25 schrieb PaX Team:
> On 16 Jun 2014 at 15:07, Borislav Petkov wrote:
> > Please fix this to have effect only for clang but not for the rest of
> > the universe.
> 
> i'd suggest reverting it instead, there're probably some stale entries
> in there already (e.g., -fcatch-undefined-behavior).

