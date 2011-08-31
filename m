Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:38237 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755001Ab1HaLuW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 31 Aug 2011 07:50:22 -0400
Message-ID: <4E5E1FFD.9020105@suse.cz>
Date: Wed, 31 Aug 2011 13:50:21 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: Pending kconfig patches
References: <CACqU3MUEqL1=s29+ibH3CvVCvm8VDN4RM-8bd+dWxdmeF-d4gw@mail.gmail.com>
In-Reply-To: <CACqU3MUEqL1=s29+ibH3CvVCvm8VDN4RM-8bd+dWxdmeF-d4gw@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On 30.8.2011 02:47, Arnaud Lacombe wrote:
> Hi,
> 
> FYI, I've been picking a few patches on the list which have not yet
> reached your kbuild-2.6/kconfig branch. They are available in the git
> repository at:
> 
> git://github.com/lacombar/linux-2.6.git kconfig/for-next
> 
> and it currently contains:
> 
> Arnaud Lacombe (1):
>       kconfig: fix __enabled_ macros definition for invisible and
> un-selected symbols
> 
> Davidlohr Bueso (1):
>       kconfig: handle SIGINT in menuconfig
> 
> Lucas De Marchi (1):
>       kconfig: fix set but not used variables

Pulled, thanks.

I was on vacation, but I had a typo in my .procmailrc rule that was
supposed to send the autoreplies... :-/

Michal
