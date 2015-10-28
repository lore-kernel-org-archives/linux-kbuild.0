Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:35101 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755516AbbJ1HA6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Oct 2015 03:00:58 -0400
Date: Wed, 28 Oct 2015 16:00:45 +0900
From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 07/10] merge_config.sh: add tests
Message-ID: <20151028070045.GI1854@malice.jf.intel.com>
References: <1445992931-28107-1-git-send-email-olof@lixom.net>
 <1445992931-28107-8-git-send-email-olof@lixom.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1445992931-28107-8-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dvhart@linux.intel.com

On Wed, Oct 28, 2015 at 09:42:08AM +0900, Olof Johansson wrote:
> For being a small script, merge_config.sh is fairly scary to change since there's no
> real way to know if you did something wrong. So it seems appropriate to add a simple
> test suite.
> 
> I've started with testcases in the areas I care about, other should of course feel
> free to expand on this.
> 
> Use is simple, from the kernel tree, run ./scripts/kconfig/merge_config_test/runall.
> It'll execute out of a tmpdir under /tmp.
> 
> Signed-off-by: Olof Johansson <olof@lixom.net>

Thanks for writing the test cases. Shell scripting is so easy to bikeshed - so
I'm going to skip that. I didn't catch any bashisms, and the test coverage is
good.

Reviewed-by: Darren Hart <dvhart@linux.intel.com>

-- 
Darren Hart
Intel Open Source Technology Center
