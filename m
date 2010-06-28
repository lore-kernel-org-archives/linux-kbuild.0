Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp-out.google.com ([216.239.44.51]:60844 "EHLO
	smtp-out.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752297Ab0F1Sqo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 28 Jun 2010 14:46:44 -0400
Date: Mon, 28 Jun 2010 11:46:37 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
Subject: Re: [PATCH 1/2] Makefile: fix missing dash when using make
 LOCALVERSION=xxx
In-Reply-To: <4C286A8F.9080508@redhat.com>
Message-ID: <alpine.DEB.2.00.1006281145590.25490@chino.kir.corp.google.com>
References: <20100628030507.5187.95903.sendpatchset@localhost.localdomain> <alpine.DEB.2.00.1006280207580.28072@chino.kir.corp.google.com> <4C286A8F.9080508@redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cong Wang <amwang@redhat.com>
Cc: linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Mon, 28 Jun 2010, Cong Wang wrote:

> But in your patch description, you said:
> 
>     Without CONFIG_LOCALVERSION_AUTO, "make" results in v2.6.32-rc4+
>     unless the repository is at the Linux v2.6.32-rc4 commit (in which
>     case the version would be v2.6.32-rc4).  If "make LOCALVERSION=kbuild"
>     were used, it results in v2.6.32-rc4-kbuild.
> 
> So, shouldn't that be "make LOCALVERSION=-kbuild"?
> 

Yup, that's what it should have said.  That doesn't mean that we need to 
change the long-standing behavior of LOCALVERSION= to add an implied `-', 
though.
