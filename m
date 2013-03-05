Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:43370 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755450Ab3CEOqs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Mar 2013 09:46:48 -0500
Message-ID: <51360554.10509@suse.cz>
Date: Tue, 05 Mar 2013 15:46:44 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH - Regression] kbuild: fix make headers_check with make
 3.80
References: <20130304203624.GA10846@merkur.ravnborg.org>
In-Reply-To: <20130304203624.GA10846@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, David Howells <dhowells@redhat.com>, lkml <linux-kernel@vger.kernel.org>, arnd@arndb.de, tglx@linutronix.de, paulmck@linux.vnet.ibm.com, davej@redhat.com

On 4.3.2013 21:36, Sam Ravnborg wrote:
> Commit 10b63956 ("UAPI: Plumb the UAPI Kbuilds into the user header
> installation and checking") introduced a dependency of make 3.81
> due to use of $(or ...)
> 
> We do not want to lift the requirement to gmake 3.81 just yet...
> Included are a straightforward conversion to $(if ...)
> 
> Bisected-and-tested-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Cc: David Howells <dhowells@redhat.com>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> ---

Thanks, Sam. I applied the patch to kbuild.git#kbuild and will send it
to Linus.

Michal
