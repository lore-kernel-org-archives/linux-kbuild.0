Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:42204 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751294Ab2DJN6A (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Apr 2012 09:58:00 -0400
Date: Tue, 10 Apr 2012 08:57:53 -0500
From: Jonathan Nieder <jrnieder@gmail.com>
Subject: Re: [PATCH] scripts/config: properly report and set string options
Message-ID: <20120410135753.GB2444@burratino>
References: <1333975750-12154-1-git-send-email-yann.morin.1998@free.fr>
 <20120409153006.GA28221@kroah.com>
 <201204091802.29839.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201204091802.29839.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Andi Kleen <andi@firstfloor.org>, Michal Marek <mmarek@suse.cz>

Yann E. MORIN wrote:

>   - it breaks the build for users that tweak the kernel configuration from
>     an upper-layer (aka 'integrated') build-system, using this script which
>     is bundled with the kernel in the first place.

The questions I have are, did using special characters like this work
before or is support for values with quotes inside just a new feature?
Or is there some wrapper around the linux makefile that automatically
uses values with quotes on them, making it effectively impossible for
some class of people to run some versions of Linux?

I don't expect this patch to cause problems for people, but it is a
good practice to explain what scenario justifies backporting a patch
to the stable series, if only because it keeps the volume of patches
to search through when there is a new bug down.

Thanks,
Jonathan
