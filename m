Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0232.hostedemail.com ([216.40.44.232]:35221 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753381AbbDPUof (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 16 Apr 2015 16:44:35 -0400
Message-ID: <1429217067.2850.55.camel@perches.com>
Subject: Re: [PATCH 1/2] compiler-gcc.h: Neatening
From: Joe Perches <joe@perches.com>
Date: Thu, 16 Apr 2015 13:44:27 -0700
In-Reply-To: <591534b6927eb1ecc0622f6049947741208f1e11.1429212277.git.joe@perches.com>
References: <20150416162938.GU2366@two.firstfloor.org>
	 <591534b6927eb1ecc0622f6049947741208f1e11.1429212277.git.joe@perches.com>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, Segher Boessenkool <segher@kernel.crashing.org>, Sasha Levin <levinsasha928@gmail.com>

On Thu, 2015-04-16 at 13:31 -0700, Joe Perches wrote:
> Move the inline and noinline blocks together
> Comment neatening
> Alignment of __attribute__ uses
> Consistent naming of __must_be_array macro argument
> Multiline macro neatening

I must have missed the -s flag on the git commit.

Signed-off-by: Joe Perches <joe@perches.com>

