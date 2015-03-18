Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpb-ews08.kpnxchange.com ([213.75.39.13]:59240 "EHLO
	cpsmtpb-ews08.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932930AbbCRKAf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Mar 2015 06:00:35 -0400
Message-ID: <1426672832.2649.28.camel@tiscali.nl>
Subject: Re: [PATCH v1 kbuild for-next 1/2] makefiles: add config option to
 force all cc warnings to errors
From: Paul Bolle <pebolle@tiscali.nl>
Date: Wed, 18 Mar 2015 11:00:32 +0100
In-Reply-To: <5508B574.5030505@cumulusnetworks.com>
References: <1426631862-19563-1-git-send-email-jtoppins@cumulusnetworks.com>
	 <1426633120.15575.17.camel@x220> <5508B574.5030505@cumulusnetworks.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan Toppins <jtoppins@cumulusnetworks.com>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Jonathan Toppins schreef op di 17-03-2015 om 19:15 [-0400]:
> So default to "n"?

"n" is the default anyhow, so I think you never need it.

> Kconfig bases paragraph continuation on indention, 
> correct?

Yes. It's a syntax I quite dislike, but we're stuck with it.

> Appreciate the review thanks.

My review ended up a bit blunt. But the patch defaults to y for every
configuration (because, I think, all of them source lib/Kconfig.debug)
for an option that would stop the build at the first warning it sees.
That's not really a considerate thing to do.


Paul Bolle

