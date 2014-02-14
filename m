Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:59344 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753075AbaBNOgx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Feb 2014 09:36:53 -0500
Date: Fri, 14 Feb 2014 06:36:49 -0800
From: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH 14/17] Kbuild, lto: Add Link Time Optimization support
Message-ID: <20140214143649.GQ12219@tassilo.jf.intel.com>
References: <1391846481-31491-1-git-send-email-ak@linux.intel.com>
 <1391846481-31491-14-git-send-email-ak@linux.intel.com>
 <52FD9B5A.4020905@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52FD9B5A.4020905@zytor.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, x86@kernel.org

On Thu, Feb 13, 2014 at 08:28:10PM -0800, H. Peter Anvin wrote:
> I am about to commit the patches before this except 02/17 and 12/17 to
> tip:x86/asmlinkage; however, I figure we need a new 02/17 before
> committing the actual LTO patches to avoid build breakage.

Thanks.

Yes I'll repost today.

I was assuming those would go through the kbuild tree.

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only
