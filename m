Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:54694 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751407AbbHTKtw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Aug 2015 06:49:52 -0400
Subject: Re: how to echo $(KBUILD_CFLAGS)
References: <848BD1798F19584EADB3CD55379CFD64665E59C7@SHMX01.s3graphics.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <55D5B0CE.1040900@suse.com>
Date: Thu, 20 Aug 2015 12:49:50 +0200
MIME-Version: 1.0
In-Reply-To: <848BD1798F19584EADB3CD55379CFD64665E59C7@SHMX01.s3graphics.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: RaphaelWu@viatech.com.cn
Cc: linux-kbuild@vger.kernel.org

On 2015-08-20 12:45, RaphaelWu@viatech.com.cn wrote:
> Hi,
> 
> I have seen this VAR used in some kernel module which also forbid ftrace.
> but I was curious about whenever I echo $(KBUILD_CFLAGS), it's always empty.
> 
> all:
> @echo $(KBUILD_CFLAGS)
> $(MAKE) -C /path-of-kernel/ M=$(PWD) modules

This does not look like a kbuild makefile, so it does not see any
KBUILD_* variables.

Michal
