Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:51670 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754932Ab3KEORP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Nov 2013 09:17:15 -0500
Date: Tue, 5 Nov 2013 06:17:02 -0800
From: Andi Kleen <ak@linux.intel.com>
Subject: Re: linux-next: build warnings after merge of the modules tree
Message-ID: <20131105141702.GE1962@tassilo.jf.intel.com>
References: <20131104134134.48665968dd006e3310333993@canb.auug.org.au>
 <87fvrba8su.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fvrba8su.fsf@rustcorp.com.au>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

> modpost creates an entry when it sees the CRC, then when it sees the
> actual symbol, it complains that it's seen it before.  The preloaded
> flag already exists for the equivalent case where we loaded from
> Module.symvers, so use that.

Looks good. Thanks for fixing.

-Andi
