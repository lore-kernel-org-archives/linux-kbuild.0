Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:39243 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751347Ab2IAOo7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 1 Sep 2012 10:44:59 -0400
Message-ID: <50421F57.3040004@suse.cz>
Date: Sat, 01 Sep 2012 16:44:39 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 20/74] x86, lto: Change dotraplinkage into __visible on
 32bit
References: <1345345030-22211-1-git-send-email-andi@firstfloor.org> <1345345030-22211-21-git-send-email-andi@firstfloor.org>
In-Reply-To: <1345345030-22211-21-git-send-email-andi@firstfloor.org>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-kbuild@vger.kernel.org, JBeulich@suse.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

Dne 19.8.2012 04:56, Andi Kleen napsal(a):
> From: Andi Kleen <ak@linux.intel.com>
> 
> Mark 32bit dotraplinkage functions as __visible for LTO.
> 64bit already is using asmlinkage which includes it.

You can make it __visible on both 32bit and 64bit, the result is the same.

Michal
