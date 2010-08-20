Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:50718 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750828Ab0HTMAd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 20 Aug 2010 08:00:33 -0400
Message-ID: <4C6E6DB7.8000403@suse.cz>
Date: Fri, 20 Aug 2010 13:57:43 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [Patch] makefile: not need to regenerate kernel.release file
 when make kernelrelease
References: <20100820094028.6321.95741.sendpatchset@localhost.localdomain>
In-Reply-To: <20100820094028.6321.95741.sendpatchset@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Amerigo Wang <amwang@redhat.com>
Cc: linux-kernel@vger.kernel.org, Brice Goglin <Brice.Goglin@inria.fr>, akpm@linux-foundation.org, linux-kbuild@vger.kernel.org

On 20.8.2010 11:36, Amerigo Wang wrote:
> Brice reported that 'kernelrelease' has a dependence on include/config/kernel.release,
> causes this file to be regenerated every time when invoke it. It doesn't have to.
>
> Reported-by: Brice Goglin<Brice.Goglin@inria.fr>
> Tested-by: Brice Goglin<Brice.Goglin@inria.fr>
> Signed-off-by: WANG Cong<amwang@redhat.com>

Thanks, applied. And sorry for breaking your previous patch.

Michal
