Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:15663 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751990Ab0F2Blt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 28 Jun 2010 21:41:49 -0400
Message-ID: <4C29504F.4010204@redhat.com>
Date: Tue, 29 Jun 2010 09:45:51 +0800
From: Cong Wang <amwang@redhat.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] Makefile: fix missing dash when using make LOCALVERSION=xxx
References: <20100628030507.5187.95903.sendpatchset@localhost.localdomain> <alpine.DEB.2.00.1006280207580.28072@chino.kir.corp.google.com> <4C286A8F.9080508@redhat.com> <alpine.DEB.2.00.1006281145590.25490@chino.kir.corp.google.com>
In-Reply-To: <alpine.DEB.2.00.1006281145590.25490@chino.kir.corp.google.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Rientjes <rientjes@google.com>
Cc: linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On 06/29/10 02:46, David Rientjes wrote:
> On Mon, 28 Jun 2010, Cong Wang wrote:
>
>> But in your patch description, you said:
>>
>>      Without CONFIG_LOCALVERSION_AUTO, "make" results in v2.6.32-rc4+
>>      unless the repository is at the Linux v2.6.32-rc4 commit (in which
>>      case the version would be v2.6.32-rc4).  If "make LOCALVERSION=kbuild"
>>      were used, it results in v2.6.32-rc4-kbuild.
>>
>> So, shouldn't that be "make LOCALVERSION=-kbuild"?
>>
>
> Yup, that's what it should have said.  That doesn't mean that we need to
> change the long-standing behavior of LOCALVERSION= to add an implied `-',
> though.

Ok, but your patch description is the only doc I found, so... :)

Thanks.

