Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:32868 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933059AbcKGTKQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Nov 2016 14:10:16 -0500
Received: by mail-it0-f68.google.com with SMTP id e187so11120626itc.0
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Nov 2016 11:10:16 -0800 (PST)
From: Vince Weaver <vincent.weaver@maine.edu>
Date: Mon, 7 Nov 2016 14:10:12 -0500 (EST)
Subject: Re: 'kbuild' merge before 4.9-rc1 breaks build and boot
In-Reply-To: <20161027154202.GE27017@al>
Message-ID: <alpine.DEB.2.20.1611071408040.24418@macbook-air>
References: <4c04b846-3da8-dc42-4fa6-30f72a5c2437@hartkopp.net> <20161027154202.GE27017@al>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter Wu <peter@lekensteyn.nl>
Cc: Michal Marek <mmarek@suse.com>, Al Viro <viro@zeniv.linux.org.uk>, Oliver Hartkopp <socketcan@hartkopp.net>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Thu, 27 Oct 2016, Peter Wu wrote:

> I can confirm Olivers issue, the current mainline kernel fails to boot
> on kernels with CONFIG_MODVERSIONS=y. Bisection points to:
> 
>     commit 784d5699eddc55878627da20d3fe0c8542e2f1a2
>     Author: Al Viro <viro@zeniv.linux.org.uk>
>     Date:   Mon Jan 11 11:04:34 2016 -0500
> > WARNING: "memset" [sound/usb/snd-usbmidi-lib.ko] has no CRC!
> > WARNING: "__fentry__" [sound/usb/snd-usbmidi-lib.ko] has no CRC!
> > WARNING: "memcpy" [sound/usb/snd-usbmidi-lib.ko] has no CRC!
> > WARNING: "__sw_hweight32" [sound/usb/snd-usbmidi-lib.ko] has no CRC!

Has any progress been made with this problem?

I'm also encountering it on my debian-unstable box on any kernel more 
recent than 4.9-rc1 (up to and including 4.9-rc4).  I am glad someone 
managed to isolate it as I was unable to get a clean bisect.

Vince

