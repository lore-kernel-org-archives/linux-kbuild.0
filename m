Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:51629 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751731AbcD1Okw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Apr 2016 10:40:52 -0400
Date: Thu, 28 Apr 2016 16:40:46 +0200
From: Jesper Dangaard Brouer <brouer@redhat.com>
Subject: Re: [net-next PATCH V4 1/5] samples/bpf: add back functionality to
 redefine LLC command
Message-ID: <20160428164046.0998f03d@redhat.com>
In-Reply-To: <20160428132132.GB7880@naverao1-tp.in.ibm.com>
References: <20160428121949.16807.84828.stgit@firesoul>
	<20160428122053.16807.93143.stgit@firesoul>
	<20160428132132.GB7880@naverao1-tp.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Cc: netdev@vger.kernel.org, linux-kbuild@vger.kernel.org, bblanco@plumgrid.com, borkmann@iogearbox.net, alexei.starovoitov@gmail.com, brouer@redhat.com

On Thu, 28 Apr 2016 18:51:33 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> > Add this features back. Note that it is possible to redefine the LLC
> > on the make command like:
> > 
> >  make samples/bpf/ LLC=~/git/llvm/build/bin/llc  
> 
> I don't have an objection to this patch, but you didn't explain why/how 
> this approach is better than just doing:
>   PATH=~/git/llvm/build/bin make samples/bpf/

It is almost the same. There is always another way to do the same.

I explicitly use this to test different combinations of LLC and CLANG,
in-order to validate Alexei's claim that older versions of CLANG could
still work with a newer version of LLC.  Thus, one use-case you
approach cannot cover ;-)

And clang seems to install a clang-3.9, which my solution also covers
by explicitly specifying CLANG=clang-3.9, if several avail clang's are
in the PATH.

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  Author of http://www.iptv-analyzer.org
  LinkedIn: http://www.linkedin.com/in/brouer
