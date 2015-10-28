Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:56671 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751290AbbJ1G1L (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Oct 2015 02:27:11 -0400
Date: Wed, 28 Oct 2015 15:26:54 +0900
From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 05/10] merge_config.sh: Better handling of CONFIG_FOO=n
Message-ID: <20151028062654.GG1854@malice.jf.intel.com>
References: <1445992931-28107-1-git-send-email-olof@lixom.net>
 <1445992931-28107-6-git-send-email-olof@lixom.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1445992931-28107-6-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dvhart@linux.intel.com

On Wed, Oct 28, 2015 at 09:42:06AM +0900, Olof Johansson wrote:
> Kconfig knows how to handle CONFIG_FOO=n just fine, but it'll always
> use "# CONFIG FOO is not set" in the resulting config. Mangle the input
> accordingly so we don't report this as a failure when it isn't.
> 
> Signed-off-by: Olof Johansson <olof@lixom.net>

Matching Kconfig behavior is the logical approach, no point in complaining if
Kconfig will accpet the result.

Bruce, I think we'll just need to update the linux-yocto tool documentation not
to mark =n as wrong.

Reviewed-by: Darren Hart <dvhart@linux.intel.com>

-- 
Darren Hart
Intel Open Source Technology Center
