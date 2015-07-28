Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from imap.thunk.org ([74.207.234.97]:36690 "EHLO imap.thunk.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752485AbbG1T1L (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 28 Jul 2015 15:27:11 -0400
Date: Tue, 28 Jul 2015 15:27:06 -0400
From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: [PATCH] builddeb: sign the modules after splitting out the
 debuginfo files
Message-ID: <20150728192706.GP2851@thunk.org>
References: <1434421046-4020-1-git-send-email-tytso@mit.edu>
 <CAAqcGHkcmFxPtCxnNgdoKyPerZXQSVpQ-FVWz7PU01TF=rzMbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAqcGHkcmFxPtCxnNgdoKyPerZXQSVpQ-FVWz7PU01TF=rzMbA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Wed, Jun 17, 2015 at 09:34:34AM +0300, Riku Voipio wrote:
> Hi,
> 
> On 16 June 2015 at 05:17, Theodore Ts'o <tytso@mit.edu> wrote:
> > Signed-off-by: Theodore Ts'o <tytso@mit.edu>
> 
> A similar patch is already in Michals tree:
> 
> https://git.kernel.org/cgit/linux/kernel/git/mmarek/kbuild.git/commit/?h=misc&id=64178cb62c329350fe06622cd215264d849b27b1
>

It looks like kbuild.git didn't get merged for the 4.2 merge cycle?

   	      		 	    - Ted
