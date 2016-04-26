Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:36808 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751363AbcDZRbM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2016 13:31:12 -0400
Date: Tue, 26 Apr 2016 10:31:06 -0700
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: [net-next PATCH V2 3/5] samples/bpf: add a README file to get
 users started
Message-ID: <20160426173105.GD42777@ast-mbp.thefacebook.com>
References: <20160426162650.22962.20516.stgit@firesoul>
 <20160426162721.22962.25054.stgit@firesoul>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160426162721.22962.25054.stgit@firesoul>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jesper Dangaard Brouer <brouer@redhat.com>
Cc: netdev@vger.kernel.org, linux-kbuild@vger.kernel.org, bblanco@plumgrid.com, naveen.n.rao@linux.vnet.ibm.com, borkmann@iogearbox.net

On Tue, Apr 26, 2016 at 06:27:22PM +0200, Jesper Dangaard Brouer wrote:
> +
> +Manually compiling LLVM with 'bpf' support
> +------------------------------------------
> +
> +In some LLVM versions the BPF target were marked experimental. They
> +needed the 'cmake .. -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=BPF'.  Since
> +version 3.7.1, LLVM adds a proper LLVM backend target for the BPF
> +bytecode architecture.

it's actually non-experimental since 3.7.0.
It was experimental after 3.6 was released during development of 3.7.
I doubt you can find this anywhere, so I suggest to just drop this paragraph.

