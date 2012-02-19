Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:48337 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755173Ab2BSV5G (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 19 Feb 2012 16:57:06 -0500
Date: Sun, 19 Feb 2012 22:57:02 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [BUG] make headers_install install system headers instead the
	ones from kernel source
Message-ID: <20120219215702.GA21133@merkur.ravnborg.org>
References: <4F416A6E.3020403@openelec.tv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4F416A6E.3020403@openelec.tv>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephan Raue <mailinglists@openelec.tv>
Cc: linux-kbuild@vger.kernel.org

On Sun, Feb 19, 2012 at 10:32:30PM +0100, Stephan Raue wrote:
> Hi all,
>
> "make headers_install INSTALL_HDR_PATH=<dest> ARCH=<arch>" should copy  
> the headers from kernel source to <dest> (the toolchain) but it copys  
> the headers from my system here.
> i have tested this command now with kernel 2.6.39 to 3.3-rc4 its same on  
> every tested kernel version.
>
> i have compared the filesize, for example /usr/include/linux/types.h  
> with <dest>/include/linux/types.h and <kernel_src>/include/linux/types.h  
> and the destination file is the same as the one in /usr/include.

Hi Stephan.

during the process of preparign the headers for use in user-space they undergo
a processing.

On my system:

types.h in the kernel is 5733 bytes
The exported variant is 1430 bytes.

I think that in your case the reason why they match in size is because
your distro uses a kernel exported types.h.

It should be simple to check. Just add a few lines to types.h in the kernel,
around a line you know will be present in the user-space version.
Export and see if the line is present.

	Sam
