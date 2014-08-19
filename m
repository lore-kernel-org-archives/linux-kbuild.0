Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fr1.as29.net ([62.210.131.231]:38390 "EHLO
	toothrot.meleeweb.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753804AbaHSSyL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Aug 2014 14:54:11 -0400
Date: Tue, 19 Aug 2014 20:54:02 +0200
From: Bertrand Jacquin <beber@meleeweb.net>
Subject: Re: [PATCH 2/3] kbuild: handle module compression while running
 'make modules_install'.
Message-ID: <20140819185402.GA10263@lemonhead.scabb>
References: <1408215016-1848-1-git-send-email-beber@meleeweb.net>
 <1408215016-1848-3-git-send-email-beber@meleeweb.net>
 <87lhqkmxdl.fsf@tassilo.jf.intel.com>
 <87iolojrdq.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87iolojrdq.fsf@rustcorp.com.au>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>

Hi,

D'ar meurzh 19 a viz Eost 2014 e 19 eur 55, « Rusty Russell » he deus skrivet :
> Andi Kleen <andi@firstfloor.org> writes:
> > Bertrand Jacquin <beber@meleeweb.net> writes:
> >>  
> >> +# CONFIG_MODULE_COMPRESS, if defined, will cause module to be compressed
> >> +# after they are installed in agreement with CONFIG_MODULE_COMPRESS_GZIP
> >> +# or CONFIG_MODULE_COMPRESS_XZ.
> >> +
> >> +mod_compress_cmd = true
> >> +ifdef CONFIG_MODULE_COMPRESS
> >> +  ifdef CONFIG_MODULE_COMPRESS_GZIP
> >> +    mod_compress_cmd = gzip -n -9
> >
> > Please don't use gzip -9. The gain is very small, but it can make
> > the time to compress much longer. Just use plain gzip.
> 
> Interesting:
> 
> $ time find * -name '*.ko' | xargs -n 1 gzip
> real	0m9.404s
> user	0m7.283s
> sys	0m1.667s
> $ du -c `find * -name '*.ko.gz'` | tail -n1
> 56412	total
> 
> time find * -name '*.ko' | xargs -n 1 gzip -9
> real	1m1.968s
> user	0m58.850s
> sys	0m1.786s
> $ du -c `find * -name '*.ko.gz'` | tail -n1
> 55764	total
> 
> $ time find * -name '*.ko' | xargs -n 1 xz
> real	1m23.396s
> user	1m13.893s
> sys	0m9.134s
> $ du -c `find * -name '*.ko.xz` | tail -n1
> 46868	total
> 
> $ time find * -name '*.ko' | xargs -n 1 xz -9
> real	1m47.202s
> user	1m25.962s
> sys	0m21.298s
> $ du -c `find * -name '*.ko.xz` | tail -n1
> 46868	total
> 
> So, Andi is right.  Please skip -9 for both options: it makes little
> (.gz) or no (.xz) difference and it slows things down.

Thank you Andi and Rusty for the feedback. I'm current updating patches
to drop -9 usage.

-- 
Beber
