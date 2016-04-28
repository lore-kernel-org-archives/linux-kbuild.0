Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f169.google.com ([209.85.192.169]:35745 "EHLO
	mail-pf0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752909AbcD1QtL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Apr 2016 12:49:11 -0400
Date: Thu, 28 Apr 2016 09:49:06 -0700
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: [net-next PATCH V4 3/5] samples/bpf: add a README file to get
 users started
Message-ID: <20160428164904.GA81443@ast-mbp.thefacebook.com>
References: <20160428121949.16807.84828.stgit@firesoul>
 <20160428122103.16807.41837.stgit@firesoul>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160428122103.16807.41837.stgit@firesoul>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jesper Dangaard Brouer <brouer@redhat.com>
Cc: netdev@vger.kernel.org, linux-kbuild@vger.kernel.org, bblanco@plumgrid.com, naveen.n.rao@linux.vnet.ibm.com, borkmann@iogearbox.net

On Thu, Apr 28, 2016 at 02:21:04PM +0200, Jesper Dangaard Brouer wrote:
> Getting started with using examples in samples/bpf/ is not
> straightforward.  There are several dependencies, and specific
> versions of these dependencies.
> 
> Just compiling the example tool is also slightly obscure, e.g. one
> need to call make like:
> 
>  make samples/bpf/
> 
> Do notice the "/" slash after the directory name.
> 
> Signed-off-by: Jesper Dangaard Brouer <brouer@redhat.com>

Acked-by: Alexei Starovoitov <ast@kernel.org>

