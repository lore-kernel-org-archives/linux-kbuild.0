Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:51043 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754734AbbJ1GAT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Oct 2015 02:00:19 -0400
Date: Wed, 28 Oct 2015 15:00:12 +0900
From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 03/10] merge_config.sh: minor argument parsing refactoring
Message-ID: <20151028060012.GE1854@malice.jf.intel.com>
References: <1445992931-28107-1-git-send-email-olof@lixom.net>
 <1445992931-28107-4-git-send-email-olof@lixom.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1445992931-28107-4-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dvhart@linux.intel.com

On Wed, Oct 28, 2015 at 09:42:04AM +0900, Olof Johansson wrote:
> Every case that continues iterating needs a shift, so move it to common location.
> Also, the continues are redundant.
> 
> Signed-off-by: Olof Johansson <olof@lixom.net>

Nice cleanup, thanks Olof.

Reviewed-by: Darren Hart <dvhart@linux.intel.com>

-- 
Darren Hart
Intel Open Source Technology Center
