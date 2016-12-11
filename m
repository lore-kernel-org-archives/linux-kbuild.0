Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:36468 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753620AbcLKUmh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Dec 2016 15:42:37 -0500
Date: Sun, 11 Dec 2016 21:42:35 +0100
From: Michal Marek <mmarek@suse.com>
Subject: Re: [PATCH 2/2] xconfig: fix missing suboption and help panels on
 first run
Message-ID: <20161211204235.GB3812@sepie.suse.cz>
References: <83475b00-45f0-0140-d024-b946b4999087@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83475b00-45f0-0140-d024-b946b4999087@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Jason Vas Dias <jason.vas.dias@gmail.com>, Boris Barbulovski <bbarbulovski@gmail.com>

On Wed, Nov 30, 2016 at 02:57:55PM -0800, Randy Dunlap wrote:
> From: Boris Barbulovski <bbarbulovski@gmail.com>
> 
> qconfig initial slider sizes fix.
> 
> On first `make xconfig`, suboption and help panels were hidden.
> Now we properly detect the first run, and show those panels.
> 
> Reported-by: Jason Vas Dias <jason.vas.dias@gmail.com>
> Signed-off-by: Boris Barbulovski <bbarbulovski@gmail.com>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>

Applied to kbuild.git#kconfig.

Michal
