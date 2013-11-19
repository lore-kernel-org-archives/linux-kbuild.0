Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:48012 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750823Ab3KSKNb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Nov 2013 05:13:31 -0500
Message-ID: <528B39C0.2000703@suse.cz>
Date: Tue, 19 Nov 2013 11:13:20 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: add comment about 'jump maybe used unitialized'
References: <1384808595-26028-1-git-send-email-yann.morin.1998@free.fr> <528B12CB.60407@linux.vnet.ibm.com>
In-Reply-To: <528B12CB.60407@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, linux-kbuild@vger.kernel.org, Christian Kujau <lists@nerdbynature.de>, Benjamin Poirier <bpoirier@suse.de>

On 19.11.2013 08:27, Madhavan Srinivasan wrote:
> On Tuesday 19 November 2013 02:33 AM, Yann E. MORIN wrote:
>>
>> Madhavan, Christian, if you could give a bit ;ore details on the distro
>> you're using, that be nice so we can have a more descriptive commit log.
> 
> When I initially reported this issue, it was in gcc version 4.8.0
> 20130526. And I am trying this now in a beta release of RHEL7 with gcc
> version 4.8.1 20131002 (Red Hat 4.8.1-11) (GCC) and I still see the
> reported issue.

In that case, I'd just give up and initialize jump to NULL. Worst case,
we will get a segfault at runtime if a genuine bug is introduced into
the function. What do you think?

Michal
