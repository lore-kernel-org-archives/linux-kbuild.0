Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from sj-iport-4.cisco.com ([171.68.10.86]:44805 "EHLO
	sj-iport-4.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S936221AbZLQEJJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Dec 2009 23:09:09 -0500
From: Roland Dreier <rdreier@cisco.com>
Subject: Re: CONFIG_KPROBES=y build requires gawk
References: <20091216235617.GA12267@hexapodia.org>
	<adabphy750b.fsf@roland-alpha.cisco.com> <4B299AB5.7020109@zytor.com>
Date: Wed, 16 Dec 2009 20:09:07 -0800
In-Reply-To: <4B299AB5.7020109@zytor.com> (H. Peter Anvin's message of "Wed,
	16 Dec 2009 18:43:01 -0800")
Message-ID: <ada7hsm6y3g.fsf@roland-alpha.cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Andrew Isaacson <adi@vmware.com>, Ingo Molnar <mingo@redhat.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Masami Hiramatsu <mhiramat@redhat.com>, Rob Landley <rob@landley.net>


 > > Is there any reason not to apply the patch below, to allow more awk
 > > implementations to be used?  After all, it's not like we're going to put
 > > non-ASCII characters into the map file...

 > I guess the question is if it will break under any other circumstances,
 > but I guess we can find those when we get to them.

I should have mentioned it, but with the current Debian testing version
(mawk 1.3.3-15) and my patch, I get a byte-for-byte identical
inat-tables.c to what I get with the unpatched kernel and gawk
1:3.1.6.dfsg-4.

I'm not sure how likely all this is to change in the future, but it's
hard for me to see a sane reason why eg [:lower:] and a-z would be
different for this use.

 - R.
