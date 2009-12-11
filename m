Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:58046 "EHLO
	terminus.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758952AbZLKTT5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Dec 2009 14:19:57 -0500
Message-ID: <4B2299E3.8020903@zytor.com>
Date: Fri, 11 Dec 2009 11:13:39 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] Replace kernel/timeconst.pl with kernel/timeconst.sh
References: <200912080317.08254.rob@landley.net> <200912091740.43147.rob@landley.net> <4B20FD2C.1010804@suse.cz> <200912101717.00049.rob@landley.net> <4B2265D2.6000400@suse.cz>
In-Reply-To: <4B2265D2.6000400@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Rob Landley <rob@landley.net>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On 12/11/2009 07:31 AM, Michal Marek wrote:
> 
> OK, that's valid point, indeed. Peter, would you ack Rob's patch with
> the oneline fix added (http://lkml.org/lkml/2009/12/8/94 plus
> http://lkml.org/lkml/2009/12/9/435)?
> 

I strongly dislike his patch, as he open-codes specific multiprecision
arithmetic.  This makes it hard for other people to maintain, and makes
it prone to errors -- as evidenced by the fact that it didn't even
replicate the known-good results.

I have made my position clear on this and other patches several times
before: I consider it a fool's errand, and a result of a completely
pointless crusade to make a particular science fair-type project a wee
bit easier.  We have already seen real damage caused by it, since people
have used awk instead, and have gotten bitten by incompatibilities
between awk implementations.

As such, no, I will not ack this patch, and will consider myself
released of any obligation to maintain the code if this goes in anyway.
 I would consider acking a C program which does proper multiprecision
arithmetic, but I'm also not going to spend my time on it.

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.

