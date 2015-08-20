Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:59300 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751506AbbHTLe5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Aug 2015 07:34:57 -0400
Subject: Re: how to echo $(KBUILD_CFLAGS)
References: <848BD1798F19584EADB3CD55379CFD64665E5A2C@SHMX01.s3graphics.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <55D5BB5F.6020809@suse.com>
Date: Thu, 20 Aug 2015 13:34:55 +0200
MIME-Version: 1.0
In-Reply-To: <848BD1798F19584EADB3CD55379CFD64665E5A2C@SHMX01.s3graphics.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: RaphaelWu@viatech.com.cn
Cc: linux-kbuild@vger.kernel.org

On 2015-08-20 13:03, RaphaelWu@viatech.com.cn wrote:
> Let me show the simplified piece.
> 
> obj-m += test.o
> KBUILD_CFLAGS := $(subst -pg,,$(KBUILD_CFLAGS))
> 
> all:
>         @echo $(KBUILD_CFLAGS)
>         $(MAKE) -C /lib/modules/`uname`/build M=$(PWD) modules
> 
> So if it's not a kbuild makefile, why the -pg flag can be successful removed through KBUILD_CFLAGS.

There are no all: rules in kbuild files.

Michal

