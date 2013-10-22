Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0015.hostedemail.com ([216.40.44.15]:52911 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754046Ab3JVQzN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Oct 2013 12:55:13 -0400
Message-ID: <1382460908.2041.94.camel@joe-AO722>
Subject: Re: [PATCH 1/3] kbuild: Increase kallsyms max symbol length
From: Joe Perches <joe@perches.com>
Date: Tue, 22 Oct 2013 09:55:08 -0700
In-Reply-To: <20131022164026.GE29695@two.firstfloor.org>
References: <1382456783-22826-1-git-send-email-andi@firstfloor.org>
	 <1382456783-22826-2-git-send-email-andi@firstfloor.org>
	 <1382459764.2041.90.camel@joe-AO722>
	 <20131022164026.GE29695@two.firstfloor.org>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: mmarek@suse.cz, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Mario <jmario@redhat.com>, Andi Kleen <ak@linux.intel.com>

On Tue, 2013-10-22 at 18:40 +0200, Andi Kleen wrote:
> > Doesn't doubling seems a tad excessive given the
> > silly length of that symbol above?
> 
> No, it doesn't.

Does it work?

Doesn't kallsyms:get_symbol_offset restrict the maximum
possible length to 255?


