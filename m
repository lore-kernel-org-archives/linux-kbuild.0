Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bipbip.grupopie.com ([195.23.16.24]:55577 "EHLO
	bipbip.grupopie.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754201AbYFDO3Z (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Jun 2008 10:29:25 -0400
Message-ID: <4846A04F.1030909@grupopie.com>
Date: Wed, 04 Jun 2008 15:01:51 +0100
From: Paulo Marques <pmarques@grupopie.com>
MIME-Version: 1.0
Subject: Re: [RFC PATCH] drop support for KALLSYMS_EXTRA_PASS
References: <20080603210732.GA6247@uranus.ravnborg.org>
In-Reply-To: <20080603210732.GA6247@uranus.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Keith Owens <kaos@ocs.com.au>

Sam Ravnborg wrote:
> We have not seen any reports on inconsistent kallsysms data recently
> as in the last one or two years. At least I do not recall these
> and google had no hits in my searching.
> 
> So I suggest removing this as to simplify the final linking.
> When doing "make allyesconfig" build this extra linking
> takes considerably time (and I usually forgoet to turn it off).

I don't remember any recent (read: in the last few years) problems 
either, so I guess this is ok.

> In addition this patch removes the debug target: debug_kallsyms

This might be useful if changes in some binutils version creates new 
problems for kallsyms, but it doesn't seem like a lot of work to just 
send a reporter a patch to add this back if needed. Since there haven't 
been any reports in a few years, I have no problems with this.

Acked-by: Paulo Marques <pmarques@grupopie.com>

-- 
Paulo Marques - www.grupopie.com

"'thinking outside the box' works better if I know what's inside the box."
