Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qg0-f50.google.com ([209.85.192.50]:33108 "EHLO
	mail-qg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752082AbcDZOuI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2016 10:50:08 -0400
Received: by mail-qg0-f50.google.com with SMTP id f92so5937954qgf.0
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Apr 2016 07:50:07 -0700 (PDT)
Date: Tue, 26 Apr 2016 10:50:04 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: kbuild fix branch for linux-next
In-Reply-To: <20160426085722.35a6a826@canb.auug.org.au>
Message-ID: <alpine.LFD.2.20.1604261047530.5091@knanqh.ubzr>
References: <alpine.LFD.2.20.1604251203100.5091@knanqh.ubzr> <20160426085722.35a6a826@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 26 Apr 2016, Stephen Rothwell wrote:

> Hi Nicolas,
> 
> On Mon, 25 Apr 2016 12:20:56 -0400 (EDT) Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
> >
> > Could you please add the following branch to the linux-next tree:
> > 
> > 	git://git.linaro.org/people/nicolas.pitre/linux kbuild
> > 
> > It includes 3 patches on top of Michal's kbuild branch already in your 
> > tree. Those patches fix issues that have been reported by 3 people 
> > already, and I'd like those fixes to appear in linux-next until Michal 
> > picks them up, which should happen in, well, some "undefined" amount of 
> > time.  ;-)
> 
> Thanks for adding your subsystem tree as a participant of linux-next.

Stephen,

You may drop this branch now.  Michal was quick to pick the most 
important fixes in his branch (thanks Michal).


Nicolas
