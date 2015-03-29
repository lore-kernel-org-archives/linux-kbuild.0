Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:33076 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752487AbbC2U5e (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 29 Mar 2015 16:57:34 -0400
Received: by pdnc3 with SMTP id c3so154414988pdn.0
        for <linux-kbuild@vger.kernel.org>; Sun, 29 Mar 2015 13:57:33 -0700 (PDT)
Date: Sun, 29 Mar 2015 13:57:31 -0700
From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2] kbuild: Create directory for target DTB
Message-ID: <20150329205731.GB13301@localhost>
References: <c09612262f2758e70dd4d700f2d32692601f8287.1426682342.git.michal.simek@xilinx.com>
 <20150318132004.GC10863@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150318132004.GC10863@arm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Will Deacon <will.deacon@arm.com>
Cc: Michal Simek <michal.simek@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "monstr@monstr.eu" <monstr@monstr.eu>, Zach Pfeffer <zachp@xilinx.com>, Nathan Rossi <nrossi@xilinx.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <Catalin.Marinas@arm.com>, Nathan Rossi <nathan.rossi@xilinx.com>, Michal Marek <mmarek@suse.cz>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, arm@kernel.org

On Wed, Mar 18, 2015 at 01:20:04PM +0000, Will Deacon wrote:
> On Wed, Mar 18, 2015 at 12:39:07PM +0000, Michal Simek wrote:
> > From: Nathan Rossi <nathan.rossi@xilinx.com>
> > 
> > When building specific DTBs out of the kernel tree the vendor subdirs
> > (boot/dts/<vendor>) are not created, ensure that they are before
> > building the DTB.
> > 
> > Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
> > Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> > ---
> > 
> > Changes in v2:
> > - Use $(dir ${dtc-tmp}) instead of `dirname ${dtc-tmp}`
> >   Reported-by: Will Deacon <will.deacon@arm.com>
> 
> Looks ok to me, but no idea which tree this should go through. Maybe
> arm-soc?
> 
>   Acked-by: Will Deacon <will.deacon@arm.com>

Sure. Please resend with appropriate acks to arm@kernel.org and we can apply it.


-Olof

