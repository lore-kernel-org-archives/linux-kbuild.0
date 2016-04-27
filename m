Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e23smtp07.au.ibm.com ([202.81.31.140]:51607 "EHLO
	e23smtp07.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752432AbcD0IIT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 27 Apr 2016 04:08:19 -0400
Received: from localhost
	by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <naveen.n.rao@linux.vnet.ibm.com>;
	Wed, 27 Apr 2016 18:08:16 +1000
Date: Wed, 27 Apr 2016 13:36:33 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [net-next PATCH V3 1/5] samples/bpf: add back functionality to
 redefine LLC command
Message-ID: <20160427080609.GB14936@naverao1-tp.in.ibm.com>
References: <20160427072855.29959.70252.stgit@firesoul>
 <20160427073013.29959.86846.stgit@firesoul>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160427073013.29959.86846.stgit@firesoul>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jesper Dangaard Brouer <brouer@redhat.com>
Cc: netdev@vger.kernel.org, linux-kbuild@vger.kernel.org, bblanco@plumgrid.com, borkmann@iogearbox.net, alexei.starovoitov@gmail.com

On 2016/04/27 09:30AM, Jesper Dangaard Brouer wrote:
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

Why not do:
  PATH=~/git/llvm/build/bin:$PATH make samples/bpf/

..if you wish to override clang/llc only for building bpf samples?
Or, just export the updated $PATH:
  export PATH=~/git/llvm/build/bin:$PATH
  make samples/bpf


- Naveen
 

