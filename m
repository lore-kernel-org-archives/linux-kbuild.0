Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([213.235.205.2]:44324 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751930Ab0EQMOB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 17 May 2010 08:14:01 -0400
Subject: Re: [ANNOUNCE] GSoC project: Improving kconfig using a SAT solver
From: Andi Kleen <andi@firstfloor.org>
References: <AANLkTil73ArhX2w6b_v1bmWjP1FA5zUTfPzK2N4waOu1@mail.gmail.com>
Date: Mon, 17 May 2010 14:13:58 +0200
In-Reply-To: <AANLkTil73ArhX2w6b_v1bmWjP1FA5zUTfPzK2N4waOu1@mail.gmail.com> (Vegard Nossum's message of "Mon\, 17 May 2010 14\:02\:15 +0200")
Message-ID: <87tyq63eux.fsf@basil.nowhere.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Bart Massey <bart@cs.pdx.edu>, Michal Marek <mmarek@suse.cz>, Greg Kroah-Hartman <greg@kroah.com>, Ingo Molnar <mingo@elte.hu>, James Bottomley <James.Bottomley@hansenpartnership.com>

Vegard Nossum <vegard.nossum@gmail.com> writes:

> I just wanted to say that I've been accepted into this year's Google
> Summer of Code program and will spend this summer working on improving
> the kconfig system in a very particular direction: I want to integrate
> a proper boolean constraint satisfiability solver into the
> configuration editors (menuconfig, etc.) in order to allow
> partial/incomplete configuration specifications. In short, this means
> that the user can choose to not specify a particular value for some
> config options, but let the system deduce their values. This will
> hopefully improve usability and also solve the select problem once and
> for all.

Nice idea. I read your proposal and it looks good.

I assume you got inspired by the libzypp use of a SAT solver
for package dependencies?  One problem that is visible there 
is that it can be hard to display conflicts in a nice and understandable
way to the user, especially if there are lots of dependencies.

It might be worth planning in some time to solve that nicely.

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only.
