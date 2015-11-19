Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:40890 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756210AbbKSK3i (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 19 Nov 2015 05:29:38 -0500
Subject: Re: out-of-tree build with external module
References: <1447858006.4104.38.camel@alcnetworx.de>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <564DA48F.8040301@suse.cz>
Date: Thu, 19 Nov 2015 11:29:35 +0100
MIME-Version: 1.0
In-Reply-To: <1447858006.4104.38.camel@alcnetworx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tino Mettler <tino.mettler@alcnetworx.de>
Cc: linux-kbuild@vger.kernel.org

On 2015-11-18 15:46, Tino Mettler wrote:
> Hi,
> 
> I want to build an external module out-of-tree. I tried this:
> 
> make -C <kernel-source> KBUILD_OUTPUT=<out-of-tree-path> M=<external-module> modules
> 
> However, the result is put to the source path specified by M=, whereas a
> normal kernel build (without M=) but otherwise same parameters puts the
> result to <out-of-tree-path>.

The combination of M= and O= is not supported by kbuild.

Michal

