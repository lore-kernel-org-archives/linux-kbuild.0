Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:33033 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751071AbaBHUV1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 8 Feb 2014 15:21:27 -0500
Date: Sat, 8 Feb 2014 12:21:24 -0800
From: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH 02/17] x86, lto: Disable fancy hweight optimizations for
 LTO v2
Message-ID: <20140208202124.GK12219@tassilo.jf.intel.com>
References: <1391846481-31491-1-git-send-email-ak@linux.intel.com>
 <1391846481-31491-2-git-send-email-ak@linux.intel.com>
 <52F67CD7.5090609@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52F67CD7.5090609@zytor.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, x86@kernel.org

On Sat, Feb 08, 2014 at 10:52:07AM -0800, H. Peter Anvin wrote:
> On 02/08/2014 12:01 AM, Andi Kleen wrote:
> > The fancy x86 hweight uses different compiler options for the
> > hweight file. This does not work with LTO. Just disable the optimization
> > with LTO
> 
> No, I'm going to NAK this.  This means not using the POPCNT instruction
> if LTO is enabled, and that really isn't an acceptable option.

I thought the use was obscure?

Ok, suppose can just disable LTO for the file.
The only drawback is that the functions will not be optimized away when
not used, as they'll need to be __visible.

-Andi
-- 
ak@linux.intel.com -- Speaking for myself only
