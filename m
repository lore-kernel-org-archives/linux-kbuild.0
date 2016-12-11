Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:36453 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753620AbcLKUmU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Dec 2016 15:42:20 -0500
Date: Sun, 11 Dec 2016 21:42:16 +0100
From: Michal Marek <mmarek@suse.com>
Subject: Re: [PATCH 1/2] xconfig: fix 'Show Debug' functionality
Message-ID: <20161211204216.GA3812@sepie.suse.cz>
References: <fb990a5d-c9c5-5b37-0e59-d5df19f64c67@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb990a5d-c9c5-5b37-0e59-d5df19f64c67@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Jason Vas Dias <jason.vas.dias@gmail.com>, Boris Barbulovski <bbarbulovski@gmail.com>

On Wed, Nov 30, 2016 at 02:57:52PM -0800, Randy Dunlap wrote:
> From: Boris Barbulovski <bbarbulovski@gmail.com>
> 
> xconfig - Fix missing 'Show Debug' functionality.
> 
> xconfig Help mentions 'Show Debug Info' but it was missing from any
> menu.
> 
> * Add 'Show debug' menu to the main menu.
> * Properly load showDebug settings.
> 
> Reported-by: Jason Vas Dias <jason.vas.dias@gmail.com>
> Signed-off-by: Boris Barbulovski <bbarbulovski@gmail.com>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>

Applied to kbuild.git#kconfig.

Michal
