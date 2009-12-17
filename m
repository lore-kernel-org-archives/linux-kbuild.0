Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:58131 "EHLO
	terminus.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751682AbZLQFOm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 17 Dec 2009 00:14:42 -0500
Message-ID: <4B29BC90.9090204@zytor.com>
Date: Wed, 16 Dec 2009 21:07:28 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: CONFIG_KPROBES=y build requires gawk
References: <20091216235617.GA12267@hexapodia.org>	<adabphy750b.fsf@roland-alpha.cisco.com> <4B299AB5.7020109@zytor.com> <ada7hsm6y3g.fsf@roland-alpha.cisco.com>
In-Reply-To: <ada7hsm6y3g.fsf@roland-alpha.cisco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roland Dreier <rdreier@cisco.com>
Cc: Andrew Isaacson <adi@vmware.com>, Ingo Molnar <mingo@redhat.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Masami Hiramatsu <mhiramat@redhat.com>, Rob Landley <rob@landley.net>

On 12/16/2009 08:09 PM, Roland Dreier wrote:
> 
>  > > Is there any reason not to apply the patch below, to allow more awk
>  > > implementations to be used?  After all, it's not like we're going to put
>  > > non-ASCII characters into the map file...
> 
>  > I guess the question is if it will break under any other circumstances,
>  > but I guess we can find those when we get to them.
> 
> I should have mentioned it, but with the current Debian testing version
> (mawk 1.3.3-15) and my patch, I get a byte-for-byte identical
> inat-tables.c to what I get with the unpatched kernel and gawk
> 1:3.1.6.dfsg-4.
> 
> I'm not sure how likely all this is to change in the future, but it's
> hard for me to see a sane reason why eg [:lower:] and a-z would be
> different for this use.
> 

If LC_COLL != C they can be.  The solution would be to force LC_COLL=C.

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.

