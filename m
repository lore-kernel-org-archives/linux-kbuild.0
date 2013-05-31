Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.eu.citrix.com ([46.33.159.39]:64393 "EHLO
	SMTP.EU.CITRIX.COM" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752321Ab3EaNQg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 31 May 2013 09:16:36 -0400
Message-ID: <1370006175.5199.143.camel@zakaz.uk.xensource.com>
Subject: Re: DTB build failure due to preproccessing
From: Ian Campbell <Ian.Campbell@citrix.com>
Date: Fri, 31 May 2013 14:16:15 +0100
In-Reply-To: <E1UiOxz-0004ET-RE@jdl.com>
References: <1369996170.5199.68.camel@zakaz.uk.xensource.com>
	 <20130531114824.60D223E0901@localhost> <E1UiOxz-0004ET-RE@jdl.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jon Loeliger <jdl@jdl.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, linux-kernel <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, Michal Marek <mmarek@suse.cz>, Stephen Warren <swarren@nvidia.com>, Rob Herring <rob.herring@calxeda.com>, linux-kbuild@vger.kernel.org

On Fri, 2013-05-31 at 08:01 -0500, Jon Loeliger wrote:
> Hrm.  Is this a "that's not in the kernel's copy yet" problem? 

BTW I'm using dtc.git 4e76ec796c90d44d417f82d9db2d67cfe575f8ed and not
the kernel copy. 

dtc-lexer.l in my HEAD is identical to the current master
(2e3fc7e9b3a4722a5500afaa9faf7874c61b2e6a) according to git diff.

Ian.

