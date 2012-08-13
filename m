Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:35292 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754339Ab2HMUie (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 13 Aug 2012 16:38:34 -0400
Message-ID: <502965BE.3070406@zytor.com>
Date: Mon, 13 Aug 2012 13:38:22 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: [PATCH RFC] Fix "/usr/bin/xargs: rm: Argument list too long"
 during make distclean
References: <502957D5.1070800@koe-americas.com>
In-Reply-To: <502957D5.1070800@koe-americas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Cullen <David.Cullen@koe-americas.com>
Cc: Michal Marek <mmarek@suse.cz>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 08/13/2012 12:39 PM, David Cullen wrote:
> When running "make distclean" in a cross chroot environment, the
> following messages are emitted:
> 
>     [user@host:/home/work/linux]: make distclean
>     /usr/bin/xargs: rm: Argument list too long
>     make: *** [clean] Error 126
> 

That sounds like a bug in xargs...

	-hpa

