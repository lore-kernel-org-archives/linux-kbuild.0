Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from trent.utfs.org ([94.185.90.103]:56971 "EHLO trent.utfs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750762Ab3KSG1o (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Nov 2013 01:27:44 -0500
Date: Mon, 18 Nov 2013 22:20:31 -0800 (PST)
From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: [PATCH] kconfig: add comment about 'jump maybe used
 unitialized'
In-Reply-To: <1384808595-26028-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <alpine.DEB.2.11.1311182218160.31521@trent.utfs.org>
References: <1384808595-26028-1-git-send-email-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, Benjamin Poirier <bpoirier@suse.de>

On Mon, 18 Nov 2013 at 22:03, Yann E. MORIN wrote:
> Madhavan, Christian, if you could give a bit ;ore details on the distro
> you're using, that be nice so we can have a more descriptive commit log.

In my case it's gcc-4.7 from Debian/wheezy (powerpc):

$ gcc --version | head -1
gcc (Debian 4.7.2-5) 4.7.2

Christian.
-- 
BOFH excuse #34:

(l)user error
