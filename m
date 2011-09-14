Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:49705 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753488Ab1INBpI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 13 Sep 2011 21:45:08 -0400
Message-ID: <4E7007F3.9080305@suse.cz>
Date: Wed, 14 Sep 2011 03:48:35 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [RFC] Kbuild: allow code re-use across different directories
References: <1313800642-32418-1-git-send-email-lacombar@gmail.com> <4E6A0700.9030401@suse.cz> <CACqU3MUfJAeur_65i5vDegu1d1VqAdq15EedfX9A3w52J23MPg@mail.gmail.com>
In-Reply-To: <CACqU3MUfJAeur_65i5vDegu1d1VqAdq15EedfX9A3w52J23MPg@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Dne 13.9.2011 23:13, Arnaud Lacombe napsal(a):
> 2011/9/9 Michal Marek <mmarek@suse.cz>:
>> On 20.8.2011 02:37, Arnaud Lacombe wrote:
>>> With the attached patch, we would do:
>>>
>>> arch/foo/boot/Makefile:
>>> LDFLAGS_fancy.o := -DPANTS=30
>>> obj-y += fancy.o
>>> vpath-y += $(srctree)/arch/foo/lib
>>>
>>> and let GNU make do the job.
>>
>> I like this. The only issue I can think of right now, is that if you add
>> a large directory to vpath-y, then it would be easy to accidentally
>> reuse more files from that directory than intended. But that could be
>> easily prevented by isolating those reusable source files.
>>
> I do not think it is that dangerous. We enforce unique access to VPATH
> and we still prioritize $(src) over any other specified path.
> 
> That said, what would you want to pull the patch into -next, beside
> kernel.org being up ?

Just post it with a proper signoff. But there won't be any linux-next
until kernel.org is back again.

Michal
