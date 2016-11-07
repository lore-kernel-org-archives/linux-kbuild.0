Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lekensteyn.nl ([178.21.112.251]:44942 "EHLO lekensteyn.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751056AbcKGVjn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Nov 2016 16:39:43 -0500
Date: Mon, 7 Nov 2016 22:39:07 +0100
From: Peter Wu <peter@lekensteyn.nl>
Subject: Re: 'kbuild' merge before 4.9-rc1 breaks build and boot
Message-ID: <20161107213907.GB18092@al>
References: <4c04b846-3da8-dc42-4fa6-30f72a5c2437@hartkopp.net>
 <20161027154202.GE27017@al>
 <alpine.DEB.2.20.1611071408040.24418@macbook-air>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1611071408040.24418@macbook-air>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vince Weaver <vincent.weaver@maine.edu>
Cc: Michal Marek <mmarek@suse.com>, Al Viro <viro@zeniv.linux.org.uk>, Oliver Hartkopp <socketcan@hartkopp.net>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>

On Mon, Nov 07, 2016 at 02:10:12PM -0500, Vince Weaver wrote:
> On Thu, 27 Oct 2016, Peter Wu wrote:
> 
> > I can confirm Olivers issue, the current mainline kernel fails to boot
> > on kernels with CONFIG_MODVERSIONS=y. Bisection points to:
> > 
> >     commit 784d5699eddc55878627da20d3fe0c8542e2f1a2
> >     Author: Al Viro <viro@zeniv.linux.org.uk>
> >     Date:   Mon Jan 11 11:04:34 2016 -0500
> > > WARNING: "memset" [sound/usb/snd-usbmidi-lib.ko] has no CRC!
> > > WARNING: "__fentry__" [sound/usb/snd-usbmidi-lib.ko] has no CRC!
> > > WARNING: "memcpy" [sound/usb/snd-usbmidi-lib.ko] has no CRC!
> > > WARNING: "__sw_hweight32" [sound/usb/snd-usbmidi-lib.ko] has no CRC!
> 
> Has any progress been made with this problem?
> 
> I'm also encountering it on my debian-unstable box on any kernel more 
> recent than 4.9-rc1 (up to and including 4.9-rc4).  I am glad someone 
> managed to isolate it as I was unable to get a clean bisect.
> 
> Vince

The original kbuild issue went in via
merge commit 84d69848c97faab0c25aa2667b273404d2e2a64a which notes:

 - EXPORT_SYMBOL for asm source by Al Viro.

   This does bring a regression, because genksyms no longer generates
   checksums for these symbols (CONFIG_MODVERSIONS). Nick Piggin is
   working on a patch to fix this.

   Plus, we are talking about functions like strcpy(), which rarely
   change prototypes.

Adding Nicholas in the cc, hopefully he can give a status update.

Kind regards,
Peter
