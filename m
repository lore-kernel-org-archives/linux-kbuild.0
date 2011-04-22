Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:49113 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754526Ab1DVLJs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 22 Apr 2011 07:09:48 -0400
Date: Fri, 22 Apr 2011 13:09:47 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3] kbuild: implement several W= levels
Message-ID: <20110422110947.GA20715@merkur.ravnborg.org>
References: <20110422102028.GA8324@liondog.tnic> <20110422104646.GB8324@liondog.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20110422104646.GB8324@liondog.tnic>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>, Michal Marek <mmarek@suse.cz>, Dave Jones <davej@redhat.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

> Borislav:
> 
> - drop -Wmissing-prototypes since it is being added to the toplevel Makefile

This is actually bogus..
We only add this to HOSTCFLAGS - which is used to build programs
that run on your build host. These options do not propagate to gcc
used to build the kernel modules.

The rest looks good.

	Sam
