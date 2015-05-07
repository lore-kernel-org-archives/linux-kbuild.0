Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:38916 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751779AbbEGL7B (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 May 2015 07:59:01 -0400
Message-ID: <554B5383.60505@suse.cz>
Date: Thu, 07 May 2015 13:58:59 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v2] scripts: fix link-vmlinux.sh bash-ism
References: <20141229163456.GB27533@dhcppc1> <54A6BF7E.8070003@suse.cz> <20150303163453.GA21318@localhost.localdomain> <550895A1.1000901@suse.cz> <20150427152525.GA22179@freedom> <20150506135422.GA24849@freedom> <554A2457.70609@suse.cz> <20150507003604.GA16571@freedom>
In-Reply-To: <20150507003604.GA16571@freedom>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sylvain.bertrand@gmail.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 2015-05-07 02:36, sylvain.bertrand@gmail.com wrote:
> While building linux with dash shell:
>   LINK    vmlinux
> trap: SIGHUP: bad trap
> /src/linux-4.0/Makefile:933: recipe for target 'vmlinux' failed
> make[1]: *** [vmlinux] Error 1
> 
> See the following document for behavior of posix shell trap instruction:
> http://pubs.opengroup.org/onlinepubs/000095399/utilities/trap.html
> 
> Cc: Ingo Molnar <mingo@kernel.org>
> Signed-off-by: Sylvain BERTRAND <sylvain.bertrand@gmail.com>

Applied to kbuild.git#kbuild now, thanks.

Michal

