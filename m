Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:45105 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755004AbcK2VZ0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Nov 2016 16:25:26 -0500
Subject: Re: [PATCH 0/7] kbuild patches for 4.10
References: <20161123164143.16839-1-npiggin@gmail.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <0c054c98-eec3-9e95-68ae-5c97c78e0753@suse.com>
Date: Tue, 29 Nov 2016 22:25:23 +0100
MIME-Version: 1.0
In-Reply-To: <20161123164143.16839-1-npiggin@gmail.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: linux-kbuild@vger.kernel.org

Dne 23.11.2016 v 17:41 Nicholas Piggin napsal(a):
> Hi,
> 
> I have a few various kbuild patches for review and  consideration
> for 4.10 branch that did not make 4.9. All of these except the first
> one have been posted before without big changes. The first, I posted
> an RFC for moving kallsyms data section but this approach is simpler.
> 
> All patches are independent, so any can be taken in any order. I'm
> posting as a group just for convenience but if that is wrong then I
> will submit individual patches in future.

Thanks, I applied them to kbuild.git#kbuild now.

Michal
