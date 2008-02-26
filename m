Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 1wt.eu ([62.212.114.60]:2151 "EHLO 1wt.eu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751512AbYBZNEn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Feb 2008 08:04:43 -0500
Date: Tue, 26 Feb 2008 14:04:30 +0100
From: Willy Tarreau <w@1wt.eu>
Subject: Re: [PATCH] Compress kernel modules on installation.
Message-ID: <20080226130430.GD21257@1wt.eu>
References: <20080225214209.a3f79327.sbrokenshire@xestia.co.uk> <20080225222137.GY8953@1wt.eu> <20080226091455.GA3498@cs181133002.pp.htv.fi> <20080226102203.GA21257@1wt.eu> <20080226123016.GA27813@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080226123016.GA27813@cs181133002.pp.htv.fi>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: Steve Brokenshire <sbrokenshire@xestia.co.uk>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Tue, Feb 26, 2008 at 02:30:16PM +0200, Adrian Bunk wrote:
> On Tue, Feb 26, 2008 at 11:22:03AM +0100, Willy Tarreau wrote:
> > On Tue, Feb 26, 2008 at 11:14:55AM +0200, Adrian Bunk wrote:
> > > On Mon, Feb 25, 2008 at 11:21:38PM +0100, Willy Tarreau wrote:
> >...
> > > > Have you tried keeping the module names intact (.ko, not .ko.gz) ?
> > > > It's what I was doing with modutils in 2.4 and what I'm still doing
> > > > with module-init-tools in 2.6. While I don't particularly use mkinitrd,
> > > > I think that keeping the name intact is preferable and should help.
> > > 
> > > How would you see if, and if yes with what program, a module was 
> > > compressed if the name is kept intact?
> > 
> > depmod/modinfo/insmod/modprobe already know it. And quite honnestly,
> > I don't know about any other program which really needs to process
> > those files once installed. Well, maybe ksymoops, but I'd have to
> > check, as I don't recall having ever been annoyed with this.
> >...
> 
> depmod/modinfo/insmod/modprobe know only if you compile 
> module-init-tools with zlib support.
> 
> And what about the busybox versions?
> 
> A different name would e.g.:
> - easily allow proper error handling if the userspace modules program 
>   doesn't support the compression used
> - better scale to support additional compressions
> - give the user a hint what is happening and what might be the problem
>   when anythig goes wrong

I agree, but right now module.dep references existing files with their
real names. Maybe something should define exactly what it should contain
(eg: module_name.ko even if .ko.gz is used) so that all tools relying on
it do not stop after noticing that the file referenced there does not
exist.

regards,
Willy

