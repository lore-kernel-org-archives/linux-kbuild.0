Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:35434 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752593Ab3F0XFf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 27 Jun 2013 19:05:35 -0400
Message-ID: <51CCC539.2000105@suse.cz>
Date: Fri, 28 Jun 2013 01:05:29 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] improve modalias building
References: <51A60E5002000078000D9978@nat28.tlf.novell.com>
In-Reply-To: <51A60E5002000078000D9978@nat28.tlf.novell.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: schwab@linux-m68k.org, linux-kbuild@vger.kernel.org

Dne 29.5.2013 14:18, Jan Beulich napsal(a):
> For one, there's no point in the respective pieces to be rebuilt
> unconditionally on each and every rebuild.
> 
> Second there's no need to invent a custom rule for generating the .s
> file from the .c source - we can simply use the generic rule here.
> 
> And finally, $(obj) should be used to refer to files in the build tree
> (rather than spelling out the subdirectory).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Applied to kbuild.git#kbuild.

Thanks,
Michal
