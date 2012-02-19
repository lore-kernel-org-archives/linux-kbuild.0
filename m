Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail01.solnet.ch ([212.101.4.135]:58726 "EHLO mail01.solnet.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754026Ab2BSWtW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 19 Feb 2012 17:49:22 -0500
Message-ID: <4F417C6F.2050100@openelec.tv>
Date: Sun, 19 Feb 2012 23:49:19 +0100
From: Stephan Raue <mailinglists@openelec.tv>
MIME-Version: 1.0
Subject: Re: [BUG] make headers_install install system headers instead the
 ones from kernel source
References: <4F416A6E.3020403@openelec.tv> <20120219215702.GA21133@merkur.ravnborg.org>
In-Reply-To: <20120219215702.GA21133@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

thanks is working :-) sorry for the noise.

Stephan

Am 19.02.2012 22:57, schrieb Sam Ravnborg:
>
> Hi Stephan.
>
> during the process of preparign the headers for use in user-space they undergo
> a processing.
>
> On my system:
>
> types.h in the kernel is 5733 bytes
> The exported variant is 1430 bytes.
>
> I think that in your case the reason why they match in size is because
> your distro uses a kernel exported types.h.
>
> It should be simple to check. Just add a few lines to types.h in the kernel,
> around a line you know will be present in the user-space version.
> Export and see if the line is present.
>
> 	Sam

