Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:52859 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752725Ab2CZHhj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 26 Mar 2012 03:37:39 -0400
Date: Mon, 26 Mar 2012 08:37:04 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: Inconsistent kallsyms data on ARM.
Message-ID: <20120326073704.GH5611@n2100.arm.linux.org.uk>
References: <CAP=VYLoStscdVJretZ-Rkbp7V3Vsm8N0oWcjih7ruHFiDN7CiA@mail.gmail.com> <201203141321.47010.arnd@arndb.de> <20120325112035.GE5611@n2100.arm.linux.org.uk> <4F6FB170.1040109@jonmasters.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4F6FB170.1040109@jonmasters.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jon Masters <jonathan@jonmasters.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org

On Sun, Mar 25, 2012 at 07:59:44PM -0400, Jon Masters wrote:
> As to longer term, I am happy to work up something that will spot this
> particular kind of failure (symbol changes type) and output something
> more useful during the kallsyms generation if you would like.
> 
> Are you planning to pull in either of the fixes you mention?

I'm not, because those are all sub-optimal - I don't see why we should
bloat the kernel image just for the sake of working around kallsyms.

The best I've come up with so far which avoids that is to force
KALLSYMS_EXTRA_PASS to always be set on ARM.
