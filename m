Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpb-ews09.kpnxchange.com ([213.75.39.14]:50121 "EHLO
	cpsmtpb-ews09.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755140AbbCRKQc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Mar 2015 06:16:32 -0400
Message-ID: <1426673790.2649.41.camel@tiscali.nl>
Subject: Re: [PATCH v1 kbuild for-next 1/2] makefiles: add config option to
 force all cc warnings to errors
From: Paul Bolle <pebolle@tiscali.nl>
Date: Wed, 18 Mar 2015 11:16:30 +0100
In-Reply-To: <5508DD81.20006@cumulusnetworks.com>
References: <1426631862-19563-1-git-send-email-jtoppins@cumulusnetworks.com>
	 <1426633120.15575.17.camel@x220> <5508DD81.20006@cumulusnetworks.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan Toppins <jtoppins@cumulusnetworks.com>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Jonathan Toppins schreef op di 17-03-2015 om 22:05 [-0400]:
> Some slight background on these patches, they were born out of the team 
> here wanting to have a simple way of easily catching warnings during 
> driver development. This seemed like the least cumbersome way. I 
> understand if defaulting to yes is not advisable.
> 
> Will be happy to submit another patch defaulting to no and clean-up the 
> Dots in the paragraphs. From the comments provided so far this approach 
> would seem to address them, unless I am misunderstanding and in fact the 
> general idea of compiling with -Werror is not wanted.
> 
> Appreciate the discussion.

The builds are rather silent as is. Warnings already tend to stand out.
But to follow up on Michal's suggestion, every now and then I do
    grep ":[[:digit:]]\+:" $LOG

to catch all well behaved warnings. (I typed that from memory, so the
pattern might be wrong.) The occasional
    make $SOME_TARGET > /dev/null

does wonders too.

And, on a general note, the warnings spotting real issues get fixed
quite quickly. The warnings that actually do make it into releases are
almost always false positives. They might only get fixed if someone
finds a way to redo the code in such a way that the compiler has less
trouble analyzing it.

Thanks,


Paul Bolle

