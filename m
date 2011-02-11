Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:50574 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757264Ab1BKUIS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Feb 2011 15:08:18 -0500
Message-ID: <4D55972E.90506@zytor.com>
Date: Fri, 11 Feb 2011 12:08:14 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: Specific processing during user space header generation
References: <4D532BEF.1040602@zytor.com> <20110210055459.GA31333@merkur.ravnborg.org> <4D547B0C.9020508@zytor.com> <20110211191430.GA6227@merkur.ravnborg.org>
In-Reply-To: <20110211191430.GA6227@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

On 02/11/2011 11:14 AM, Sam Ravnborg wrote:
> 
> The purpose of headers_install is to install the existing kernel headers
> and during the installation process do some minimal adjustments to make
> then suit userspace consumption.
> 
> What you suggest smells like something else - care to explain what
> you have in mind?
> 

I am working with H.J. Lu on an experimental native 32-bit ABI for
x86-64.  As a result, we are adding an <asm/unistd_x32.h> for new system
call numbers.

Now, the kernel needs to use both <asm/unistd_64.h> and
<asm/unistd_x32.h>, since as far as the kernel are concerned they are
both 64-bit system calls.  As such, the latter contains symbols like:

	__NR_x32_ioctl

... however, when used in user space, we want it to look like

	__NR_ioctl

... just like any other ABI.

Incidentally we have a similar situation with the i386 ABI, but that one
is sort of backwards -- since unistd_32.h is also used by native 32
bits, we can't just make the transformation for userspace there.

The alternative, of course (which would also work for the native 32 bit
case, now when I think about it) is for the human-written file to be the
user space version, and use a script to generate the kernel version.

	-hpa

