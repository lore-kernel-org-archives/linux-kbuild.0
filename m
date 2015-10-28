Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:46182 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752375AbbJ1Hc6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Oct 2015 03:32:58 -0400
Date: Wed, 28 Oct 2015 16:32:42 +0900
From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 10/10] merge_config.sh: add tests for cmdline configs
Message-ID: <20151028073242.GN1854@malice.jf.intel.com>
References: <1445992931-28107-1-git-send-email-olof@lixom.net>
 <1445992931-28107-11-git-send-email-olof@lixom.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1445992931-28107-11-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dvhart@linux.intel.com

On Wed, Oct 28, 2015 at 09:42:11AM +0900, Olof Johansson wrote:
> Again, these tests could be more complicated but at least it gets
> the very basics covered.
> 
> Signed-off-by: Olof Johansson <olof@lixom.net>

Good thing you added =n as valid, this would be much harder otherwise :-)

Signed-off-by: Darren Hart <dvhart@linux.intel.com>

-- 
Darren Hart
Intel Open Source Technology Center
