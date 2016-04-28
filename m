Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:57447 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752661AbcD1Cz5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 27 Apr 2016 22:55:57 -0400
Date: Wed, 27 Apr 2016 22:55:54 -0400 (EDT)
Message-Id: <20160427.225554.343063639979471594.davem@davemloft.net>
Subject: Re: [net-next PATCH V3 0/5] samples/bpf: Improve user experience
From: David Miller <davem@davemloft.net>
In-Reply-To: <20160427072855.29959.70252.stgit@firesoul>
References: <20160427072855.29959.70252.stgit@firesoul>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: brouer@redhat.com
Cc: netdev@vger.kernel.org, linux-kbuild@vger.kernel.org, bblanco@plumgrid.com, naveen.n.rao@linux.vnet.ibm.com, borkmann@iogearbox.net, alexei.starovoitov@gmail.com

From: Jesper Dangaard Brouer <brouer@redhat.com>
Date: Wed, 27 Apr 2016 09:30:08 +0200

> It is a steep learning curve getting started with using the eBPF
> examples in samples/bpf/.  There are several dependencies, and
> specific versions of these dependencies.  Invoking make in the correct
> manor is also slightly obscure.
> 
> This patchset cleanup, document and hopefully improves the first time
> user experience with the eBPF samples directory by auto-detecting
> certain scenarios.
> 
> V3:
>  - Add Alexei's ACKs
>  - Remove README paragraph about LLVM experimental BPF target
>    as it only existed between LLVM version 3.6 to 3.7.
> 
> V2:
>  - Adjusted recommend minimum versions to 3.7.1
>  - Included clang build instructions
>  - New patch adding CLANG variable and validation of command

Please respin addressing Naveen's feedback, thanks.
