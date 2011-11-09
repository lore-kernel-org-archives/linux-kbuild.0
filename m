Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:51715 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752809Ab1KINnA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Nov 2011 08:43:00 -0500
Message-ID: <4EBA8383.3020100@suse.cz>
Date: Wed, 09 Nov 2011 14:43:31 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] Kbuild: append missing-syscalls to the default target
 list
References: <1314234210-11090-1-git-send-email-lacombar@gmail.com> <4E69FEC9.2080204@suse.cz> <CACqU3MUFyn_jh2pN4GLENqcGVUzAwcMJUR_WLY2EtqOhMheceQ@mail.gmail.com> <20111101232233.GA32441@sepie.suse.cz> <20111107204448.GA9949@linux-mips.org> <20111107211900.GB6264@sepie.suse.cz> <20111107233330.GA26705@linux-mips.org> <4EB8E75D.1010706@suse.cz> <4EB97333.1050403@gmail.com> <4EB9AD98.3010404@suse.cz> <20111109095414.GA15438@linux-mips.org>
In-Reply-To: <20111109095414.GA15438@linux-mips.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: David Daney <ddaney.cavm@gmail.com>, Arnaud Lacombe <lacombar@gmail.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "Daney, David" <David.Daney@caviumnetworks.com>

Dne 9.11.2011 10:54, Ralf Baechle napsal(a):
> On Tue, Nov 08, 2011 at 11:30:48PM +0100, Michal Marek wrote:
> 
>> On 8.11.2011 19:21, David Daney wrote:
>>> The problem is that compiler options meant to be used only for the 
>>> compiling done by scripts/checksyscalls.sh are now leaking into the 
>>> compilation of other parts of the kernel (asm-offsets.c), where they 
>>> wreak havoc.
>>>
>>> Something like the attached is what I think needs to be done.
>>
>> Ah, right. That makes a lot of sense now. Ralf, does the patch at
>> https://lkml.org/lkml/2011/11/8/312 work for you?
> 
> Yes, it does - and unlike David's first version this one also looks
> reasonably elegant.
> 
> Acked-by: Ralf Baechle <ralf@linux-mips.org>

Thanks to both of you, applied to kbuild.git#rc-fixes.

Michal
