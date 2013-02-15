Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60178 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S935780Ab3BOPbK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 15 Feb 2013 10:31:10 -0500
Message-ID: <511E54B7.2080709@suse.cz>
Date: Fri, 15 Feb 2013 16:31:03 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] fix: build aborts if SPACE characters are found in path.
References: <CAK2BWApu9PjkmDdV4HoFXcq9KTh4e57iEdwYn9muVmYRwRNXgw@mail.gmail.com>
In-Reply-To: <CAK2BWApu9PjkmDdV4HoFXcq9KTh4e57iEdwYn9muVmYRwRNXgw@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sunil Beta Baskar <betasam@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 18.1.2013 15:33, Sunil Beta Baskar wrote:
> Signed-off-by: Sunil Beta <betasam@gmail.com>
> ---
>  Makefile |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 07bc925..48bfd8e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -10,6 +10,8 @@ NAME = "Divemaster Edition"
>  # Comments in this file are targeted only to the developer, do not
>  # expect to learn how to build the kernel reading this file.
> 
> +CURDIRSPC := $(echo $(CURDIR) | sed "s/ /\\\ /g" )
> +$(ifneq $(CURDIR),$(CURDIRSPC), $(error directory $(CURDIR) contains spaces.))

You do not need to call shell and sed here. Use the findstring make
function and the $(space) variable from scripts/Kbuild.include. Also,
while at it, could you also add a check for colon? This breaks the build
in similar way.

Thanks,
Michal
