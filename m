Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:32813 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750930AbbEFNy3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 May 2015 09:54:29 -0400
Date: Wed, 6 May 2015 13:54:22 +0000
From: sylvain.bertrand@gmail.com
Subject: Re: [PATCH] scripts: fix link-vmlinux.sh bash-ism
Message-ID: <20150506135422.GA24849@freedom>
References: <20141229163456.GB27533@dhcppc1>
 <54A6BF7E.8070003@suse.cz>
 <20150303163453.GA21318@localhost.localdomain>
 <550895A1.1000901@suse.cz>
 <20150427152525.GA22179@freedom>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150427152525.GA22179@freedom>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Apr 27, 2015 at 03:25:25PM +0000, sylvain.bertrand@gmail.com wrote:
> On Tue, Mar 17, 2015 at 09:59:13PM +0100, Michal Marek wrote:
> > Sorry if I wasn't clear. The changelog should contain the actual error
> > message or description of wrong behavior when ran under dash.
> 
> While building linux with dash shell:
>   LINK    vmlinux
> trap: SIGHUP: bad trap
> /src/linux-4.0/Makefile:933: recipe for target 'vmlinux' failed
> make[1]: *** [vmlinux] Error 1

Hi, what's up with this?

regards,

-- 
Sylvain
