Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:56697 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752094Ab0CGVMG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 7 Mar 2010 16:12:06 -0500
Message-ID: <4B9416A7.203@suse.cz>
Date: Sun, 07 Mar 2010 22:12:07 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: Patch eb8f844c "kbuild: specify absolute paths for cscope" breaks
 cscope use on NFS mounted source tree
References: <1267784461.11737.37000.camel@zakaz.uk.xensource.com>
In-Reply-To: <1267784461.11737.37000.camel@zakaz.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ian Campbell <ijc@hellion.org.uk>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org

On 5.3.2010 11:21, Ian Campbell wrote:
> I keep my kernel source tree on a more powerful build box where I run my
> builds etc (including "make cscope") but run my editor from my
> workstation with an NFS mount to the source. This worked fine for me
> using relative paths for cscope. Using absolute paths in cscope breaks
> this previously working setup because the root path is not the same on
> both systems. I guess this is similar to moving the source tree around.

I was aware that moving the source tree around would break the cscope
database. I hoped that nobody would do this on a daily basis, but
nfs-mounting the tree is essentially the same (an makes perfect sense to
do).


> Without wanting to start a flamewar it really sounds to me like we are
> working around a vim (or cscope) bug here, emacs with cscope bindings
> works fine in this configuration.
> 
> Could we at least have an option to allow both variants to work? Would
> setting "make O=$(pwd) cscope" (where pwd is the source tree) not have
> provided a workaround for people who needed absolute paths for whatever
> reason?

Daniel, how do we proceed here? Would
$ make O=. cscope
plus maybe a comment suggesting this, be an acceptable workaround for
your use case (which was running vim from within a subdirectory, IIRC).

Michal
