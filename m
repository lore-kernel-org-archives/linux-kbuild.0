Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:51934 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751267Ab3D3EYy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 30 Apr 2013 00:24:54 -0400
Message-ID: <517F477E.7090901@zytor.com>
Date: Mon, 29 Apr 2013 21:24:30 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: Build-failure with old files in build-directory (Was: Linux 3.9
 released)
References: <CA+55aFxcqR+5wK0QoGBA_jYP1epH2NCbVTRaE51rLK3mdRjN6Q@mail.gmail.com> <20130429083649.GA23540@citd.de>
In-Reply-To: <20130429083649.GA23540@citd.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Schniedermeyer <ms@citd.de>, Michal Marek <mmarek@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On 04/29/2013 01:36 AM, Matthias Schniedermeyer wrote:
> On 28.04.2013 17:56, Linus Torvalds wrote:
> 
> I'm not sure if it is supported, but building with a O= -directory that 
> was previously used to build a 3.8.9-kernel that was "clean"ed (but not 
> "mrproper"ed) before building 3.9 results in a build-failure:
> make[2]: *** No rule to make target `/xssd/usr_src/ko/leeloo/include/config/hz.h', needed by `kernel/hz.bc'.  Stop.
> 
> After deleting everything in the KBUILD_OUTPUT-directory, except the 
> .config-file, the kernel-build worked again.
> 
> At least in the past a "clean" seamed to be enough. I had a file with a 
> 2.6.39-name inside, so it seams i have build my kernels this way for the 
> last few releases.
> 

This is a question for the Kbuild people I believe...

	-hpa


