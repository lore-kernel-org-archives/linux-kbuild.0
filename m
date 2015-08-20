Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:60920 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751114AbbHTLz1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Aug 2015 07:55:27 -0400
Subject: Re: [PATCH] kbuild: Fix .text.unlikely placement
References: <1437354079-18609-1-git-send-email-andi@firstfloor.org>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <55D5C02D.5060707@suse.cz>
Date: Thu, 20 Aug 2015 13:55:25 +0200
MIME-Version: 1.0
In-Reply-To: <1437354079-18609-1-git-send-email-andi@firstfloor.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

On 2015-07-20 03:01, Andi Kleen wrote:
> From: Andi Kleen <ak@linux.intel.com>
> 
> When building a kernel with .text.unlikely text the unlikely text for
> each translation unit was put next to the main .text code in the
> final vmlinux.
> 
> The problem is that the linker doesn't allow more specific submatches
> of a section name in a different linker script statement after the
> main match.
> 
> So we need to move them all into one line. With that change
> .text.unlikely is at the end of everything again.
> 
> I also moved .text.hot into the same statement though, even though
> that's not strictly needed.
> 
> Signed-off-by: Andi Kleen <ak@linux.intel.com>

Applied to kbuild.git#kbuild.

Michal

