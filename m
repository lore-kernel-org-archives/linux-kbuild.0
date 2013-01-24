Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:36081 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753511Ab3AXWWv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2013 17:22:51 -0500
Message-ID: <5101B42D.2090709@suse.cz>
Date: Thu, 24 Jan 2013 23:22:37 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] mod/file2alias: make modalias generation safe for cross
 compiling
References: <m2txqbu6yg.fsf@igel.home>
In-Reply-To: <m2txqbu6yg.fsf@igel.home>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-kbuild@vger.kernel.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

Dne 20.1.2013 17:58, Andreas Schwab napsal(a):
> Use the target compiler to compute the offsets for the fields of the
> device_id structures, so that it won't be broken by different alignments
> between the host and target ABIs.
> 
> This also fixes missing endian corrections for some modaliases.
> 
> Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
> ---
> This has been tested with an allmodconfig cross build of the m68k
> kernel.  This is the difference in the generated module aliases before
> and after the patch:

Nice! I merged your patch to kbuild.git#kbuild.

Thanks,
Michal
