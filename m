Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:39472
	"EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752099Ab0HRImc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Aug 2010 04:42:32 -0400
Message-ID: <4C6B9BFE.1030308@inria.fr>
Date: Wed, 18 Aug 2010 10:38:22 +0200
From: Brice Goglin <Brice.Goglin@inria.fr>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] Makefile: "make kernelrelease" should show the correct
 full kernel version
References: <20100628030507.5187.95903.sendpatchset@localhost.localdomain> <20100628030516.5187.49089.sendpatchset@localhost.localdomain> <4C6B88A5.4050305@inria.fr> <4C6B957C.1090308@redhat.com>
In-Reply-To: <4C6B957C.1090308@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cong Wang <amwang@redhat.com>
Cc: Brice Goglin <Brice.Goglin@inria.fr>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, David Rientjes <rientjes@google.com>, Michal Marek <mmarek@suse.cz>

Le 18/08/2010 10:10, Cong Wang a écrit :
> On 08/18/10 15:15, Brice Goglin wrote:
>> This patch (actually 01ab17887 in 2.6.36-rc1) reveals what looks like a
>> problem to me: make kernelrelease always regenerates
>> include/config/kernel.release even if it's already more recent than
>> include/config/auto.conf. Is this the expected behavior? Do we really
>> need include/config/kernel.release to depend on FORCE?
>>
>
> I think so, because "LOCALVERSION=" can be given from command line,
> so we need to regenerate it.
>
> Or am I missing your point here?
>

Interesting. I assumed "make kernelrelease" was mainly here to display
the release string (which means you would not need write access to the
kernel build dir). And indeed make help says:
  kernelrelease      - Output the release version string
Right now, it looks like "update the version string and by the way
display it too" (and you need write access).

Brice
