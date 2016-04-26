Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:34584 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752753AbcDZR2R (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2016 13:28:17 -0400
Date: Tue, 26 Apr 2016 10:28:12 -0700
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: [net-next PATCH V2 1/5] samples/bpf: add back functionality to
 redefine LLC command
Message-ID: <20160426172810.GB42777@ast-mbp.thefacebook.com>
References: <20160426162650.22962.20516.stgit@firesoul>
 <20160426162711.22962.13821.stgit@firesoul>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160426162711.22962.13821.stgit@firesoul>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jesper Dangaard Brouer <brouer@redhat.com>
Cc: netdev@vger.kernel.org, linux-kbuild@vger.kernel.org, bblanco@plumgrid.com, naveen.n.rao@linux.vnet.ibm.com, borkmann@iogearbox.net

On Tue, Apr 26, 2016 at 06:27:11PM +0200, Jesper Dangaard Brouer wrote:
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
> 
> Fixes: 128d1514be35 ("samples/bpf: Use llc in PATH, rather than a hardcoded value")
> Signed-off-by: Jesper Dangaard Brouer <brouer@redhat.com>

Acked-by: Alexei Starovoitov <ast@kernel.org>

