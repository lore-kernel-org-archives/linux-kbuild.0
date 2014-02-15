Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asav12.altibox.net ([81.167.36.146]:57848 "EHLO
	asav12.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752965AbaBOVjf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 15 Feb 2014 16:39:35 -0500
Date: Sat, 15 Feb 2014 22:28:27 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 03/19] lto: Make asmlinkage __visible
Message-ID: <20140215212827.GC27575@ravnborg.org>
References: <1392412903-25733-1-git-send-email-andi@firstfloor.org>
 <1392412903-25733-4-git-send-email-andi@firstfloor.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1392412903-25733-4-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-kbuild@vger.kernel.org, mmarek@suse.cz, Andi Kleen <ak@linux.intel.com>

On Fri, Feb 14, 2014 at 10:21:27PM +0100, Andi Kleen wrote:
> From: Andi Kleen <ak@linux.intel.com>
> 
> Note this causes warnings for static asmlinkage, which
> is used in some places. These can be later cleaned up.
> static asmlinkage usually makes no sense.
> 

Reading the above changelog - it does not justify *why* asmlinkage
is made visible.

	Sam
