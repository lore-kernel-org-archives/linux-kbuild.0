Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:46922 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753719Ab0EQMCR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 17 May 2010 08:02:17 -0400
MIME-Version: 1.0
Date: Mon, 17 May 2010 14:02:15 +0200
Message-ID: <AANLkTil73ArhX2w6b_v1bmWjP1FA5zUTfPzK2N4waOu1@mail.gmail.com>
Subject: [ANNOUNCE] GSoC project: Improving kconfig using a SAT solver
From: Vegard Nossum <vegard.nossum@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Bart Massey <bart@cs.pdx.edu>, Michal Marek <mmarek@suse.cz>, Greg Kroah-Hartman <greg@kroah.com>, Ingo Molnar <mingo@elte.hu>, James Bottomley <James.Bottomley@hansenpartnership.com>

Hi,

I just wanted to say that I've been accepted into this year's Google
Summer of Code program and will spend this summer working on improving
the kconfig system in a very particular direction: I want to integrate
a proper boolean constraint satisfiability solver into the
configuration editors (menuconfig, etc.) in order to allow
partial/incomplete configuration specifications. In short, this means
that the user can choose to not specify a particular value for some
config options, but let the system deduce their values. This will
hopefully improve usability and also solve the select problem once and
for all.

A slightly shortened version of the project proposal that was accepted
can be found here:

http://userweb.kernel.org/~vegard/gsoc2010/proposal-short.html

In case anybody would like to track my progress throughout the summer,
I have set up my public project repositories at:

http://github.com/vegard/dpll
http://github.com/vegard/linux-2.6-kconfig-sat

I am also planning to post some updates to LKML as milestones are
completed.  (Please let me know if you would like to be added to or
removed from the Cc list.) The official end date is August 16, by
which time I hope to have submitted my work for mainline inclusion.

Feedback is appreciated -- I am also prepared to respond to
constructive criticism.

Lastly, I would like to thank Google for sponsoring me, and to thank
Portland State University and my mentor Bart Massey for believing in
this idea and project.


Vegard
