Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:57341 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754275Ab3ALVsD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 12 Jan 2013 16:48:03 -0500
Message-ID: <50F1DA0F.9060607@suse.cz>
Date: Sat, 12 Jan 2013 22:47:59 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [pull request v2] Pull request for branch yem-kconfig-rc-fixes
References: <cover.1356476868.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1356476868.git.yann.morin.1998@free.fr>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org

On 26.12.2012 00:10, Yann E. MORIN wrote:
> Hello Michal, All!
> 
> Here is a trivial patch suitable for post-rc1:
>   - remove duplicate variable declaration in kconfig/lxdialog
> 
> Changes v1..v2:
>   - since changes about use of ${CONFIG_} have not been pulled in Linus'
>     tree, I've dropped the previous two related patches from this branch.
>   - added Wang's cleanup

Thanks, pulled into kbuild.git#rc-fixes. Sorry for the delay, family and
work keep me busy :). I will look at the more exciting kconfig stuff
tomorrow.

Michal

