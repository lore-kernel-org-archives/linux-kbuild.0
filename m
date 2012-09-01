Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([213.235.205.2]:42291 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751761Ab2IARQv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 1 Sep 2012 13:16:51 -0400
Date: Sat, 1 Sep 2012 19:16:45 +0200
From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [PATCH 44/74] lto: Mark functions used by the vsyscall init code visible
Message-ID: <20120901171645.GN16230@one.firstfloor.org>
References: <1345345030-22211-1-git-send-email-andi@firstfloor.org> <1345345030-22211-45-git-send-email-andi@firstfloor.org> <5042291E.6050602@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5042291E.6050602@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-kbuild@vger.kernel.org, JBeulich@suse.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

> I think that there should be a comment why the symbol needs to be
> visible (just copy the reasoning from the changelog). Otherwise someone
> might attempt to do a cleanup a few years later, noticing that there is
> no assembler code calling get_random_int().

Ok. On hindsight maybe it's better to split vsyscall_64.c into two
files, one only with the vsyscall code and another with the init code.

-Andi
