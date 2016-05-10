Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:52844 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751568AbcEJPOh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 May 2016 11:14:37 -0400
Date: Tue, 10 May 2016 17:14:37 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [RESEND PATCH 0/5] gcov fixes and maybe-uninitialized warnings
Message-ID: <20160510151437.GA12889@pobox.suse.cz>
References: <1461598531-2190169-1-git-send-email-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1461598531-2190169-1-git-send-email-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, Peter Oberparleiter <oberpar@linux.vnet.ibm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On Mon, Apr 25, 2016 at 05:35:26PM +0200, Arnd Bergmann wrote:
> Hi Michal,
> 
> This is a resend of a series I originally sent back in February, but
> unfortunately I never heard back from you. Could you apply these
> patches for v4.7?
> 
> [PATCH 1/5] Kbuild: change CC_OPTIMIZE_FOR_SIZE definition
> [PATCH 2/5] Kbuild: disable 'maybe-uninitialized' warning for
> [PATCH 3/5] gcov: disable for COMPILE_TEST
> [PATCH 4/5] gcov: disable tree-loop-im to reduce stack usage
> [PATCH 5/5] gcov: disable -Wmaybe-uninitialized warning

Applied now, sorry for the delay.

Michal
