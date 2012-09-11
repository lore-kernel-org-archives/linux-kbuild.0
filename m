Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:48154 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751111Ab2IKEWD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 11 Sep 2012 00:22:03 -0400
Date: Tue, 11 Sep 2012 12:21:49 +0800
From: Fengguang Wu <fengguang.wu@intel.com>
Subject: Re: [PATCH] Kbuild: use normal compression settings for tar*-pkg
Message-ID: <20120911042149.GA25359@localhost>
References: <1347133679-14641-1-git-send-email-andi@firstfloor.org>
 <20120911004633.GA21147@localhost>
 <20120911030109.GU16230@one.firstfloor.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120911030109.GU16230@one.firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: mmarek@suse.cz, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

On Tue, Sep 11, 2012 at 05:01:09AM +0200, Andi Kleen wrote:
> > 
> > -c should be kept because it means --stdout and --keep
> 
> It seems to work without it.

Yeah I see: it's used in the pipe anyway:

        tar cf - . $opts | ${compress} > "${tarball}${file_ext}"

Thanks,
Fengguang

