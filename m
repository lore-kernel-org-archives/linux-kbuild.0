Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e28smtp09.in.ibm.com ([125.16.236.9]:59322 "EHLO
	e28smtp09.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752195AbcD1NVz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Apr 2016 09:21:55 -0400
Received: from localhost
	by e28smtp09.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <naveen.n.rao@linux.vnet.ibm.com>;
	Thu, 28 Apr 2016 18:51:52 +0530
Date: Thu, 28 Apr 2016 18:51:33 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [net-next PATCH V4 1/5] samples/bpf: add back functionality to
 redefine LLC command
Message-ID: <20160428132132.GB7880@naverao1-tp.in.ibm.com>
References: <20160428121949.16807.84828.stgit@firesoul>
 <20160428122053.16807.93143.stgit@firesoul>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160428122053.16807.93143.stgit@firesoul>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jesper Dangaard Brouer <brouer@redhat.com>
Cc: netdev@vger.kernel.org, linux-kbuild@vger.kernel.org, bblanco@plumgrid.com, borkmann@iogearbox.net, alexei.starovoitov@gmail.com

On 2016/04/28 02:20PM, Jesper Dangaard Brouer wrote:
> It is practical to be-able-to redefine the location of the LLVM
> command 'llc', because not all distros have a LLVM version with bpf
> target support.  Thus, it is sometimes required to compile LLVM from
> source, and sometimes it is not desired to overwrite the distros
> default LLVM version.
> 
> This feature was removed with 128d1514be35 ("samples/bpf: Use llc in
> PATH, rather than a hardcoded value").
> 
> Add this features back. Note that it is possible to redefine the LLC
> on the make command like:
> 
>  make samples/bpf/ LLC=~/git/llvm/build/bin/llc

I don't have an objection to this patch, but you didn't explain why/how 
this approach is better than just doing:
  PATH=~/git/llvm/build/bin make samples/bpf/

- Naveen

