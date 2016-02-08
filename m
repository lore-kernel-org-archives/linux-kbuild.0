Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58087 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753805AbcBHDvW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 7 Feb 2016 22:51:22 -0500
Message-ID: <1454903481.3407.3.camel@ellerman.id.au>
Subject: Re: scripts/kconfig: allow building with make 3.80 again
From: Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 08 Feb 2016 14:51:21 +1100
In-Reply-To: <56AF3E85.9050903@suse.de>
References: <56A65F4B02000078000CAC75@prv-mh.provo.novell.com>
	 <56AF3E85.9050903@suse.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.de>, Jan Beulich <JBeulich@suse.com>
Cc: linux-kbuild@vger.kernel.org

On Mon, 2016-02-01 at 12:16 +0100, Michal Marek wrote:

> Dne 25.1.2016 v 17:45 Jan Beulich napsal(a):

> > Documentation/Changes still lists this as the minimal required version,
> > so it ought to remain usable for the time being.
> > 
> > Fixes: d2036f30cf ("scripts/kconfig/Makefile: Allow KBUILD_DEFCONFIG to be a target")
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > ---
> >  scripts/kconfig/Makefile |    4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> Sorry for the delay, applied to kbuild.git#kconfig now.

Erk, sorry for breaking it.

I guess somewhere we need a system with an old make on it for testing this
stuff. Nothing I have around has make that old though, Ubuntu 10.04 and Debian
6.0 both have 3.81 and I don't have anything older.

cheers

