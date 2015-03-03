Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:37147 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756104AbbCCQe4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 3 Mar 2015 11:34:56 -0500
Date: Tue, 3 Mar 2015 17:34:53 +0100
From: Sylvain BERTRAND <sylvain.bertrand@gmail.com>
Subject: Re: [PATCH] scripts: fix link-vmlinux.sh bash-ism
Message-ID: <20150303163453.GA21318@localhost.localdomain>
References: <20141229163456.GB27533@dhcppc1>
 <54A6BF7E.8070003@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54A6BF7E.8070003@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jan 02, 2015 at 04:55:42PM +0100, Michal Marek wrote:
> On 2014-12-29 17:34, Sylvain BERTRAND wrote:
> > Chocked while compiling linux with dash shell instead of bash shell.
> > See:
> > http://pubs.opengroup.org/onlinepubs/000095399/utilities/trap.html
> 
> Please describe the actual problem in the changelog. I guess it's
> because of the 'ERR' trap?

Indeed:
 - ERR is specific to bash
 - signal names in a trap built-in instruction should be without the SIG prefix

Shall I repost a v2 with the above lines?

-- 
Sylvain
